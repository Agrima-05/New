SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





CREATE VIEW [dbo].[vAVM_History]
AS
SELECT FIPSCode
	, Final_Value
	, convert(bigint,0) as Low_Value
	, convert(bigint,0)  as High_Value
	, convert(int,0)  as ConfidenceScore
	, convert(float,0) as StandardDeviation
	, [date_calc] as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2000_new]

UNION ALL

SELECT FIPSCode
	, Final_Value
	, convert(bigint,0) as Low_Value
	, convert(bigint,0)  as High_Value
	, convert(int,0)  as ConfidenceScore
	, convert(float,0) as StandardDeviation
	, [date_calc] as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2002_new]

UNION ALL

SELECT FIPSCode
	, Final_Value
	, convert(bigint,0) as Low_Value
	, convert(bigint,0)  as High_Value
	, convert(int,0)  as ConfidenceScore
	, convert(float,0) as StandardDeviation
	, [date_calc] as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2005_new]

UNION ALL

SELECT FIPSCode
	, Final_Value
	, convert(bigint,0) as Low_Value
	, convert(bigint,0)  as High_Value
	, convert(int,0)  as ConfidenceScore
	, convert(float,0) as StandardDeviation
	, [date_calc] as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2008_new]

UNION ALL

SELECT FIPSCode
	, Final_Value
	, convert(bigint,0) as Low_Value
	, convert(bigint,0)  as High_Value
	, convert(int,0)  as ConfidenceScore
	, convert(float,0) as StandardDeviation
	, [date_calc] as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2011_new]

UNION ALL

SELECT FIPSCode
	, Final_Value
	, convert(bigint,0) as Low_Value
	, convert(bigint,0)  as High_Value
	, convert(int,0)  as ConfidenceScore
	, convert(float,0) as StandardDeviation
	, [date_calc] as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2014_new]

UNION ALL

SELECT FIPSCode
	, Final_Value
	, [low] as Low_Value
	, [high] as High_Value
	, [score] as ConfidenceScore
	, [score] as StandardDeviation
	, convert(datetime,[VALUATION_DATE]) as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2017_new]



UNION ALL

SELECT FIPSCode
	, Final_Value
	, [low] as Low_Value
	, [high] as High_Value
	, [score] as ConfidenceScore
	, [score] as StandardDeviation
	, convert(datetime,[VALUATION_DATE]) as VALUATION_DATE
	, [PropertyID]
FROM  [dbo].[valuation_hist_2018_new]








