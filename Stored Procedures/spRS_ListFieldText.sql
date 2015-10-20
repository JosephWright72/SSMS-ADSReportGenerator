SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spRS_ListFieldText')
	DROP PROCEDURE dbo.spRS_ListFieldText
GO

CREATE PROCEDURE dbo.spRS_ListFieldText
	@Locale		NVARCHAR(20),
	@ReportName	NVARCHAR(MAX),
	@FormName	NVARCHAR(MAX),
	@Usage2Name	VARCHAR(20),
	@Debug		BIT = 0
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @Debug = 1
	BEGIN
		PRINT '@Locale:[' + @Locale + ']'
		PRINT '@ReportName:[' + @ReportName + ']'
		PRINT '@Usage2Name:[' + @Usage2Name + ']'
	END

	SELECT	Locale,
			FormName,
			ColName,
			VisibleColText,
			Usage2Value
	FROM	dbo.FormFields (NOLOCK)
	WHERE	Locale = @Locale
	AND		FormName IN (@ReportName, @FormName) 
	AND		Usage2Name != @Usage2Name

END