SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[PropertyEditon_IV]
AS
SELECT a.FIPS
	, a.PropertyID
	, a.FormattedAPN AS APN
	, a.APNSeqNbr
	, a.OldAPN
	, a.OldApnIndicator
	, a.TaxAccountNumber
	, a.SitusStdFullStreetAddress AS SitusFullStreetAddress
	, a.SitusStdHouseNbr AS SitusHouseNbr
	, a.SitusStdHouseNbrSuffix AS SitusHouseNbrSuffix
	, a.SitusStdDirectionLeft AS SitusDirectionLeft
	, a.SitusStdStreet AS SitusStreet
	, a.SitusStdMode AS SitusMode
	, a.SitusStdDirectionRight AS SitusDirectionRight
	, a.SitusStdUnitType AS SitusUnitType
	, a.SitusStdUnitNbr AS SitusUnitNbr
	, a.SitusStdCity AS SitusCity
	, a.SitusStdState AS SitusState
	, a.SitusStdZIP5 AS SitusZIP5
	, a.SitusStdZIP4 AS SitusZIP4
	, a.SitusStdCarrierCode AS SitusCarrierCode
	, a.SitusLatitude
	, a.SitusLongitude
	, a.SitusGeoStatusCode
	, a.PropertyClassID
	, a.StdLandUseCode AS LandUseCode
	, a.StateLandUseCode
	, a.CountyLandUseCode
	, a.Zoning
	, a.SitusCensusTract
	, a.SitusCensusBlock
	, a.MobileHomeInd
	, a.TimeshareCode
	, a.SchoolDistrictName
	, a.LotSizeFrontageFeet
	, a.LotSizeDepthFeet
	, a.LotSizeAcres
	, a.LotSizeSqFt
	, a.OwnerStd1CorpInd AS Owner1CorpInd
	, a.OwnerStd1LastName AS Owner1LastName
	, a.OwnerStd1FirstName AS Owner1FirstName
	, a.OwnerStd1MiddleName AS Owner1MiddleName
	, a.OwnerStd1Suffix AS Owner1Suffix
	, a.OwnerStd2CorpInd AS Owner2CorpInd
	, a.OwnerStd2LastName AS Owner2LastName
	, a.OwnerStd2FirstName AS Owner2FirstName
	, a.OwnerStd2MiddleName AS Owner2MiddleName
	, a.OwnerStd2Suffix AS Owner2Suffix
	, a.OwnerStdNAME1FULL AS OwnerNAME1FULL
	, a.OwnerStdNAME2FULL AS OwnerNAME2FULL
	, a.OwnerOccupied
	, a.OwnerStd1OwnershipRights AS Owner1OwnershipRights
	, a.MailingStdFullStreetAddress AS MailingFullStreetAddress
	, a.MailingStdHouseNbr AS MailingHouseNbr
	, a.MailingStdHouseNbrSuffix AS MailingHouseNbrSuffix
	, a.MailingStdDirectionLeft AS MailingDirectionLeft
	, a.MailingStdStreet AS MailingStreet
	, a.MailingStdMode AS MailingMode
	, a.MailingStdDirectionRight AS MailingDirectionRight
	, a.MailingStdUnitType AS MailingUnitType
	, a.MailingStdUnitNbr AS MailingUnitNbr
	, a.MailingStdCity AS MailingCity
	, a.MailingStdState AS MailingState
	, a.MailingStdZIP5 AS MailingZIP5
	, a.MailingStdZIP4 AS MailingZIP4
	, a.MailingStdCarrierCode AS MailingCarrierCode
	, a.MailingOptOut
	, a.MailingCareOfName AS MailingCOName
	, a.MailForeignAddrInd AS MailingForeignAddressInd
	, a.AssdTotalValue
	, a.AssdLandValue
	, a.AssdImprovementValue
	, a.MarketTotalValue
	, a.MarketValueLand
	, a.MarketValueImprovement
	, a.TaxAmount AS TaxAmt
	, a.TaxYear
	, a.TaxDeliquentYear1 AS TaxDeliquentYear
	, a.MarketValueYear AS MarketYear
	, a.AssdYear
	, a.TaxRateCodeArea
	, a.SchoolTaxDistrict1Code
	, a.SchoolTaxDistrict2Code
	, a.SchoolTaxDistrict3Code
	, a.HomesteadInd
	, a.VeteranInd
	, a.DisabledInd
	, a.WidowInd
	, a.SeniorInd
	, a.SchoolCollegeInd
	, a.ReligiousInd
	, a.WelfareInd
	, a.PublicUtilityInd
	, a.CemeteryInd
	, a.HospitalInd
	, a.LibraryInd
	, a.BuildingArea
	, a.BuildingAreaInd
	, a.SumBuildingSqFt
	, a.SumLivingAreaSqFt
	, a.SumGrossAreaSqFt
	, a.SumAdjAreaSqFt
	, a.SumBasementSqFt
	, a.SumGarageSqFt
	, a.YearBuilt
	, a.EffectiveYearBuilt
	, a.Bedrooms
	, a.TotalRooms
	, a.BathTotalCalc
	, a.BathFull
	, a.BathsParcialNbr AS BathsPartialNbr
	, a.BathFixturesNbr
	, a.Amenities
	, a.AirConditioningCode
	, a.BasementCode
	, a.BuildingClassCode
	, a.BuildingConditionCode
	, a.ConstructionTypeCode
	, a.DeckCode AS DeckInd
	, a.ExteriorWallsCode
	, a.InteriorWallsCode
	, a.FireplaceCode
	, a.FloorCoverCode
	, a.Garage
	, a.HeatCode
	, a.HeatingFuelTypeCode
	, a.SiteInfluenceCode
	, a.GarageParkingNbr
	, a.DrivewayCode
	, a.OtherRooms
	, a.PatioCode
	, a.PoolCode
	, a.PorchCode
	, a.BuildingQualityCode
	, a.RoofCoverCode
	, a.RoofTypeCode
	, a.SewerCode
	, a.StoriesNbrCode
	, a.StyleCode
	, a.SumResidentialUnits
	, a.SumBuildingsNbr
	, a.SumCommercialUnits
	, a.TopographyCode
	, a.WaterCode
	, a.LotCode
	, a.LotNumber AS LotNbr
	, a.LandLot
	, a.[Block]
	, a.Section
	, a.District
	, a.LegalUnit
	, a.Municipality
	, a.SubdivisionName
	, a.SubdivisionPhaseNbr
	, a.SubdivisionTractNbr
	, a.Meridian
	, a.AssessorsMapRef1 AS AssessorsMapRef
	, a.LegalDescription
	, a.FATimestamp
	, a.FAUCIDFlag AS FARecordType
	FROM dbo.Property_del AS a with(NOLOCK) INNER JOIN dbo.PrevEdition_IV AS b 
	ON a.FIPS = b.FIPS 
		AND a.PropertyID = b.PropertyID 
			AND CONVERT(int, a.EditionNumber) = b.EditionNbr 
				AND a.FADateReceived = b.MAXDtRec
	WHERE isNULL(a.StdLandUseCode,'') NOT IN('1006','1109','1000','1001','1999')


