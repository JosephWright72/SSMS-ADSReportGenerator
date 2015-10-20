select * from AAOS_UAT_UK.dbo.images where image_id=
(
	select hdw.img1
	from AAOS_UAT_UK.dbo.HardwareStandard hdw 
	where hdw_std_id in (
		select CASE WHEN CHARINDEX(',', APH.IDs) = 0 THEN -1 ELSE LEFT(APH.IDs, CHARINDEX(',', APH.IDs)-1) END AS HDW_STD_ID 
		from aaosprojecthardware aph 
		where description ='80635580011'
	)
)

