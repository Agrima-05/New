/*SET ANSI_NULLS ON
*/


/*SET QUOTED_IDENTIFIER ON
*/


/*

-------------------------------------------------
Exception while translation of a query:

create   VIEW [src_IndependentPlatlabs].[dbo].[Listing_RS_FULL]
    AS
        SELECT 	CASE WHEN isNULL(UnparsedAddress,'') not like '' THEN 
		(SELECT UnparsedAddress as complete_address
		,isNULL(StreetNumber,'') as street_number
		,isNULL(StreetName,'') as street_name
		,isNULL(StreetSuffix,'') as street_suffix
		,isNULL(StreetDirSuffix,'') as street_postdirection
		,isNULL(StreetDirPrefix,'') as street_predirection
		,NULL as secondary_number
		,NULL as secondary_designator
		,NULL as extra_secondary_number
		,NULL as extra_secondary_designator
		,isNULL(City,'') as city
		,isNULL(PostalCode,'') as zip
		,isNULL(StateOrProvince,'') as state
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
		ELSE NULL END
		AS normalized_address

	,JSON_QUERY(
    CASE 
        WHEN ISNULL(ListAgentKey,'') <> '' THEN 
            (
                SELECT 
                    ListAgentKey as id,
                    NULL as uid,
                    LTRIM(RTRIM(ListAgentFullName)) as name,
                    LTRIM(RTRIM(ListAgentFirstName)) as first_name,
                    LTRIM(RTRIM(ListAgentMiddleName)) as middle_name,
                    LTRIM(RTRIM(ListAgentLastName)) as last_name,
                    LTRIM(RTRIM(ListAgentEmail)) as email,
                    LTRIM(RTRIM(Coalesce(ListAgentPreferredPhone,ListAgentMobilePhone))) as phone,
                    LTRIM(RTRIM(ListAgentStateLicense)) as license_number,
                    LTRIM(RTRIM(ListOfficeKey)) as 'Office.id',
                    LTRIM(RTRIM(ListOfficeName)) as 'Office.name',
                    LTRIM(RTRIM(ListOfficePhone)) as 'Office.phone'
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
            )
        ELSE NULL
    END
) AS agents_listing_agent

	,CASE WHEN isNULL(CoListAgentKey,'') not like '' THEN 
		(SELECT CoListAgentKey as id
		,NULL as uid
		,Ltrim(Rtrim(CoListAgentFullName)) as name
		,Ltrim(Rtrim(CoListAgentFirstName)) as first_name
		,Ltrim(Rtrim(CoListAgentMiddleName)) as middle_name
		,Ltrim(Rtrim(CoListAgentLastName)) as last_name
		,Ltrim(Rtrim(CoListAgentEmail)) as email
		,Ltrim(Rtrim(CoListAgentPreferredPhone)) as phone
		,Ltrim(Rtrim(CoListAgentStateLicense)) as license_number
		,Ltrim(Rtrim(CoListOfficeMlsId)) as 'Office.id'
		,Ltrim(Rtrim(CoListOfficeName)) as 'Office.name'
		,Ltrim(Rtrim(ListOfficePhone)) as 'Office.phone'
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
		ELSE NULL END
		AS agents_co_listing_agent

	,CASE WHEN isNULL(BuyerAgentKey,'') not like '' THEN 
		(SELECT BuyerAgentKey as id
		,NULL as uid
		,Ltrim(Rtrim(BuyerAgentFullName)) as name
		,Ltrim(Rtrim(BuyerAgentFirstName)) as first_name
		,Ltrim(Rtrim(BuyerAgentMiddleName)) as middle_name
		,Ltrim(Rtrim(BuyerAgentLastName)) as last_name
		,Ltrim(Rtrim(BuyerAgentEmail)) as email
		,Ltrim(Rtrim(BuyerAgentPreferredPhone)) as phone
		,Ltrim(Rtrim(BuyerAgentStateLicense)) as license_number
		,Ltrim(Rtrim(BuyerOfficeMlsId)) as 'Office.OfficeID'
		,Ltrim(Rtrim(BuyerOfficeName)) as 'Office.OfficeName'
		,Ltrim(Rtrim(ListOfficePhone)) as 'Office.Phone'
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
		ELSE NULL END
		AS agents_selling_agent

	,CASE WHEN isNULL(CoBuyerAgentKey,'') not like '' THEN 
		(SELECT CoBuyerAgentMlsId as id
		,NULL as uid
		,Ltrim(Rtrim(CoBuyerAgentFullName)) as name
		,Ltrim(Rtrim(CoBuyerAgentFirstName)) as first_name
		,Ltrim(Rtrim(CoBuyerAgentMiddleName)) as middle_name
		,Ltrim(Rtrim(CoBuyerAgentLastName)) as last_name
		,Ltrim(Rtrim(CoBuyerAgentEmail)) as email
		,Ltrim(Rtrim(CoBuyerAgentPreferredPhone)) as phone
		,Ltrim(Rtrim(CoBuyerAgentStateLicense)) as license_number
		,Ltrim(Rtrim(CoBuyerOfficeMlsId)) as 'Office.id'
		,Ltrim(Rtrim(CoBuyerOfficeName)) as 'Office.name'
		,Ltrim(Rtrim(ListOfficePhone)) as 'Office.phone'
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
		ELSE NULL END
		AS agents_co_selling_agent


		,LTRIM(RTRIM([AboveGradeFinishedArea])) AS above_grade_finished_area
            ,CAST([ActivationDate] AS datetime2(7)) AS activation_date
            ,NULL AS active
            ,LTRIM(RTRIM([AccessibilityFeatures])) AS additional_features
            ,LTRIM(RTRIM([UnparsedAddress])) AS address
            ,LTRIM(RTRIM([Cooling])) AS air_conditioning
            ,LTRIM(RTRIM([InternetAutomatedValuationDisplayYN])) AS allow_avm
            ,LTRIM(RTRIM([InternetConsumerCommentYN])) AS allow_comments
            ,LTRIM(RTRIM([InsuranceExpense])) AS annual_insurance
            ,LTRIM(RTRIM([MaintenanceExpense])) AS annual_maintenance
            ,LTRIM(RTRIM([ManagerExpense])) AS annual_management_fees
            ,LTRIM(RTRIM([TaxAnnualAmount])) AS annual_tax
            ,NULL AS annual_utilities
            ,LTRIM(RTRIM([Appliances])) AS appliances
            ,NULL AS approximate_age
            ,LTRIM(RTRIM([MLSAreaMajor])) AS area_name
            ,LTRIM(RTRIM([MLSAreaMinor])) AS area_name_minor
            ,CAST([AvailabilityDate] AS datetime2(7)) AS availability_date
            ,LTRIM(RTRIM([Basement])) AS basement_description
            ,LTRIM(RTRIM([BathroomsTotalInteger])) AS bathrooms
            ,LTRIM(RTRIM([BathroomsFull])) AS bathrooms_full
            ,LTRIM(RTRIM([BathroomsHalf])) AS bathrooms_half
            ,LTRIM(RTRIM([BathroomsPartial])) AS bathrooms_partial
            ,LTRIM(RTRIM([BathroomsOneQuarter])) AS bathrooms_quarter
            ,LTRIM(RTRIM([BathroomsThreeQuarter])) AS bathrooms_three_quarter
            ,LTRIM(RTRIM([BedroomsTotal])) AS bedrooms
            ,LTRIM(RTRIM([BelowGradeFinishedAreaSource])) AS below_grade_description
            ,LTRIM(RTRIM([BelowGradeFinishedArea])) AS below_grade_finished_area
            ,LTRIM(RTRIM([BuildingName])) AS building_name
            ,CAST([CancellationDate] AS datetime2(7)) AS cancelled_date
            ,NULL AS ceiling_height
            ,NULL AS ceiling_height_str
            ,LTRIM(RTRIM([City])) AS city
            ,CAST([CloseDate] AS datetime2(7)) AS close_date
            ,CASE WHEN LTRIM(RTRIM([CoListAgentEmail])) is NULL THEN LTRIM(RTRIM(cm.MemberEmail)) ELSE LTRIM(RTRIM([CoListAgentEmail])) END AS co_listing_agent_email
            ,CASE WHEN LTRIM(RTRIM([CoListAgentFirstName])) is NULL THEN LTRIM(RTRIM(cm.[MemberFirstName])) ELSE LTRIM(RTRIM([CoListAgentFirstName])) END AS co_listing_agent_FirstName
            ,CASE WHEN LTRIM(RTRIM([CoListAgentLastName])) is NULL THEN LTRIM(RTRIM(cm.[MemberLastName])) ELSE LTRIM(RTRIM([CoListAgentLastName])) END AS co_listing_agent_LastName
            ,LTRIM(RTRIM([CoListAgentStateLicense])) AS co_listing_agent_License_Number
            ,CASE WHEN LTRIM(RTRIM([CoListAgentFullName])) is NULL THEN LTRIM(RTRIM(cm.MemberFullName)) ELSE LTRIM(RTRIM([CoListAgentFullName])) END AS co_listing_agent_Name
            ,CASE WHEN LTRIM(RTRIM([CoListAgentPreferredPhone])) is NULL THEN LTRIM(RTRIM(cm.MemberMobilePhone)) ELSE LTRIM(RTRIM([CoListAgentPreferredPhone])) END AS co_listing_agent_phone
            ,LTRIM(RTRIM([CoBuyerAgentEmail])) AS co_Selling_agent_email
            ,LTRIM(RTRIM([CoBuyerAgentFirstName])) AS co_Selling_agent_FirstName
            ,LTRIM(RTRIM([CoBuyerAgentLastName])) AS co_Selling_agent_LastName
            ,LTRIM(RTRIM([CoBuyerAgentStateLicense])) AS co_Selling_agent_License_Number
            ,LTRIM(RTRIM([CoBuyerAgentFullName])) AS co_Selling_agent_Name
            ,LTRIM(RTRIM([CoBuyerAgentPreferredPhone])) AS co_Selling_agent_phone
            ,NULL AS commission_misc
            ,LTRIM(RTRIM([CommunityFeatures])) AS community
            ,LTRIM(RTRIM([PropertyCondition])) AS condition
            ,LTRIM(RTRIM([PrivateRemarks])) AS confidential_description
            ,LTRIM(RTRIM([Roof])) AS constructinoRoofing
            ,LTRIM(RTRIM([ConstructionMaterials])) AS construction_materials
            ,NULL AS ConstructionGeneral
            ,NULL AS ConstructionWindows
            ,LTRIM(RTRIM([Contingency])) AS contingencies
            ,CAST([ContingentDate] AS datetime2(7)) AS contingent_date
            ,CAST([PurchaseContractDate] AS datetime2(7)) AS contract_date
            ,CAST([ContractStatusChangeDate] AS datetime2(7)) AS contract_status_change_date
            ,LTRIM(RTRIM([Country])) AS country
            ,NULL AS country_code
            ,LTRIM(RTRIM([CountyOrParish])) AS county
            ,CAST(NULL AS datetime2(7)) AS created_date
            ,LTRIM(RTRIM([CumulativeDaysOnMarket])) AS cumulative_days_on_market
            ,LTRIM(RTRIM([CurrentUse])) AS current_use
            ,LTRIM(RTRIM([DaysOnMarket])) AS days_on_market
            ,CAST(NULL AS datetime2(7)) AS days_on_market_replication_date
            ,NULL AS den_description
            ,LTRIM(RTRIM([PublicRemarks])) AS description
            ,NULL AS design
            ,NULL AS dining_room_description
            ,LTRIM(RTRIM([Directions])) AS directions
            ,NULL AS disability_features
            ,LTRIM(RTRIM([Latitude])) AS display_lat
            ,LTRIM(RTRIM([Longitude])) AS display_lng
            ,LTRIM(RTRIM([ListingId])) AS display_mls_number
            ,CAST(CASE WHEN isDATE([DocumentsChangeTimestamp])=0 THEN NULL ELSE [DocumentsChangeTimestamp] END as datetime2(7)) AS documents_change_timestamp
            ,LTRIM(RTRIM([DoorFeatures])) AS door_features
            ,NULL AS down_payment_resource
            ,NULL AS driveway_description
            ,LTRIM(RTRIM([ElementarySchool])) AS elementary_school
            ,LEFT(LTRIM(RTRIM([Exclusions])),250) AS exclusions
            ,CAST([ExpirationDate] as datetime2(7)) AS expiration_date
            ,NULL AS exterior_description
            ,LEFT(LTRIM(RTRIM([ExteriorFeatures])),1080) AS exterior_features
            ,NULL AS extras
            ,NULL AS family_room_description
            ,NULL AS FeatureExteriorGeneral
            ,LTRIM(RTRIM([ParkingFeatures])) AS FeatureExteriorParking
            ,LTRIM(RTRIM([PoolFeatures])) AS FeatureExteriorPool
            ,LTRIM(RTRIM([ArchitecturalStyle])) AS FeatureExteriorStyle
            ,LTRIM(RTRIM([Cooling])) AS FeatureInteriorAC
            ,LTRIM(RTRIM([Appliances])) AS FeatureInteriorAppliances
            ,LTRIM(RTRIM([Basement])) AS FeatureInteriorBasement
            ,NULL AS FeatureInteriorDisability
            ,LTRIM(RTRIM([FireplaceFeatures])) AS FeatureInteriorFireplace
            ,LTRIM(RTRIM([Flooring])) AS FeatureInteriorFlooring
            ,NULL AS FeatureInteriorGeneral
            ,LTRIM(RTRIM([GreenBuildingVerificationType])) AS FeatureInteriorGreen
            ,LTRIM(RTRIM([Heating])) AS FeatureInteriorHeating
            ,LTRIM(RTRIM([LaundryFeatures])) AS FeatureInteriorLaundry
            ,NULL AS FeatureInteriorRooms
            ,LTRIM(RTRIM([Fencing])) AS fence_description
            ,NULL AS financial_information
            ,NULL AS FinancialBuyersAgentCompensation
            ,NULL AS FinancialNACompensation
            ,LTRIM(RTRIM([FinancialDataSource])) AS FinancialSource
            ,NULL AS FIPS
            ,LEFT(LTRIM(RTRIM([FireplaceFeatures])),250) AS fireplace_description
            ,LTRIM(RTRIM([FireplacesTotal])) AS fireplaces
            ,LEFT(LTRIM(RTRIM([Flooring])),250) AS flooring_information
            ,NULL AS foreclosure_type
            ,LTRIM(RTRIM([UnparsedAddress])) AS formatted_address
            ,LTRIM(RTRIM([FrontageType])) AS frontage_type
            ,LEFT(LTRIM(RTRIM([ParkingFeatures])),250) AS garage_description
            ,LTRIM(RTRIM([GarageSpaces])) AS garage_spaces
            ,CAST(NULL as datetime2(7)) AS geocode_date
            ,NULL AS geocode_quality
            ,LTRIM(RTRIM([City])) AS GeoData_CityName
            ,NULL AS GeoData_NeighborhoodName
            ,LTRIM(RTRIM([HighSchoolDistrict])) AS GeoData_SchoolDistrictName
            ,NULL AS GeoData_ZipName
            ,LTRIM(RTRIM([GreenEnergyEfficient])) AS green_features
            ,LTRIM(RTRIM(CASE WHEN BasementYN = 1 THEN 'Y' ELSE NULL END)) AS has_basement
            ,LTRIM(RTRIM(CASE WHEN ElectricOnPropertyYN = 1 THEN 'Y' ELSE NULL END)) AS has_electricity
            ,LTRIM(RTRIM(CASE WHEN FireplaceYN = 1 THEN 'Y' ELSE NULL END)) AS has_fireplace
            ,LTRIM(RTRIM(CASE WHEN GarageYN = 1 THEN 'Y' ELSE NULL END)) AS has_garage
            ,LTRIM(RTRIM(CASE WHEN AssociationYN = 1 THEN 'Y' ELSE NULL END)) AS has_hoa
            ,LTRIM(RTRIM(CASE WHEN HorseYN = 1 THEN 'Y' ELSE NULL END)) AS has_horse_property
            ,LTRIM(RTRIM(CASE WHEN [View] LIKE '%Mountain%' THEN 'Y' ELSE NULL END)) AS has_mountain_view
            ,LTRIM(RTRIM(CASE WHEN ISNULL([OpenHouse],'') NOT LIKE '' THEN 'Y' ELSE NULL END)) AS has_open_house
            ,LTRIM(RTRIM(CASE WHEN PoolPrivateYN = 1 THEN 'Y' ELSE NULL END)) AS has_pool
            ,LTRIM(RTRIM(CASE WHEN ListPrice < OriginalListPrice THEN 'Y' ELSE NULL END)) AS has_price_reduced
            ,LTRIM(RTRIM(CASE WHEN ISNULL([Sewer],'') NOT LIKE '' THEN 'Y' ELSE NULL END)) AS has_sewer
            ,LTRIM(RTRIM(CASE WHEN ISNULL([View],'') NOT LIKE '' THEN 'Y' ELSE NULL END)) AS has_view
            ,LTRIM(RTRIM(CASE WHEN ISNULL([WaterSource],'') NOT LIKE '' THEN 'Y' ELSE NULL END)) AS has_water
            ,LTRIM(RTRIM(CASE WHEN WaterfrontYN = 1 THEN 'Y' ELSE NULL END)) AS has_waterfront
            ,LTRIM(RTRIM(CASE WHEN [View] LIKE '%WATER%' THEN 'Y' ELSE NULL END)) AS has_waterview
            ,LTRIM(RTRIM(CASE
                WHEN [Heating] LIKE '%Electric%' THEN 'Electric'
                WHEN [Heating] LIKE '%Natural Gas%' THEN 'Natural Gas'
                WHEN [Heating] LIKE '%Hot Water%' THEN 'Hot Water'
                WHEN [Heating] LIKE '%Propane%' THEN 'Propane'
                WHEN [Heating] LIKE '%Oil%' THEN 'Oil'
                WHEN [Heating] LIKE '%Electric%' THEN 'Electric'
                ELSE NULL
            END)) AS heat_source
            ,LTRIM(RTRIM([Heating])) AS heat_type
            ,LTRIM(RTRIM(CASE WHEN InternetAddressDisplayYN = 1 THEN 'Y' ELSE NULL END)) AS hide_address
            ,LTRIM(RTRIM([HighSchool])) AS high_school
            ,LTRIM(RTRIM([AssociationAmenities])) AS hoa_amenities
            ,LTRIM(RTRIM([AssociationFee])) AS hoa_fee
            ,LTRIM(RTRIM([AssociationFeeIncludes])) AS hoa_fee_includes
            ,LTRIM(RTRIM([AssociationFeeFrequency])) AS hoa_frequency
            ,LTRIM(RTRIM([AssociationName])) AS hoa_name
            ,LTRIM(RTRIM([AssociationPhone])) AS hoa_phone
            ,NULL AS idx
            ,NULL AS improvements
            ,LTRIM(RTRIM([InteriorFeatures])) AS interior_features
            ,NULL AS is_adult_community
            ,NULL AS is_boat_slip
            ,NULL AS is_business_with_real_estate
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%commercial%' THEN 'Y' ELSE NULL END)) AS is_commercial
            ,NULL AS is_commercial_lease
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%condo%' THEN 'Y' ELSE NULL END)) AS is_condo
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%condo%townhouse%' THEN 'Y' ELSE NULL END)) AS is_condo_townhouse
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%coop%' THEN 'Y' ELSE NULL END)) AS is_coop
            ,LTRIM(RTRIM(CASE WHEN PublicRemarks LIKE '%cul-de%' THEN 'Y' ELSE NULL END)) AS is_cul_de_sac
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%duplex%' THEN 'Y' ELSE NULL END)) AS is_duplex
            ,NULL AS is_farm_hobby
            ,NULL AS is_foreclosure
            ,LTRIM(RTRIM(CASE WHEN PublicRemarks LIKE '%Gated%' THEN 'Y' ELSE NULL END)) AS is_gated_community
            ,NULL AS is_golf_community
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%industrial%' THEN 'Y' ELSE NULL END)) AS is_industrial
            ,NULL AS is_investment
            ,NULL AS is_loft
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%Lot%' THEN 'Y' ELSE NULL END)) AS is_lot
            ,NULL AS is_mixed_use
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%mobile%' THEN 'Y' ELSE NULL END)) AS is_mobile_home
            ,NULL AS is_model
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%multi%' THEN 'Y' ELSE NULL END)) AS is_multi_family
            ,LTRIM(RTRIM(CASE WHEN NewConstructionYN = 1 THEN 'Y' ELSE NULL END)) AS is_new_construction
            ,NULL AS is_on_golf_course
            ,CASE WHEN [StoriesTotal] = 1 THEN 'Y' ELSE NULL END AS is_one_story
            ,NULL AS is_other
            ,CASE WHEN [PropertyType] like '%Rent%' THEN 'Y' ELSE NULL END AS is_rental
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%res%lease%' THEN 'Y' ELSE NULL END)) AS is_residential_lease
            ,NULL AS is_shortsale
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%single%' THEN 'Y' ELSE NULL END)) AS is_single_family
            ,NULL AS is_single_family_detached
            ,CASE WHEN [StoriesTotal] = 3 THEN 'Y' ELSE NULL END  AS is_three_plus_story
            ,LTRIM(RTRIM(CASE WHEN PropertyType LIKE '%townhouse%' THEN 'Y' ELSE NULL END)) AS is_townhouse
            ,CASE WHEN [StoriesTotal] = 2 THEN 'Y' ELSE NULL END  AS is_two_story
            ,NULL AS junior_high_school
            ,NULL AS kitchen
            ,NULL AS kitchen_description
            ,NULL AS kitchen_dimensions
            ,NULL AS kitchen_level
            ,NULL AS landscape
            ,CAST(p.[ModificationTimestamp] as datetime2(7)) AS last_update_date
            ,LTRIM(RTRIM([Latitude])) AS latitude
            ,LTRIM(RTRIM([LaundryFeatures])) AS laundry_room_description
            ,LTRIM(RTRIM([ListAgentEmail])) AS List_Agent_email
            ,LTRIM(RTRIM([ListAgentFirstName])) AS List_Agent_FirstName
            ,LTRIM(RTRIM([ListAgentLastName])) AS List_Agent_LastName
            ,LTRIM(RTRIM([ListAgentStateLicense])) AS List_Agent_License_Number
            ,LTRIM(RTRIM([ListAgentFullName])) AS List_Agent_Name
            ,COALESCE(LTRIM(RTRIM([ListOfficeMlsId])),LTRIM(RTRIM([ListOfficeKey]))) AS List_Agent_Office_ID
            ,LTRIM(RTRIM([ListOfficeName])) AS List_Agent_Office_Name
            ,COALESCE(LTRIM(RTRIM([ListOfficePhone])),LTRIM(RTRIM([ListAgentOfficePhone]))) AS List_Agent_Office_Phone
            ,COALESCE(LTRIM(RTRIM([ListAgentPreferredPhone])),LTRIM(RTRIM([ListAgentMobilePhone])),LTRIM(RTRIM([ListAgentOfficePhone]))) AS List_Agent_phone
            ,CAST([ListingContractDate] as datetime2(7)) AS list_date
            ,NULL AS listing_agent_commission_rate
            ,LTRIM(RTRIM([ListAgentEmail])) AS listing_agent_email
            ,NULL AS listing_agent_flat_fee
            ,COALESCE(LTRIM(RTRIM([ListAgentMlsId])),LTRIM(RTRIM([ListAgentMlsId]))) AS listing_agent_id
            ,LTRIM(RTRIM([ListAgentFullName])) AS listing_agent_name
            ,COALESCE(LTRIM(RTRIM([ListAgentPreferredPhone])),LTRIM(RTRIM([ListAgentMobilePhone])),LTRIM(RTRIM([ListAgentOfficePhone]))) AS listing_agent_phone
            ,NULL AS listing_agent_uid
            ,LTRIM(RTRIM([ListingAgreement])) AS listing_agreement
            ,LTRIM(RTRIM([ListingKey])) AS listing_key
            ,COALESCE(LTRIM(RTRIM([ListOfficeMlsId])),LTRIM(RTRIM([ListOfficeKey]))) AS listing_office_id
            ,LTRIM(RTRIM([ListOfficeName])) AS listing_office_name
            ,COALESCE(LTRIM(RTRIM([ListOfficePhone])),LTRIM(RTRIM([ListOfficePhone]))) AS listing_office_phone
            ,NULL AS listing_office_uid
            ,NULL AS living_room_description
            ,GETDATE() AS LoadDate
            ,NULL AS location
            ,LTRIM(RTRIM([CountyOrParish])) AS LocationCounty
            ,LTRIM(RTRIM([AssociationAmenities])) AS LocationHOAAmenities
            ,LTRIM(RTRIM(p.[OriginatingSystemName])) AS LocationOriginatingMLS
            ,NULL AS LocationRoadAccess
            ,LTRIM(RTRIM([Longitude])) AS longitude
            ,LTRIM(RTRIM([LotFeatures])) AS lot_description
            ,LTRIM(RTRIM([LotSizeDimensions])) AS lot_dimension
            ,LTRIM(RTRIM([LotSizeAcres])) AS lot_size
            ,LTRIM(RTRIM([LotSizeArea])) AS lot_size_area
            ,NULL AS lot_size_display
            ,LTRIM(RTRIM([LotSizeSource])) AS lot_size_source
            ,LTRIM(RTRIM([LotSizeSquareFeet])) AS lot_size_square_feet
            ,LTRIM(RTRIM([LotSizeUnits])) AS lot_size_units
            ,LTRIM(RTRIM([LotDimensionsSource])) AS LotCurrentUse
            ,LTRIM(RTRIM([Fencing])) AS LotFencing
            ,LTRIM(RTRIM([View])) AS LotView
            ,LTRIM(RTRIM([ZoningDescription])) AS LotZoning
            ,CAST(CASE WHEN isDATE([MajorChangeTimestamp])=0 THEN NULL ELSE [MajorChangeTimestamp] END as datetime2(7)) AS major_change_date
            ,LTRIM(RTRIM([PlatlabsCode])) AS market_name
            ,NULL AS master_bath_description
            ,NULL AS master_bedroom_description
            ,NULL AS master_bedroom_level
            ,LTRIM(RTRIM([MiddleOrJuniorSchool])) AS middle_school
            ,CAST(NULL as datetime2(7)) AS mls_create_date
            ,LTRIM(RTRIM(p.[mls_id])) AS mls_id
            ,LTRIM(RTRIM([Latitude])) AS mls_lat
            ,CAST([ListingContractDate] as datetime2(7)) AS mls_list_date
            ,LTRIM(RTRIM([ListingId])) AS mls_listing_id
            ,LTRIM(RTRIM([Longitude])) AS mls_lng
            ,LTRIM(RTRIM([PropertySubType])) AS mls_property_sub_type
            ,LTRIM(RTRIM([PropertyType])) AS mls_property_type
            ,LEFT(LTRIM(RTRIM([MlsStatus])),25) AS mls_status
            ,CAST(NULL as datetime2(7)) AS mls_update_date
            ,CAST(CASE WHEN isDATE(p.[ModificationTimestamp])=0 THEN NULL ELSE p.[ModificationTimestamp] END as datetime2(7)) AS modified_date
            ,NULL AS monthly_hoa_fee
            ,NULL AS neighborhood
            ,LTRIM(RTRIM([AssociationFeeFrequency])) AS normalized_hoa_frequency
            ,NULL AS NormalizedAddress_City
            ,NULL AS NormalizedAddress_CompleteAddress
            ,NULL AS NormalizedAddress_State
            ,NULL AS NormalizedAddress_StreetName
            ,NULL AS NormalizedAddress_StreetNumber
            ,NULL AS NormalizedAddress_StreetPostdirection
            ,NULL AS NormalizedAddress_StreetPredirection
            ,NULL AS NormalizedAddress_StreetSuffix
            ,NULL AS NormalizedAddress_Zip
            ,LTRIM(RTRIM([OccupantType])) AS occupant_type
            ,CAST(cast([OffMarketDate] as datetime) as datetime2(7)) AS off_market_date
            ,CAST([OnMarketDate] as datetime2(7)) AS on_market_date
            ,LTRIM(RTRIM([OpenHouse])) AS open_house
            ,LTRIM(RTRIM([OriginalListPrice])) AS original_listing_price
            ,LTRIM(RTRIM(p.[OriginatingSystemName])) AS originating_system_name
            ,LTRIM(RTRIM([OtherStructures])) AS outbuildings_description
            ,LTRIM(RTRIM([Ownership])) AS ownership
            ,LTRIM(RTRIM([ParcelNumber])) AS parcel_number
            ,NULL AS parcel_number_public_record
            ,LTRIM(RTRIM([ParkingFeatures])) AS parking_description
            ,LTRIM(RTRIM([ParkingTotal])) AS parking_spaces
            ,LTRIM(RTRIM([PatioAndPorchFeatures])) AS patio_and_porch_features
            ,CAST(CASE WHEN isDATE([PendingTimestamp])=0 THEN NULL ELSE [PendingTimestamp] END as datetime2(7)) AS pending_date
            ,LTRIM(RTRIM([PetsAllowed])) AS pets_allowed
            ,LTRIM(RTRIM([PhotosCount])) AS photo_count
            ,CAST(CASE WHEN isDATE([PhotosChangeTimestamp])=0 THEN NULL ELSE [PhotosChangeTimestamp] END as datetime2(7)) AS photo_date
            ,LTRIM(RTRIM([PoolFeatures])) AS pool_description
            ,LTRIM(RTRIM([ListPrice])) AS price
            ,CAST([PriceChangeTimestamp] as datetime2(7)) AS price_change_date
            ,CAST(CASE WHEN isDATE([PriceChangeTimestamp])=0 THEN NULL ELSE [PriceChangeTimestamp] END as datetime2(7)) AS price_change_timestamp
            ,LTRIM(RTRIM([ListPrice])) AS price_display
            ,NULL AS price_per_square_foot
            ,NULL AS property_type
            ,LTRIM(RTRIM([View])) AS property_view_description
            ,NULL AS PropertyID
            ,NULL AS REF_ID
            ,NULL AS restrictions
            ,LTRIM(RTRIM([RoadFrontageType])) AS road_frontage_description
            ,LTRIM(RTRIM([Roof])) AS roofing
            ,LTRIM(RTRIM([Rooms])) AS rooms
            ,LTRIM(RTRIM([RoomDescription])) AS rooms_description
            ,NULL AS rupid
            ,NULL AS sale_type
            ,CASE WHEN LTRIM(RTRIM([HighSchoolDistrict])) like '000000' THEN NULL ELSE LTRIM(RTRIM([HighSchoolDistrict])) END AS school_district
            ,LTRIM(RTRIM([SecurityFeatures])) AS security_features
            ,LTRIM(RTRIM([ConcessionsAmount])) AS seller_concessions
            ,NULL AS selling_agent_commission_rate
            ,LTRIM(RTRIM([BuyerAgentEmail])) AS Selling_Agent_email
            ,LTRIM(RTRIM([BuyerAgentFirstName])) AS Selling_Agent_FirstName
            ,NULL AS selling_agent_flat_fee
            ,LTRIM(RTRIM([BuyerAgentLastName])) AS Selling_Agent_LastName
            ,LTRIM(RTRIM([BuyerAgentStateLicense])) AS Selling_Agent_license_number
            ,LTRIM(RTRIM([BuyerAgentFullName])) AS Selling_Agent_Name
            ,LTRIM(RTRIM([BuyerOfficeMlsId])) AS Selling_Agent_Office_ID
            ,LTRIM(RTRIM([BuyerOfficeName])) AS Selling_Agent_Office_Name
            ,LTRIM(RTRIM([BuyerOfficePhone])) AS Selling_Agent_Office_Phone
            ,LTRIM(RTRIM([BuyerAgentPreferredPhone])) AS Selling_Agent_phone
            ,LTRIM(RTRIM([Sewer])) AS sewer
            ,CAST([CloseDate] as datetime2(7)) AS sold_date
            ,[ClosePrice] AS sold_price
            ,CAST(CASE WHEN isDATE(p.[OriginalEntryTimestamp])=0 THEN NULL ELSE p.[OriginalEntryTimestamp] END as datetime2(7)) AS source_create_date
            ,LTRIM(RTRIM([SourceSystemKey])) AS source_system_key
            ,LTRIM(RTRIM(p.[SourceSystemName])) AS source_system_name
            ,LTRIM(RTRIM([LivingArea])) AS square_feet
            ,LTRIM(RTRIM([LotSizeSquareFeet])) AS square_feet_of_land
            ,NULL AS square_feet_range
            ,LTRIM(RTRIM([LivingAreaSource])) AS square_foot_source
            ,LTRIM(RTRIM([StateOrProvince])) AS state
            ,LTRIM(RTRIM([StandardStatus])) AS status
            ,CAST(CASE WHEN isDATE([StatusChangeTimestamp])=0 THEN NULL ELSE p.[StatusChangeTimestamp] END as datetime2(7)) AS status_change_date
            ,NULL AS stories_description
            ,LTRIM(RTRIM([StoriesTotal])) AS stories_total
            ,LTRIM(RTRIM([StreetDirPrefix])) AS street_direction
            ,LTRIM(RTRIM([StreetName])) AS street_name
            ,LTRIM(RTRIM([StreetNumber])) AS street_number
            ,LTRIM(RTRIM([StreetDirSuffix])) AS street_pre_direction
            ,LTRIM(RTRIM([StreetSuffix])) AS street_type
            ,LTRIM(RTRIM([StructureType])) AS structure_type
            ,LTRIM(RTRIM([ArchitecturalStyle])) AS style
            ,LTRIM(RTRIM([SubdivisionName])) AS subdivision
            ,LTRIM(RTRIM([FoundationDetails])) AS substructure
            ,LTRIM(RTRIM([TaxLegalDescription])) AS tax_legal_description
            ,LTRIM(RTRIM([TaxYear])) AS tax_year
            ,LEFT(LTRIM(RTRIM([TenantPays])),250) AS tenant_pays
            ,LTRIM(RTRIM([Topography])) AS topography
            ,LTRIM(RTRIM([UnitTypeUnitsTotal])) AS total_units
            ,LTRIM(RTRIM([Township])) AS township
            ,cast(p.mls_id as varchar) + '_' + p.ListingId as [UID]
            ,LTRIM(RTRIM([UnitNumber])) AS unit_number
            ,LTRIM(RTRIM([Sewer])) AS UtilitesSewer
            ,LTRIM(RTRIM([Utilities])) AS utilities
            ,NULL AS utilities_available
            ,LTRIM(RTRIM([Utilities])) AS UtilitiesUtilities
            ,LTRIM(RTRIM([WaterSource])) AS UtilitiesWater
            ,CAST(CASE WHEN isDATE([VideosChangeTimestamp])=0 THEN NULL ELSE p.[VideosChangeTimestamp] END as datetime2(7)) AS videos_change_date
            ,LTRIM(RTRIM([VirtualTourURLUnbranded])) AS virtual_tour
            ,LTRIM(RTRIM([VirtualTourURLBranded])) AS virtual_tour_branded
            ,LTRIM(RTRIM([WalkScore])) AS walk_score
            ,LTRIM(RTRIM([WaterSource])) AS water
            ,LTRIM(RTRIM([WaterfrontFeatures])) AS water_frontage
            ,NULL AS waterfront_description
            ,NULL AS windows_description
            ,CAST([WithdrawnDate] as datetime2(7)) AS withdrawn_date
            ,LTRIM(RTRIM([YearBuilt])) AS year_built
            ,LTRIM(RTRIM([YearBuiltSource])) AS year_built_source
            ,LTRIM(RTRIM([PostalCode])) AS zip
            ,LTRIM(RTRIM([Zoning])) AS zoning
			,[BuyerFinancing] as [buyer_financing]
			,[LivingArea] as [finished_area]
			,[Furnished]
			,CASE WHEN [IrrigationWaterRightsYN] like 'Y' THEN 'true' ELSE NULL END as [has_irrigation_water_rights]
			,CASE WHEN [LandLeaseYN] like 'Y' THEN 'true' ELSE NULL END as [is_land_lease]
			,p.OriginatingSystemID as [originating_system_id]
			,[possession]
			,ConcessionsComments as [seller_concessions_comments]
			,[SpecialListingConditions] as [special_listing_conditions]
			,LEFT([TenantPays],250) as [tenant_total_expenses]
			,AboveGradeUnfinishedArea as [unfinished_area]
			,[WaterBodyName] as [water_body_name]
			,LEFT([ZoningDescription],250) as [zoning_description]
			,p.AttributionContact as Attribution_Contact
			,NULL as source_mls_url
			,convert(datetime,ListingContractDate) as Platlabs_Listdate
        FROM [listing].[Property_PlatlabsStd_FULL] p with(NOLOCK)
        JOIN [src_IndependentPlatlabs].dbo.PlatlabsGlobal g with(NOLOCK)
            ON p.mls_id = g.mls_id
		LEFT OUTER JOIN agent.Member_PlatlabsStd_FULL m with(NOLOCK)
			ON m.MemberMlsId = p.ListAgentMlsId
		LEFT OUTER JOIN agent.Member_PlatlabsStd_FULL cm with(NOLOCK)
			ON m.MemberMlsId = p.CoListAgentMlsId;



-------------------------------------------------

Received exception:
RuntimeException: java.lang.IllegalArgumentException


-------------------------------------------------*/
