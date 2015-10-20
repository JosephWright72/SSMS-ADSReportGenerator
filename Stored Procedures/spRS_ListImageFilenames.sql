SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spRS_ListImageFilenames')
	DROP PROCEDURE dbo.spRS_ListImageFilenames
GO

CREATE PROCEDURE dbo.spRS_ListImageFilenames
	@ImagesPath	VARCHAR(255),
	@Debug		BIT = 0
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @Debug = 1
	BEGIN
		PRINT '@ImagesPath:[' + @ImagesPath + ']'
	END

	SET ARITHABORT ON

    SELECT	
		HST.HDW_STD_ID,
		@ImagesPath + CASE WHEN LEFT(FileName, 1) = '\' THEN RIGHT(FileName, LEN(FileName)-1) ELSE FileName END as [Image]
	FROM
		dbo.hardwarestandard HST (NOLOCK)
	LEFT OUTER JOIN
		dbo.images img (NOLOCK) ON  HST.Img1 = img.Image_id

END