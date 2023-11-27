SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shirley Contreras
-- Create date: 11/26/2023
-- Description:	Insert employee to the employee table
-- =============================================
CREATE PROCEDURE InsertEmployee (
	@FirstName NVARCHAR(100), 
	@SecondName NVARCHAR(100), 
	@PhoneNumber NVARCHAR(15),
	@EmployeeType NVARCHAR(3)
)
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [dbo].[Employee]
           ([FirstName]
           ,[SecondName]
           ,[PhoneNumber]
           ,[EmployeeType])
     VALUES
           (@FirstName
           ,@SecondName
           ,@PhoneNumber
           ,@EmployeeType)
END
GO