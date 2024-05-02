CREATE TABLE [dbo].[Account] (
    [AccountID]   INT             IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT             NULL,
    [BankID]      INT             NULL,
    [AccountType] VARCHAR (50)    NULL,
    [Balance]     DECIMAL (18, 2) NULL,
    CONSTRAINT [PK__Account__349DA5860CBAE877] PRIMARY KEY CLUSTERED ([AccountID] ASC),
    CONSTRAINT [FK__Account__BankID__0F975522] FOREIGN KEY ([BankID]) REFERENCES [dbo].[Bank] ([BankID])
);

