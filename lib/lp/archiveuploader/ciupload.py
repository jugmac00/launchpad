# Copyright 2022 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Process a CI upload."""

__all__ = [
    "CIUpload",
    ]

import json
import os

from zope.component import getUtility

from lp.archiveuploader.utils import UploadError
from lp.buildmaster.enums import BuildStatus
from lp.code.enums import RevisionStatusResult
from lp.code.interfaces.revisionstatus import IRevisionStatusReportSet


class CIUpload:
    """An upload from a pipeline of CI jobs."""

    def __init__(self, upload_path, logger):
        """Create a `CIUpload`.

        :param upload_path: A directory containing files to upload.
        :param logger: The logger to be used.
        """
        self.upload_path = upload_path
        self.logger = logger

    def process(self, build):
        """Process this upload, loading it into the database."""
        self.logger.debug("Beginning processing.")

        jobs_path = os.path.join(self.upload_path, "jobs.json")
        try:
            with open(jobs_path) as jobs_file:
                jobs = json.load(jobs_file)
        except FileNotFoundError:
            raise UploadError("Build did not run any jobs.")

        # collect all artifacts
        artifacts = {}
        # we assume first level directories are job directories
        job_directories = [
            d.name for d in os.scandir(self.upload_path) if d.is_dir()
        ]
        for job_directory in job_directories:
            artifacts[job_directory] = []
            for dirpath, _, filenames in os.walk(os.path.join(
                self.upload_path, job_directory
            )):
                for filename in filenames:
                    artifacts[job_directory].append(os.path.join(
                        dirpath, filename
                    ))

        for job_name in jobs:
            report = getUtility(IRevisionStatusReportSet).getByCIBuildAndTitle(
                build, job_name)
            if not report:
                # the report should normally exist, since the build request
                # logic will eventually create report rows for the jobs it
                # expects to run, but for robustness it's a good idea to
                # ensure its existence here
                report = getUtility(IRevisionStatusReportSet).new(
                    creator=build.git_repository.owner,
                    title=job_name,
                    git_repository=build.git_repository,
                    commit_sha1=build.commit_sha1,
                    ci_build=build,
                )

            # attach log file
            log_file = os.path.join(self.upload_path, job_name + ".log")
            try:
                with open(log_file, mode="rb") as f:
                    report.setLog(f.read())
            except FileNotFoundError as e:
                raise UploadError(
                    "log file `%s` for job `%s` not found" % (
                        e.filename, job_name)
                ) from e

            # attach artifacts
            for file_path in artifacts[job_name]:
                with open(file_path, mode="rb") as f:
                    report.attach(
                        name=os.path.basename(file_path), data=f.read()
                    )

            # set status
            try:
                result = RevisionStatusResult.items[jobs[job_name]["result"]]
            except KeyError as e:
                raise UploadError(
                    "Invalid RevisionStatusResult `%s`" % e.args[0]) from e
            report.transitionToNewResult(result)

        self.logger.debug("Updating %s" % build.title)
        build.updateStatus(BuildStatus.FULLYBUILT)

        self.logger.debug("Finished upload.")
