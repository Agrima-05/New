SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[v_SchoolDistricts] AS
SELECT [DateCreated]
      ,[SourceFile]
      --,[Geom]
      ,[STATEFP]
      ,[INTPTLON]
      ,[HIGRADE]
      ,[FUNCSTAT]
      ,[LSAD]
      ,[INTPTLAT]
      ,[ELSDLEA]
      ,[ALAND]
      ,[SDTYP]
      ,[GEOID]
      ,[LOGRADE]
      ,[MTFCC]
      ,[AWATER]
      ,[NAME]
FROM [TigerShapefile].[dbo].[ELSD] with (nolock)
UNION
SELECT [DateCreated]
      ,[SourceFile]
      --,[Geom]
      ,[STATEFP]
      ,[INTPTLON]
      ,[HIGRADE]
      ,[FUNCSTAT]
      ,[LSAD]
      ,[INTPTLAT]
      ,[ALAND]
      ,[SDTYP]
      ,[GEOID]
      ,[LOGRADE]
      ,[MTFCC]
      ,[AWATER]
      ,[NAME]
      ,[SCSDLEA]
FROM [TigerShapefile].[dbo].[SCSD] with (nolock)
UNION
SELECT [DateCreated]
      ,[SourceFile]
      --,[Geom]
      ,[UNSDLEA]
      ,[INTPTLON]
      ,[HIGRADE]
      ,[FUNCSTAT]
      ,[LSAD]
      ,[INTPTLAT]
      ,[ALAND]
      ,[SDTYP]
      ,[GEOID]
      ,[LOGRADE]
      ,[STATEFP]
      ,[MTFCC]
      ,[AWATER]
      ,[NAME]
FROM [TigerShapefile].[dbo].[UNSD] with (nolock)


