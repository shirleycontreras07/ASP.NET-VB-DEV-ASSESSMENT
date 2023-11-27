SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shirley Contreras
-- Create date: 11/26/2023
-- Description:	Delete existing employee
-- =============================================
CREATE PROCEDURE DeleteEmployee (
	@ID INT
)
AS
BEGIN

	SET NOCOUNT ON;

DELETE FROM [dbo].[Employee]
 WHERE ID = @ID

END
GO