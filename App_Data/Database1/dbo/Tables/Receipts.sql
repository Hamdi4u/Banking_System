CREATE TABLE [dbo].[Receipts] (
    [ReceiptID]       INT             IDENTITY (1, 1) NOT NULL,
    [AccountID]       INT             NOT NULL,
    [TransactionType] NVARCHAR (50)   NULL,
    [TransactionDate] DATETIME        NULL,
    [Amount]          DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED ([ReceiptID] ASC)
);

