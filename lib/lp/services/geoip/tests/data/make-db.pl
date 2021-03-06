#! /usr/bin/perl -w

# Copyright 2020 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

# Create a tiny test database in the style of GeoLite2-Country, for use by
# the Launchpad test suite.  Requires libmaxmind-db-writer-perl.

use Time::Local qw(timegm_modern);

use MaxMind::DB::Writer::Tree;

my %types = (
    country => 'map',
    iso_code => 'utf8_string',
);

my $tree = MaxMind::DB::Writer::Tree->new(
    ip_version => 4,
    record_size => 24,
    database_type => 'Launchpad-Test-Country',
    languages => ['en'],
    description => { en => 'Launchpad test data' },
    map_key_type_callback => sub { $types{$_[0]} },
    # Arguments are ($sec, $min, $hour, $mday, $mon, $year); $mon is
    # 0-based.  Bump this date when you change this script.
    _build_epoch => timegm_modern(0, 30, 23, 29, 8, 2020),
);

$tree->insert_network('69.232.0.0/15', { country => { iso_code => 'US' } });
$tree->insert_network('80.66.224.0/20', { country => { iso_code => 'LI' } });
$tree->insert_network('82.211.80.0/20', { country => { iso_code => 'GB' } });
$tree->insert_network('83.196.40.0/21', { country => { iso_code => 'FR' } });
$tree->insert_network('84.112.0.0/15', { country => { iso_code => 'AT' } });
$tree->insert_network('121.44.0.0/15', { country => { iso_code => 'AU' } });
$tree->insert_network('143.54.0.0/16', { country => { iso_code => 'BR' } });
$tree->insert_network('157.92.0.0/16', { country => { iso_code => 'AR' } });
$tree->insert_network('196.36.0.0/14', { country => { iso_code => 'ZA' } });
$tree->insert_network('201.13.0.0/16', { country => { iso_code => 'BR' } });
$tree->insert_network('202.214.0.0/16', { country => { iso_code => 'JP' } });

open my $fh, '>:raw', 'test.mmdb'
    or die "Can't open test.mmdb for writing: $!";
$tree->write_tree($fh);
