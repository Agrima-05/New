SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





CREATE VIEW [dbo].[v_PropertyRadar_Listing]
AS
			Select
			[Property Address],
			[Property City],
			[Property State],
			[Property Zip],
			[Property Zip + 4],
			CASE WHEN PM_APN is NULL then [Assessor's Parcel Identification Number] ELSE PM_APN END AS [Assessor's Parcel Identification Number],
			[County FIPS],
			PM_PropertyID AS [Internal FA Property Ref ID],
			[Property Type],
			[Property Sub-Type],
			[Lot Size (Sq Ft)],
			[Home Size (Sq Ft)],
			[Home or Building Style],
			[Heating Type],
			[Heating Fuel Type],
			[Cooling Type],
			[Cooling Fuel Type],
			[Number of Stories],
			[Year Built],
			[Roof Type],
			[Exterior Construction],
			[Number of Bedrooms],
			[Number of Bathrooms],
			[Number of Garages],
			[Garage Type],
			[Pool Features],
			[View Features],
			[FA Calculated Days on Market],
			[Current Original Listing Date],
			[Listing Number],
			[Status],
			[Status Sub Type],
			[Rental Ind],
			[Current Listing Price],
			[Sold Price],
			[Sold Date],
			[FA Adjusted Sold Price],
			[FA Sold Price Range],
			[Listing Tracking ID],
			[FA Unique Listing Identifier - Ref ID],
			[Update Timestamp],
			[Add, Change, Delete Indicator]


	FROM     dbo.PropertyRadar_WORK





