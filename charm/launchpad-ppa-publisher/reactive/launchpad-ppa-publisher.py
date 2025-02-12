# Copyright 2023 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

import os

import yaml
from charmhelpers.core import hookenv, host, templating
from charms.launchpad.base import configure_email, get_service_config
from charms.launchpad.payload import configure_cron, configure_lazr
from charms.reactive import (
    clear_flag,
    endpoint_from_flag,
    hook,
    set_flag,
    when,
    when_not,
    when_not_all,
)
from ols import base


def configure_logrotate(config):
    hookenv.log("Writing logrotate configuration.")
    templating.render(
        "logrotate.conf.j2",
        "/etc/logrotate.d/launchpad",
        config,
        perms=0o644,
    )


def get_data_dir():
    return os.path.join(base.base_dir(), "data")


def archives_dir():
    # Used by `lp.archivepublisher.config.getPubConfig` to construct
    # `Config.temproot`, even for PPAs.
    return os.path.join(get_data_dir(), "archives")


def ppa_archive_root():
    return os.path.join(get_data_dir(), "ppa-archive")


def ppa_archive_private():
    return os.path.join(get_data_dir(), "private-ppa-archive")


def generate_exclude_ppas_options(excluded_ppas):
    if not excluded_ppas:
        return ""
    return f" --exclude {' --exclude '.join(excluded_ppas)}"


@when(
    "launchpad.db.configured",
    "memcache.available",
)
@when_not("service.configured")
def configure():
    hookenv.log("Configuring ppa publisher")
    config = get_service_config()

    data_dir = get_data_dir()
    ppa_keys_root = os.path.join(data_dir, "ppa-signing-keys")
    oval_data_root = os.path.join(data_dir, "oval-data")

    config["archives_dir"] = archives_dir()
    config["ppa_archive_root"] = ppa_archive_root()
    config["ppa_archive_private_root"] = ppa_archive_private()
    config["ppa_signing_keys_root"] = ppa_keys_root
    config["oval_data_root"] = oval_data_root

    excluded_ppas = yaml.safe_load(config["excluded_ppas"])
    config["excluded_ppas_options"] = generate_exclude_ppas_options(
        excluded_ppas
    )

    host.mkdir(data_dir, owner=base.user(), group=base.user(), perms=0o775)
    host.mkdir(
        archives_dir(), owner=base.user(), group=base.user(), perms=0o775
    )
    host.mkdir(
        ppa_archive_root(), owner=base.user(), group=base.user(), perms=0o775
    )
    host.mkdir(
        ppa_archive_private(),
        owner=base.user(),
        group=base.user(),
        perms=0o775,
    )
    host.mkdir(
        ppa_keys_root, owner=base.user(), group=base.user(), perms=0o775
    )
    host.mkdir(
        oval_data_root, owner=base.user(), group=base.user(), perms=0o775
    )

    hookenv.log("Setting up memcache for ppa uploader")
    memcache = endpoint_from_flag("memcache.available")
    config["memcache_servers"] = ",".join(
        sorted(
            f"({host}:{port},1)"
            for host, port in memcache.memcache_hosts_ports()
        )
    )

    configure_lazr(
        config,
        "launchpad-ppa-publisher-lazr.conf.j2",
        "launchpad-ppa-publisher/launchpad-lazr.conf",
    )
    configure_lazr(
        config,
        "launchpad-ppa-publisher-secrets-lazr.conf.j2",
        "launchpad-ppa-publisher-secrets-lazr.conf",
        secret=True,
    )
    configure_lazr(
        config,
        "launchpad-ppa-auth-lazr.conf.j2",
        "launchpad-ppa-auth/launchpad-lazr.conf",
    )
    configure_email(config, "launchpad-ppa-publisher")
    configure_logrotate(config)
    configure_cron(config, "crontab.j2")
    set_flag("service.configured")


@when("service.configured")
def check_is_running():
    hookenv.status_set("active", "Ready")


@when("service.configured")
@when_not("launchpad.db.configured")
def deconfigure():
    clear_flag("service.configured")


@hook("{requires:memcache}-relation-{joined,changed,broken,departed}")
def memcache_relation_changed(memcache):
    clear_flag("service.configured")


@when("apache-website.available", "service.configured")
@when_not("service.apache-website.configured")
def configure_apache_website():
    config = get_service_config()
    if not (config["domain_ppa_public"] and config["domain_ppa_private"]):
        hookenv.status_set(
            "blocked",
            "Apache configuration requires `domain_ppa_public` and "
            "`domain_ppa_private`",
        )
        return

    config["data_dir"] = get_data_dir()
    config["ppa_archive_root"] = ppa_archive_root()
    config["ppa_archive_private_root"] = ppa_archive_private()

    # If the config value for "domain_ppa_<public/private>_alt" are set, we set
    # a server alias for the alternative domain in the Apache configuration.
    # This is mainly for legacy reasons: we want to keep vhost configurations
    # for "(private-)ppa.launchpadcontent.net" along side "ppa.launchpad.net".
    # See https://blog.launchpad.net/ppa/new-domain-names-for-ppas.
    site_configs = []
    site_configs.append(templating.render("vhosts/ppa.conf.j2", None, config))
    site_configs.append(
        templating.render("vhosts/private-ppa.conf.j2", None, config)
    )
    if config["domain_ppa_buildd"]:
        site_configs.append(
            templating.render(
                "vhosts/private-ppa.buildd.conf.j2", None, config
            )
        )

    apache_website = endpoint_from_flag("apache-website.available")
    apache_website.set_remote(
        domain=config["domain"],
        enabled="true",
        ports="80",
        site_config="\n".join(site_configs),
        site_modules="expires headers rewrite wsgi",
    )
    set_flag("service.apache-website.configured")


@when("service.apache-website.configured")
@when_not_all("apache-website.available", "service.configured")
def deconfigure_apache_website():
    clear_flag("service.apache-website.configured")
