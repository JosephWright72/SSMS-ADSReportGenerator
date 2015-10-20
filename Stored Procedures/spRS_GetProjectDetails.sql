SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spRS_GetProjectDetails')
	DROP PROCEDURE dbo.spRS_GetProjectDetails
GO

CREATE PROCEDURE dbo.spRS_GetProjectDetails
	@ProjectID	INT,
	@Debug		BIT = 0
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @Debug = 1
	BEGIN
		PRINT '@ProjectID:[' + CAST(@ProjectID AS VARCHAR(10)) + ']'
	END

	SET ARITHABORT ON

    SELECT	
		AP.ID ProjectReference,
		AP.ProjectName,
		(ACS.FirstName + ' ' + ACS.LastName) AS ProjectOwner,
		CASE WHEN Day(Getdate()) IN ( 1, 21, 31 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'st ' WHEN Day(Getdate()) IN ( 2, 22 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'nd ' WHEN Day(Getdate()) IN ( 3, 23 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'rd ' ELSE CONVERT(VARCHAR, Day(Getdate())) + 'th ' END + Datename(month, Getdate()) + ' '
		+ CONVERT(VARCHAR, Year(Getdate()))TodaysDateEN, GETDATE() TodaysDate,
		CS.firstname + ' ' + CS.lastname SpecConsult,
		ACS.Email AS PrjOwnEmail,
		CS.Email AS SpecConEmail,
		ACS.Phone PrjOwnNumber,
		CS.Phone SpecConNumber,
		ACS.Title PrjOwnTitle,
		CS.Title SpecConTitle
    FROM   
		AAOSProjects AP (NOLOCK) 
	LEFT OUTER JOIN AAOSConsultants (NOLOCK) ACS ON AP.ArchConsultant = ACS.ID
	LEFT OUTER JOIN AAOSConsultants CS (NOLOCK) ON AP.consultant = CS.id
    WHERE  
		AP.ID = @ProjectID
    GROUP BY 
		AP.ID,
		AP.ProjectName, 
		(ACS.FirstName + ' '  + ACS.LastName),
		ACS.firstname + ' ' + ACS.lastname, CS.firstname + ' ' + CS.lastname, 
		ACS.Email, 
		CS.Email, 
		ACS.Phone, 
		CS.Phone, 
		ACS.Title, 
		CS.Title
END