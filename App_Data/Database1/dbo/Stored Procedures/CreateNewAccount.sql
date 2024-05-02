

CREATE PROCEDURE [dbo].[CreateNewAccount]
    @CustomerID INT,
    @BankID INT,
    @AccountType VARCHAR(50),
    @InitialBalance DECIMAL(18, 2)
  
AS
BEGIN
    SET NOCOUNT ON;
   DECLARE @ErrorMessage VARCHAR(255);
   SET @ErrorMessage = NULL;
    -- Check if CustomerID and BankID exist
    IF NOT EXISTS (SELECT 1 FROM Customer WHERE CustomerID = @CustomerID)
    BEGIN
        SET @ErrorMessage ='Customer does not exist.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Bank WHERE BankID = @BankID)
    BEGIN
       SET @ErrorMessage ='Bank does not exist.';
        RETURN;
    END

    -- Insert new account
    INSERT INTO Account (CustomerID, BankID, AccountType, Balance)
    VALUES (@CustomerID, @BankID, @AccountType, @InitialBalance);

    -- Output success message
    PRINT 'New account created successfully.';
END;