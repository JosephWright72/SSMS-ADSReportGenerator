DECLARE @ProjectID INT SET @ProjectID = 28478 SET ARITHABORT ON
SELECT AP.ID, AP.ProjectName, CASE WHEN ISNULL(AP.OriginalProjectID, 0) <> '0'
	THEN CAST(AP.OriginalProjectID AS NVARCHAR(MAX))  +  '-'  +  CAST(AP.RevisionNumber AS NVARCHAR(MAX))
	ELSE CAST(AP.ID AS NVARCHAR(MAX)) END AS NewProjID, ISNULL(AP.OriginalProjectID, 0) AS OriginalProjectID,
	CAST(AP.RevisionNumber AS NVARCHAR(MAX)) AS Revision,
	ACS.FirstName + ' ' + ACS.LastName ProjectOwner, AD.DoorElevation, AD.ArchDoorType, AD.DoorMaterial, 
	CASE MAX(AH.Leaf) WHEN 'A' THEN 'Single' WHEN 'B' THEN 'Equal Pair' WHEN  'I' THEN 'Unequal Pairs' 
	ELSE 'Single' END AS Leaf, AD.Qty, AD.FireRating, AD.AcousticRating, 
	CAST((AD.DoorPrice/CASE WHEN AD.Qty = 0 THEN 1 ELSE AD.Qty END) AS DECIMAL(18, 2)) AS UnitRate,
	CASE WHEN DAY(GETDATE()) IN ( 1, 21, 31 ) THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'st ' WHEN DAY(GETDATE()) IN ( 2, 22 ) 
	THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'nd ' WHEN DAY(GETDATE()) IN ( 3, 23 ) THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'rd ' 
	ELSE CONVERT(VARCHAR, DAY(GETDATE())) + 'th ' END + DATENAME(MONTH, GETDATE()) + ' '  + CONVERT(VARCHAR, YEAR(GETDATE()))
	TodaysDateEN, GETDATE() TodaysDate
FROM AAOSDoors AD
INNER JOIN AAOSProjects AP ON AP.ID = AD.ProjectID
LEFT OUTER JOIN AAOSConsultants ACS ON AP.ArchConsultant = ACS.ID
LEFT OUTER JOIN AAOSHWSets AH ON AP.ID = AH.ProjectID AND AD.HWSet = AH.SetName
--WHERE AP.ID = @ProjectID 
where ACS.firstname='Colin' and isnull(AD.ArchDoorType,'') <>''
GROUP BY AP.ID, AP.ProjectName, AP.OriginalProjectID, AP.RevisionNumber, ACS.FirstName, ACS.LastName, AD.DoorElevation, AD.ArchDoorType,
	AD.DoorMaterial, AD.UOM, AD.Qty, AD.FireRating, AD.AcousticRating, AD.Qty, AD.DoorPrice
	order by 1
