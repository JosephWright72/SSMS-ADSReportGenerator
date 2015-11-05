DECLARE @ProjectID INT SET @ProjectID = 28395 SET ARITHABORT ON
SELECT AP.ID, AP.ProjectName, CASE WHEN AP.OriginalProjectID IS NOT NULL or AP.OriginalProjectID <> '0'
	THEN CAST(AP.OriginalProjectID AS NVARCHAR(MAX))  +  '-'  +  CAST(AP.RevisionNumber AS NVARCHAR(MAX))
	ELSE CAST(AP.ID AS NVARCHAR(MAX)) END AS NewProjID,
	ACS.FirstName + ' ' + ACS.LastName ProjectOwner, AD.Mark, AH.SetDesc, AH.SetName, AD.Qty,
	CAST((AD.DoorPrice/CASE WHEN AD.Qty = 0 THEN 1 ELSE AD.Qty END) AS DECIMAL(18, 2)) AS UnitRate,
	CASE WHEN DAY(GETDATE()) IN ( 1, 21, 31 ) THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'st ' WHEN DAY(GETDATE()) IN ( 2, 22 ) 
	THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'nd ' WHEN DAY(GETDATE()) IN ( 3, 23 ) THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'rd ' 
	ELSE CONVERT(VARCHAR, DAY(GETDATE())) + 'th ' END + DATENAME(MONTH, GETDATE()) + ' '  + CONVERT(VARCHAR, YEAR(GETDATE()))
	TodaysDateEN, GETDATE() TodaysDate,
	LTRIM(MAX(Notes.List)) AS SetNotes
FROM AAOSDoors AD
INNER JOIN AAOSProjects AP ON AP.ID = AD.ProjectID
LEFT OUTER JOIN AAOSConsultants ACS ON AP.ArchConsultant = ACS.ID
LEFT OUTER JOIN AAOSHWSets AH ON AP.ID = AH.ProjectID AND AD.HWSet = AH.SetName
LEFT OUTER JOIN (
	SELECT DISTINCT (ProjectID)ProjectID, STUFF((
		SELECT ' ',  Char(13),  +SetNotes [text()]  
		FROM   (
			SELECT DISTINCT (ProjectID),  
				CASE WHEN Len(SetNotes) > 0 THEN (SetName + ' : '  + Replace(Replace(SetNotes, Char(13), ' '), Char(10), ' '))  
				ELSE NULL  END SetNotes  
			FROM  AAOSHWSets T  
			WHERE ProjectID = @ProjectID AND SetNotes != ''  
			GROUP BY ProjectID,	SetName, SetNotes) A  
		WHERE ProjectID = @ProjectID  FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List  
	FROM AAOSHWSets T  
	WHERE ProjectID = @ProjectID  
	GROUP BY ProjectID,	SetNotes) Notes 
ON Notes.ProjectID = AP.ID
WHERE AP.ID = @ProjectID 
GROUP BY AP.ID, AP.ProjectName, AP.OriginalProjectID, AP.RevisionNumber, ACS.FirstName, ACS.LastName, AD.Mark, AH.SetDesc, AH.SetName, AD.DoorPrice, AD.Qty