SET client_min_messages=ERROR;

ALTER TABLE person ADD COLUMN account_status_comment text;
ALTER TABLE person ADD COLUMN account_status integer DEFAULT 10;

UPDATE person
    SET account_status = 20
    WHERE id IN (SELECT id FROM ValidPersonOrTeamCache)
        AND teamowner IS NULL;

INSERT INTO LaunchpadDatabaseRevision VALUES (87, 29, 0);
