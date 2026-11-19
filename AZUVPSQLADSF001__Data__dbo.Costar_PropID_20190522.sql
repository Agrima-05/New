SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON








CREATE VIEW [dbo].[Costar_PropID_20190522]
AS
SELECT DISTINCT Fips,FAPropertyID as PropertyID
FROM            xMSmith.dbo.CostarTestData_20190522
WHERE FAPropertyID is NOT NULL
--And PropertyClassID not like 'R'
-- And isNULL(StdLandUseCode,'') <> '1001'







