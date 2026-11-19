SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON






CREATE VIEW [dbo].[vDeedMortgage_BAC_LIST]
AS
SELECT      
LEFT(P.[FIPS],5) as [FIPS CODE],
P.[PropertyID] as [PROPERTY UNIQUE ID],
LEFT(P.[FormattedAPN],45) as [APN],
LEFT(P.[SitusStdFullStreetAddress],100) as [PROPERTY FULL ADDRESS],
LEFT(P.[SitusStdCity],30) as [CITY],
LEFT(P.[SitusStdState],2) as [STATE],
LEFT(P.[SitusStdZIP5],9) as [ZIP CODE],
G.[County Name] as [COUNTY],
LEFT(P.[OwnerStdNAME1FULL],60) as [CURRENT OWNER NAME],
LEFT(P.[LegalDescription],250) as [LEGAL DESCRIPTION],
LEFT(P.[StdLandUseCode],10) as [First American STD LAND USE CODE ],
P.[AssdTotalValue] as [ASSESSED TOTAL VALUE],
LEFT(P.[MailingStdFullStreetAddress],100) as [MAIL FULL ADDRESS],
LEFT(P.[MailingStdCity],40) as [MAIL CITY],
LEFT(P.[MailingStdState],2) as [MAIL STATE],
LEFT(P.[MailingStdZIP5],9) as [MAIL ZIP CODE],
LEFT(D.[Buyer1FullName],70) as [1ST BORROWER FULLNAME 1],
LEFT(D.[Buyer2FullName],70) as [1ST BORROWER FULLNAME 2],
LEFT(D.[Buyer3FullName],70) as [1ST BORROWER FULLNAME 3],
LEFT(D.[Buyer4FullName],70) as [1ST BORROWER FULLNAME 4],
LEFT(D.[Loan1LenderName],60) as [1ST LENDERNAME],
LEFT(D.[Loan1RecordingDt],8) as [1ST MORTGAGE RECORDING DATE],
D.[Loan1Amount] as [1ST MORTGAGE AMOUNT],
LEFT(D.[Loan1Document],20) as [1ST DOC NUMBER],
LEFT(D.[Loan1Type],10) as [1ST LOAN TYPE],
LEFT(D.[Loan1InterestRate],7) as [1ST INTEREST RATE],
LEFT(D.[Loan1TypeFinance],3) as [1ST INTEREST RATE TYPE],
LEFT(D.[Loan1TermMonths],3) as [1ST MTG TERM],
LEFT(D.[Loan2LenderName],60) as [2ND LENDERNAME],
LEFT(D.[Loan2RecordingDt],8) as [2ND MORTGAGE RECORDING DATE],
D.[Loan2Amount] as [2ND MORTGAGE AMOUNT],
LEFT(D.[Loan2Document],20) as [2ND DOC NUMBER],
LEFT(D.[Loan2Type],10) as [2ND LOAN TYPE],
LEFT(D.[Loan2InterestRate],7) as [2ND INTEREST RATE],
LEFT(D.[Loan2TypeFinance],3) as [2ND INTEREST RATE TYPE],
LEFT(D.[Loan2TermMonths],3) as [2ND MTG TERM],
--LEFT(D.[Loan3LenderName],60) as [3RD LENDERNAME],
--LEFT(D.[Loan3RecordingDt],8) as [3RD MORTGAGE RECORDING DATE],
--D.[Loan3Amount] as [3RD MORTGAGE AMOUNT],
--LEFT(D.[Loan3Document],20) as [3RD DOC NUMBER],
--LEFT(D.[LoanType],10) as [3RD LOAN TYPE],
--LEFT(D.[Loan3InterestRate],7) as [3RD INTEREST RATE],
--LEFT(D.[Loan3TypeFinance],3) as [3RD INTEREST RATE TYPE],
--LEFT(D.[Loan3TermMonths],3) as [3RD MTG TERM],
LEFT(P.[SitusStdHouseNbr],10) as [HOUSE NUMBER],
LEFT(P.[SitusStdHouseNbr2],10) as [HOUSE NUMBER #2],
LEFT(P.[SitusStdHouseNbrSuffix],10) as [HOUSE NUMBER SUFFIX],
LEFT(P.[SitusStdDirectionLeft],2) as [DIRECTION LEFT],
LEFT(P.[SitusStdStreet],30) as [STREET NAME],
LEFT(P.[SitusStdMode],5) as [SUFFIX],
LEFT(P.[SitusStdDirectionRight],2) as [DIRECTION RIGHT],
LEFT(P.[SitusStdUnitType],10) as [UNIT TYPE ],
LEFT(P.[SitusStdUnitNbr],15) as [UNIT NUMBER],
LEFT(P.[SitusStdZIP4],9) as [ZIP Plus 4],
LEFT(P.[SitusStdCarrierCode],4) as [CARRIER Route],
Case when P.[OwnerStd1CorpInd] = 1 then 'Y' else NULL end as [OWNER CORPORATE INDICATOR - 1],
LEFT(P.[OwnerStd1LastName],60) as [OWNER 1 LAST NAME],
LEFT(P.[OwnerStd1FirstName],30) as [OWNER 1 FIRST NAME],
LEFT(P.[OwnerStd1MiddleName],10) as [OWNER 1 Middle NAME ],
LEFT(P.[OwnerStd1Suffix],5) as [OWNER 1 NAME SUFFIX],
Case when P.[OwnerStd2CorpInd] = 1 then 'Y' else NULL end as [OWNER CORPORATE INDICATOR - 2],
LEFT(P.[OwnerStd2LastName],60) as [OWNER 2 LAST NAME],
LEFT(P.[OwnerStd2FirstName],32) as [OWNER 2 FIRST NAME ],
LEFT(P.[OwnerStd2MiddleName],10) as [OWNER 2 Middle NAME ],
LEFT(P.[OwnerStd2Suffix],4) as [OWNER 2 SUFFIX],
LEFT(P.[OwnerStdNAME1FULL],60) as [OWNER NAME 1 FULL],
LEFT(P.[OwnerStdNAME2FULL],60) as [OWNER NAME 2 FULL],
LEFT(P.[OwnerOccupied],1) as [OWNER OCCUPIED FLAG],
LEFT(P.[OwnerStd1OwnershipRights],3) as [OWNER OWNERSHIP RIGHTS CODE],
LEFT(P.[OwnerStd1RelationshipType],2) as [OWNER RELATIONSHIP TYPE],
LEFT(P.[MailingStdHouseNbr],10) as [MAIL HOUSE NUMBER],
LEFT(P.[MailingStdHouseNbr2],10) as [MAIL HOUSE NUMBER #2],
LEFT(P.[MailingStdHouseNbrSuffix],10) as [MAIL HOUSE NUMBER SUFFIX],
LEFT(P.[MailingStdDirectionLeft],2) as [MAIL DIRECTION LEFT],
LEFT(P.[MailingStdStreet],30) as [MAIL STREET NAME],
LEFT(P.[MailingStdMode],5) as [MAIL MODE],
LEFT(P.[MailingStdDirectionRight],2) as [MAIL DIRECTION RIGHT],
LEFT(P.[MailingStdUnitType],10) as [MAIL UNIT TYPE ],
LEFT(P.[MailingStdUnitNbr],6) as [MAIL UNIT NUMBER],
LEFT(P.[MailingStdZIP4],9) as [MAIL ZIP Plus 4],
LEFT(P.[MailingStdCarrierCode],4) as [MAIL CARRIER CODE],
Case when P.[MailingOptOut] = 1 then 'Y' else NULL end as [MAILING OPT-OUT CODE],
P.[CurrentSaleTransactionId] as [First American Unique ID],
LEFT(P.[CurrSaleRecordingDate],8) as [RECORDING DATE],
LEFT(P.[CurrSaleContractDate],8) as [SALE DATE],
P.[CurrSalesPrice] as [SALE AMOUNT],
P.[MarketTotalValue] as [MARKET TOTAL VALUE],
LEFT(P.[AssdYear],4) as [ASSESSED YEAR],
D.[TransactionId] as [TransactionId],
D.[VendorPID] as [VendorPID],
D.[YearDocNbrFrmt] as [YearDocNbrFrmt],
D.[DocNbrFrmt] as [DocNbrFrmt]

FROM            deed as D with(nolock)
join Data.dbo.Property as P with(nolock)
on D.FIPS = P.FIPS
and D.FAPropertyID = P.PropertyID
join Global.dbo.County as G on 
D.FIPS = G.FIPSCODE
where 
P.FIPS = 37081
and [AssdTotalValue] >= '500000'
and StdLandUseCode in ('2000','2001','2004','2006','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2024','2025',
'2026','2027','2028','2029','2030','2032','2037','2041','2043','2045','2046','2047','2050','2051','2053','2054','3000','3001','3003','3005','3006','3007',
'5000','5001','5002','5003','5004','5005','5006','5007','5011')
and P.[MailingStdCarrierCode] is not null
and (
([Loan1RecordingDt] between '2010-04-01' and '2015-04-13' and [Loan1Amount] >= '250000' and [Loan1Amount] <= '25000000')
OR ([Loan2RecordingDt] between '2010-04-01' and '2015-04-13' and [Loan2Amount] >= '250000' and [Loan2Amount] <= '25000000')
--OR ([Loan3RecordingDt] between '2010-04-01' and '2015-04-13' and [Loan3Amount] >= '250000' and [Loan3Amount] <= '25000000')
)

UNION ALL
/*-------------------------------------------------------------------------------------*/ 

SELECT 
LEFT(P.[FIPS],5) as [FIPS CODE],
P.[PropertyID] as [PROPERTY UNIQUE ID],
LEFT(P.[FormattedAPN],45) as [APN],
LEFT(P.[SitusStdFullStreetAddress],100) as [PROPERTY FULL ADDRESS],
LEFT(P.[SitusStdCity],30) as [CITY],
LEFT(P.[SitusStdState],2) as [STATE],
LEFT(P.[SitusStdZIP5],9) as [ZIP CODE],
G.[County Name] as [COUNTY],
LEFT(P.[OwnerStdNAME1FULL],60) as [CURRENT OWNER NAME],
LEFT(P.[LegalDescription],250) as [LEGAL DESCRIPTION],
LEFT(P.[StdLandUseCode],10) as [First American STD LAND USE CODE ],
P.[AssdTotalValue] as [ASSESSED TOTAL VALUE],
LEFT(P.[MailingStdFullStreetAddress],100) as [MAIL FULL ADDRESS],
LEFT(P.[MailingStdCity],40) as [MAIL CITY],
LEFT(P.[MailingStdState],2) as [MAIL STATE],
LEFT(P.[MailingStdZIP5],9) as [MAIL ZIP CODE],
LEFT(M.[Borrower1FullName],70) as [1ST BORROWER FULLNAME 1],
LEFT(M.[Borrower2FullName],70) as [1ST BORROWER FULLNAME 2],
LEFT(M.[Borrower3FullName],70) as [1ST BORROWER FULLNAME 3],
LEFT(M.[Borrower4FullName],70) as [1ST BORROWER FULLNAME 4],
LEFT(M.[LenderName],60) as [1ST LENDERNAME],
LEFT(M.[RecordingDt],8) as [1ST MORTGAGE RECORDING DATE],
M.[LoanAmount] as [1ST MORTGAGE AMOUNT],
LEFT(M.[YearDocNbrFrmt],20) as [1ST DOC NUMBER],
LEFT(M.[LoanType],10) as [1ST LOAN TYPE],
LEFT(M.[LoanInterestRate],7) as [1ST INTEREST RATE],
LEFT(M.[TypeFinance],3) as [1ST INTEREST RATE TYPE],
LEFT(M.[LoanTermMonths],3) as [1ST MTG TERM],
NULL as [2ND LENDERNAME],
NULL as [2ND MORTGAGE RECORDING DATE],
NULL as [2ND MORTGAGE AMOUNT],
NULL as [2ND DOC NUMBER],
NULL as [2ND LOAN TYPE],
NULL as [2ND INTEREST RATE],
NULL as [2ND INTEREST RATE TYPE],
NULL as [2ND MTG TERM],
--NULL as [3RD LENDERNAME],
--NULL as [3RD MORTGAGE RECORDING DATE],
--NULL as [3RD MORTGAGE AMOUNT],
--NULL as [3RD DOC NUMBER],
--NULL as [3RD LOAN TYPE],
--NULL as [3RD INTEREST RATE],
--NULL as [3RD INTEREST RATE TYPE],
--NULL as [3RD MTG TERM],

LEFT(P.[SitusStdHouseNbr],10) as [HOUSE NUMBER],
LEFT(P.[SitusStdHouseNbr2],10) as [HOUSE NUMBER #2],
LEFT(P.[SitusStdHouseNbrSuffix],10) as [HOUSE NUMBER SUFFIX],
LEFT(P.[SitusStdDirectionLeft],2) as [DIRECTION LEFT],
LEFT(P.[SitusStdStreet],30) as [STREET NAME],
LEFT(P.[SitusStdMode],5) as [SUFFIX],
LEFT(P.[SitusStdDirectionRight],2) as [DIRECTION RIGHT],
LEFT(P.[SitusStdUnitType],10) as [UNIT TYPE ],
LEFT(P.[SitusStdUnitNbr],15) as [UNIT NUMBER],
LEFT(P.[SitusStdZIP4],9) as [ZIP Plus 4],
LEFT(P.[SitusStdCarrierCode],4) as [CARRIER Route],
Case when P.[OwnerStd1CorpInd] = 1 then 'Y' else NULL end as [OWNER CORPORATE INDICATOR - 1],
LEFT(P.[OwnerStd1LastName],60) as [OWNER 1 LAST NAME],
LEFT(P.[OwnerStd1FirstName],30) as [OWNER 1 FIRST NAME],
LEFT(P.[OwnerStd1MiddleName],10) as [OWNER 1 Middle NAME ],
LEFT(P.[OwnerStd1Suffix],5) as [OWNER 1 NAME SUFFIX],
Case when P.[OwnerStd2CorpInd] = 1 then 'Y' else NULL end as [OWNER CORPORATE INDICATOR - 2],
LEFT(P.[OwnerStd2LastName],60) as [OWNER 2 LAST NAME],
LEFT(P.[OwnerStd2FirstName],32) as [OWNER 2 FIRST NAME ],
LEFT(P.[OwnerStd2MiddleName],10) as [OWNER 2 Middle NAME ],
LEFT(P.[OwnerStd2Suffix],4) as [OWNER 2 SUFFIX],
LEFT(P.[OwnerStdNAME1FULL],60) as [OWNER NAME 1 FULL],
LEFT(P.[OwnerStdNAME2FULL],60) as [OWNER NAME 2 FULL],
LEFT(P.[OwnerOccupied],1) as [OWNER OCCUPIED FLAG],
LEFT(P.[OwnerStd1OwnershipRights],3) as [OWNER OWNERSHIP RIGHTS CODE],
LEFT(P.[OwnerStd1RelationshipType],2) as [OWNER RELATIONSHIP TYPE],
LEFT(P.[MailingStdHouseNbr],10) as [MAIL HOUSE NUMBER],
LEFT(P.[MailingStdHouseNbr2],10) as [MAIL HOUSE NUMBER #2],
LEFT(P.[MailingStdHouseNbrSuffix],10) as [MAIL HOUSE NUMBER SUFFIX],
LEFT(P.[MailingStdDirectionLeft],2) as [MAIL DIRECTION LEFT],
LEFT(P.[MailingStdStreet],30) as [MAIL STREET NAME],
LEFT(P.[MailingStdMode],5) as [MAIL MODE],
LEFT(P.[MailingStdDirectionRight],2) as [MAIL DIRECTION RIGHT],
LEFT(P.[MailingStdUnitType],10) as [MAIL UNIT TYPE ],
LEFT(P.[MailingStdUnitNbr],6) as [MAIL UNIT NUMBER],
LEFT(P.[MailingStdZIP4],9) as [MAIL ZIP Plus 4],
LEFT(P.[MailingStdCarrierCode],4) as [MAIL CARRIER CODE],
Case when P.[MailingOptOut] = 1 then 'Y' else NULL end as [MAILING OPT-OUT CODE],
P.[CurrentSaleTransactionId] as [First American Unique ID],
LEFT(P.[CurrSaleRecordingDate],8) as [RECORDING DATE],
LEFT(P.[CurrSaleContractDate],8) as [SALE DATE],
P.[CurrSalesPrice] as [SALE AMOUNT],
P.[MarketTotalValue] as [MARKET TOTAL VALUE],
LEFT(P.[AssdYear],4) as [ASSESSED YEAR],
M.[TransactionId] as [TransactionId],
M.[VendorPID] as [VendorPID],
NULL as [YearDocNbrFrmt],
NULL as [DocNbrFrmt]

FROM            mortgage as M with(NoLock)
join Data.dbo.Property as P with(NOLOCK)
on 
M.FIPS = P.FIPS
and M.FAPropertyID = P.PropertyID
join Global.dbo.County as G on 
M.FIPS = G.FIPSCODE
where 
P.FIPS = 37081
and [AssdTotalValue] >= '500000'
and StdLandUseCode in ('2000','2001','2004','2006','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2024','2025',
'2026','2027','2028','2029','2030','2032','2037','2041','2043','2045','2046','2047','2050','2051','2053','2054','3000','3001','3003','3005','3006','3007',
'5000','5001','5002','5003','5004','5005','5006','5007','5011')
and P.[MailingStdCarrierCode] is not null
and M.[RecordingDt] between '2010-04-01' and '2015-04-13' and [LoanAmount] >= '250000' and [LoanAmount] <= '25000000'















GRANT SELECT ON [dbo].[vDeedMortgage_BAC_LIST] TO [CORP\cbrady] AS [dbo]
