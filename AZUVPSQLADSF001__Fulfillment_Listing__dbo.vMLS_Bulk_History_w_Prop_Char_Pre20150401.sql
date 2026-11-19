SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vMLS_Bulk_History_w_Prop_Char_Pre20150401]
AS
SELECT [Property Address]
	,[Property City]
	,[Property State]
	,[Property Zip]
	,[Property Zip + 4]
	,[Assessor's Parcel Identification Number]
	,RIGHT('00000' + CAST([County FIPS] AS VARCHAR(5)), 5) AS [County FIPS]
	,[Internal FA Property Ref ID]
	,[Property Type]
	,[Property Sub-Type]
	,[Lot Size (Sq Ft)]
	,[Home Size (Sq Ft)]
	,[Home or Building Style]
	,[Heating Type]
	,[Heating Fuel Type]
	,[Cooling Type]
	,[Cooling Fuel Type]
	,[Number of Stories]
	,[Year Built]
	,[Roof Type]
	,[Exterior Construction]
	,[Number of Bedrooms]
	,[Number of Bathrooms]
	,[Number of Garages]
	,[Garage Type]
	,[Pool Features]
	,[View Features]
	,[Price per Square Feet]
	,[Porch]
	,[Patio]
	,[Deck]
	,[Basement]
	,[Air Conditioner]
	,[Number of Fireplaces]
	,[Presence of Fireplace]
	,[Fireplace Description]
	,[Interior Features]
	,[Exterior Features]
	,[Existing Structures]
	,[Property Details]
	,[Lot Features]
	,[Zoning]
	,[Neighborhood]
	,[School District]
	,[Elementary School]
	,[Middle School]
	,[High School]
	,[Appliances]
	,[Approximate Lot Dimensions]
	,[Topogrophy]
	,[Waterfront Features]
	,[Water]
	,[Water Source]
	,[Water Amenities]
	,[Water Access]
	,[Water Heater]
	,[FA Calculated Days on Market]
	,[Current Original Listing Date]
	,[Listing Number]
	,[Status]
	,[Status Sub Type]
	,CASE 
		WHEN Rental_Ind = 1
			THEN 'Y'
		ELSE ''
		END AS [Rental Ind]
	,[Current Listing Price]
	,[Sold Price]
	,[Sold Date]
	,[FA Adjusted Sold Price]
	,[FA Sold Price Range]
	,[Listing Tracking ID]
	,[FA Unique Listing Identifier - Ref ID]
	,[Update Timestamp]
	,[Add, Change, Delete Indicator]
FROM Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char_Pre20150401(NOLOCK) a
INNER JOIN Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char_Checksum3(NOLOCK) b ON b.Row_Id = a.[FA Unique Listing Identifier - Ref ID]
LEFT JOIN Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char_Checksum3(NOLOCK) b2 ON b2.Listing_ID = b.Listing_ID
	AND b.ROW4 = (b2.ROW4 + 1)
INNER JOIN Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char_Checksum4(NOLOCK) c ON c.Row_Id = a.[FA Unique Listing Identifier - Ref ID]
LEFT JOIN Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char_Checksum4(NOLOCK) c2 ON c2.Listing_ID = c.Listing_ID
	AND c.ROW4 = (c2.ROW4 + 1)
WHERE isnull(b.Checksum_3Col, 0) <> isnull(b2.Checksum_3Col, 0)
	OR isnull(c.Checksum_34Col, 0) <> isnull(c2.Checksum_34Col, 0)



