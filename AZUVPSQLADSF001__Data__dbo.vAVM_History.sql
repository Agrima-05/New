SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vAVM_History]
AS
SELECT P.FIPS
, P.PropertyID
, P.FormattedAPN AS APN
, P.SitusStdFullStreetAddress as SitusFullStreetAddress
, P.SitusStdHouseNbr as SitusHouseNbr
, P.SitusStdHouseNbrSuffix as SitusHouseNbrSuffix
, P.SitusStdDirectionLeft as SitusDirectionLeft
, P.SitusStdStreet as SitusStreet
, P.SitusStdMode as SitusMode
, P.SitusStdDirectionRight as SitusDirectionRight
, P.SitusStdUnitType as SitusUnitType
, P.SitusStdUnitNbr as SitusUnitNbr
, P.SitusStdCity as SitusCity
, P.SitusStdState as SitusState
, P.SitusStdZIP5 as SitusZIP5
, P.SitusStdZIP4 as SitusZIP4
, P.SitusStdCarrierCode as SitusCarrierCode
, A.Final_Value as FinalValue
, A.[high] HighValue
, A.[low] LowValue
, A.[score] ConfidenceScore
, A.[stdev] StandardDeviation
, A.VALUATION_DATE as ValuationDate
, P.[StdLandUseCode]
FROM [SNAVNSQLADSF001.datatree.local].[prod_AVM_History].[dbo].[AVM_History_201909] AS A WITH(NOLOCK) 
	JOIN [Data].dbo.[Property] AS P WITH(NOLOCK) 
		ON A.FIPS = P.FIPS AND A.PropertyID = P.PropertyID















GRANT SELECT ON [dbo].[vAVM_History] TO [CORP\cbrady] AS [dbo]
