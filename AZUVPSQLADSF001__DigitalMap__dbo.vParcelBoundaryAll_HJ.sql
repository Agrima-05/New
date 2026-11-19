SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.vParcelBoundaryAll_HJ
AS
SELECT        [FADigitalMapMasterId], PropertyID, [APN], [FIPS], [Longitude], [Latitude], [ParcelGeography], [ParcelGeometry], [ParcelPointGeography], [ParcelPointGeometry], [EstLotSizeSqFt], [AddressScore], [GeoSource], 
                         [PARCELAPN], [FAGeoStatusCode], [LatLonGeometry], [DmDate], [MatchCode], [UpdateFlag], [RefId], [PRCLDMPID], [PROPDMPID], [ParcelGeometry4269], [ParcelPointGeometry4269], [Id], [FATimestamp], 
                         [GeomWKT], [UCIDFlag], [PointWKT]
FROM            [DigitalMap].[dbo].[FADigitalMap_HJ]
/*-[FADigitalMap_HJ]*/ WHERE [ParcelGeometry4269] IS NOT NULL
UNION ALL
SELECT        [FADigitalMapMasterId], NULL AS PropertyID, [APN], [FIPS], [Longitude], [Latitude], [ParcelGeography], [ParcelGeometry], [ParcelPointGeography], [ParcelPointGeometry], [EstLotSizeSqFt], [AddressScore], 
                         [GeoSource], [PARCELAPN], [FAGeoStatusCode], [LatLonGeometry], [DmDate], [MatchCode], [UpdateFlag], [RefId], [PRCLDMPID], [PROPDMPID], [ParcelGeometry4269], [ParcelPointGeometry4269], [Id], 
                         [FATimestamp], [GeomWKT], [UCIDFlag], [PointWKT]
FROM            [DigitalMap].[dbo].[FADigitalMapUnmatched_HJ]

