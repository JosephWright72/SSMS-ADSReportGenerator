DECLARE @PROJECTID INT
DECLARE @DOORFILTER INT
SET @PROJECTID = 28520
SET @DOORFILTER = 2
SET ARITHABORT ON

IF @DOORFILTER=2 
SELECT 
'2' AS Filter,
HW.SETNAME,
--'\\segbgsis103\AlanT\Collateral Data UK'+ img.FileName as Image,
HST.Img1,
img.Image_id,
CASE WHEN Len(HW.PRICE)=0 THEN '0' ELSE HW.PRICE END AS totSetItemPrice,
HW.PRODUCT,
HW.QTY,
HW.DESCRIPTION,
HW.TYPEDESCRIPTION,
HST.hdw_type_description,
AP.PROJECTNAME,
AP.ID ProjectReference,
CASE WHEN Len(PH.PRICE)=0 THEN '0' ELSE PH.PRICE END AS singlePrice,
PH.UOM,
(ACS.FIRSTNAME+' ' +ACS.LASTNAME) as SalesRep,
ACS.EMAIL as Email, 
ACS.firstname + ' ' + ACS.lastname ProjectOwner, 
CS.firstname + ' ' + CS.lastname SpecConsult, 
ACS.Email AS PrjOwnEmail ,
CS.Email AS SpecConEmail ,
ACS.Phone PrjOwnNumber, 
CS.Phone SpecConNumber, 
ACS.Title PrjOwnTitle, 
CS.Title SpecConTitle, 
HW.Finish as Finish,ISNULL(DOORS.QTY, 0) AS TotDoors,
TOTALS.PRICE TotSetPrice,
/*CASE 
WHEN Day(Getdate()) IN ( 1, 21, 31 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'st '
WHEN Day(Getdate()) IN ( 2, 22 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'nd '
WHEN Day(Getdate()) IN ( 3, 23 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'rd '
ELSE 
CONVERT(VARCHAR, Day(Getdate())) + 'th ' END+Datename(MONTH, Getdate())+' '+CONVERT(VARCHAR, Year(Getdate())) TodaysDateEN,
getdate() TodaysDate,*/
ISNULL(DOORS.LIST, 'N/A') AS Mark,
CASE WHEN Len(HW.SETNOTES)>0 THEN (HW.SETNAME+' : ' +Replace(Replace(HW.SETNOTES, Char(13), ' '), Char(10), ' ')) ELSE NULL END AS SetNotes 
FROM   AAOSPROJECTHARDWARE PH
RIGHT OUTER JOIN AAOSHWSETS HW ON PH.ITEM=HW.PRODUCT 
LEFT OUTER JOIN AAOSPROJECTS AP ON HW.PROJECTID=AP.ID 
LEFT OUTER JOIN AAOSCONSULTANTS ACS ON AP.ARCHCONSULTANT=ACS.ID 
left outer join AAOSConsultants CS on AP.consultant = CS.id
LEFT OUTER JOIN (SELECT PROJECTID,SETNAME,Sum(Cast (QTY AS INT)) Qty,Sum(Cast(CASE WHEN Len(AAOSHWSETS.PRICE)=0 THEN '0' 
                ELSE AAOSHWSETS.PRICE 
                END AS DECIMAL(18, 2))*Cast (QTY AS INT)) Price 
                FROM   AAOSHWSETS 
                WHERE  AAOSHWSETS.PROJECTID=@PROJECTID 
                GROUP  BY AAOSHWSETS.PROJECTID,SETNAME) TOTALS                    ON TOTALS.PROJECTID=HW.PROJECTID AND TOTALS.SETNAME=HW.SETNAME 
LEFT OUTER JOIN (SELECT PROJECTID,HWSET,Sum(QTY) Qty,Stuff((SELECT ', '+Cast(MARK AS VARCHAR(250)) [text()] 
                FROM   AAOSDOORS 
                WHERE  HWSET=T.HWSET AND 
                PROJECTID=@PROJECTID 
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List 
                FROM   AAOSDOORS T 
                WHERE  PROJECTID=@PROJECTID AND 
                (Charindex('deleted', CHANGELOG)<1) 
                GROUP  BY PROJECTID,HWSET) DOORS
                ON DOORS.HWSET=HW.SETNAME AND DOORS.PROJECTID=HW.PROJECTID 
left outer JOIN AAOS.dbo.hardwarestandard HST ON  HW.TYPEDESCRIPTION =  HST.hdw_type_description 
left outer JOIN AAOS.dbo.images img ON  HST.Img1 = img.Image_id 
WHERE  (HW.PROJECTID=28520) 
AND ( AP.ID=28520)
AND (PH.PROJECTID=28520) 
ORDER  BY HW.SETNAME,PH.DHI 
ELSE BEGIN 
IF @DOORFILTER=1 
SELECT 
'1' AS Filter,
HW.SETNAME,'\\segbgsis103\AlanT\Collateral Data UK'+ FileName as Image,
CASE WHEN Len(HW.PRICE)=0 THEN '0' ELSE HW.PRICE END AS totSetItemPrice,
HW.PRODUCT,
HW.QTY,
HW.DESCRIPTION,
HW.TYPEDESCRIPTION,
AP.PROJECTNAME,
AP.ID ProjectReference,
CASE WHEN Len(PH.PRICE)=0 THEN '0' ELSE PH.PRICE END AS singlePrice,
PH.UOM,
(ACS.FIRSTNAME+' ' +ACS.LASTNAME) as SalesRep,
ACS.EMAIL as Email, 
ACS.firstname + ' ' + ACS.lastname ProjectOwner, 
CS.firstname + ' ' + CS.lastname SpecConsult, 
ACS.Email AS PrjOwnEmail ,
CS.Email AS SpecConEmail ,
ACS.Phone PrjOwnNumber, 
CS.Phone SpecConNumber, 
ACS.Title PrjOwnTitle, 
CS.Title SpecConTitle, 
HW.Finish as Finish,ISNULL(DOORS.QTY, 0) AS TotDoors,
TOTALS.PRICE TotSetPrice,
CASE 
WHEN Day(Getdate()) IN ( 1, 21, 31 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'st '
WHEN Day(Getdate()) IN ( 2, 22 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'nd '
WHEN Day(Getdate()) IN ( 3, 23 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'rd '
ELSE 
CONVERT(VARCHAR, Day(Getdate())) + 'th ' END+Datename(MONTH, Getdate())+' '+CONVERT(VARCHAR, Year(Getdate())) TodaysDateEN,
getdate() TodaysDate,
ISNULL(DOORS.LIST, 'N/A') AS Mark,
CASE WHEN Len(HW.SETNOTES)>0 THEN (HW.SETNAME+' : ' +Replace(Replace(HW.SETNOTES, Char(13), ' '), Char(10), ' ')) ELSE NULL END AS SetNotes 
FROM   AAOSPROJECTHARDWARE PH
RIGHT OUTER JOIN AAOSHWSETS HW ON PH.ITEM=HW.PRODUCT 
LEFT OUTER JOIN AAOSPROJECTS AP ON HW.PROJECTID=AP.ID 
LEFT OUTER JOIN AAOSCONSULTANTS ACS ON AP.ARCHCONSULTANT=ACS.ID 
left outer join AAOSConsultants CS on AP.consultant = CS.id
LEFT OUTER JOIN (SELECT PROJECTID,SETNAME,Sum(Cast (QTY AS INT)) Qty,Sum(Cast(CASE WHEN Len(AAOSHWSETS.PRICE)=0 THEN '0' 
                ELSE AAOSHWSETS.PRICE 
                END AS DECIMAL(18, 2))*Cast (QTY AS INT)) Price 
                FROM   AAOSHWSETS 
                WHERE  AAOSHWSETS.PROJECTID=@PROJECTID 
                GROUP  BY AAOSHWSETS.PROJECTID,SETNAME) TOTALS                    ON TOTALS.PROJECTID=HW.PROJECTID AND TOTALS.SETNAME=HW.SETNAME 
LEFT OUTER JOIN (SELECT PROJECTID,HWSET,Sum(QTY) Qty,Stuff((SELECT ', '+Cast(MARK AS VARCHAR(250)) [text()] 
                FROM   AAOSDOORS 
                WHERE  HWSET=T.HWSET AND 
                PROJECTID=@PROJECTID 
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List 
                FROM   AAOSDOORS T 
                WHERE  PROJECTID=@PROJECTID AND 
                (Charindex('deleted', CHANGELOG)<1) 
                GROUP  BY PROJECTID,HWSET) DOORS
                ON DOORS.HWSET=HW.SETNAME AND DOORS.PROJECTID=HW.PROJECTID 
left outer JOIN AAOS.dbo.hardwarestandard HST ON  HW.TYPEDESCRIPTION =  HST.hdw_type_description 
left outer JOIN AAOS.dbo.images img ON  HST.Img1 = img.Image_id 
    WHERE  (HW.PROJECTID=@PROJECTID) AND 
    (AP.ID=@PROJECTID) AND 
    (PH.PROJECTID=@PROJECTID) AND 
    ISNULL(DOORS.QTY, 0)!=0 
    ORDER  BY HW.SETNAME,PH.DHI 
ELSE 
SELECT 
'0' AS Filter,
HW.SETNAME,'\\segbgsis103\AlanT\Collateral Data UK'+ FileName as Image,
CASE WHEN Len(HW.PRICE)=0 THEN '0' ELSE HW.PRICE END AS totSetItemPrice,
HW.PRODUCT,
HW.QTY,
HW.DESCRIPTION,
HW.TYPEDESCRIPTION,
AP.PROJECTNAME,
AP.ID ProjectReference,
CASE WHEN Len(PH.PRICE)=0 THEN '0' ELSE PH.PRICE END AS singlePrice,
PH.UOM,
(ACS.FIRSTNAME+' ' +ACS.LASTNAME) as SalesRep,
ACS.EMAIL as Email, 
ACS.firstname + ' ' + ACS.lastname ProjectOwner, 
CS.firstname + ' ' + CS.lastname SpecConsult, 
ACS.Email AS PrjOwnEmail ,
CS.Email AS SpecConEmail ,
ACS.Phone PrjOwnNumber, 
CS.Phone SpecConNumber, 
ACS.Title PrjOwnTitle, 
CS.Title SpecConTitle, 
HW.Finish as Finish,ISNULL(DOORS.QTY, 0) AS TotDoors,
TOTALS.PRICE TotSetPrice,
CASE 
WHEN Day(Getdate()) IN ( 1, 21, 31 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'st '
WHEN Day(Getdate()) IN ( 2, 22 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'nd '
WHEN Day(Getdate()) IN ( 3, 23 ) 
    THEN CONVERT(VARCHAR, Day(Getdate())) + 'rd '
ELSE 
CONVERT(VARCHAR, Day(Getdate())) + 'th ' END+Datename(MONTH, Getdate())+' '+CONVERT(VARCHAR, Year(Getdate())) TodaysDateEN,
getdate() TodaysDate,
ISNULL(DOORS.LIST, 'N/A') AS Mark,
CASE WHEN Len(HW.SETNOTES)>0 THEN (HW.SETNAME+' : ' +Replace(Replace(HW.SETNOTES, Char(13), ' '), Char(10), ' ')) ELSE NULL END AS SetNotes 
FROM   AAOSPROJECTHARDWARE PH
RIGHT OUTER JOIN AAOSHWSETS HW ON PH.ITEM=HW.PRODUCT 
LEFT OUTER JOIN AAOSPROJECTS AP ON HW.PROJECTID=AP.ID 
LEFT OUTER JOIN AAOSCONSULTANTS ACS ON AP.ARCHCONSULTANT=ACS.ID 
left outer join AAOSConsultants CS on AP.consultant = CS.id
LEFT OUTER JOIN (SELECT PROJECTID,SETNAME,Sum(Cast (QTY AS INT)) Qty,Sum(Cast(CASE WHEN Len(AAOSHWSETS.PRICE)=0 THEN '0' 
                ELSE AAOSHWSETS.PRICE 
                END AS DECIMAL(18, 2))*Cast (QTY AS INT)) Price 
                FROM   AAOSHWSETS 
                WHERE  AAOSHWSETS.PROJECTID=@PROJECTID 
                GROUP  BY AAOSHWSETS.PROJECTID,SETNAME) TOTALS                    ON TOTALS.PROJECTID=HW.PROJECTID AND TOTALS.SETNAME=HW.SETNAME 
LEFT OUTER JOIN (SELECT PROJECTID,HWSET,Sum(QTY) Qty,Stuff((SELECT ', '+Cast(MARK AS VARCHAR(250)) [text()] 
                FROM   AAOSDOORS 
                WHERE  HWSET=T.HWSET AND 
                PROJECTID=@PROJECTID 
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List 
                FROM   AAOSDOORS T 
                WHERE  PROJECTID=@PROJECTID AND 
                (Charindex('deleted', CHANGELOG)<1) 
                GROUP  BY PROJECTID,HWSET) DOORS
                ON DOORS.HWSET=HW.SETNAME AND DOORS.PROJECTID=HW.PROJECTID 
left outer JOIN AAOS.dbo.hardwarestandard HST ON  HW.TYPEDESCRIPTION =  HST.hdw_type_description 
left outer JOIN AAOS.dbo.images img ON  HST.Img1 = img.Image_id 
    WHERE  (HW.PROJECTID=@PROJECTID) AND 
    (AP.ID=@PROJECTID) AND 
    (PH.PROJECTID=@PROJECTID) AND 
    ISNULL(DOORS.QTY, 0)=0 
    ORDER  BY HW.SETNAME,PH.DHI 
END 
