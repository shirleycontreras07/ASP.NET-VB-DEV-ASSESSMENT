USE [EmployeeEvaluationDB]
GO

/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 26/11/2023 11:02:58 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Shirley Contreras
-- Create date: 11/26/2023
-- Description:	Get list of employee types
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeeTypes]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
	   [Code]
      ,[Definition]
  FROM [dbo].[EmployeeType]
END
GO


