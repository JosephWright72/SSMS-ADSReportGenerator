ALTER TABLE AAOS_UAT_UK.dbo.FormFields
ALTER COLUMN Usage2Value VARCHAR(2000)
GO

UPDATE	ff1
SET		ff1.Usage2Value = ff2.Usage2Value
FROM	AAOS_UAT_UK.dbo.FormFields ff1
INNER JOIN AAOS.dbo.FormFields ff2
ON		ff1.FormName = ff2.FormName
AND		ff1.ColName = ff2.ColName
WHERE	ff1.Locale = 'EN'
AND		ff1.FormName  IN ('rptPageFooters', 'rptEMEACoverLetter') 
AND		ff1.usage2name != 'SimpleView'
GO

UPDATE	ff1
SET		ff1.Usage2Value = ff2.Usage2Value
FROM	AAOS_UAT_UK.dbo.FormFields ff1
INNER JOIN AAOS.dbo.FormFields ff2
ON		ff2.FormName = ff1.FormName
AND		ff2.ColName = ff1.ColName
AND		ff2.Locale = ff1.Locale
AND		ff2.ColNumber = ff2.ColNumber
AND		ff2.usage2name = ff2.usage2name
AND		ff2.visiblecoltext = ff2.visiblecoltext
AND		ff2.usage1name = ff2.usage1name
AND		ff2.usage2name = ff2.usage2name
AND		ff2.usage2value = ff2.usage2value
AND		ff2.defaultwidth = ff2.defaultwidth
AND		ff2.[required] = ff2.[required]
GO

insert into aaos_uat_uk.dbo.formfields
(locale,formname,colname,colnumber,visiblecoltext,usage1name,usage1value,usage2name,usage2value,defaultwidth,required)
select locale,'rptEMEAHWScheduleSummary',colname,colnumber,'Ironmongery Schedule Oppsummering',usage1name,usage1value,usage2name,usage2value,defaultwidth,required from formfields
where locale='NO'
and formname='rptEMEAHWSetSummary'
GO

insert into aaos_uat_uk.dbo.formfields
(locale,formname,colname,colnumber,visiblecoltext,usage1name,usage1value,usage2name,usage2value,defaultwidth,[required])
select locale,'rptEMEATimberStdDoorSizes',colname,colnumber,'Timber Doorset Standard Sizes',usage1name,usage1value,usage2name,usage2value,defaultwidth,[required] from formfields
where formname='rptEMEADoorSummary'
GO

INSERT INTO AAOS_UAT_UK.dbo.formfields
(
	locale,
	formname,
	colname,
	colnumber,
	visiblecoltext,
	usage1name,
	usage1value,
	usage2name,
	usage2value,
	defaultwidth,
	[required]
)
	'EN',
	'rptEMEATimberStdDoorSizes',
	'txtSizeInfo',
	1,
	'Sizes for single-acting doors' + CHAR(13)
GO

UPDATE AAOS_UAT_UK.dbo.formfields 
SET visiblecoltext='Revision Notes' 
WHERE ColName = 'lblGenRem' AND Locale = 'EN'
GO

UPDATE AAOS_UAT_UK.dbo.formfields 
SET visiblecoltext='Revision No.' 
WHERE ColName = 'lblRevNo' AND Locale = 'EN'
GO
