DECLARE @ProjectID INT
SET @ProjectID = 28543
SELECT	
	CASE MAX(AH.Leaf) WHEN 'A' THEN 'Single Leaf' WHEN 'B' THEN 'Equal Leaf Pairs' WHEN  'I' THEN 'Unequal Leaf Pairs' ELSE '' END AS Leaf,
	-1 AS ModuleSize,
	AD.Extra1 + CASE WHEN ISNULL(AD.Extra1,'') = '' THEN '' ELSE  ' x ' END + AD.Extra2 AS StructuralOpeningSize,
	CAST(AD.RoughWidth AS VARCHAR(MAX)) + ' x ' + CAST(AD.RoughHeight AS VARCHAR(MAX)) AS TimberFrameSize,
	CAST(AD.Width AS VARCHAR(MAX)) + ' x ' + CAST(AD.Height AS VARCHAR(MAX)) AS DoorLeafSize,
	-1 AS KickPlateSize
FROM	AAOSProjects AP
INNER JOIN AAOSDoors AD ON AP.id = AD.ProjectID
INNER JOIN AAOSHWSets AH ON AP.id = AH.ProjectID AND AD.hwset = AH.setname
WHERE AP.id = @ProjectID
GROUP BY 
	AD.Extra1 + CASE WHEN ISNULL(AD.Extra1,'') ='' THEN '' ELSE  ' x ' END + AD.Extra2,
	CAST(AD.RoughWidth AS VARCHAR(MAX)) + ' x ' + CAST(AD.RoughHeight AS VARCHAR(MAX)),
	CAST(AD.Width AS VARCHAR(MAX)) + ' x ' + CAST(AD.Height AS VARCHAR(MAX))
ORDER BY 1,4
