SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vAVM_History_Procision_Power_2022]
AS

SELECT b.[FIPS]
      ,b.[PropertyID]
      ,b.[FormattedAPN] [APN]
      ,b.[SitusStdFullStreetAddress] [SitusFullStreetAddress]
      ,b.[SitusStdHouseNbr] [SitusHouseNbr]
      ,b.[SitusStdHouseNbrSuffix] [SitusHouseNbrSuffix]
      ,b.[SitusStdDirectionLeft] [SitusDirectionLeft]
      ,b.[SitusStdStreet] [SitusStreet]
      ,b.[SitusStdMode] [SitusMode]
      ,b.[SitusStdDirectionRight] [SitusDirectionRight]
      ,b.[SitusStdUnitType] [SitusUnitType]
      ,b.[SitusStdUnitNbr] [SitusUnitNbr]
      ,b.[SitusStdCity] [SitusCity]
      ,b.[SitusStdState] [SitusState]
      ,b.[SitusStdZIP5] [SitusZIP5]
      ,b.[SitusStdZIP4] [SitusZIP4]
      ,b.[SitusStdCarrierCode] [SitusCarrierCode]
      ,[POWER_FINAL_VALUE] [FinalValue]
      ,[POWER_HIGH_VALUE] [HighValue]
      ,[POWER_LOW_VALUE] [LowValue]
      ,[POWER_CONFIDENCE_SCORE] [ConfidenceScore]
      ,[POWER_FORECAST_STANDARD_DEVIATION] [StandardDeviation]
      ,[VALUE_AS_OF] [ValuationDate]
      ,b.[StdLandUseCode]
      --,b.[DTDB_REF_ID]
      --,b.[DTDB_UNFORMATTED_APN]
      --,b.[DTDB_FORMATTED_APN]
       FROM [AZUVPSQLADSF006.DATATREE.LOCAL].[Holocron].[dbo].[PROCISION_2022_AVM] a 
              JOIN zCust_ADS__00_SharedProcs.dbo.Property b with(NOLOCK)
              ON a.REF_ID = b.Ref_ID



GRANT SELECT ON [dbo].[vAVM_History_Procision_Power_2022] TO [CORP\cbrady] AS [dbo]
