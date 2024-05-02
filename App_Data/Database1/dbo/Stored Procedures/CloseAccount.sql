CREATE PROCEDURE [dbo].[CloseAccount]
    @AccountID INT,
     @ErrorMessage VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
SET @ErrorMessage = NULL;
    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @AccountID)
    BEGIN
       SET @ErrorMessage = 'Account does not exist.';
        RETURN;
    END

    -- Delete the account
    DELETE FROM Account WHERE AccountID = @AccountID;

    PRINT 'Account closed successfully.';
END