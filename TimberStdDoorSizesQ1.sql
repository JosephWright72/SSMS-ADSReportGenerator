DECLARE @ProjectID INT
SET @ProjectID = 28643
SELECT	
	AH.SetName,
	AD.Thickness,
	AD.FireRating + CASE WHEN ISNULL(AD.FireRating, '') = '' OR ISNULL(AD.AcousticRating, '') = '' THEN '' ELSE '/' END + AD.AcousticRating AS Rating,
	AD.FireRating + '/' + AD.AcousticRating AS Rating
FROM	AAOSProjects AP
INNER JOIN AAOSDoors AD ON AP.id = AD.ProjectID
INNER JOIN AAOSHWSets AH ON AP.id = AH.ProjectID AND AD.hwset = AH.setname
WHERE AP.id = @ProjectID
GROUP BY 
	AH.SetName,
	AD.Thickness,
	AD.AcousticRating,
	AD.FireRating
ORDER BY 
	AH.SetName