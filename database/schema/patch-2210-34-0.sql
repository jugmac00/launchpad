-- Copyright 2021 Canonical Ltd.  This software is licensed under the
-- GNU Affero General Public License version 3 (see the file LICENSE).

SET client_min_messages=ERROR;

ALTER TABLE signedcodeofconduct
    ADD COLUMN affirmed boolean;
ALTER TABLE signedcodeofconduct
    ADD COLUMN version text;

ALTER TABLE signedcodeofconduct ADD CONSTRAINT affirmed_or_signed_is_not_null CHECK (NOT affirmed OR signing_key_fingerprint IS NULL);

COMMENT ON COLUMN signedcodeofconduct.affirmed IS 'Code of conduct was affirmed via website interaction.';
COMMENT ON COLUMN signedcodeofconduct.version IS 'Version of the Code of Conduct that was signed.'

INSERT INTO LaunchpadDatabaseRevision VALUES (2210, 34, 0);
