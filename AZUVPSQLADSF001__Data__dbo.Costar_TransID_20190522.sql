SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON







CREATE VIEW [dbo].[Costar_TransID_20190522]
AS
SELECT DISTINCT FIPS,TransactionID
FROM            xMSmith.dbo.CostarTestData_20190522
WHERE UCID <> 'D' 
--and (PropertyClassID not like 'R' or PropertyClassID is NULL)
-- And isNULL(StdLandUseCode,'') <> '1001'








