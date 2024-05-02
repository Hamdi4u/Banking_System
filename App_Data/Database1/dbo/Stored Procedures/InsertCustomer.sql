CREATE PROCEDURE [dbo].[InsertCustomer]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(50),
    @Address NVARCHAR(100),
    @PhoneNumber NVARCHAR(15),
    @Username NVARCHAR(50),
    @CustomerID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
 DECLARE @ErrorMessage VARCHAR(255);
    -- Check if the username already exists
    IF EXISTS (SELECT 1 FROM Customer WHERE Username = @Username)
    BEGIN
       set @ErrorMessage='Username already exists.';
        RETURN;
    END;

    -- Insert into Customer table
    INSERT INTO Customer (FirstName, LastName,Email, [Address], PhoneNumber, Username)
    VALUES (@FirstName, @LastName,@Email,@Address, @PhoneNumber, @Username)
    set @CustomerID = SCOPE_IDENTITY()
    -- Output success message
    --PRINT 'Customer inserted successfully. CustomerID: ' + CAST(@CustomerID AS NVARCHAR(10));
   Return @CustomerID;
END;