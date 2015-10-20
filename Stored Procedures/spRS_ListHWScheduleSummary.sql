SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spRS_ListHWScheduleSummary')
	DROP PROCEDURE dbo.spRS_ListHWScheduleSummary
GO

CREATE PROCEDURE dbo.spRS_ListHWScheduleSummary
	@ProjectID	INT,
	@DoorFilter	INT,
	@Debug		BIT = 0
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @Debug = 1
	BEGIN
		PRINT '@ProjectID:[' + CAST(@ProjectID AS VARCHAR(10)) + ']'
		PRINT '@DoorFilter:[' + CAST(@DoorFilter AS VARCHAR(10)) + ']'
	END

	SET ARITHABORT ON

    SELECT	
		HW.[Description] ProductCode,
		HW.TypeDescription   ProductDescription,
		PH.UOM,
		SUM(ISNULL(NULLIF(HW.Qty, ''), 0) * ISNULL(Doors.Qty, 0)) Quantity,
		CAST((HW.PRICE/CASE WHEN HW.Qty = 0 THEN 1 ELSE HW.Qty END) AS DECIMAL(18, 2)) AS UnitRate,
		(SUM(ISNULL(NULLIF(HW.Qty, ''), 0) * ISNULL(Doors.Qty, 0))) * (CAST((HW.PRICE/CASE WHEN HW.Qty = 0 THEN 1 ELSE HW.Qty END) AS DECIMAL(18, 2))) AS ExtendedRate,
		LTRIM(MAX(Notes.List)) AS SetNotes,
		CASE WHEN CHARINDEX(',', APH.IDs) = 0 THEN -1 ELSE LEFT(APH.IDs, CHARINDEX(',', APH.IDs)-1) END AS HDW_STD_ID
    FROM
		AAOSProjectHardware PH (NOLOCK)
	RIGHT OUTER JOIN AAOSHWSets HW (NOLOCK) ON PH.Item = HW.Product
	LEFT OUTER JOIN AAOSProjects AP (NOLOCK) ON HW.ProjectID = AP.ID
	LEFT OUTER JOIN AAOSProjectHardware APH (NOLOCK) ON  CAST(HW.[DESCRIPTION] AS VARBINARY(MAX)) =  CAST(APH.[description] AS VARBINARY(MAX)) AND APH.ProjectID=HW.PROJECTID
	LEFT OUTER JOIN (
		SELECT 
			ProjectID,
			SetName,
			Sum(Cast (QTY AS INT)) Qty,
			Sum(Cast(CASE WHEN Len(AAOSHWSets.Price) = 0 THEN '0.00'
			ELSE AAOSHWSets.Price
			END AS DECIMAL(18, 2)) * Cast (QTY AS INT)) Price
		FROM	AAOSHWSets (NOLOCK) 
		WHERE	AAOSHWSets.ProjectID = @ProjectID
		GROUP  BY 
			AAOSHWsets.ProjectID,
			SetName
	) Totals ON Totals.ProjectID = HW.ProjectID 
	AND	Totals.SetName = HW.SetName
	LEFT OUTER JOIN (
		SELECT	
			ProjectID,
			HWSet,
			Sum(QTY)   Qty,
			Stuff((
				SELECT	
					', ' + Cast(Mark AS VARCHAR(250)) [text()]
				FROM	AAOSDoors (NOLOCK) 
				WHERE	HWSet = T.HWSet AND
						ProjectID = @ProjectID
									FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List
									FROM
										AAOSDoors T (NOLOCK) 
									WHERE  
										ProjectID = @ProjectID 
									AND	(Charindex('deleted', ChangeLog) < 1)
									GROUP BY 
										ProjectID,
										HWSet) Doors 
	ON	Doors.HWSet = HW.SetName 
	AND	Doors.ProjectID = HW.ProjectID
	LEFT OUTER JOIN (
		SELECT DISTINCT 
			(ProjectID) ProjectID,
			Stuff((
				SELECT 
					' ',
					CHAR(13)+CHAR(10),
					+SetNotes [text()]
				FROM   
				(	SELECT DISTINCT 
						(ProjectID),
						CASE 
							WHEN Len(SetNotes) > 0 THEN (SetName + ' : ' + REPLACE(REPLACE(SetNotes, CHAR(13), ' '), CHAR(10), ' '))
							ELSE NULL
						END SetNotes
					FROM   
						AAOSHWSets T (NOLOCK) 
					WHERE  
						ProjectID = @ProjectID 
					AND	setnotes != ''
					GROUP BY 
						ProjectID,
						SetName,
						SetNotes
				) A
				WHERE  
					ProjectID = @ProjectID
			FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List
		FROM   
			AAOSHWSets T (NOLOCK) 
		WHERE  
			ProjectID = @ProjectID
		GROUP BY 
			ProjectID,
			SetNotes) Notes 
	ON Notes.ProjectID = AP.id
    WHERE  
		(HW.ProjectID = @ProjectID)
    AND (AP.ID = @ProjectID)
    AND (PH.ProjectID = @ProjectID)
    AND ISNULL(NULLIF(HW.Qty, ''), 0) != 0
    AND ISNULL(CASE WHEN DOORS.QTY = 0 THEN 0 WHEN DOORS.QTY > 0 THEN 1 END, 0) =
		CASE @DOORFILTER WHEN 0 THEN 0 WHEN 1 THEN 1 ELSE ISNULL(CASE WHEN DOORS.QTY = 0 THEN 0 WHEN DOORS.QTY > 0 THEN 1 END, 0) END
    GROUP BY 
		HW.[Description],
		HW.TypeDescription,
		PH.UOM,
		CAST((HW.PRICE/CASE WHEN HW.Qty = 0 THEN 1 ELSE HW.Qty END) AS DECIMAL(18, 2)),
		CASE WHEN CHARINDEX(',', APH.IDs) = 0 THEN -1 ELSE LEFT(APH.IDs, CHARINDEX(',', APH.IDs)-1) END
    ORDER BY 
	HW.Description
END