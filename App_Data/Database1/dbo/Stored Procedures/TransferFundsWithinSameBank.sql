CREATE PROCEDURE [dbo].[TransferFundsWithinSameBank]
    @SourceAccountID INT,
    @DestinationAccountID INT,
    @Amount DECIMAL(18, 2),
    @ErrorMessage VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Initialize error message
    SET @ErrorMessage = NULL;

    --Check if source and destination accounts exist
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @SourceAccountID)
    BEGIN
        SET @ErrorMessage = 'Source account does not exist.';
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @DestinationAccountID)
    BEGIN
        SET @ErrorMessage = 'Destination account does not exist.';
        RETURN;
    END;

    -- Check if source account has sufficient balance
    DECLARE @SourceBalance DECIMAL(18, 2);
    SELECT @SourceBalance = Balance FROM Account WHERE AccountID = @SourceAccountID;

    IF @SourceBalance < @Amount
    BEGIN
        SET @ErrorMessage = 'Insufficient balance in the source account.';
        RETURN;
    END;

    -- Update source and destination account balances
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Account
        SET Balance = Balance - @Amount
        WHERE AccountID = @SourceAccountID;

        UPDATE Account
        SET Balance = Balance + @Amount
        WHERE AccountID = @DestinationAccountID;

        COMMIT TRANSACTION;

        SET @ErrorMessage = 'Funds transferred successfully.';
         RETURN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @ErrorMessage = 'An error occurred while transferring funds.';
         RETURN;
    END CATCH;
END;
