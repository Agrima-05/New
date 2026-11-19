SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.ReleaseDocNbrs
AS
SELECT        Fips, TransactionID, FAPropertyId, APN, RecordingDt, DocNbrSrce, DocNbrFrmt, YearDocNbrFrmt, BkPgFrmt, YearBkPgFrmt, CMTIDInstNbr, OrigDeedDocNbr, OrigLoanCMTIDInstNbr, OrigDeedRecordingDt, Loan_FA_DocNbrFmt, 
                         Loan_FA_YearDocNbrFmt, Loan_FA_YearDayDocNumFmt, Loan_FA_BookPageFmt
FROM            src_EPR.dbo.ReleaseDocNbrs

