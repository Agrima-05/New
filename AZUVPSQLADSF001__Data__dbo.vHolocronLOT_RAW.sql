SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vHolocronLOT_RAW]
AS

		SELECT 
		[Fipscode]
      ,[REF_ID]
      ,[FIPS]
      ,[VALUE_AS_OF]
      ,[LOT_FINAL_VALUE]
      ,[LOT_HIGH_VALUE]
      ,[LOT_LOW_VALUE]
      ,[LOT_CONFIDENCE_SCORE]
      ,[LOT_FORECAST_STANDARD_DEVIATION]
      ,[PREMIER_MESSAGE_CODE]
      ,[PREMIER_MESSAGE_TEXT]
      ,[RUN_DATE]
      ,[COMP1a]
      ,[COMP2a]
      ,[COMP3a]
      ,[COMP4a]
      ,[COMP5a]
      ,[COMP6a]
      ,[COMP7a]
      ,[COMP1]
      ,[COMP2]
      ,[COMP3]
      ,[COMP4]
      ,[COMP5]
      ,[COMP6]
      ,[COMP7]
      ,[SMALL_LOT_BUCKET_ACRES]
      ,[SMALL_SALES_N]
      ,[SMALL_MEAN_PRICE_PER_ACRE]
      ,[SMALL_MEDIAN_PRICE_PER_ACRE]
      ,[SMALL_STDDEV_PRICE_PER_ACRE]
      ,[SMALL_LOW_PRICE_PER_ACRE_P10]
      ,[SMALL_HIGH_PRICE_PER_ACRE_P90]
      ,[MEDIUM_LOT_BUCKET_ACRES]
      ,[MEDIUM_SALES_N]
      ,[MEDIUM_MEAN_PRICE_PER_ACRE]
      ,[MEDIUM_MEDIAN_PRICE_PER_ACRE]
      ,[MEDIUM_STDDEV_PRICE_PER_ACRE]
      ,[MEDIUM_LOW_PRICE_PER_ACRE_P10]
      ,[MEDIUM_HIGH_PRICE_PER_ACRE_P90]
      ,[LARGE_LOT_BUCKET_ACRES]
      ,[LARGE_SALES_N]
      ,[LARGE_MEAN_PRICE_PER_ACRE]
      ,[LARGE_MEDIAN_PRICE_PER_ACRE]
      ,[LARGE_STDDEV_PRICE_PER_ACRE]
      ,[LARGE_LOW_PRICE_PER_ACRE_P10]
      ,[LARGE_HIGH_PRICE_PER_ACRE_P90]
      ,[PropertyID]
      ,[Model]

  FROM [Holocron].[dbo].[HolocronLOT] with(NOLOCK)









