-- =============================
-- FIX USERS STATUS COLUMN ISSUE
-- =============================

-- First, check if there are any NULL values in STATUS column
-- If there are, update them to 'UNA' (new users need approval)
UPDATE USERS SET STATUS = 'UNA' WHERE STATUS IS NULL
/

-- Verify the update
SELECT COUNT(*) as NULL_COUNT FROM USERS WHERE STATUS IS NULL
/

-- Add NOT NULL constraint if it doesn't exist (in case migration failed)
-- This will fail if there are still NULL values
ALTER TABLE USERS MODIFY STATUS VARCHAR2(3 CHAR) NOT NULL
/

-- =============================
-- COMMENTS FOR DOCUMENTATION
-- =============================
COMMENT ON COLUMN USERS.STATUS IS 'User status: UNA (Unauthorised), AUT (Authorised) - Fixed NULL values'
/
