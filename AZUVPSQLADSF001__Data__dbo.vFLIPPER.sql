SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON









CREATE VIEW [dbo].[vFLIPPER]
AS
SELECT 
A.[FIPS] as [FIPS]
,A.[PropertyID] as [PropertyID]
,A.[FormattedAPN] as [APN]
,A.[APNSeqNbr] as [APNSeqNbr]
,A.[OldAPN] as [OldAPN]
,A.[TaxAccountNumber] as [TaxAccountNumber]
,A.[MatchedFlag] as [MatchedFlag]
,A.[SitusStdFullStreetAddress] as [SitusFullStreetAddress]
,A.[SitusStdHouseNbr] as [SitusHouseNbr]
,A.[SitusStdHouseNbrSuffix] as [SitusHouseNbrSuffix]
,A.[SitusStdDirectionLeft] as [SitusDirectionLeft]
,A.[SitusStdStreet] as [SitusStreet]
,A.[SitusStdMode] as [SitusMode]
,A.[SitusStdDirectionRight] as [SitusDirectionRight]
,A.[SitusStdUnitType] as [SitusUnitType]
,A.[SitusStdUnitNbr] as [SitusUnitNbr]
,A.[SitusStdCity] as [SitusCity]
,A.[SitusStdState] as [SitusState]
,A.[SitusStdZIP5] as [SitusZIP5]
,A.[SitusStdZIP4] as [SitusZIP4]
,A.[SitusStdCarrierCode] as [SitusCarrierCode]
,A.[PropertyClassID] as [PropertyClassID]
,A.[StdLandUseCode] as [LandUseCode]
,A.[Bedrooms] as [Bedrooms]
,A.[TotalRooms] as [TotalRooms]
,A.[BathTotalCalc] as [BathTotalCalc]
,A.[BathFull] as [BathFull]
,A.[BathsParcialNbr] as [BathsPartialNbr]
,A.[BuildingArea] as [BuildingArea]
,A.[BuildingAreaInd] as [BuildingAreaInd]
,A.[LotSizeAcres] as [LotSizeAcres]
,A.[LotSizeSqFt] as [LotSizeSqFt]
,A.[YearBuilt] as [YearBuilt]
,A.[EffectiveYearBuilt] as [EffectiveYearBuilt]
,A.[DateDifference] as [DateDifference]
,A.[eTransactionId] as [eFATransactionID]
,A.[eMultiAPNCode] as [eMultiAPN]
,A.[eDeedTransactionType] as [eDeedTransactionType]
,A.[eRecordingDt] as [eRecordingDate]
,A.[eSalesPrice] as [eSaleAmt]
,A.[eLoan1Amount] as [eFirstMtgAmt]
,A.[eLoan1LenderName] as [eFirstMtgLenderName]
,A.[eLoan1TermMonths] as [eFirstMtgTerm]
,A.[eLoan2Amount] as [eSecondMtgAmt]
,A.[eLoan2LenderName] as [eSecondMtgLenderName]
,A.[eLoan2TermMonths] as [eSecondMtgTerm]
,case when A.[eBuyer1NoParsInd] is not null then 'Y' else '' end  as [eBuyerBorrower1CorpInd]
,A.[eBuyer1FullName] as [eBuyerBorrower1Name]
,A.[eBuyer1LastName] as [eBuyerBorrower1LastName]
,A.[eBuyer1FirstName] as [eBuyerBorrower1FirstName]
,case when A.[eBuyer2NoParsInd] is not null then 'Y' else '' end  as [eBuyerBorrower2CorpInd]
,A.[eBuyer2FullName] as [eBuyerBorrower2Name]
,A.[eBuyer2LastName] as [eBuyerBorrower2LastName]
,A.[eBuyer2FirstName] as [eBuyerBorrower2FirstName]
,A.[eBuyerMailFullAddress] as [eBuyerMailingFullStreetAddress]
,A.[eBuyerMailHouseNbr] as [eBuyerMailingHouseNbr]
,A.[eBuyerMailHouseNbrSuffix] as [eBuyerMailingHouseNbrSuffix]
,A.[eBuyerMailLeftDirection] as [eBuyerMailingDirectionLeft]
,A.[eBuyerMailStreetName] as [eBuyerMailingStreet]
,A.[eBuyerMailMode] as [eBuyerMailingMode]
,A.[eBuyerMailRightDirection] as [eBuyerMailingDirectionRight]
,A.[eBuyerMailUnitType] as [eBuyerMailingUnitType]
,A.[eBuyerMailUnitNumber] as [eBuyerMailingUnitNbr]
,A.[eBuyerMailCity] as [eBuyerMailingCity]
,A.[eBuyerMailState] as [eBuyerMailingState]
,A.[eBuyerMailZip5] as [eBuyerMailingZIP5]
,A.[eBuyerMailZip4] as [eBuyerMailingZIP4]
,A.[eBuyerMailCarrierCode] as [eBuyerMailingCarrierCode]
,A.[eSeller1FullName] as [eSeller1FullName]
,A.[eSeller2FullName] as [eSeller2FullName]
,A.[eSellerMailFullAddress] as [eSellerMailingFullStreetAddress]
,A.[eSellerMailHouseNbr] as [eSellerMailingHouseNbr]
,A.[eSellerMailHouseNbrSuffix] as [eSellerMailingHouseNbrSuffix]
,A.[eSellerMailLeftDirection] as [eSellerMailingDirectionLeft]
,A.[eSellerMailStreetName] as [eSellerMailingStreet]
,A.[eSellerMailMode] as [eSellerMailingMode]
,A.[eSellerMailRightDirection] as [eSellerMailingDirectionRight]
,A.[eSellerMailUnitType] as [eSellerMailingUnitType]
,A.[eSellerMailUnitNumber] as [eSellerMailingUnitNbr]
,A.[eSellerMailCity] as [eSellerMailingCity]
,A.[eSellerMailState] as [eSellerMailingState]
,A.[eSellerMailZip5] as [eSellerMailingZIP5]
,A.[eSellerMailZip4] as [eSellerMailingZIP4]
,A.[eSellerMailCarrierCode] as [eSellerMailingCarrierCode]
,A.[dTransactionId] as [dFATransactionID]
,A.[dMultiAPNCode] as [dMultiAPN]
,A.[dDeedTransactionType] as [dDeedTransactionType]
,A.[dRecordingDt] as [dRecordingDate]
,A.[dSalesPrice] as [dSaleAmt]
,A.[dLoan1Amount] as [dFirstMtgAmt]
,A.[dLoan1LenderName] as [dFirstMtgLenderName]
,A.[dLoan1TermMonths] as [dFirstMtgTerm]
,A.[dLoan2Amount] as [dSecondMtgAmt]
,A.[dLoan2LenderName] as [dSecondMtgLenderName]
,A.[dLoan2TermMonths] as [dSecondMtgTerm]
,case when A.[dBuyer1NoParsInd] is not null then 'Y' else '' end  as [dBuyerBorrower1CorpInd]
,A.[dBuyer1FullName] as [dBuyerBorrower1Name]
,A.[dBuyer1LastName] as [dBuyerBorrower1LastName]
,A.[dBuyer1FirstName] as [dBuyerBorrower1FirstName]
,case when A.[dBuyer2NoParsInd] is not null then 'Y' else '' end  as [dBuyerBorrower2CorpInd]
,A.[dBuyer2FullName] as [dBuyerBorrower2Name]
,A.[dBuyer2LastName] as [dBuyerBorrower2LastName]
,A.[dBuyer2FirstName] as [dBuyerBorrower2FirstName]
,A.[dBuyerMailFullAddress] as [dBuyerMailingFullStreetAddress]
,A.[dBuyerMailHouseNbr] as [dBuyerMailingHouseNbr]
,A.[dBuyerMailHouseNbrSuffix] as [dBuyerMailingHouseNbrSuffix]
,A.[dBuyerMailLeftDirection] as [dBuyerMailingDirectionLeft]
,A.[dBuyerMailStreetName] as [dBuyerMailingStreet]
,A.[dBuyerMailMode] as [dBuyerMailingMode]
,A.[dBuyerMailRightDirection] as [dBuyerMailingDirectionRight]
,A.[dBuyerMailUnitType] as [dBuyerMailingUnitType]
,A.[dBuyerMailUnitNumber] as [dBuyerMailingUnitNbr]
,A.[dBuyerMailCity] as [dBuyerMailingCity]
,A.[dBuyerMailState] as [dBuyerMailingState]
,A.[dBuyerMailZip5] as [dBuyerMailingZIP5]
,A.[dBuyerMailZip4] as [dBuyerMailingZIP4]
,A.[dBuyerMailCarrierCode] as [dBuyerMailingCarrierCode]
,A.[dSeller1FullName] as [dSeller1FullName]
,A.[dSeller2FullName] as [dSeller2FullName]
,A.[dSellerMailFullAddress] as [dSellerMailingFullStreetAddress]
,A.[dSellerMailHouseNbr] as [dSellerMailingHouseNbr]
,A.[dSellerMailHouseNbrSuffix] as [dSellerMailingHouseNbrSuffix]
,A.[dSellerMailLeftDirection] as [dSellerMailingDirectionLeft]
,A.[dSellerMailStreetName] as [dSellerMailingStreet]
,A.[dSellerMailMode] as [dSellerMailingMode]
,A.[dSellerMailRightDirection] as [dSellerMailingDirectionRight]
,A.[dSellerMailUnitType] as [dSellerMailingUnitType]
,A.[dSellerMailUnitNumber] as [dSellerMailingUnitNbr]
,A.[dSellerMailCity] as [dSellerMailingCity]
,A.[dSellerMailState] as [dSellerMailingState]
,A.[dSellerMailZip5] as [dSellerMailingZIP5]
,A.[dSellerMailZip4] as [dSellerMailingZIP4]
,A.[dSellerMailCarrierCode] as [dSellerMailingCarrierCode]
,A.FATimestamp as [FATimestamp]
,A.FAUCIDFlag as [FAUCIDFlag]
,case when A.[dREO] = 1 then 'Y' else '' end as [dREO]
,case when A.[dREOSale] = 1 then 'Y' else '' end as [dREOSale]
,case when A.[dArmlength] = 1 then 'Y' else '' end as [dArmlength]
,case when A.[dNewConstructionInd] = 1 then 'Y' else '' end as [dNewConstructionInd]
,case when A.[dLoan1PrivatePartyLender] is not null then 'Y' else '' end as [dLoan1PrivatePartyLender]
,case when A.[dLoan1SellerCarry] is not null then 'Y' else '' end as [dLoan1SellerCarry]
,case when A.[dLoan1NewConstructionLoanInd] = 1 then 'Y' else '' end as [dLoan1NewConstructionLoanInd]
,case when A.[dPartialInterestTransferred] Is not null then 'Y' else '' end as [dPartialInterestTransferred]
,case when A.[dResaleInd] = 1 then 'Y' else '' end as [dResaleInd]
,case when A.[dInterFamilyTransfer] = 1 then 'Y' else '' end as [dInterFamilyTransfer]
,A.dLoan1InterestRate as [dLoan1InterestRate]
,A.dLoan1InterestRateSrce as [dLoan1InterestRateSrce]
,A.dLoan1TypeFinance as [dLoan1TypeFinance]
,A.dLoan2InterestRate as [dLoan2InterestRate]
,A.dLoan2InterestRateSrce as [dLoan2InterestRateSrce]
,A.dLoan2TypeFinance as [dLoan2TypeFinance]
,case when A.[eREO] = 1 then 'Y' else '' end as [eREO]
,case when A.[eREOSale] = 1 then 'Y' else '' end as [eREOSale]
,case when A.[eArmlength] = 1 then 'Y' else '' end as [eArmlength]
,case when A.[eNewConstructionInd] = 1 then 'Y' else '' end as [eNewConstructionInd]
,case when A.[eLoan1PrivatePartyLender] is not null then 'Y' else '' end as [eLoan1PrivatePartyLender]
,case when A.[eLoan1SellerCarry] is not null then 'Y' else ''  end as [eLoan1SellerCarry]
,case when A.[eLoan1NewConstructionLoanInd] = 1 then 'Y' else '' end as [eLoan1NewConstructionLoanInd]
,case when A.[ePartialInterestTransferred] Is not null then 'Y' else '' end as [ePartialInterestTransferred]
,case when A.[eResaleInd] = 1 then 'Y' else '' end as [eResaleInd]
,case when A.[eInterFamilyTransfer] = 1 then 'Y' else '' end as [eInterFamilyTransfer]
,A.eLoan1InterestRate as [eLoan1InterestRate]
,A.eLoan1InterestRateSrce as [eLoan1InterestRateSrce]
,A.eLoan1TypeFinance as [eLoan1TypeFinance]
,A.eLoan2InterestRate as [eLoan2InterestRate]
,A.eLoan2InterestRateSrce as [eLoan2InterestRateSrce]
,A.eLoan2TypeFinance as [eLoan2TypeFinance]
,A.Run as [Run]
------20201022 - Changed to NULL per BR
--,A.eBank as [eBank]
--,A.dBank as [dBank]
--,A.eInFlipperUnique as [eInFlipperUnique]
--,A.dInFlipperUnique as [dInFlipperUnique]
,NULL as [eBank]
,NULL as [dBank]
,NULL as [eInFlipperUnique]
,NULL as [dInFlipperUnique]

----Added for queries----
,substring([dRecordingDt],1,4) as [dRecordingDt_YEAR]
,substring([eRecordingDt],1,4) as [eRecordingDt_YEAR]
----Added 20201001---
,A.Profit as Profit

----Added 20201022 per BR--
,CBSAName
,Latitude
,Longitude
,SitusCensusTract
,CountyLandUseDescription

----Added 20250501  -Emily request - JME--
,A.eSalesPriceCode as [eSalePriceCode]
,A.dSalesPriceCode as [dSalePriceCode]


FROM  DATA.dbo.FLIPPER as A with(NOLOCK)
where [dREO] is null 
and [eREO] is null
and [dArmlength] = 1 
and [eArmlength] = 1
and [dNewConstructionInd] is null 
and [eNewConstructionInd] is null
and DateDifference > 0









GRANT SELECT ON [dbo].[vFLIPPER] TO [CORP\cbrady] AS [dbo]
