SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[vAssessor_Tenant]
AS
SELECT b.FIPS 
	  ,b.[PropertyID] as [PROPERTYID]
	  ,b.[FormattedAPN] as [APN]
	  ,[COMPANY_NAME]
      ,[ALIAS_COMPANY_NAME]
      ,[ADDRESS]
      ,[SUITE_UNIT]
      ,[CITY]
      ,[STATE]
      ,[ZIP5]
      ,[ZIP4]
      ,[CONTACT_NAME]
      ,[CONTACT_TITLE]
      ,[PHONE]
      ,[NON_PROFIT_FLAG]
      ,[BUSINESS_START_DATE]
      ,[MOVED_IN_DATE]
      ,[TYPE_OF_BUSINESS]
	  ,NULL as [FIPS_APN_MATCH_TO_PROP]
	  ,[Property_ID_Match_Type] as [FIPS_APN_MATCH_TYPE]
      ,[TENANT_OWNS_PROPERTY]
      ,[TENANTID]
	  ,NULL as [LIQUOR LICENSE FLAG]
	  ,NULL as [UNDERGROUND FUEL TANK FLAG]
	  ,NAICS
	  ,b.[StdLandUseCode]

  FROM [Data].[dbo].[SMR_Tenants] a with(NOLOCK) LEFT OUTER JOIN data.dbo.Property b with(NOLOCK)
  on a.Property_ID = b.PropertyID



GRANT SELECT ON [dbo].[vAssessor_Tenant] TO [CORP\cbrady] AS [dbo]
