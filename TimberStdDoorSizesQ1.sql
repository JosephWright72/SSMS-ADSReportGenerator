DECLARE @ProjectID INT
SET @ProjectID = 28543
SELECT	
	AH.SetName,
	AD.Thickness,
	AD.FireRating + '/' + AD.AcousticRating AS Rating,
	CASE RIGHT(MAX(FrameDepthArray.FrameDepthList),1) WHEN ',' THEN LEFT(MAX(FrameDepthArray.FrameDepthList), LEN(MAX(FrameDepthArray.FrameDepthList))-1) ELSE REPLACE(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))), RTRIM(RIGHT(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))), CHARINDEX(',', REVERSE(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))))))), ' and' + RTRIM(RIGHT(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))), CHARINDEX(',', REVERSE(SUBSTRING(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '), 0, LEN(REPLACE(LTRIM(MAX(FrameDepthArray.FrameDepthList)), '  ', ' '))))) - 1))) END AS FrameDepthList
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
WHERE AP.id = @ProjectID
GROUP BY 
	AH.SetName,
	AD.Thickness,
	AD.AcousticRating,
	AD.FireRating
ORDER BY 
	AH.SetName