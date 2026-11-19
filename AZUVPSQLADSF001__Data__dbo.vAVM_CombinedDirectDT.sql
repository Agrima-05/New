SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vAVM_CombinedDirectDT]
AS
SELECT b.[Fips],
b.[PropertyID],
b.[FormattedAPN] as [APN],
b.[SitusStdFullStreetAddress] as [SitusFullStreetAddress],
b.[SitusStdHouseNbr] as [SitusHouseNbr],
b.[SitusStdHouseNbrSuffix] as [SitusHouseNbrSuffix],
b.[SitusStdDirectionLeft] as [SitusDirectionLeft],
b.[SitusStdStreet] as [SitusStreet],
b.[SitusStdMode] as [SitusMode],
b.[SitusStdDirectionRight] as [SitusDirectionRight],
b.[SitusStdUnitType] as [SitusUnitType],
b.[SitusStdUnitNbr] as [SitusUnitNbr],
b.[SitusStdCity] as [SitusCity],
b.[SitusStdState] as [SitusState],
b.[SitusStdZIP5] as [SitusZIP5],
b.[SitusStdZIP4] as [SitusZIP4],
b.[SitusStdCarrierCode] as [SitusCarrierCode],
a.[DIRECT_FINAL_VALUE],
a.[DIRECT_HIGH_VALUE],
a.[DIRECT_LOW_VALUE],
a.[DIRECT_CONFIDENCE_SCORE] as [DIRECT_CONFIDENCE_SCORE],
a.[DIRECT_FORECAST_STANDARD_DEVIATION],
convert(varchar(8),convert(date,a.[VALUE_AS_OF]),112) as [ValuationDate],
b.[StdLandUseCode],
'Procision'  as [ValuationModel],
b.PropertyClassID,
B.DTDB_Ref_ID,
B.DTDB_UNFORMATTED_APN,
B.DTDB_FORMATTED_APN,

----Added 20221021 for Costar
B.[CS_FORMATTED_APN],
B.[CS_UNFORMATTED_APN]

FROM [Holocron].[dbo].[Holocron] a with(NOLOCK) JOIN [Data].[dbo].[Property] b with(NOLOCK)
ON a.FIPSCode = b.FIPS and a.REF_ID = b.DTDB_Ref_ID
where a.[DIRECT_FINAL_VALUE] > 0

UNION ALL

SELECT b.[Fips],
b.[PropertyID],
b.[FormattedAPN] as [APN],
b.[SitusStdFullStreetAddress] as [SitusFullStreetAddress],
b.[SitusStdHouseNbr] as [SitusHouseNbr],
b.[SitusStdHouseNbrSuffix] as [SitusHouseNbrSuffix],
b.[SitusStdDirectionLeft] as [SitusDirectionLeft],
b.[SitusStdStreet] as [SitusStreet],
b.[SitusStdMode] as [SitusMode],
b.[SitusStdDirectionRight] as [SitusDirectionRight],
b.[SitusStdUnitType] as [SitusUnitType],
b.[SitusStdUnitNbr] as [SitusUnitNbr],
b.[SitusStdCity] as [SitusCity],
b.[SitusStdState] as [SitusState],
b.[SitusStdZIP5] as [SitusZIP5],
b.[SitusStdZIP4] as [SitusZIP4],
b.[SitusStdCarrierCode] as [SitusCarrierCode],
a.[final_value] as [FinalValue],
a.[high] as [HighValue],
a.[low] as [LowValue],
a.[score] as [ConfidenceScore],
a.[stdev] as [StandardDeviation],
a.[VALUATION_DATE] as [ValuationDate],
b.[StdLandUseCode],
CASE WHEN a.[Model] = 'NEW' THEN 'PrevVersionII' ELSE 'PrevVersionI' END  as [ValuationModel],
b.PropertyClassID,
B.DTDB_Ref_ID,
B.DTDB_UNFORMATTED_APN,
B.DTDB_FORMATTED_APN,

-----Added 20220721 for Costar
B.CS_FORMATTED_APN,
B.CS_UNFORMATTED_APN

-- FROM [Data].[dbo].[AVM] a with(NOLOCK) JOIN [Data].[dbo].[Property] b with(NOLOCK)
--ON a.PropertyID = b.PropertyID
--WHERE a.ref_id NOT IN(Select REF_ID FROM Holocron.dbo.Holocron)

FROM [Data].[dbo].[AVM] a with(NOLOCK) JOIN [Data].[dbo].[Property] b with(NOLOCK)
ON a.FIPS = b.FIPS and a.ref_id = b.DTDB_Ref_ID
LEFT OUTER JOIN Holocron.dbo.Holocron as C with(NOLOCK)
on A.ref_id = C.REF_ID
WHERE C.REF_ID is null or C.DIRECT_FINAL_VALUE is null




GRANT SELECT ON [dbo].[vAVM_CombinedDirectDT] TO [CORP\cbrady] AS [dbo]
