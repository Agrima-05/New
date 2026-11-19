SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[HIIS_QuickView] AS SELECT a.MLSID,g.MLSName,g.MLSAka as MLS_Abbrev,a.FIPSCode, a.PropertyID, a.REF_ID, a.ListingId,PropertyType,PropertySubType, a.ListingContractDate,a.OnMarketDate, a.ListPrice, a.OriginalListPrice, a.CloseDate, a.ClosePrice,a.ModificationTimestamp, a.MlsStatus, b.FullStreetAddress, b.City, b.State, b.Zip, b.ZIP4, b.Latitude, b.Longitude, b.CarrierCode FROM [dbo].[HIIS_Listings_Current] AS a LEFT OUTER JOIN [dbo].[HIIS_StandardizedAddress] AS b ON a.ListingId = b.ListingID JOIN dbo.MLS_Global g on g.MLSID = a.MLSID 

