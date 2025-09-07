-- =============================
-- ADD STATUS COLUMN TO USERS TABLE
-- =============================

-- Add STATUS column to USERS table
ALTER TABLE USERS ADD STATUS VARCHAR2(3 CHAR) DEFAULT 'UNA' NOT NULL
/

-- Add index for STATUS column for better query performance
CREATE INDEX IX_USERS_STATUS ON USERS(STATUS)
/

-- Add comment for documentation
COMMENT ON COLUMN USERS.STATUS IS 'User status: UNA (Unauthorised), AUT (Authorised)'
/

-- Update existing users to have UNA status (new users need approval)
UPDATE USERS SET STATUS = 'UNA' WHERE STATUS IS NULL
/

-- =============================
-- COMMENTS FOR DOCUMENTATION
-- =============================
COMMENT ON TABLE USERS IS 'Users table with status tracking for approval workflow'
/
