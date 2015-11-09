DECLARE @ProjectID INT SET @ProjectID = 28418 SET ARITHABORT ON
SELECT AP.ID, AP.ProjectName, CASE WHEN AP.OriginalProjectID IS NOT NULL or AP.OriginalProjectID <> '0'
	THEN CAST(AP.OriginalProjectID AS NVARCHAR(MAX))  +  '-'  +  CAST(AP.RevisionNumber AS NVARCHAR(MAX))
	ELSE CAST(AP.ID AS NVARCHAR(MAX)) END AS NewProjID,
	ACS.FirstName + ' ' + ACS.LastName ProjectOwner, AD.Mark, AD.ToRoom, AD.FromRoom, AD.DoorElevation, AD.FireRating,
	AD.AcousticRating, AD.Undercut, AD.Thickness, AD.DoorFinish, AD.DoorEdge, AH.SetName, 'TBD' AS Glass, 'TBD' AS Aperture,		
	AD.FrameDepth, AD.Extra1, AD.Extra2,  ROUND(AD.RoughWidth,1) AS FrameWidth, ROUND(AD.RoughHeight,1) AS FrameHeight,
	AD.ArchFrameFinish, AD.DoorSeries AS Threshold, AD.SpecifierRemarks, AD.Handing,
	CAST((AD.DoorPrice/CASE WHEN AD.Qty = 0 THEN 1 ELSE AD.Qty END) AS DECIMAL(18, 2)) AS DoorNetPrice,
	CAST((AH.PRICE/CASE WHEN AH.Qty = 0 THEN 1 ELSE AH.Qty END) AS DECIMAL(18, 2)) AS HWSetNetPrice, 'TBD' AS Fitting, 
	CAST((AD.DoorPrice/CASE WHEN AD.Qty = 0 THEN 1 ELSE AD.Qty END) AS DECIMAL(18, 2)) +
	CAST((AH.PRICE/CASE WHEN AH.Qty = 0 THEN 1 ELSE AH.Qty END) AS DECIMAL(18, 2)) AS Total, 
	CASE WHEN DAY(GETDATE()) IN ( 1, 21, 31 ) THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'st ' WHEN DAY(GETDATE()) IN ( 2, 22 ) 
	THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'nd ' WHEN DAY(GETDATE()) IN ( 3, 23 ) THEN CONVERT(VARCHAR, DAY(GETDATE())) + 'rd ' 
	ELSE CONVERT(VARCHAR, DAY(GETDATE())) + 'th ' END + DATENAME(MONTH, GETDATE()) + ' '  + CONVERT(VARCHAR, YEAR(GETDATE()))
	TodaysDateEN, GETDATE() TodaysDate
FROM AAOSDoors AD
INNER JOIN AAOSProjects AP ON AP.ID = AD.ProjectID
LEFT OUTER JOIN AAOSConsultants ACS ON AP.ArchConsultant = ACS.ID
LEFT OUTER JOIN AAOSHWSets AH ON AP.ID = AH.ProjectID AND AD.HWSet = AH.SetName
where ah.setname is not null and ad.qty>0 and ad.doorprice>0
--WHERE AP.ID = @ProjectID
