DECLARE @ProjectID INT
SET @ProjectID = 28618
SELECT	
	AH.SetName,
	AD.Thickness,
	AD.AcousticRating,
	AD.FireRating,
	AD.FrameDepth
FROM	AAOSProjects AP
INNER JOIN AAOSDoors AD ON AP.id = AD.ProjectID
LEFT OUTER JOIN AAOSHWSets AH ON AP.id = AH.ProjectID AND AD.hwset = AH.setname
WHERE AP.id = @ProjectID
GROUP BY
	AH.SetName,
	AD.Thickness,
	AD.AcousticRating,
	AD.FireRating,
	AD.FrameDepth
ORDER BY 
	AH.SetName