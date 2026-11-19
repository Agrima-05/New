SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




 CREATE view [dbo].[MLTrigger] 
 as
		SELECT CASE WHEN (l.[status] in('Active','Contengent','Backup') and [price] < [original_listing_price] and ([price_change_timestamp] is not null or [price_change_date] is not null) AND l.[mls_update_date] != l.[photo_date]) THEN coalesce([price_change_timestamp],[price_change_date],l.[mls_update_date])
			WHEN l.[status] in('Active','Contengent','Backup') THEN Platlabs_ListDate
			WHEN l.[status] = 'Pending' then coalesce(CASE WHEN [pending_date] > GETDATE() THEN [status_change_date] ELSE [pending_date] END,[status_change_date],[contract_status_change_date],[contract_date],l.[mls_update_date])
			WHEN (l.[status] in('sold') OR (l.[status] = 'closed' and sold_price is not null)) then coalesce([sold_date],[close_date],l.[status_change_date],[contract_status_change_date],l.[mls_update_date])
			WHEN l.[status] in ('withdrawn','cancelled','expired') THEN coalesce([off_market_date],[cancelled_date],[expiration_date],[close_date],l.[status_change_date],l.[mls_update_date],[major_change_date],[contract_status_change_date])
			END as STATUS_CHANGE_DATE
		,CASE WHEN (l.[status] in('Active','Contengent','Backup') and [price] < [original_listing_price] and ([price_change_timestamp] is not null or [price_change_date] is not null) AND l.[mls_update_date] != l.[photo_date]) THEN 'Price Change'
			WHEN l.[status] in('Active','Contengent','Backup') THEN 'Listed'
			WHEN l.[status] = 'Pending' then 'Pending'
			WHEN (l.[status] in('sold') OR (l.[status] = 'closed' and sold_price is not null)) then 'Sold'
			WHEN l.[status] in ('withdrawn','cancelled','expired') THEN 'Off Market'
			END as LISTING_STATUS
			,price,original_listing_price,sold_date,sold_price
		,REF_ID as PROPERTY_ID
		,FIPS
		,l.[address] SITUS_ADDRESS
		,l.[city] as CITY
		,l.[state] as [STATE]
		,l.[zip] as ZIP_CODE
		,[county] as COUNTY
		,[listing_agent_name] as LISTING_AGENT_NAME
		,[List_Agent_FirstName] as LISTING_AGENT_FIRST_NAME
		,[List_Agent_LastName] as LISTING_AGENT_LAST_NAME
		,[listing_office_name] as LISTING_OFFICE_NAME
		,[listing_agent_phone] as LISTING_AGENT_PHONE
		,List_Agent_License_Number as LISTING_AGENT_LICENSE_NUMBER
		,[listing_agent_email] as LISTING_AGENT_EMAIL
		,lo.[address] + ',' + lo.[city] + ',' + lo.[state] + ',' + lo.[zip] as LISTING_OFFICE_ADDRESS
		,[listing_office_phone] as LISTING_OFFICE_PHONE
		,lo.[email] as LISTING_OFFICE_EMAIL
		,lo.[website] as LISTING_OFFICE_WEBSITE
		,[Sell_Agent_Office_Name] as BUYER_AGENT_NAME
		,[Selling_Agent_FirstName] as BUYER_AGENT_FIRST_NAME
		,[Selling_Agent_LastName] as BUYER_AGENT_LAST_NAME
		,[Selling_Agent_phone] as BUYER_AGENT_PHONE
		,[Selling_Agent_email] as BUYER_AGENT_EMAIL
		,[Sell_Agent_Office_Name] as BUYER_OFFICE_NAME
		,bo.[address] + ',' + bo.[city] + ',' + bo.[state] + ',' + bo.[zip] as BUYER_OFFICE_ADDRESS
		,l.[mls_id] as MLS_ID
		,l.[mls_listing_id] as MLS_LISTING_ID
		,lo.[license_number] as LISTING_OFFICE_LICENSE_NUMBER
		,bo.[license_number] as BUYER_AGENT_LICENSE_NUMBER
		FROM src_PlatLabs.listing.listingFull l with(NOLOCK)
			LEFT OUTER JOIN src_Platlabs.Office.Platlabs_Offices lo with(NOLOCK)
				ON l.mls_id = lo.mls_id
					and l.listing_office_id = lo.dp_office_id
			LEFT OUTER JOIN src_Platlabs.Office.Platlabs_Offices bo with(NOLOCK)
				ON l.mls_id = bo.mls_id
					and l.listing_office_id = bo.dp_office_id
		WHERE l.mls_id in(Select mls_id from src_Platlabs.dbo.platlabs_update_config with(NOLOCK) where active = '1' and code like '%39' and LEFT(code,2) in('TX', 'MT', 'ID', 'NM', 'CA'))
		AND l.LoadDate > (Select BeginDate from dbo.MTTrack) 
		AND (is_rental is NULL and is_residential_lease is NULL and price > 5000)
		AND (l.mls_id in (Select mls_id from src_Platlabs.dbo.platlabs_update_config with(NOLOCK) where active = '1' and code like '%_39'))
		AND CASE WHEN (l.[status] in('Active','Contengent','Backup') and [price] < [original_listing_price] and ([price_change_timestamp] is not null or [price_change_date] is not null) AND l.[mls_update_date] != l.[photo_date]) THEN coalesce([price_change_timestamp],[price_change_date],l.[mls_update_date])
			WHEN l.[status] in('Active','Contengent','Backup') THEN Platlabs_ListDate
			WHEN l.[status] = 'Pending' then coalesce(CASE WHEN [pending_date] > GETDATE() THEN [status_change_date] ELSE [pending_date] END,[status_change_date],[contract_status_change_date],[contract_date],l.[mls_update_date])
			WHEN (l.[status] in('sold') OR (l.[status] = 'closed' and sold_price is not null)) then coalesce([sold_date],[close_date],l.[status_change_date],[contract_status_change_date],l.[mls_update_date])
			WHEN l.[status] in ('withdrawn','cancelled','expired') THEN coalesce([off_market_date],[cancelled_date],[expiration_date],[close_date],l.[status_change_date],l.[mls_update_date],[major_change_date],[contract_status_change_date])
			END > (Select BeginDate from dbo.MTTrack)



