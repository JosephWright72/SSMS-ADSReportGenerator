SELECT  
	AP.id ProjectReference,
	AP.projectname ProjectName,
	CASE WHEN DAY(getdate()) in (1,21,31) THEN convert(varchar,DAY(getdate())) + 'st ' WHEN DAY(getdate()) IN (2,22) then convert(varchar,DAY(getdate())) + 'nd ' WHEN DAY(getdate()) IN (3,23) then convert(varchar,DAY(getdate())) + 'rd '  ELSE convert(varchar,DAY(getdate())) + 'th ' end +  DATENAME(month, getdate())  + ' ' + convert(varchar,year(getdate())) TodaysDateEN, getdate() TodaysDate, AP.JobName  CompanyName, AP.Address1 Address1, AP.Address2 Address2, AP.Address3 Address3, AP.City City, AP.Zip Postcode, AA.firstname + ' ' + AA.lastname Architect,
	AC.firstname + ' ' + AC.lastname Contractor,
	AO.firstname + ' ' + AO.lastname Owner,
	ACS.firstname + ' ' + ACS.lastname ProjectOwner,
	CS.firstname + ' ' + CS.lastname SpecConsult,
	ACS.Email AS PrjOwnEmail , 
	CS.Email AS SpecConEmail , 
	ACS.Phone PrjOwnNumber,
	CS.Phone SpecConNumber,
	ACS.Title PrjOwnTitle,
	CS.Title SpecConTitle  
FROM 
	[AAOSProjects] AP 
left outer join AAOSConsultants ACS on AP.archconsultant = ACS.id 
left outer join AAOSConsultants CS on AP.consultant = CS.id 
left outer join AAOSFirms AA on AP.Architect = AA.id 
left outer join AAOSFirms AC on AP.Contractor = AC.id 
left outer join AAOSFirms AO on AP.Owner = AO.id 
--where AP.id = 28510 
order by ap.id
