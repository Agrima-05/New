SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vAVM_History_Procision_ALL_2024_TOOL_FMT]
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
      ,FORMAT([PREMIER_FINAL_VALUE],'0.0000') [PREMIER_FINAL_VALUE]
      ,FORMAT([PREMIER_HIGH_VALUE],'0.0000') [PREMIER_HIGH_VALUE]
      ,FORMAT([PREMIER_LOW_VALUE],'0.0000') [PREMIER_LOW_VALUE]
      ,[PREMIER_CONFIDENCE_SCORE]
      ,[PREMIER_FORECAST_STANDARD_DEVIATION]
      ,FORMAT([POWER_FINAL_VALUE],'0.0000') [POWER_FINAL_VALUE]
      ,FORMAT([POWER_HIGH_VALUE],'0.0000') [POWER_HIGH_VALUE]
      ,FORMAT([POWER_LOW_VALUE],'0.0000') [POWER_LOW_VALUE]
      ,[POWER_CONFIDENCE_SCORE]
      ,[POWER_FORECAST_STANDARD_DEVIATION]
      ,FORMAT([DIRECT_FINAL_VALUE],'0.0000') [DIRECT_FINAL_VALUE]
      ,FORMAT([DIRECT_HIGH_VALUE],'0.0000') [DIRECT_HIGH_VALUE]
      ,FORMAT([DIRECT_LOW_VALUE],'0.0000') [DIRECT_LOW_VALUE]
      ,[DIRECT_CONFIDENCE_SCORE]
      ,[DIRECT_FORECAST_STANDARD_DEVIATION]
      ,Replace([VALUE_AS_OF],'-','') as [VALUATION_DATE]
      ,COALESCE(CS_UNFORMATTED_APN,DTDB_UNFORMATTED_APN) [DTDB_UNFORMATTED_APN]
       FROM [dbo].[PROCISION_AVM_YEARLY_2024] a with(NOLOCK)
           JOIN [prod_AVM_History].dbo.Property b with(NOLOCK)
              ON a.REF_ID = b.DTDB_REF_ID




