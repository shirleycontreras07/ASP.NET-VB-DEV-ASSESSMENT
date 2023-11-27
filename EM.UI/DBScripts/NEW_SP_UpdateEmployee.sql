SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shirley Contreras
-- Create date: 11/26/2023
-- Description:	Update existing employee
-- =============================================
CREATE PROCEDURE UpdateEmployee (
	@ID INT,
	@FirstName NVARCHAR(100), 
	@SecondName NVARCHAR(100), 
	@PhoneNumber NVARCHAR(15),
	@EmployeeType NVARCHAR(3)
)
AS
BEGIN

	SET NOCOUNT ON;

UPDATE [dbo].[Employee]
   SET [FirstName] = @FirstName
      ,[SecondName] = @SecondName
      ,[PhoneNumber] = @PhoneNumber
      ,[EmployeeType] = @EmployeeType
 WHERE ID = @ID
END
GO