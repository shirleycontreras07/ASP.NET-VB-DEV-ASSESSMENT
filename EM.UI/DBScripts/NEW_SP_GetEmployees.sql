
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shirley Contreras
-- Create date: 11/26/2023
-- Description:	Get list of employees
-- =============================================
CREATE PROCEDURE GetEmployees
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
	   e.[ID]
      ,e.[FirstName]
      ,e.[SecondName]
      ,e.[PhoneNumber]
      ,e.[EmployeeType]
	  ,et.[Code] as EmployeeTypeCode
	  ,et.[Definition] as EmployeeTypeDefinition
  FROM 
	   [dbo].[Employee] e
  INNER JOIN 
	   [dbo].[EmployeeType] et
  ON 
	   e.EmployeeType = et.Code
END
GO
