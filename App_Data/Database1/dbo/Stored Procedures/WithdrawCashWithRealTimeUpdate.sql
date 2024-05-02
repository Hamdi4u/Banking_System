CREATE PROCEDURE [dbo].[WithdrawCashWithRealTimeUpdate]
    @AccountID INT,
    @Amount DECIMAL(18, 2),
    @ErrorMessage VARCHAR(255)OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

   SET @ErrorMessage = NULL;
    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @AccountID)
    BEGIN
         SET @ErrorMessage ='Account does not exist.';
        RETURN;
    END;

    -- Check if sufficient balance is available
    DECLARE @CurrentBalance DECIMAL(18, 2);
    SELECT @CurrentBalance = Balance FROM Account WHERE AccountID = @AccountID;

    IF @CurrentBalance < @Amount
    BEGIN
         SET @ErrorMessage ='Insufficient balance.';
        RETURN;
    END;

    -- Update the balance
    UPDATE Account
    SET Balance = Balance - @Amount
    WHERE AccountID = @AccountID;
    
    
    -- Generate receipt
    DECLARE @ReceiptID INT;
    INSERT INTO Receipts (AccountID, TransactionType, Amount, TransactionDate)
    VALUES (@AccountID, 'Withdraw', @Amount, GETDATE());
    SET @ReceiptID = SCOPE_IDENTITY();

    -- Output success message
    PRINT 'Withdrawal successful. Updated balance: ' + CAST((@CurrentBalance - @Amount) AS VARCHAR(20));
END;