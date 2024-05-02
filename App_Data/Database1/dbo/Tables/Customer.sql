CREATE TABLE [dbo].[Customer] (
    [CustomerID]  INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (50)  NULL,
    [LastName]    NVARCHAR (50)  NULL,
    [Address]     NVARCHAR (100) NULL,
    [PhoneNumber] NVARCHAR (50)  NULL,
    [Username]    NVARCHAR (50)  NULL,
    [Email]       NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

