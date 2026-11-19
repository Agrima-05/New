SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vAssessor_LITE_wDescriptions]
AS
SELECT       
	A.[FIPS] as 'FIPS'
	,A.[PropertyID] as 'PropertyID'
	,A.[FormattedAPN] as 'FormattedAPN'
	,A.[APNSeqNbr] as 'APNSeqNbr'
	,A.[OldAPN] as 'OldAPN'
	,A.[TaxAccountNumber] as 'TaxAccountNumber'
	,A.[SitusStdFullStreetAddress] as 'SitusStdFullStreetAddress'
	,A.[SitusStdHouseNbr] as 'SitusStdHouseNbr'
	,A.[SitusStdHouseNbrSuffix] as 'SitusStdHouseNbrSuffix'
	,A.[SitusStdDirectionLeft] as 'SitusStdDirectionLeft'
	,A.[SitusStdStreet] as 'SitusStdStreet'
	,A.[SitusStdMode] as 'SitusStdMode'
	,A.[SitusStdDirectionRight] as 'SitusStdDirectionRight'
	,A.[SitusStdUnitType] as 'SitusStdUnitType'
	,A.[SitusStdUnitNbr] as 'SitusStdUnitNbr'
	,A.[SitusStdCity] as 'SitusStdCity'
	,A.[SitusStdState] as 'SitusStdState'
	,A.[SitusStdZIP5] as 'SitusStdZIP5'
	,A.[SitusStdZIP4] as 'SitusStdZIP4'
	,A.[SitusStdCarrierCode] as 'SitusStdCarrierCode'
	,A.[SitusLatitude] as 'SitusLatitude'
	,A.[SitusLongitude] as 'SitusLongitude'
	,CASE WHEN A.[SitusGeoStatusCode] like '5' THEN 'Record was coded to the 5-digit ZIP code centroid (U.S.) or the first 3-digit Postal Code Level (Canada)' 
		WHEN A.[SitusGeoStatusCode] like '7' THEN 'Record was coded to the ZIP + 2 centroid'
		WHEN A.[SitusGeoStatusCode] like '9' THEN 'Record was coded to the ZIP + 4 centroid (U.S.) or the full 6-digit Postal Code Level (Canada)'
		WHEN A.[SitusGeoStatusCode] like 'A' THEN 'Record was coded to interpolated rooftop level'
		WHEN A.[SitusGeoStatusCode] like 'B' THEN 'Record was coded to the rooftop level'
		WHEN A.[SitusGeoStatusCode] like 'X' THEN 'Record was not coded'
		END  as 'SitusGeoStatusCode'
	,c.[CodeDesc] as 'PropertyClassID'
	,d.[CodeDesc] as 'StdLandUseCode'
	,A.[StateLandUseCode] as 'StateLandUseCode'
	,A.[CountyLandUseDescription] as 'CountyLandUseCode'
	,A.[Zoning] as 'Zoning'
	,A.[SitusCensusTract] as 'SitusCensusTract'
	,A.[MobileHomeInd] as 'MobileHomeInd'
	,A.[TimeshareCode] as 'TimeshareCode'
	,A.[SchoolDistrictName] as 'SchoolDistrictName'
	,A.[LotSizeFrontageFeet] as 'LotSizeFrontageFeet'
	,A.[LotSizeDepthFeet] as 'LotSizeDepthFeet'
	,A.[LotSizeAcres] as 'LotSizeAcres'
	,A.[LotSizeSqFt] as 'LotSizeSqFt'
	,A.[OwnerStd1CorpInd] as 'OwnerStd1CorpInd'
	,A.[OwnerStd1LastName] as 'OwnerStd1LastName'
	,A.[OwnerStd1FirstName] as 'OwnerStd1FirstName'
	,A.[OwnerStd1MiddleName] as 'OwnerStd1MiddleName'
	,A.[OwnerStd1Suffix] as 'OwnerStd1Suffix'
	,A.[OwnerStd2CorpInd] as 'OwnerStd2CorpInd'
	,A.[OwnerStd2LastName] as 'OwnerStd2LastName'
	,A.[OwnerStd2FirstName] as 'OwnerStd2FirstName'
	,A.[OwnerStd2MiddleName] as 'OwnerStd2MiddleName'
	,A.[OwnerStd2Suffix] as 'OwnerStd2Suffix'
	,A.[OwnerStdNAME1FULL] as 'OwnerStdNAME1FULL'
	,A.[OwnerStdNAME2FULL] as 'OwnerStdNAME2FULL'
	,A.[OwnerOccupied] as 'OwnerOccupied'
	,A.[OwnerStd1OwnershipRights] as 'OwnerStd1OwnershipRights'
	,A.[MailingStdFullStreetAddress] as 'MailingStdFullStreetAddress'
	,A.[MailingStdHouseNbr] as 'MailingStdHouseNbr'
	,A.[MailingStdHouseNbrSuffix] as 'MailingStdHouseNbrSuffix'
	,A.[MailingStdDirectionLeft] as 'MailingStdDirectionLeft'
	,A.[MailingStdStreet] as 'MailingStdStreet'
	,A.[MailingStdMode] as 'MailingStdMode'
	,A.[MailingStdDirectionRight] as 'MailingStdDirectionRight'
	,A.[MailingStdUnitType] as 'MailingStdUnitType'
	,A.[MailingStdUnitNbr] as 'MailingStdUnitNbr'
	,A.[MailingStdCity] as 'MailingStdCity'
	,A.[MailingStdState] as 'MailingStdState'
	,A.[MailingStdZIP5] as 'MailingStdZIP5'
	,A.[MailingStdZIP4] as 'MailingStdZIP4'
	,A.[MailingStdCarrierCode] as 'MailingStdCarrierCode'
	,A.[MailingOptOut] as 'MailingOptOut'
	,A.[AssdTotalValue] as 'AssdTotalValue'
	,A.[AssdLandValue] as 'AssdLandValue'
	,A.[AssdImprovementValue] as 'AssdImprovementValue'
	,A.[MarketTotalValue] as 'MarketTotalValue'
	,A.[MarketValueLand] as 'MarketValueLand'
	,A.[MarketValueImprovement] as 'MarketValueImprovement'
	,A.[TaxAmount]
	,A.[TaxYear]
		---- Removed DBS Tax MS 20230531
	--,CASE WHEN (A.[DBSTaxYear] > isNULL(A.[TaxYear],'0') and A.[DBSTaxAmount] is not null) THEN A.[DBSTaxAmount]
	--	WHEN (A.[DBSTaxYear] = isNULL(A.[TaxYear],'') and A.[DBSTaxAmount] is not null and ISNULL(A.[TaxAmount],0) = 0 ) THEN A.[DBSTaxAmount]
	--		ELSE A.[TaxAmount] END as TaxAmount
	--,CASE WHEN (A.[DBSTaxYear] > A.[TaxYear] and A.[DBSTaxAmount] is not null) THEN A.[DBSTaxYear] ELSE A.[TaxYear] END as 'TaxYear'
	,A.[TaxDeliquentYear1] as 'TaxDeliquentYear1'
	,A.[AssdYear] as 'AssdYear'
	,A.[TaxRateCodeArea] as 'TaxRateCodeArea'
	,A.[SchoolTaxDistrict1Code] as 'SchoolTaxDistrict1Code'
	,A.[SchoolTaxDistrict2Code] as 'SchoolTaxDistrict2Code'
	,A.[SchoolTaxDistrict3Code] as 'SchoolTaxDistrict3Code'
	,CASE WHEN A.[HomesteadInd] = 1 THEN 'Y' END as 'HomesteadInd'
	,CASE WHEN A.[VeteranInd] = 1 THEN 'Y' END as 'VeteranInd'
	,CASE WHEN A.[DisabledInd] = 1 THEN 'Y' END as 'DisabledInd'
	,CASE WHEN A.[WidowInd] = 1 THEN 'Y' END as 'WidowInd'
	,CASE WHEN A.[SeniorInd] = 1 THEN 'Y' END as 'SeniorInd'
	,CASE WHEN A.[SchoolCollegeInd] = 1 THEN 'Y' END as 'SchoolCollegeInd'
	,CASE WHEN A.[ReligiousInd] = 1 THEN 'Y' END as 'ReligiousInd'
	,CASE WHEN A.[WelfareInd] = 1 THEN 'Y' END as 'WelfareInd'
	,CASE WHEN A.[PublicUtilityInd] = 1 THEN 'Y' END as 'PublicUtilityInd'
	,CASE WHEN A.[CemeteryInd] = 1 THEN 'Y' END as 'CemeteryInd'
	,CASE WHEN A.[HospitalInd] = 1 THEN 'Y' END as 'HospitalInd'
	,CASE WHEN A.[LibraryInd] = 1 THEN 'Y' END as 'LibraryInd'
	,A.[BuildingArea] as 'BuildingArea'
	,e.[CodeDesc] as 'BuildingAreaInd'
	,A.[SumBuildingSqFt] as 'SumBuildingSqFt'
	,A.[SumLivingAreaSqFt] as 'SumLivingAreaSqFt'
	,A.[SumGrossAreaSqFt] as 'SumGrossAreaSqFt'
	,A.[SumAdjAreaSqFt] as 'SumAdjAreaSqFt'
	,A.[SumBasementSqFt] as 'SumBasementSqFt'
	,A.[SumGarageSqFt] as 'SumGarageSqFt'
	,A.[YearBuilt] as 'YearBuilt'
	,A.[EffectiveYearBuilt] as 'EffectiveYearBuilt'
	,A.[Bedrooms] as 'Bedrooms'
	,A.[TotalRooms] as 'TotalRooms'
	,A.[BathTotalCalc] as 'BathTotalCalc'
	,A.[BathFull] as 'BathFull'
	,A.[BathsParcialNbr] as 'BathsParcialNbr'
	,A.[BathFixturesNbr] as 'BathFixturesNbr'
	,f.[CodeDesc] as 'AirConditioningCode'
	,g.[CodeDesc] as 'BasementCode'
	,h.[CodeDesc] as 'BuildingClassCode'
	,i.[CodeDesc] as 'BuildingConditionCode'
	,j.[CodeDesc] as 'ConstructionTypeCode'
	,k.[CodeDesc] as 'ExteriorWallsCode'
	,l.[CodeDesc] as 'InteriorWallsCode'
	,CASE WHEN A.[FireplaceCode] = 1 THEN 'Yes' END as 'FireplaceCode'
	,m.[CodeDesc] as 'FloorCoverCode'
	,n.[CodeDesc] as 'Garage'
	,o.[CodeDesc] as 'HeatCode'
	,p.[CodeDesc] as 'HeatingFuelTypeCode'
	,q.[CodeDesc] as 'SiteInfluenceCode'
	,A.[GarageParkingNbr] as 'GarageParkingNbr'
	,CASE WHEN A.[DrivewayCode] = 1 THEN 'Yes' END as 'DrivewayCode'
	,CASE WHEN A.[PatioCode] =14 THEN 'Patio - Screened'
		WHEN A.[PatioCode] =20 THEN 'Patio'
		END as 'PatioCode'
	,r.[CodeDesc] as 'PoolCode'
	,CASE WHEN A.[PorchCode]  = 4 THEN 'Porch screened'
		WHEN A.[PorchCode]  = 5 THEN 'Portico (drive under)'
		WHEN A.[PorchCode]  = 6 THEN 'Porch covered'
		WHEN A.[PorchCode]  = 7 THEN 'Porch - Open'
		WHEN A.[PorchCode]  = 8 THEN 'Porch'
		END as 'PorchCode'
	,s.[CodeDesc] as 'BuildingQualityCode'
	,t.[CodeDesc] as 'RoofCoverCode'
	,u.[CodeDesc] as 'RoofTypeCode'
	,v.[CodeDesc] as 'SewerCode'
	,w.[CodeDesc] as 'StoriesNbrCode'
	,x.[CodeDesc] as 'StyleCode'
	,A.[SumResidentialUnits] as 'SumResidentialUnits'
	,A.[SumBuildingsNbr] as 'SumBuildingsNbr'
	,A.[SumCommercialUnits] as 'SumCommercialUnits'
	,y.[CodeDesc] as 'WaterCode'
	,CASE WHEN A.[LotCode] LIKE 'M' THEN 'More than one lot'
		WHEN A.[LotCode] LIKE 'MP' THEN 'Multiple w/a portion of one or more lots'
		WHEN A.[LotCode] LIKE 'P' THEN 'Portion of a lot'
		WHEN A.[LotCode] LIKE '1-99' THEN 'Single Lot number'
		END as 'LotCode'
	,A.[LotNumber] as 'LotNumber'
	,A.[LandLot] as 'LandLot'
	,A.[Block] as 'Block'
	,A.[Section] as 'Section'
	,A.[District] as 'District'
	,A.[LegalUnit] as 'LegalUnit'
	,A.[Municipality] as 'Municipality'
	,A.[SubdivisionName] as 'SubdivisionName'
	,A.[SubdivisionPhaseNbr] as 'SubdivisionPhaseNbr'
	,A.[SubdivisionTractNbr] as 'SubdivisionTractNbr'
	,A.[Meridian] as 'Meridian'
	,A.[AssessorsMapRef1] as 'AssessorsMapRef1'
	,A.[LegalDescription] as 'LegalDescription'
	,A.[FATimestamp] as 'FATimestamp'
	,A.[FAUCIDFlag] as 'FAUCIDFlag'
	,B.[County Name] as CountyName

FROM            Data.dbo.Property as A WITH (nolock)
join Global.dbo.County as B with(NOLOCK)
on A.FIPS = B.FIPSCODE
 LEFT OUTER JOIN [Global].dbo.[lkup_Property_Class] c with(NOLOCK)
 on PropertyClassID = PropClass
  LEFT OUTER JOIN [Global].dbo.[lkup_STD_LUSE] d with(NOLOCK)
  on StdLandUseCode = d.BKFSCode
   LEFT OUTER JOIN [Global].dbo.[lkup_Building_Area] e with(NOLOCK)
   on BuildingAreaInd = e.BKFSCode
    LEFT OUTER JOIN [Global].dbo.[lkup_Air_Condition] f with(NOLOCK)
    on AirConditioningCode = [AcCodeId]
     LEFT OUTER JOIN [Global].dbo.[lkup_Basement] g with(NOLOCK)
     on BasementCode = BasementId
      LEFT OUTER JOIN [Global].dbo.[lkup_Building_Class] h with(NOLOCK)
      on BuildingClassCode = BldgClsId
       LEFT OUTER JOIN [Global].dbo.[lkup_Building_Condition] i with(NOLOCK)
       on BuildingConditionCode = BldgCondId
        LEFT OUTER JOIN [Global].dbo.[lkup_Construction_Type] j with(NOLOCK)
        on ConstructionTypeCode = ConstructionTypeId
		 LEFT OUTER JOIN [Global].dbo.[lkup_Exterior_Wall] k with(NOLOCK)
		 on ExteriorWallsCode = ExteriorWallId
		  LEFT OUTER JOIN [Global].dbo.[lkup_Interior_Wall] l with(NOLOCK)
		  on InteriorWallsCode = InteriorWallId
		   LEFT OUTER JOIN [Global].dbo.[lkup_Floor_Cover] m with(NOLOCK)
		   on FloorCoverCode = FloorCoverId
			LEFT OUTER JOIN [Global].dbo.[lkup_Garage_Parking_Type] n with(NOLOCK)
			on Garage = GarageParkingId
			 LEFT OUTER JOIN [Global].dbo.[lkup_Heating] o with(NOLOCK)
			 on HeatCode = HeatingId
			  LEFT OUTER JOIN [Global].dbo.[lkup_Heating_Fuel_Type] p with(NOLOCK)
			  on HeatingFuelTypeCode = HeatingFuelId
			   LEFT OUTER JOIN [Global].dbo.[lkup_Site_Influence] q with(NOLOCK)
			   on SiteInfluenceCode = q.BKFSCode
				LEFT OUTER JOIN [Global].dbo.[lkup_Pool] r with(NOLOCK)
				on PoolCode = PoolId
				 LEFT OUTER JOIN [Global].dbo.[lkup_Building_Quality] s with(NOLOCK)
				 on QualityCode = BldgQtyId
				  LEFT OUTER JOIN [Global].dbo.[lkup_Roof_Cover] t with(NOLOCK)
				  on RoofCoverCode = RoofCoverId
					LEFT OUTER JOIN [Global].dbo.[lkup_Roof_Type] u with(NOLOCK)
					on RoofTypeCode = RoofId
						LEFT OUTER JOIN [Global].dbo.[lkup_Sewer] v with(NOLOCK)
						on SewerCode = SewerId
							LEFT OUTER JOIN [Global].dbo.[lkup_StoriesNbrCode_FA] w with(NOLOCK)
							on StoriesNbrCode = StoriesId
								LEFT OUTER JOIN [Global].dbo.[lkup_Style] x with(NOLOCK)
								on StyleCode = StyleId
									LEFT OUTER JOIN [Global].dbo.[lkup_Water] y with(NOLOCK)
									on WaterCode = WaterId









GRANT SELECT ON [dbo].[vAssessor_LITE_wDescriptions] TO [CORP\cbrady] AS [dbo]
