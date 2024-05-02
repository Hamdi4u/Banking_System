CREATE PROCEDURE [dbo].[GetTransactionHistoryWithFilters]
  
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL,
    @TransactionType VARCHAR(50) = NULL,
    @MinAmount DECIMAL(18, 2) = NULL,
    @MaxAmount DECIMAL(18, 2) = NULL
   
AS
BEGIN
    SET NOCOUNT ON;
     Declare @ErrorMessage varchar(255);
    -- Initialize error message
    SET @ErrorMessage = NULL;

     SELECT * FROM Receipts
    WHERE (@StartDate IS NULL OR TransactionDate >= @StartDate)
        AND (@EndDate IS NULL OR TransactionDate <= @EndDate)
        AND (@TransactionType IS NULL OR TransactionType = @TransactionType)
        AND (@MinAmount IS NULL OR Amount >= @MinAmount)
        AND (@MaxAmount IS NULL OR Amount <= @MaxAmount);
   
END;