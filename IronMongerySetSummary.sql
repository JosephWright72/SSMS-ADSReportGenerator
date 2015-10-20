 DECLARE @PROJECTID INT 
 SET @PROJECTID = 28520 
 SET ARITHABORT ON 
 SELECT	 AP.PROJECTNAME, 
		 AP.ID ProjectReference, 
		 HW.SETNAME,
		 HW.SETDESC, 
		 Max(TOTALS.PRICE) AS Price, 
		 Max(DOORS.QTY) AS Qty, 
		 Max(TOTALS.PRICE)*Max(DOORS.QTY) AS ExtendedPrice, 
		 (ACS.FIRSTNAME+' '+ACS.LASTNAME) AS SalesRep, 
		 ACS.EMAIL as Email, 
		 CASE WHEN Day(Getdate()) IN ( 1, 21, 31 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'st ' WHEN Day(Getdate()) IN ( 2, 22 )  THEN CONVERT(VARCHAR, Day(Getdate())) + 'nd ' WHEN Day(Getdate()) IN ( 3, 23 ) THEN CONVERT(VARCHAR, Day(Getdate())) + 'rd '  ELSE CONVERT(VARCHAR, Day(Getdate())) + 'th ' END+Datename(MONTH, Getdate())+' '  +CONVERT(VARCHAR, Year(Getdate())) as TodaysDateEN,  
		 getdate() as TodaysDate,
		 Ltrim(NOTES.LIST) SetNotes,  
		 ACS.firstname + ' ' + ACS.lastname ProjectOwner,  
		 CS.firstname + ' ' + CS.lastname SpecConsult,  
		 ACS.Email AS PrjOwnEmail , 
		 CS.Email AS SpecConEmail , 
		 ACS.Phone PrjOwnNumber,  
		 CS.Phone SpecConNumber,  
		 ACS.Title PrjOwnTitle,  
		 CS.Title SpecConTitle  
FROM   AAOSHWSETS HW  
LEFT OUTER JOIN AAOSPROJECTS AP ON HW.PROJECTID=AP.ID  
LEFT OUTER JOIN AAOSCONSULTANTS ACS ON AP.ARCHCONSULTANT=ACS.ID  
left outer join AAOSConsultants CS on AP.consultant = CS.id 
LEFT OUTER JOIN AAOSDOORS AD ON AD.PROJECTID=@PROJECTID AND AD.HWSET=HW.SETNAME  
LEFT OUTER JOIN (SELECT DISTINCT 
						(PROJECTID) ProjectID,
						Stuff((SELECT '  '+Char(13),+SETNOTES [text()]  
				 FROM   (SELECT DISTINCT 
								(PROJECTID),
								CASE WHEN Len(SETNOTES)>0 THEN (SETNAME+' : '  +Replace(Replace(SETNOTES, Char(13), ' '), Char(10), ' '))  ELSE NULL  END AS SetNotes  
						 FROM   AAOSHWSETS T  
						 WHERE  PROJECTID=@PROJECTID AND  SETNOTES!=''  
						 GROUP  BY PROJECTID,SETNAME,SETNOTES) A  
				 WHERE  PROJECTID=@PROJECTID  
				 FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List  
				 FROM   AAOSHWSETS T  
				 WHERE  PROJECTID=@PROJECTID  
				 GROUP  BY PROJECTID,SETNOTES) NOTES 
ON NOTES.PROJECTID=HW.PROJECTID  
LEFT OUTER JOIN (SELECT PROJECTID,HWSET,
						Sum(QTY) Qty,
						Stuff((SELECT ', '+Cast(MARK AS VARCHAR(250)) [text()]  
				 FROM   AAOSDOORS  
				 WHERE  HWSET=T.HWSET AND  PROJECTID=@PROJECTID  
				 FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ' ') List  
				 FROM   AAOSDOORS T  
				 WHERE  PROJECTID=@PROJECTID AND  (Charindex('deleted', CHANGELOG)<1)  
				 GROUP  BY PROJECTID,HWSET) DOORS 
ON DOORS.HWSET=HW.SETNAME AND  DOORS.PROJECTID=HW.PROJECTID  
LEFT OUTER JOIN (SELECT PROJECTID,
						SETNAME,
						Sum(Cast (QTY AS INT)) Qty, 
						SUM(CASE WHEN LEN(AAOSHWSets.Price) = 0 THEN '0.00' ELSE CAST(AAOSHWSets.Price AS DECIMAL(18,2)) END * CAST (Qty AS INT)) Price 
				 FROM   AAOSHWSETS  
				 WHERE  AAOSHWSETS.PROJECTID=@PROJECTID  
				 GROUP  BY AAOSHWSETS.PROJECTID,SETNAME) TOTALS 
ON TOTALS.PROJECTID=HW.PROJECTID AND TOTALS.SETNAME=HW.SETNAME  
WHERE  HW.PROJECTID=28520
GROUP  BY AP.PROJECTNAME,
		  AP.ID, 
		  HW.SETNAME,
		  HW.SETDESC,
		  ACS.FIRSTNAME,
		  ACS.LASTNAME,
		  ACS.EMAIL,
		  NOTES.LIST, 
		  ACS.firstname + ' ' + ACS.lastname, 
		  CS.firstname + ' ' + CS.lastname, 
		  ACS.Email, 
		  CS.Email, 
		  ACS.Phone, 
		  CS.Phone, 
		  ACS.Title, 
		  CS.Title 
