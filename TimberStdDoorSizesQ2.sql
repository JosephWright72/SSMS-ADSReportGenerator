DECLARE @ProjectID INT
SET @ProjectID = 28618
SELECT	
	CASE MAX(AH.Leaf) WHEN 'A' THEN 'Single Leaf' WHEN 'B' THEN 'Equal Leaf Pairs' WHEN  'I' THEN 'Unequal Leaf Pairs' ELSE 'Single Leaf' END AS Leaf,
	-1 AS ModuleSize,
	AD.Extra1 + CASE WHEN ISNULL(AD.Extra1,'') = '' THEN '' ELSE  ' x ' END + AD.Extra2 AS StructuralOpeningSize,
	CAST(AD.RoughWidth AS VARCHAR(MAX)) + ' x ' + CAST(AD.RoughHeight AS VARCHAR(MAX)) AS TimberFrameSize,
	CASE MAX(AH.Leaf) WHEN 'A' THEN '' WHEN 'B' THEN CAST(AD.Width AS VARCHAR(MAX)) + ' + ' WHEN 'I' THEN '-1' + ' + ' ELSE '' END + CAST(AD.Width AS VARCHAR(MAX)) + ' x ' + CAST(AD.Height AS VARCHAR(MAX)) AS DoorLeafSize, /* TODO 'I' Door Leaf Size */
	-1 AS KickPlateSize,
	CASE RIGHT(MAX(FrameDepthArray.FrameDepthList),1) WHEN ',' THEN LEFT(MAX(FrameDepthArray.FrameDepthList), LEN(MAX(FrameDepthArray.FrameDepthList))-1) ELSE REPLACE(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))), RTRIM(RIGHT(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))), CHARINDEX(',', REVERSE(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))))))), ' and' + RTRIM(RIGHT(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))), CHARINDEX(',', REVERSE(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))))) - 1))) END AS FrameDepthList,
	REPLACE(X.HWList, ' ,', ', ') AS DoorTypes
FROM	AAOSProjects AP
INNER JOIN AAOSDoors AD ON AP.id = AD.ProjectID
INNER JOIN AAOSHWSets AH ON AP.id = AH.ProjectID AND AD.hwset = AH.setname
LEFT OUTER JOIN (
	SELECT	DISTINCT (ProjectID) ProjectID, 
			STUFF((	SELECT ' ', ' ', + AD.FrameDepth [text()] 
					FROM   (SELECT	TOP 10000 (ProjectID), 
									CASE WHEN LEN(CAST (AD.FrameDepth AS VARCHAR(MAX))) > 0 THEN (CAST(AD.FrameDepth AS VARCHAR(MAX)) + ',' )
									ELSE NULL 
									END FrameDepth
							FROM   AAOSDoors AD 
							WHERE  ProjectID = @ProjectID 
							AND	   AD.FrameDepth != '' 
							GROUP  BY ProjectID,AD.FrameDepth
							ORDER BY AD.FrameDepth) AD 
					WHERE  ProjectID = @ProjectID 
					FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' '
					) FrameDepthList
	FROM   AAOSDoors AD
	WHERE  AD.ProjectID = @ProjectID 
	GROUP  BY AD.ProjectID) FrameDepthArray ON FrameDepthArray.ProjectID = AP.id 
LEFT OUTER JOIN(
	SELECT DISTINCT (AH.ProjectID) ProjectID, AD.Extra1, AD.Extra2, AD.RoughWidth, AD.RoughHeight, AD.Width, AD.Height,
		Stuff((SELECT ' ',  ',',  +SetNotes [text()]  
		FROM   (
			SELECT DISTINCT (AH.ProjectID), AD.Extra1,AD.Extra2,AD.RoughWidth,AD.RoughHeight,AD.Width,AD.Height,AH.SetName SetNotes  
			FROM   AAOSProjects AP
			INNER JOIN AAOSDoors AD ON AP.id = AD.ProjectID
			INNER JOIN AAOSHWSets AH ON AP.id = AH.ProjectID AND AD.hwset = AH.setname
			WHERE  AP.ID = @ProjectID AND  SetName != ''  
			GROUP  BY AH.ProjectID,AD.Extra1,AD.Extra2,AD.RoughWidth,AD.RoughHeight,AD.Width,AD.Height,SetName) A  
		WHERE A.ProjectID = @ProjectID AND ISNULL(A.Extra1,'') = ISNULL(AD.Extra1,'') AND ISNULL(A.Extra2,'') = ISNULL(AD.Extra2,'')
		AND ISNULL(A.RoughWidth,'') = ISNULL(AD.RoughWidth,'') AND ISNULL(A.RoughHeight,'') = ISNULL(AD.RoughHeight,'')
		AND ISNULL(A.Width,'') = ISNULL(AD.Width,'') AND ISNULL(A.Height,'') = ISNULL(AD.Height,'')
		FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') HWList  
	FROM  AAOSProjects AP  
	INNER JOIN AAOSDoors AD ON AP.id = AD.ProjectID
	INNER JOIN AAOSHWSets AH ON AP.id = AH.ProjectID AND AD.hwset = AH.setname
	WHERE AH.ProjectID = @ProjectID  
	GROUP  BY AH.ProjectID,AD.Extra1,AD.Extra2,AD.RoughWidth,AD.RoughHeight,AD.Width,AD.Height ) X
ON ISNULL(X.Extra1,'') = ISNULL(AD.Extra1,'') AND ISNULL(X.Extra2,'') = ISNULL(AD.Extra2,'') 
AND ISNULL(X.RoughWidth,'') = ISNULL(AD.RoughWidth,'') AND ISNULL(X.RoughHeight,'') = ISNULL(AD.RoughHeight,'') 
AND ISNULL(X.Width,'') = ISNULL(AD.Width,'') AND ISNULL(X.Height,'') = ISNULL(AD.Height,'')
WHERE AP.id = @ProjectID
GROUP BY AD.Extra1,AD.Extra2,AD.RoughWidth,AD.RoughHeight,AD.Width,AD.Height,X.HWList
ORDER BY CASE MAX(AH.Leaf) WHEN  'A' THEN 1 WHEN 'I' THEN 2 WHEN 'B' THEN 3 ELSE 999 END, 4
