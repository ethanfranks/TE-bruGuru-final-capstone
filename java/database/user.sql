-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER breweries_1_owner
WITH PASSWORD 'finalcapstone';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO breweries_1_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO breweries_1_owner;

CREATE USER breweries_1_appuser
WITH PASSWORD 'finalcapstone';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO breweries_1_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO breweries_1_appuser;
