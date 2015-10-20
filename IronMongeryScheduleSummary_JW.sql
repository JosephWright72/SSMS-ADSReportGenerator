DECLARE @ProjectID INT
DECLARE @DOORFILTER INT
SET @ProjectID = 28640
SET @DOORFILTER = 2
SET ARITHABORT ON 

SELECT 
	AP.ID ProjectReference, 
	AP.ProjectName, 
	(ACS.FirstName + ' ' + ACS.LastName) AS ProjectOwner, 
	CASE WHEN Day(Getdate()) IN ( 1, 21, 31 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'st ' WHEN Day(Getdate()) IN ( 2, 22 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'nd ' WHEN Day(Getdate()) IN ( 3, 23 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'rd ' ELSE CONVERT(VARCHAR, Day(Getdate())) + 'th ' END + Datename(month, Getdate()) + ' ' 
	+ CONVERT(VARCHAR, Year(Getdate()))TodaysDateEN, getdate() TodaysDate, 
	'\\segbgsis103\AlanT\Collateral Data UK\'+CASE WHEN LEFT(FileName, 1) = '\' THEN RIGHT(FileName, LEN(FileName)-1) ELSE FileName END as Image,
	HW.Description ProductCode, 
	HW.TypeDescription   ProductDescription, 
	PH.UOM,
	Sum(ISNULL(NULLIF(HW.Qty, ''), 0) * ISNULL(Doors.Qty, 0)) Quantity, 
	Cast(Sum(Cast(Cast(HW.Price AS DECIMAL(18, 2)) * CASE WHEN (ISNULL(Doors.Qty, 0)) = 0 THEN 1 ELSE (ISNULL(Doors.Qty, 0)) END AS DECIMAL(18, 2)))/CASE WHEN Sum(ISNULL(NULLIF(HW.Qty, ''), 0) * ISNULL(Doors.Qty, 0)) = 0 THEN 1 ELSE Sum(ISNULL(NULLIF(HW.Qty, ''), 0) * ISNULL(Doors.Qty, 0)) END  AS DECIMAL(18, 2)) AS UnitRate,
	Sum(Cast(Cast(HW.Price AS DECIMAL(18, 2)) * (ISNULL(Doors.Qty, 0)) AS DECIMAL(18, 2))) AS ExtendedRate, 
	Ltrim(Max(Notes.List)) AS SetNotes ,
	ACS.firstname + ' ' + ACS.lastname ProjectOwner, 
	CS.firstname + ' ' + CS.lastname SpecConsult, 
	ACS.Email AS PrjOwnEmail ,
	CS.Email AS SpecConEmail ,
	ACS.Phone PrjOwnNumber, 
	CS.Phone SpecConNumber, 
	ACS.Title PrjOwnTitle, 
	CS.Title SpecConTitle 
FROM   
	AAOSProjectHardware PH 
RIGHT OUTER JOIN AAOSHWSets HW ON PH.Item = HW.Product 
LEFT OUTER JOIN AAOSProjects AP ON HW.ProjectID = AP.ID 
LEFT OUTER JOIN AAOSConsultants ACS ON AP.ArchConsultant = ACS.ID 
left outer join AAOSConsultants CS on AP.consultant = CS.id
left outer JOIN AAOSProjectHardware APH ON  CAST(HW.[DESCRIPTION] AS VARBINARY(MAX)) =  CAST(APH.[description] AS VARBINARY(MAX)) AND APH.ProjectID=HW.PROJECTID 
left outer JOIN AAOS_UAT_UK.dbo.hardwarestandard HST ON  LEFT(APH.IDs, CHARINDEX(',', APH.IDs)-1) = HST.HDW_STD_ID 
left outer JOIN AAOS_UAT_UK.dbo.images img ON  HST.Img1 = img.Image_id 
LEFT OUTER JOIN (
	SELECT 
		ProjectID, 
		SetName, 
		Sum(Cast (QTY AS INT)) Qty, 
		Sum(Cast(CASE WHEN Len(AAOSHWSets.Price) = 0 THEN '0.00' 
				 ELSE AAOSHWSets.Price 
				 END AS DECIMAL(18, 2)) * Cast (QTY AS INT)) Price 
	FROM   AAOSHWSets 
	WHERE  AAOSHWSets.ProjectID = @ProjectID 
	GROUP  BY AAOSHWsets.ProjectID,SetName) Totals 
ON Totals.ProjectID = HW.ProjectID 
AND Totals.SetName = HW.SetName 
LEFT OUTER JOIN (
	SELECT 
		ProjectID, 
		HWSet, 
		Sum(QTY)   Qty, 
		Stuff((	SELECT	', ' + Cast(Mark AS VARCHAR(250)) [text()] 
				FROM	AAOSDoors 
				WHERE	HWSet = T.HWSet 
				AND		ProjectID = @ProjectID 
				FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List 
	FROM   AAOSDoors T 
	WHERE  ProjectID = @ProjectID 
	AND    (Charindex('deleted', ChangeLog) < 1) 
	GROUP  BY ProjectID,HWSet) Doors 
ON	Doors.HWSet = HW.SetName 
AND Doors.ProjectID = HW.ProjectID 
LEFT OUTER JOIN (
	SELECT	DISTINCT (ProjectID)ProjectID, 
			Stuff((	SELECT ' ', Char(13), +SetNotes [text()] 
					FROM   (SELECT	DISTINCT (ProjectID), 
									CASE WHEN Len(SetNotes) > 0 THEN (SetName + ' : ' + Replace(Replace(SetNotes, Char(13), ' '), Char(10), ' ')) 
									ELSE NULL 
									END SetNotes 
							FROM   AAOSHWSets T 
							WHERE  ProjectID = @ProjectID 
							AND	   setnotes != '' 
							GROUP  BY ProjectID,SetName,SetNotes) A 
					WHERE  ProjectID = @ProjectID 
					FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List 
	FROM   AAOSHWSets T 
	WHERE  ProjectID = @ProjectID 
	GROUP  BY ProjectID,SetNotes) Notes ON Notes.ProjectID = AP.id 
WHERE	(HW.ProjectID = @ProjectID) 
AND		(AP.ID = @ProjectID) 
AND		(PH.ProjectID = @ProjectID) 
AND		ISNULL(NULLIF(HW.Qty, ''), 0) != 0
AND		ISNULL(CASE WHEN DOORS.QTY = 0 THEN 0 WHEN DOORS.QTY > 0 THEN 1 END, 0) =	
	CASE @DOORFILTER
	WHEN 0 THEN 0
	WHEN 1 THEN 1
	ELSE ISNULL(CASE WHEN DOORS.QTY = 0 THEN 0 WHEN DOORS.QTY > 0 THEN 1 END, 0)
	END
GROUP  BY 
	AP.ID,AP.ProjectName, 
	(ACS.FirstName + ' '  + ACS.LastName),
	HW.Description,
	HW.TypeDescription,
	--HW.Price,
	PH.UOM, 
	ACS.firstname + ' ' + ACS.lastname, 
	CS.firstname + ' ' + CS.lastname, 
	ACS.Email, 
	CS.Email, 
	ACS.Phone, 
	CS.Phone, 
	ACS.Title, 
	CS.Title,
	filename
ORDER  BY HW.Description 
