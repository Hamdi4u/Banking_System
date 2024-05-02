CREATE PROCEDURE [dbo].[DepositCashWithReceipt]
    @AccountID INT,
    @Amount DECIMAL(18, 2)
    
AS
BEGIN
    SET NOCOUNT ON;
    declare @ErrorMessage VARCHAR(255);
    SET @ErrorMessage = NULL;
    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM Account WHERE AccountID = @AccountID)
    BEGIN
        SET @ErrorMessage = 'Account does not exist.';
        RETURN;
    END

    -- Update the balance
    UPDATE Account
    SET Balance = Balance + @Amount
    WHERE AccountID = @AccountID;

    -- Generate receipt
    DECLARE @ReceiptID INT;
    INSERT INTO Receipts (AccountID, TransactionType, Amount, TransactionDate)
    VALUES (@AccountID, 'Deposit', @Amount, GETDATE());
    SET @ReceiptID = SCOPE_IDENTITY();

    -- Output receipt information
    SELECT 'Receipt generated successfully. Receipt ID: ' + CAST(@ReceiptID AS VARCHAR(10)) AS ReceiptInfo;
END;
