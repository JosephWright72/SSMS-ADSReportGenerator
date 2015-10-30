SELECT PARSENAME(FF.Usage2Value, 1) AS Leaf, PARSENAME(FF.Usage1Value,4) AS ModuleSize, 
	PARSENAME(FF.Usage1Value,3) AS StructuralOpeningSize, PARSENAME(FF.Usage1Value,2) AS TimberFrameSize,
	PARSENAME(FF.Usage1Value,2) AS DoorLeafSize, PARSENAME(FF.Usage2Value,3) AS KickPlateSize,
	FF2.Usage1Value AS FrameDepthList, PARSENAME(FF.Usage2Value,2) AS DoorTypes
FROM FormFields FF
INNER JOIN (SELECT FF.Usage1Value FROM FormFields FF WHERE FF.FormName = 'rptEMEATimberStdDoorSizes' 
AND FF.ColName = 'STD_FRAME_DEPTHS') FF2 ON 1=1
WHERE FF.FormName = 'rptEMEATimberStdDoorSizes' AND FF.ColName LIKE 'STD_DOOR_SIZES%'
ORDER BY FF.ColNumber, CAST (PARSENAME(FF.Usage1Value,4) AS INT)