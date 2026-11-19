SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vAVM_History_2009]
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
,NULL as HighValue
,NULL as LowValue
,NULL as ConfidenceScore
,NULL as StandardDeviation
,a.[date_calc] as ValuationDate
-----Added 20211004
,C.StdLandUseCode
,c.DTDB_FORMATTED_APN
,c.DTDB_UNFORMATTED_APN
,C.DTDB_REF_ID
	From [AZUVPSQLDTDB029.datatree.local].[Property_AVM_History].dbo.[valuation_hist_2009_new] a with(NOLOCK)
		JOIN [Data].dbo.[Property] c with(NOLOCK) 
		on a.FIPS = convert(int,c.FIPS) and a.REF_ID = c.DTDB_Ref_ID
WHERE [date_calc] is not null





GRANT SELECT ON [dbo].[vAVM_History_2009] TO [CORP\cbrady] AS [dbo]
