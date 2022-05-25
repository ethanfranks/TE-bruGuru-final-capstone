-- **************************************************************
-- This script destroys the database and associated users
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'breweries_1';

DROP DATABASE breweries_1;

DROP USER breweries_1_owner;
DROP USER breweries_1_appuser;
