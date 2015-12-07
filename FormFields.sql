USE AAOS_UAT_UK
GO

ALTER TABLE FormFields ALTER COLUMN [Usage2Value] NVARCHAR(MAX)
GO

UPDATE FormFields SET VisibleColText = 'Revision No' WHERE Locale = 'EN' AND ColName='lblRevNo'
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES (N'EN', N'rptEMEACoverLetter', N'lblTitle', 1, N'Cover Letter', N'REPORT', N'2', N'SimpleView', N'1', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES (N'EN', N'rptEMEACoverLetter', N'txtMainBody', 1, N'UK Cover Letter Text', N'REPORT', N'2', N'Text Box', N'All prices are subject to VAT at the ruling rate on the day of dispatch.' + CHAR(13) + CHAR(10) + + CHAR(13) + CHAR(10) + 'This document, the specifications and schedules that are contained herein are the copyright of ASSA ABLOY UK Ltd. It has been produced for the sole use of the project team and no licence is implied or given for their dissemination or distribution to any other parties without prior consent in writing from ASSA ABLOY UK Ltd.' + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) + 'ASSA ABLOY has prepared this schedule in good faith and based on the available information at the date of issue. It remains the responsibility of the contractor or his appointed ASSA ABLOY distributor to ensure that the information is correct based on the most recent version of relevant contract drawings and specifications. Any discrepancy between those documents and this schedule is not the responsibility of ASSA ABLOY unless said documents have been recorded as issued to us for revision.' + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) + 'This quotation is subject to our Terms and Conditions, a copy of which are attached. This quotation is open for acceptance for a period of 30 days from the date of its issue. Prices are fixed for all deliveries made within a period of 60 days from the date of acceptance and are subject to VAT at the rate applicable on the date of dispatch.' + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) + 'We reserve the right to re-quote these prices at the end of the above fixed price period.' + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) + 'Yours faithfully,', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES (N'EN', N'rptEMEADoorSummary', N'lblTitle', 1, N'Door Summary', N'REPORT', N'2', N'SimpleView', N'1', 0, 1)
GO

INSERT INTO (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAHWSchedule', N'lblTitle', 1, N'Ironmongery Schedule', N'REPORT', N'2', N'SimpleView', N'1', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAHWScheduleSummary', N'lblTitle', 1, N'Ironmongery Schedule Summary', N'REPORT', N'2', N'SimpleView', N'1', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAHWSetSummary', N'lblTitle', 1, N'Iromongery Set Summary', N'REPORT', N'2', N'SimpleView', N'1', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAQuoteTerms', N'lblTitle', 1, N'Quotation Qualifications & Implied Terms', N'REPORT', N'2', N'SimpleView', N'1', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAQuoteTerms', N'txtAddDet', 1, N'UK Quote Terms Text', N'REPORT', N'2', N'Text Box', N'', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAQuoteTerms', N'txtGenCon', 1, N'UK Quote Terms Text', N'REPORT', N'2', N'Text Box', N'', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAQuoteTerms', N'txtGenRem', 1, N'UK Quote Terms Text', N'REPORT', N'2', N'Text Box', N'', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptEMEAQuoteTerms', N'txtTechNote', 1, N'UK Quote Terms Text', N'REPORT', N'2', N'Text Box', N'', 0, 1)
GO

INSERT INTO FormFields (
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
) 
VALUES (N'EN', N'rptPageFooters', N'txtFooter', 1, N'UK Footer', N'REPORT', N'2', N'FooterText', N'ASSA ABLOY UK Specification
School Street, Willenhall, West Midlands, UK, WV13 3PW
T: +44 (0)845 223 2124 F: +44 (0)845 223 2125 
E: info@assaabloy.co.uk W: www.assaabloy.co.uk', 0, 1)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblTitle',
	1,
	'Timber Doorset Standard Sizes & Glass',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'txtSizeInfo',
	1,
	'Sizes for single-acting doors' + CHAR(13) + CHAR(10) + 'All double acting doors are 62mm thick to accommodate ironmongery i.e. floor springs and concealed closers',
	'REPORT',
	2,
	'SimpleView',
	'SimpleView',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblDoorTypes2',
	1,
	'Door types',
	'REPORT',
	2,
	'SimpleView',
	'SimpleView',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'txtStandardFrameDepths',
	1,
	'Standard frame depths',
	'REPORT',
	2,
	'SimpleView',
	'SimpleView',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblPrimedPainted',
	1,
	'Primed/painted',
	'REPORT',
	2,
	'SimpleView',
	'SimpleView',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblHardwood',
	1,
	'Hardwood',
	'REPORT',
	2,
	'SimpleView',
	'SimpleView',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblVeneered',
	1,
	'Veneered',
	'REPORT',
	2,
	'SimpleView',
	'SimpleView',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblModuleSize',
	1,
	'Module size',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblStructuralOpeningSize',
	1,
	'Structural opening size',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblTimberFrameSize',
	1,
	'Timber frame size',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblDoorLeafSize',
	1,
	'Door leaf size',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblKickplateSize',
	1,
	'Kickplate size',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblDoorTypes',
	1,
	'Door Types',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblReference',
	1,
	'Reference',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblType',
	1,
	'Type',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblThickness',
	1,
	'Thickness',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblFireRatings',
	1,
	'Fire Ratings',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblRwdBRatings',
	1,
	'Rw dB Ratings',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblENClassifications',
	1,
	'EN Classifications',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'lblReference',
	1,
	'Reference',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'txtAllSizesIn',
	1,
	'all sizes in',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_0',
	1,
	NULL,
	'A1',
	'A1.40.Non-rated',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_1',
	1,
	NULL,
	'A2',
	'A2.40.NR/33dB',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_2',
	1,
	NULL,
	'A3',
	'A3.40.FD30S',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_3',
	1,
	NULL,
	'A4',
	'A4.40.FD30S/33dB',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_4',
	1,
	NULL,
	'A5',
	'A5.62.FD30S/38dB',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_5',
	1,
	NULL,
	'A6',
	'A6.62.FD30S/43dB',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_6',
	1,
	NULL,
	'A7',
	'A7.62.FD60S',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_HW_SETS_7',
	1,
	NULL,
	'A8',
	'A8.62.FD60S/38dB',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_0',
	1,
	NULL,
	'SL7-1',
	'7.700 x 2100.686 x 2089.625 x 2052',
	'SL7-2',
	'585.A1, A2, A3, A4, A5, A6, A7, A8.Single Leaf',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_1',
	1,
	NULL,
	'SL8-1',
	'8.800 x 2100.786 x 2089.725 x 2052',
	'SL8-2',
	'685.A1, A2, A3, A4, A5, A6, A7, A8.Single Leaf',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_2',
	1,
	NULL,
	'SL9-1',
	'9.900 x 2100.886 x 2089.825 x 2052',
	'SL9-2',
	'785.A1, A2, A3, A4, A5, A6, A7, A8.Single Leaf',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_3',
	1,
	NULL,
	'SL10-1',
	'10.1000 x 2100.986 x 2089.925 x 2052',
	'SL10-2',
	'885.A1, A2, A3, A4, A5, A6, A7, A8.Single Leaf',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_4',
	1,
	NULL,
	'SL11-1',
	'11.1100 x 2100.1086 x 2089.1025 x 2052',
	'SL11-2',
	'985.A1, A2, A3, A4, A5, A6, A7, A8.Single Leaf',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_5',
	1,
	NULL,
	'SL12-1',
	'12.1200 x 2100.1186 x 2089.1125 x 2052',
	'SL12-2',
	'1085.A1, A2, A3, A4, A5, A6, A7, A8.Single Leaf',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_6',
	2,
	NULL,
	'ULP12-1',
	'12.1200 x 2100.1186 x 2089.725 + 398 x 2052',
	'ULP12-2',
	'695 + 368.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_7',
	2,
	NULL,
	'ULP13-1',
	'13.1300 x 2100.1286 x 2089.825 + 398 x 2052',
	'ULP13-2',
	'795 + 368.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_8',
	2,
	NULL,
	'ULP14-1',
	'14.1400 x 2100.1386 x 2089.925 + 398 x 2052',
	'ULP14-2',
	'895 + 368.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_9',
	2,
	NULL,
	'ULP15-1',
	'15.1500 x 2100.1486 x 2089.925 + 398 x 2052',
	'ULP12-2',
	'895 + 468.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_10',
	2,
	NULL,
	'ULP16-1',
	'16.1600 x 2100.1586 x 2089.925 + 398 x 2052',
	'ULP16-2',
	'895 + 568.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_11',
	2,
	NULL,
	'ULP17-1',
	'17.1700 x 2100.1686 x 2089.925 + 698 x 2052',
	'ULP17-2',
	'895 + 668.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_12',
	2,
	NULL,
	'ULP18-1',
	'18.1800 x 2100.1786 x 2089.925 + 798 x 2052',
	'ULP18-2',
	'895 + 768.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_13',
	2,
	NULL,
	'ULP19-1',
	'19.1900 x 2100.1886 x 2089.925 + 898 x 2052',
	'ULP19-2',
	'895 + 868.A1, A2, A3, A4, A5, A6, A7, A8.Unequal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_14',
	3,
	NULL,
	'ELP13-1',
	'13.1300 x 2100.1286 x 2089.611 + 611 x 2052',
	'ELP13-2',
	'2/581.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_15',
	3,
	NULL,
	'ELP14-1',
	'14.1400 x 2100.1386 x 2089.661 + 661 x 2052',
	'ULP14-2',
	'2/631.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_16',
	3,
	NULL,
	'ELP15-1',
	'15.1500 x 2100.1486 x 2089.711 + 711 x 2052',
	'ELP15-2',
	'2/681.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_17',
	3,
	NULL,
	'ELP16-1',
	'16.1600 x 2100.1586 x 2089.761 + 761 x 2052',
	'ELP16-2',
	'2/731.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_18',
	3,
	NULL,
	'ELP17-1',
	'17.1700 x 2100.1686 x 2089.811 + 811 x 2052',
	'ELP17-2',
	'2/781.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_19',
	3,
	NULL,
	'ELP18-1',
	'18.1800 x 2100.1786 x 2089.861 + 861 x 2052',
	'ULP18-2',
	'2/831.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_20',
	3,
	NULL,
	'ELP19-1',
	'19.1900 x 2100.1886 x 2089.911 + 911 x 2052',
	'ELP19-2',
	'2/881.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_21',
	3,
	NULL,
	'ELP20-1',
	'20.2000 x 2100.1986 x 2089.961 + 961 x 2052',
	'ELP20-2',
	'2/931.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_DOOR_SIZES_22',
	3,
	NULL,
	'ELP21-1',
	'21.2100 x 2100.2086 x 2089.1011 + 1011 x 2052',
	'ELP20-2',
	'2/981.A1, A2, A3, A4, A5, A6, A7, A8.Equal Leaf Pairs',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_GLASS_DESC_0',
	4,
	NULL,
	'SGD1-1',
	'1.TUF6.Toughened.6mm',
	'SGD1-2',
	'Non.25dB & 30dB.N/A',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_GLASS_DESC_1',
	4,
	NULL,
	'SGD2-1',
	'2.CDLEW11.Contraflam Door Lite.11mm',
	'SGD2-2',
	'FD30;FD60.30dB & 35dB.EW - Integrity & Partial Insulation',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_GLASS_DESC_2',
	4,
	NULL,
	'SGD3-1',
	'3.CLEW13.Contraflam Lite.13mm',
	'SGD3-2',
	'FD30;FD60.30dB & 35dB.EW - Integrity & Partial Insulation',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_GLASS_DESC_3',
	4,
	NULL,
	'SGD4-1',
	'4.SSAC12.Stadlip Silence.12mm',
	'SGD4-2',
	'Non.35dB.N/A',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_GLASS_DESC_4',
	4,
	NULL,
	'SGD5-1',
	'5.CEI30.Contraflam.16mm (EI30)',
	'SGD5-2',
	'FD30.FD30.EI - Integrity & Insulation',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_GLASS_DESC_5',
	4,
	NULL,
	'SGD6-1',
	'6.CEI60.Contraflam.25mm (EI60)',
	'SGD6-2',
	'FD60.FD60.EI - Integrity & Insulation',
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_FRAME_DEPTHS_PRIMED_PAINTED',
	1,
	NULL,
	'STD_FRAME_DEPTHS_PRIMED_PAINTED',
	'75, 96, 100, 110, 121 128, 147, 150, 160, 170, 180, 200 and 250',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_FRAME_DEPTHS_HARDWOOD',
	1,
	NULL,
	'STD_FRAME_DEPTHS_HARDWOOD',
	'75, 96, 100, 110, 121 128, 147, 150, 160, 170, 180 and 200',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'STD_FRAME_DEPTHS_VENEERED',
	1,
	NULL,
	'STD_FRAME_DEPTHS_VENEERED',
	'75, 96, 100, 110, 121 128, 147, 150, 160 and 170',
	NULL,
	NULL,
	0,
	0
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEATimberStdDoorSizes',
	'txtNBRatings',
	1,
	'N.B. - ratings - FD relates to vision panles within doors. Glass for internal screens is designated FR',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADoorScheduleSummary',
	'lblTitle',
	1,
	'Door Schedule Summary',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblDoorRef',
	1,
	'Door Ref',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblToRoom',
	1,
	'To Room',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblFromRoom',
	1,
	'From Room',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblMaterial',
	1,
	'Material',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblConfiguration',
	1,
	'Configuration',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblQty',
	1,
	'Qty',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblFireRating',
	1,
	'Fire Rating',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblAcousticRating',
	1,
	'Acoustic Rating',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblFrameWidth',
	1,
	'Frame Width',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblFrameHeight',
	1,
	'Frame Height',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblFrameDepth',
	1,
	'Frame Depth',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADoorScheduleSummaryByDoorType',
	'lblTitle',
	1,
	'Door Schedule Summary By Door Type',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblDoorType',
	1,
	'Door Type',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADoorScheduleSummaryByDoorType',
	'lblArchDoorType',
	1,
	'Arch Door Type',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADoorsIronmongerySetSummary',
	'lblTitle',
	1,
	'Doors & Ironmongery Set Summary',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADoorsIronmongerySetSummary',
	'lblFunction',
	1,
	'Function',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADoorsIronmongerySetSummary',
	'lblTotalDoorAndHWSetPrice',
	1,
	'Total Door & Ironmongery Price',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblUndercut',
	1,
	'Undercut',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblThickness',
	1,
	'Thickness',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblDoorFinish',
	1,
	'Door Finish',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblDoorEdge',
	1,
	'Door Edge',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblIronmongerySet',
	1,
	'Ironmongery Set',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblGlassType',
	1,
	'Glass',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblAperture',
	1,
	'Aperture',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblSOWidth',
	1,
	'S/O Width',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblSOHeight',
	1,
	'S/O Height',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblFrameFinish',
	1,
	'Frame Finish',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblThreshold',
	1,
	'Threshold',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblHanding',
	1,
	'Handing',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblDoorset',
	1,
	'Doorset',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblIronmongery',
	1,
	'Ironmongery',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblFitting',
	1,
	'Fitting',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblTotal',
	1,
	'Total',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEADetailDoorSchedule',
	'lblDoorHandingDiagram',
	1,
	'Door Handing Diagram',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblDrawingsUsed',
	1,
	'Drawings Used',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblRevisionNotes',
	1,
	'Revision Notes',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

UPDATE FormFields
SET Usage2Value = 'ASSA ABLOY UK Specification
School Street, Willenhall, West Midlands, UK, WV13 3PW
T: +44 (0)845 223 2124 F: +44 (0)845 223 2125 
E: info@assaabloy.co.uk W: www.assaabloy.co.uk'
WHERE Locale = 'EN' AND ColName='txtFooter' AND FormName = 'rptPageFooters'
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptGenericHeaders',
	'lblSpecificationSummary',
	1,
	'Specification Summary',
	'REPORT',
	2,
	'SimpleView',
	'1',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEAQuoteTermsDoors',
	'lblTitle',
	1,
	'Quotation Qualifications & Implied Terms' + CHAR(13) + CHAR(10),
	'REPORT',
	2,
	'SimpleView',
	'SimpleView',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEAQuoteTermsDoors',
	'txtGeneralConditions',
	1,
	'General Conditions Text',
	'REPORT',
	2,
	'Text Box',
	'  1.  Solidcore door tested to ‘Severe’ performance rating BS DD171.' + CHAR(13) + CHAR(10) + 
	'  2.  Glazing aperture positioned to comply with EA i.e. height above finished floor level & clearance of handle.' + CHAR(13) + CHAR(10) + 
	'  3.  Standard handle height is 983mm above finished floor level.' + CHAR(13) + CHAR(10) + 
	'  4.  Where acoustic performance is required door must be sealed on all four edges.' + CHAR(13) + CHAR(10) +
	'  5.  Doors supplied in protective bags and labelled.' + CHAR(13) + CHAR(10) +
	'  6.  Cylinder and handle holes on door face prepared at factory.' + CHAR(13) + CHAR(10) +
	'  7.  Hinges, lockcase, striking plate and flush bolts are all factory fitted.' + CHAR(13) + CHAR(10) +
	'  8.  Surface fix ironmongery supplied to site for fixing.' + CHAR(13) + CHAR(10) +
	'  9.  Timber frames are made from factory engineered Redwood.' + CHAR(13) + CHAR(10) +
	'  10. Door stops are an integral part of frame. i.e. rebated timber section.' + CHAR(13) + CHAR(10) +
	'  11. Intumescents and smoke seals are included.' + CHAR(13) + CHAR(10) +
	'  12. Frames pre-drilled' + CHAR(13) + CHAR(10) +
	'  13. Frames supplied in parts, shrink wrapped for protection and labelled.' + CHAR(13) + CHAR(10) +
	'  14. Architraves by others.' + CHAR(13) + CHAR(10) +
	'  15. Prices include from modular doorset size range. Any non standard sizes are extra.' + CHAR(13) + CHAR(10) +
	'  16. It is the contractor’s responsibility to check prior to order that sizes/depths quoted are suitable for site locations.' + CHAR(13) + CHAR(10) +
	'  17. Factory finished frames are not painted on the back of frame. i.e. adjacent to wall. Any final decoration by main contractor.' + CHAR(13) + CHAR(10) +
	'  18. Certification does not allow for exposure of the back side of frame to fire.' + CHAR(13) + CHAR(10) +
	'  19. Vision panel dimensions are cut-out sizes, visual area is slightly less.' + CHAR(13) + CHAR(10) +
	'  20. Delivery lead times commence when a full order including full and final information is received. Changes under instruction'  + CHAR(13) + CHAR(10) +
	'      after an order is placed and prior to manufacture are deemed as final.',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEAQuoteTermsDoors',
	'txtTechnicalNotes',
	1,
	'Technical Notes Text',
	'REPORT',
	2,
	'Text Box',
	'  1.  Doors are faced with Formica laminate, veneer or paint.' + CHAR(13) + CHAR(10) + 
	'  2.  Door leaf lipped on four edges with assimilate Beech PVC' + CHAR(13) + CHAR(10) + 
	'  3.  Glazing beads are solid Beech, clear lacquered and security screw fixed.' + CHAR(13) + CHAR(10) + 
	'  4.  Glass – please refer to ‘Doorset Standard Sizes and Glass’ document.' + CHAR(13) + CHAR(10) +
	'  5.  ASSA Modular lock features cylinder over handle for EA compliancy. ' + CHAR(13) + CHAR(10) +
	'  6.  Frame finish is primed.',
	0,
	1
)
GO

INSERT INTO FormFields
(
	Locale,
	FormName,
	ColName,
	ColNumber,
	VisibleColText,
	Usage1Name,
	Usage1Value,
	Usage2Name,
	Usage2Value,
	DefaultWidth,
	[Required]
)
VALUES
(
	'EN',
	'rptEMEAQuoteTermsDoors',
	'txtSpecificationSummary',
	1,
	'Specification Summary Text',
	'REPORT',
	2,
	'Text Box',
	'Hinges – e.g. ASSA Lift off journal' + CHAR(13) + CHAR(10) + 
	'Locks – e.g. ASSA Modular' + CHAR(13) + CHAR(10) + 
	'Door Finish – e.g. fully factory finished' + CHAR(13) + CHAR(10) + 
	'Door Edge - e.g. fully factory finished' + CHAR(13) + CHAR(10) +
	'Beads – e.g. Beech glazing bead, screw fixed. Intumescent as appropriate' + CHAR(13) + CHAR(10) +
	'Glass – e.g. As shown to comply with performance ratings – clear finish i.e. no GWPP' + CHAR(13) + CHAR(10) +
	'Frame Finish – e.g. fully factory primed, pre-drilled' + CHAR(13) + CHAR(10) +
	'Threshold – e.g. Drop down, where required.',
	0,
	1
)
GO













 