 DECLARE @ProjectID INT 
 DECLARE @DOORFILTER INT 
 SET @ProjectID = 28520
 SET @DOORFILTER = 2 
 SET ARITHABORT ON  
 SELECT 
	AP.ID ProjectReference,  
	AP.ProjectName, 
	CASE WHEN AP.OriginalProjectID IS NOT NULL or AP.OriginalProjectID <> '0' THEN CAST(AP.OriginalProjectID AS nvarchar(max))  +  '-'  +  CAST(AP.RevisionNumber AS nvarchar(max)) ELSE CAST(AP.ID AS nvarchar(max)) END as NewProjID, 
	(ACS.FirstName + ' ' + ACS.LastName) AS ProjectOwner,  
	CASE WHEN Day(Getdate()) IN ( 1, 21, 31 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'st ' WHEN Day(Getdate()) IN ( 2, 22 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'nd ' WHEN Day(Getdate()) IN ( 3, 23 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'rd ' ELSE CONVERT(VARCHAR, Day(Getdate())) + 'th ' END + Datename(month, Getdate()) + ' '  + CONVERT(VARCHAR, Year(Getdate()))TodaysDateEN, getdate() TodaysDate, 
	'\\segbgsis103\AlanT\Collateral Data UK\' + CASE WHEN LEFT(img.[FileName], 1) = '\' THEN RIGHT(img.[FileName], LEN(img.[FileName])-1) ELSE img.[FileName] END as [Image], 
	'file:' + REPLACE('//segbgsis103/AlanT/Collateral Data UK/' + CASE WHEN LEFT(pdf.[FileName], 1) = '\' THEN RIGHT(pdf.[FileName], LEN(pdf.[FileName])-1) ELSE pdf.[FileName] END, '\', '/') as [PDF], 
	HW.Description ProductCode,  
	HW.TypeDescription   ProductDescription,  
	PH.UOM,  
	Sum(ISNULL(NULLIF(HW.Qty, ''), 0) * ISNULL(NULLIF(Doors.Qty,''), 1)) Quantity,
	CAST((HW.PRICE/CASE WHEN HW.Qty = 0 THEN 1 ELSE HW.Qty END) AS DECIMAL(18, 2)) AS UnitRate,  
	(Sum(ISNULL(NULLIF(HW.Qty, ''), 0) * ISNULL(NULLIF(Doors.Qty,''), 0))) * (CAST((HW.PRICE/CASE WHEN HW.Qty = 0 THEN 1 ELSE HW.Qty END) AS DECIMAL(18, 2))) AS ExtendedRate,  
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
	LEFT OUTER JOIN AAOSConsultants CS on AP.consultant = CS.id 
	LEFT OUTER JOIN (
		SELECT	[Description], MIN(x.ImageID) AS ImageID, ProjectID FROM AAOSProjectHardware APH
		INNER JOIN (
			SELECT A.ID, Split.a.value('.', 'VARCHAR(MAX)') AS ImageID  
			FROM  (
				SELECT ID,  CAST ('<M>' + REPLACE([imageids], ',', '</M><M>') + '</M>' AS XML) AS String  
				FROM  AAOSProjectHardware 
				WHERE ProjectID = @ProjectID) 
			AS A CROSS APPLY String.nodes ('/M') AS Split(a)
			WHERE ISNULL(Split.a.value('.', 'VARCHAR(MAX)'),'') <> ''
			UNION
			SELECT ID,ImageIDs FROM AAOSProjectHardware where ProjectID = @ProjectID AND ISNULL(ImageIDs,'') ='' ) x
			INNER JOIN 
				(SELECT Image_id, [Filename] 
				FROM AAOS_UAT_UK.dbo.images img 
				WHERE (NOT (UPPER([Filename]) LIKE '%.PDF') OR ISNULL([Filename],'') = '')) img 
			ON  x.ImageID = img.Image_id
		ON x.ID = APH.ID  GROUP BY [Description], ProjectID ) APH 
	ON  CAST(HW.[DESCRIPTION] AS VARBINARY(MAX)) =  CAST(APH.[description] AS VARBINARY(MAX)) 
	AND APH.ProjectID=HW.PROJECTID
	LEFT OUTER JOIN (
		SELECT	[Description], MIN(x.ImageID) AS ImageID, ProjectID FROM AAOSProjectHardware APH
		INNER JOIN (
			SELECT A.ID, Split.a.value('.', 'VARCHAR(MAX)') AS ImageID  
			FROM  (
				SELECT ID,  CAST ('<M>' + REPLACE([imageids], ',', '</M><M>') + '</M>' AS XML) AS String  
				FROM  AAOSProjectHardware 
				WHERE ProjectID = @ProjectID) 
			AS A CROSS APPLY String.nodes ('/M') AS Split(a)
			WHERE ISNULL(Split.a.value('.', 'VARCHAR(MAX)'),'') <> ''
			UNION
			SELECT ID,ImageIDs FROM AAOSProjectHardware where ProjectID = @ProjectID AND ISNULL(ImageIDs,'') ='' ) x
			INNER JOIN 
				(SELECT Image_id, [Filename] 
				FROM AAOS_UAT_UK.dbo.images img 
				WHERE ((UPPER([Filename]) LIKE '%.PDF') OR ISNULL([Filename],'') = '')) img 
			ON  x.ImageID = img.Image_id
		ON x.ID = APH.ID  GROUP BY [Description], ProjectID ) APH2
	ON  CAST(HW.[DESCRIPTION] AS VARBINARY(MAX)) =  CAST(APH2.[description] AS VARBINARY(MAX)) 
	AND APH2.ProjectID=HW.PROJECTID
	LEFT OUTER JOIN AAOS_UAT_UK.dbo.images img ON APH.ImageID= img.Image_ID
	LEFT OUTER JOIN AAOS_UAT_UK.dbo.images pdf ON APH2.ImageID= pdf.Image_ID
	LEFT OUTER JOIN (
		SELECT 
			ProjectID,  
			SetName,  
			Sum(Cast (QTY AS INT)) Qty,  
			Sum(Cast(CASE WHEN Len(AAOSHWSets.Price) = 0 THEN '0.00'  ELSE AAOSHWSets.Price  END AS DECIMAL(18, 2)) * Cast (QTY AS INT)) Price  
		FROM   
			AAOSHWSets  
		WHERE  
			AAOSHWSets.ProjectID = @ProjectID  
		GROUP  BY 
			AAOSHWsets.ProjectID,
			SetName) Totals 
	ON Totals.ProjectID = HW.ProjectID 
	AND  Totals.SetName = HW.SetName  
	LEFT OUTER JOIN (
		SELECT 
			ProjectID,  
			HWSet,  
			Sum(QTY)   Qty,  
			Stuff((
				SELECT ', ' + Cast(Mark AS VARCHAR(250)) [text()]  
				FROM   AAOSDoors  
				WHERE  HWSet = T.HWSet 
				AND  ProjectID = @ProjectID  
				FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List  
		FROM   
			AAOSDoors T  
		WHERE  
			ProjectID = @ProjectID 
		AND  (Charindex('deleted', ChangeLog) < 1)  
		GROUP  BY ProjectID,HWSet) Doors 
	ON Doors.HWSet = HW.SetName 
	AND  Doors.ProjectID = HW.ProjectID  
WHERE  (HW.ProjectID = @ProjectID)  
AND (AP.ID = @ProjectID)  
AND (PH.ProjectID = @ProjectID)  
AND ISNULL(NULLIF(HW.Qty, ''), 0) != 0  
AND ISNULL(CASE WHEN DOORS.QTY = 0 THEN 0 WHEN DOORS.QTY > 0 THEN 1 END, 0) =  CASE @DOORFILTER WHEN 0 THEN 1 WHEN 1 THEN 0 ELSE ISNULL(CASE WHEN DOORS.QTY = 0 THEN 0 WHEN DOORS.QTY > 0 THEN 1 END, 0) END 
GROUP  BY APH.ImageID,img.Image_ID,
	AP.ID,
	AP.ProjectName,
	AP.OriginalProjectID,
	AP.RevisionNumber,
	PH.DHI, 
	(ACS.FirstName + ' '  + ACS.LastName),
	HW.Description,
	HW.TypeDescription,
	CAST((HW.PRICE/CASE WHEN HW.Qty = 0 THEN 1 ELSE HW.Qty END) AS DECIMAL(18, 2)),
	PH.UOM, 
	ACS.firstname + ' ' + ACS.lastname, CS.firstname + ' ' + CS.lastname, 
	ACS.Email, 
	CS.Email, 
	ACS.Phone, 
	CS.Phone, 
	ACS.Title, 
	CS.Title,
	img.[Filename],
	pdf.[Filename]
ORDER  BY PH.DHI
