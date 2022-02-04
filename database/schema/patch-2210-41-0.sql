-- Copyright 2022 Canonical Ltd.  This software is licensed under the
-- GNU Affero General Public License version 3 (see the file LICENSE).

SET client_min_messages=ERROR;

ALTER TABLE Distribution
    ADD COLUMN branch_sharing_policy integer DEFAULT 1 NOT NULL,
    ADD COLUMN bug_sharing_policy integer DEFAULT 1 NOT NULL,
    ADD COLUMN specification_sharing_policy integer DEFAULT 1 NOT NULL,
    ADD COLUMN information_type integer DEFAULT 1 NOT NULL,
    ADD COLUMN access_policies integer[],
    ADD CONSTRAINT distribution__valid_information_type CHECK (
        information_type = ANY(ARRAY[1, 5, 6]));

ALTER TABLE CommercialSubscription
    ADD COLUMN distribution integer REFERENCES distribution,
    ALTER COLUMN product DROP NOT NULL,
    ADD CONSTRAINT one_pillar CHECK (null_count(ARRAY[product, distribution]) = 1);

INSERT INTO LaunchpadDatabaseRevision VALUES (2210, 41, 0);
