CREATE PROCEDURE [dbo].[EditAccountDetails]
    @AccountID INT,
    @NewAccountType VARCHAR(50),
    @NewFirstName VARCHAR(50),
    @NewLastName VARCHAR(50),
    @NewAddress VARCHAR(100),
    @NewPhoneNumber VARCHAR(15),
    @NewEmail VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update account type
    UPDATE Account
    SET AccountType = @NewAccountType
    WHERE AccountID = @AccountID;

    -- Update customer information if provided
    IF (@NewFirstName IS NOT NULL AND @NewLastName IS NOT NULL AND @NewAddress IS NOT NULL AND @NewPhoneNumber IS NOT NULL AND @NewEmail IS NOT NULL)
    BEGIN
        UPDATE Customer
        SET FirstName = @NewFirstName,
            LastName = @NewLastName,
            Address = @NewAddress,
            PhoneNumber = @NewPhoneNumber,
            Email=@NewEmail
        WHERE CustomerID = (SELECT CustomerID FROM Account WHERE AccountID = @AccountID);
    END

    PRINT 'Account details updated successfully.';
END;