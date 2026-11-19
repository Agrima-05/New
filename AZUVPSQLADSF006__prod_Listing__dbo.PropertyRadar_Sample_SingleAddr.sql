SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


Create VIEW [dbo].[PropertyRadar_Sample_SingleAddr]
AS
SELECT [Property Address], [Property City], [Property State], [Property Zip], [Property Zip + 4], CASE WHEN PM_APN is NULL then [Assessor's Parcel Identification Number] ELSE PM_APN END AS [Assessor's Parcel Identification Number], [County FIPS], 
                  PM_PropertyID AS [Internal FA Property Ref ID], [Property Type], [Property Sub-Type], [Lot Size (Sq Ft)], [Home Size (Sq Ft)], [Home or Building Style], [Heating Type], 
                  [Heating Fuel Type], [Cooling Type], [Cooling Fuel Type], [Number of Stories], [Year Built], [Roof Type], [Exterior Construction], [Number of Bedrooms], [Number of Bathrooms], 
                  [Number of Garages], [Garage Type], [Pool Features], [View Features], [FA Initial List Date], [FA Calculated Days on Market], [Current Original Listing Date], [Initial List Status], 
                  [Listing Number], Status, [Current Listing Price], [Max List Price], [Max List Price Date], [Min List Price], [Min List Price Date], [Sold Price], [FA Adjusted Sold Price], 
                  [FA Sold Price Range], [Last Listing Price Change Amount], [Last Listing Price Change Date], [Prior Listing Price Change Amount], [Prior Listing Price Change Date], 
                  [Last Listing Status Change], [Last Listing Status Change Date], [Prior Listing Status Change], [Prior Listing Status Change Date], [FA Unique Listing Identifier - Ref ID], 
                  [Update Timestamp], [Add, Change, Delete Indicator]
FROM     dbo.PropertyRadar_06013_OUT
where [Internal FA Property Ref ID] = '10560195'


