SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON






CREATE VIEW [dbo].[vAVM_History_Procision_ALL_2008_TOOL_FMT_V5]
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
      ,[PREMIER_FINAL_VALUE] [PREMIER_FINAL_VALUE]
      ,[PREMIER_HIGH_VALUE] [PREMIER_HIGH_VALUE]
      ,[PREMIER_LOW_VALUE] [PREMIER_LOW_VALUE]
      ,[PREMIER_CONFIDENCE_SCORE]
      ,[PREMIER_FORECAST_STANDARD_DEVIATION]
      ,[POWER_FINAL_VALUE] [POWER_FINAL_VALUE]
      ,[POWER_HIGH_VALUE] [POWER_HIGH_VALUE]
      ,[POWER_LOW_VALUE] [POWER_LOW_VALUE]
      ,[POWER_CONFIDENCE_SCORE]
      ,[POWER_FORECAST_STANDARD_DEVIATION]
      ,[DIRECT_FINAL_VALUE] [DIRECT_FINAL_VALUE]
      ,[DIRECT_HIGH_VALUE] [DIRECT_HIGH_VALUE]
      ,[DIRECT_LOW_VALUE] [DIRECT_LOW_VALUE]
      ,[DIRECT_CONFIDENCE_SCORE]
      ,[DIRECT_FORECAST_STANDARD_DEVIATION]
      ,Replace([VALUE_AS_OF],'-','') as [VALUATION_DATE]
      ,COALESCE(CS_UNFORMATTED_APN,DTDB_UNFORMATTED_APN) [DTDB_UNFORMATTED_APN]
       FROM [dbo].[PROCISION_AVM_YEARLY_2008_24001_32000] a with(NOLOCK)
           JOIN [prod_AVM_History].dbo.Property b with(NOLOCK)
              ON a.REF_ID = b.DTDB_REF_ID




