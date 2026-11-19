SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[Edition04]
AS
SELECT [FIPS]
      ,[PropertyID]
      ,[FormattedAPN] as APN
      ,[SitusStdFullStreetAddress] as SitusFullStreetAddress
      ,[SitusStdHouseNbr] as SitusHouseNbr
      ,[SitusStdHouseNbrSuffix] as SitusHouseNbrSuffix
      ,[SitusStdDirectionLeft] as SitusDirectionLeft
      ,[SitusStdStreet] as SitusStreet
      ,[SitusStdMode] as SitusMode
      ,[SitusStdDirectionRight] as SitusDirectionRight
      ,[SitusStdUnitType] as SitusUnitType
      ,[SitusStdUnitNbr] as SitusUnitNbr
      ,[SitusStdCity] as SitusCity
      ,[SitusStdState] as SitusState
      ,[SitusStdZIP5] as SitusZIP5
      ,[SitusStdZIP4] as SitusZIP4
      ,[SitusStdCarrierCode] as SitusCarrierCode
      ,[SitusLatitude] as SitusLatitude
      ,[SitusLongitude] as SitusLongitude
      ,[SitusGeoStatusCode] as SitusGeoStatusCode
      ,[LotSizeFrontageFeet]
      ,[LotSizeDepthFeet]
      ,[LotSizeAcres]
      ,[LotSizeSqFt] 
      ,[OwnerStd1CorpInd] as Owner1CorpInd
      ,[OwnerStd1LastName] as Owner1LastName
      ,[OwnerStd1FirstName] as Owner1FirstName
      ,[OwnerStd1MiddleName] as Owner1MiddleName
      ,[OwnerStd1Suffix] as Owner1Suffix
      ,[OwnerStd2CorpInd] as Owner2CorpInd
      ,[OwnerStd2LastName] as Owner2LastName
      ,[OwnerStd2FirstName] as Owner2FirstName
      ,[OwnerStd2MiddleName] as Owner2MiddleName
      ,[OwnerStd2Suffix] as Owner2Suffix
      ,[OwnerStdNAME1FULL] as OwnerNAME1FULL
      ,[OwnerStdNAME2FULL] as OwnerNAME2FULL
      ,[OwnerOccupied]     
      ,[OwnerStd1OwnershipRights] as Owner1OwnershipRights
      ,[MailingStdFullStreetAddress] as MailingFullStreetAddress
      ,[MailingStdHouseNbr] as MailingHouseNbr
      ,[MailingStdHouseNbrSuffix] as MailingHouseNbrSuffix
      ,[MailingStdDirectionLeft] as MailingDirectionLeft
      ,[MailingStdStreet] as MailingStreet
      ,[MailingStdMode] as MailingMode
      ,[MailingStdDirectionRight] as MailingDirectionRight
      ,[MailingStdUnitType] as MailingUnitType
      ,[MailingStdUnitNbr] as MailingUnitNbr
      ,[MailingStdCity] as MailingCity
      ,[MailingStdState] as MailingState
      ,[MailingStdZIP5] as MailingZIP5
      ,[MailingStdZIP4] as MailingZIP4
      ,[MailingStdCarrierCode] as MailingCarrierCode
      ,[MailingOptOut]
      ,[MailingCareOfName] as MailingCOName
      ,[MailForeignAddrInd] as MailingForeignAddressInd
      ,[AssdTotalValue]
      ,[AssdLandValue]
      ,[AssdImprovementValue]
      ,[MarketTotalValue]
      ,[MarketValueLand]
      ,[MarketValueImprovement]
      ,[TaxAmount] as TaxAmt
      ,[TaxYear]
      ,[TaxDeliquentYear1] as TaxDeliquentYear
      ,[MarketValueYear] as MarketYear
      ,[AssdYear]
      ,[TaxRateCodeArea]
      ,[SchoolTaxDistrict1Code]
      ,[SchoolTaxDistrict2Code]
      ,[SchoolTaxDistrict3Code]
      ,[BuildingArea]
      ,[BuildingAreaInd]
      ,[SumBuildingSqFt]
      ,[SumLivingAreaSqFt]
      ,[SumGroundFloorSqFt]
      ,[SumGrossAreaSqFt]
      ,[SumAdjAreaSqFt] as SumAdjAreaSqFt
      ,[AtticSqFt]
      ,[AtticUnfinSqFt] as AtticUnfinishedSqFt
      ,[AtticFinishSqFt] as AtticFinishedSqFt
      ,[SumBasementSqFt] as SumBasementSqFt
      ,[BasementUnfinSqFt] as BasementUnfinishedSqFt
      ,[BasementFinishSqFt] as BasementFinishedSqFt
      ,[SumGarageSqFt]
      ,[GarageUnFinSqFt] as GarageUnFinishedSqFt
      ,[GarageFinishSqFt] as GarageFinishedSqFt
      ,[YearBuilt]
      ,[EffectiveYearBuilt]
      ,[Bedrooms]
      ,[TotalRooms]
      ,[BathTotalCalc]
      ,[BathFull]
      ,[BathsParcialNbr] as BathsPartialNbr
      ,[BathFixturesNbr]
      ,[Amenities]     
      ,[AirConditioningCode]
      ,[BasementCode]
      ,[BuildingClassCode]
      ,[BuildingConditionCode]
      ,[ConstructionTypeCode]
      ,[DeckCode] as DeckInd
      ,[ExteriorWallsCode]
      ,[InteriorWallsCode]   
      ,[FireplaceCode]
      ,[FloorCoverCode]      
      ,[Garage]
      ,[HeatCode]
      ,[HeatingFuelTypeCode]
      ,[SiteInfluenceCode]         
      ,[GarageParkingNbr]        
      ,[DrivewayCode]        
      ,[OtherRooms]
      ,[PatioCode]
      ,[PoolCode]
      ,[PorchCode]
      ,[BuildingQualityCode]
      ,[RoofCoverCode]
      ,[RoofTypeCode]
      ,[SewerCode]
      ,[StoriesNbrCode]
      ,[StyleCode]
      ,[SumResidentialUnits]
      ,[SumBuildingsNbr]
      ,[SumCommercialUnits]
      ,[TopographyCode]
      ,[WaterCode]
         FROM [PropertyEditions].[dbo].[Property_4thEd_USE_ME] with(NOLOCK)
         where [StdLandUseCode] IN ('1000','1001','1002','1003','1004','1005','1006','1007','1008','1009','1010','1011','1012','1013','1014','1015','1016','1017'
			,'1018','1019','1020','1021','1100','1101','1102','1103','1104','1105','1106','1107','1108','1109','1110','1111','1112','1113','1114','1901','1902','1999','8001','8007','8014','8015')
         
                       


