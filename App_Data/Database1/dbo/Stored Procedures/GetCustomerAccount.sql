CREATE PROCEDURE [dbo].[GetCustomerAccount]
   @Username NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    

  SELECT     Customer.CustomerID, Customer.FirstName, Customer.LastName, Customer.Address, Customer.PhoneNumber, Customer.Username, Customer.Email, Account.AccountID, 
                      Account.CustomerID AS Expr1, Account.AccountType, Account.Balance
FROM         Account INNER JOIN
                      Customer ON Account.CustomerID = Customer.CustomerID
                      where Customer.Username=@Username;
END;