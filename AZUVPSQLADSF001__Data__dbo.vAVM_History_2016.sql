SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vAVM_History_2016]
AS

Select c.FIPS
,c.PropertyID
,c.FormattedAPN as APN
,c.SitusStdFullStreetAddress as SitusFullStreetAddress
,c.SitusStdHouseNbr as SitusHouseNbr
,c.SitusStdHouseNbrSuffix as SitusHouseNbrSuffix
,c.SitusStdDirectionLeft as SitusDirectionLeft
,c.SitusStdStreet as SitusStreet
,c.SitusStdMode as SitusMode
,c.SitusStdDirectionRight as SitusDirectionRight
,c.SitusStdUnitType as SitusUnitType
,c.SitusStdUnitNbr as SitusUnitNbr
,c.SitusStdCity as SitusCity
,c.SitusStdState as SitusState
,c.SitusStdZIP5 as SitusZIP5
,c.SitusStdZIP4 as SitusZIP4
,c.SitusStdCarrierCode as SitusCarrierCode
,a.[final_value] as FinalValue
,a.[high] as HighValue
,a.[low] as LowValue
,a.[score] as ConfidenceScore
,a.[stdev] as StandardDeviation
,convert(datetime,Convert(Varchar(10),a.[VALUATION_DATE],120)) as ValuationDate
-----Added 20211004
,C.StdLandUseCode
,c.DTDB_FORMATTED_APN
,c.DTDB_UNFORMATTED_APN
,C.DTDB_REF_ID
	From [AZUVPSQLDTDB029.datatree.local].[Property_AVM_History].dbo.[valuation_hist_2016_new] a with(NOLOCK)
JOIN [Data].dbo.[Property] c with(NOLOCK) 
on a.FIPS = convert(int,c.FIPS) and a.REF_ID = c.DTDB_REF_ID





GRANT SELECT ON [dbo].[vAVM_History_2016] TO [CORP\cbrady] AS [dbo]
