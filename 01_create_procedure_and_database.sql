-- This stored procedure creates a database named 'db_LibraryManagement'
-- and defines tables for the library management system.

-- This stored procedure drops the database if it exists and then creates a new one named 'db_LibraryManagement'
-- It also defines tables for the library management system.

CREATE PROC dbo.LibraryManagementSystemProcedure
AS
BEGIN
    -- Drop the database if it exists
    IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'db_LibraryManagement')
    BEGIN
        ALTER DATABASE db_LibraryManagement SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        DROP DATABASE IF EXISTS db_LibraryManagement;
    END

    -- Create the library management database
    CREATE DATABASE db_LibraryManagement;

    -- Switch back to multi-user mode
    ALTER DATABASE db_LibraryManagement SET MULTI_USER;
END
GO


-- USE db_LibraryManagement; 
GO

-- Check if the stored procedure exists
IF OBJECT_ID('dbo.LibraryManagementSystemProcedure', 'P') IS NOT NULL
    PRINT 'The stored procedure exists.';
ELSE
    PRINT 'The stored procedure does not exist.';

USE db_LibraryManagement;
GO

-- Check if the stored procedure exists
IF OBJECT_ID('dbo.LibraryManagementSystemProcedure', 'P') IS NOT NULL
    PRINT 'The stored procedure exists.';
ELSE
    PRINT 'The stored procedure does not exist.';
