SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





CREATE VIEW [dbo].[vASR_STD1]
AS
SELECT      
A.[FIPS] as FIPS
,A.[FAPropertyId] as FAPropertyId
,A.[APN] as APN
,NULL as APNSeqNbr
,NULL as PreviousParcelNumber
,A.[TaxAccountNbr] as TaxAccountNbr
,A.[SitusStdHouseNbr] as SitusStdHouseNbr
,A.[SitusStdHouseNbr2] as SitusStdHouseNbr2
,A.[SitusStdHouseNbrSuffix] as SitusStdHouseNbrSuffix
,A.[SitusStdDirectionLeft] as SitusStdDirectionLeft
,A.[SitusStdStreet] as SitusStdStreet
,A.[SitusStdMode] as SitusStdMode
,A.[SitusStdDirectionRight] as SitusStdDirectionRight
,A.[SitusStdUnitType] as SitusStdUnitType
,A.[SitusStdUnitNbr] as SitusStdUnitNbr
,A.[SitusStdCity] as SitusStdCity
,A.[SitusStdState] as SitusStdState
,A.[SitusStdZIP5] as SitusStdZIP5
,A.[SitusStdZIP4] as SitusStdZIP4
,A.[SitusStdCarrierCode] as SitusStdCarrierCode
,A.[TransactionId] as FirstAmericanUniqueTransactionID
,A.[DocNbrSrce] as DocNbrSrce
,A.[BookSrce] as BookSrce
,A.[PageSrce] as PageSrce
,A.[RecordingDt] as RecordingDt
,A.[EffectiveDt] as EffectiveDt
,A.[DocumentType] as DocumentType
,left((Replace(Replace(Replace(Replace(case when charindex('a sin',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a sin',[BorrowerFullName])-1)) when charindex('a marri',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a marri',[BorrowerFullName])-1)) when charindex('as Hu',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as hu',[BorrowerFullName])-1)) when charindex('Husband and wife',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('husband and wife',[BorrowerFullName])-1)) when charindex('wife and husband',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('wife and husband',[BorrowerFullName])-1)) when charindex('an unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('an unmar',[BorrowerFullName])-1)) when charindex('as unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as unmar',[BorrowerFullName])-1)) when charindex('unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('unmar',[BorrowerFullName])-1)) when charindex('marr',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('marr',[BorrowerFullName])-1)) else [BorrowerFullName] end,',', ' '),';',' '),'.',' '),' ', ' ')),60) as BorrowerFullName
,left((Replace(Replace((case when charindex(':',assignee) >0 then Substring([Assignee],1,(Charindex(':',[Assignee])-1)) when charindex(';',assignee) >0 then Substring([Assignee],1,(Charindex(';',[Assignee])-1)) when charindex(',',assignee) >0 then Substring([Assignee],1,(Charindex(',',[Assignee])-1)) else assignee end),',',' '),'.','')),60) as NewLenderName
,left((Replace(Replace((case when charindex(':',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(':',[AssignorName])-1)) when charindex(';',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(';',[AssignorName])-1)) when charindex(',',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(',',[AssignorName])-1)) else [AssignorName] end),',',' '),'.','')),60) as OriginalLenderName
,[OrigDeedRecordingDt] as OrigDeedRecordingDt
,[OrigDeedDocNbr] as OrigDeedDocNbr
,[OrigDeedBook] as OrigDeedBook
,[OrigDeedPage] as OrigDeedPage
,[OrigLoanAmt] as OrigLoanAmt
,case when FADeedid is null then FASamID else FADeedID end as OriginalLoanTransactionID
,A.[FATimestamp] as UpdateTimeStamp
,A.[FAUCIDFlag] as FAUCIDFlag
,A.[FATimestamp] as FATimestamp

------------------20180522 - Added for Rocktop----------------------
,(Replace(Replace(Replace(Replace(case when charindex('a sin',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a sin',[BorrowerFullName])-1)) when charindex('a marri',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a marri',[BorrowerFullName])-1)) when charindex('as Hu',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as hu',[BorrowerFullName])-1)) when charindex('Husband and wife',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('husband and wife',[BorrowerFullName])-1)) when charindex('wife and husband',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('wife and husband',[BorrowerFullName])-1)) when charindex('an unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('an unmar',[BorrowerFullName])-1)) when charindex('as unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as unmar',[BorrowerFullName])-1)) when charindex('unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('unmar',[BorrowerFullName])-1)) when charindex('marr',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('marr',[BorrowerFullName])-1)) else [BorrowerFullName] end,',', ' '),';',' '),'.',' '),' ', ' ')) as BorrowerFullName_R
,(Replace(Replace((case when charindex(':',assignee) >0 then Substring([Assignee],1,(Charindex(':',[Assignee])-1)) when charindex(';',assignee) >0 then Substring([Assignee],1,(Charindex(';',[Assignee])-1)) when charindex(',',assignee) >0 then Substring([Assignee],1,(Charindex(',',[Assignee])-1)) else assignee end),',',' '),'.','')) as NewLenderName_R
,(Replace(Replace((case when charindex(':',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(':',[AssignorName])-1)) when charindex(';',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(';',[AssignorName])-1)) when charindex(',',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(',',[AssignorName])-1)) else [AssignorName] end),',',' '),'.','')) as OriginalLenderName_R


----------------20180524 - Added for RealFactor------
,B.StdLandUseCode as StdLandUseCode


----------------20190221------
,B.SitusSTDFullStreetAddress as SitusSTDFullStreetAddress

FROM            ASSIGNMENT  as A with(NOLOCK)
left outer join data.dbo.Property as B with(NOLOCK) on A.FIPS = B.FIPS and A.FAPropertyID = B.PropertyID
Where isDate(RecordingDt) = 1 and RecordingDt <= convert(varchar(8),GetDate(),112)

UNION ALL
/*-------------------------------------------------------------------------------------*/ 

SELECT 
A.[FIPS] as FIPS
,[FAPropertyId] as FAPropertyId
,[APN] as APN
,NULL as APNSeqNbr
,NULL as PreviousParcelNumber
,A.[TaxAccountNbr] as TaxAccountNbr
,A.[SitusHouseNbr] as SitusStdHouseNbr
,A.[SitusHouseNbr2] as SitusStdHouseNbr2
,A.[SitusHouseNbrSuffix] as SitusStdHouseNbrSuffix
,A.[SitusDirectionLeft] as SitusStdDirectionLeft
,A.[SitusStreet] as SitusStdStreet
,A.[SitusMode] as SitusStdMode
,A.[SitusDirectionRight] as SitusStdDirectionRight
,A.[SitusUnitType] as SitusStdUnitType
,A.[SitusUnitNbr] as SitusStdUnitNbr
,A.[SitusCity] as SitusStdCity
,A.[SitusState] as SitusStdState
,A.[SitusZIP5] as SitusStdZIP5
,A.[SitusZIP4] as SitusStdZIP4
,A.[SitusCarrierCode] as SitusStdCarrierCode
,A.[TransactionId] as FirstAmericanUniqueTransactionID
,A.[DocNbrSrce] as DocNbrSrce
,A.[BookSrce] as BookSrce
,A.[PageSrce] as PageSrce
,A.[RecordingDt] as RecordingDt
,A.[EffectiveDt] as EffectiveDt
,A.[DocumentType] as DocumentType
,left((Replace(Replace(Replace(Replace(case when charindex('a sin',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a sin',[BorrowerFullName])-1)) when charindex('a marri',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a marri',[BorrowerFullName])-1)) when charindex('as Hu',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as hu',[BorrowerFullName])-1)) when charindex('Husband and wife',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('husband and wife',[BorrowerFullName])-1)) when charindex('wife and husband',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('wife and husband',[BorrowerFullName])-1)) when charindex('an unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('an unmar',[BorrowerFullName])-1)) when charindex('as unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as unmar',[BorrowerFullName])-1)) when charindex('unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('unmar',[BorrowerFullName])-1)) when charindex('marr',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('marr',[BorrowerFullName])-1)) else [BorrowerFullName] end,',', ' '),';',' '),'.',' '),' ', ' ')),60) as BorrowerFullName
,NULL as NewLenderName
,Replace(Replace([OrigLenderBen],',',''),'.','') as OriginalLenderName
,[OrigDeedRecordingDt] as OrigDeedRecordingDt
,[OrigDeedDocNbr] as OrigDeedDocNbr
,[OrigDeedBook] as OrigDeedBook
,[OrigDeedPage] as OrigDeedPage
,[OrigLoanAmt] as OrigLoanAmt
,case when FADeedid is null then FASamID else FADeedID end as OriginalLoanTransactionID
,A.[FATimestamp] as UpdateTimeStamp
,A.[FAUCIDFlag] as FAUCIDFlag
,A.[FATimestamp] as FATimestamp


---------------20180522 - Added for RockTop-----
,(Replace(Replace(Replace(Replace(case when charindex('a sin',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a sin',[BorrowerFullName])-1)) when charindex('a marri',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a marri',[BorrowerFullName])-1)) when charindex('as Hu',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as hu',[BorrowerFullName])-1)) when charindex('Husband and wife',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('husband and wife',[BorrowerFullName])-1)) when charindex('wife and husband',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('wife and husband',[BorrowerFullName])-1)) when charindex('an unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('an unmar',[BorrowerFullName])-1)) when charindex('as unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as unmar',[BorrowerFullName])-1)) when charindex('unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('unmar',[BorrowerFullName])-1)) when charindex('marr',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('marr',[BorrowerFullName])-1)) else [BorrowerFullName] end,',', ' '),';',' '),'.',' '),' ', ' ')) as BorrowerFullName_R
,NULL as NewLenderName_R
,Replace(Replace([OrigLenderBen],',',''),'.','') as OriginalLenderName_R

----------------20180524 - Added for RealFactor------
,B.StdLandUseCode as StdLandUseCode

----------------20190221------
,B.SitusSTDFullStreetAddress as SitusSTDFullStreetAddress


FROM            RELEASE  as A with(NOLOCK)
left outer join data.dbo.Property as B with(NOLOCK) on A.FIPS = B.FIPS and A.FAPropertyID = B.PropertyID
Where isDate(RecordingDt) = 1 and RecordingDt <= convert(varchar(8),GetDate(),112)











GRANT SELECT ON [dbo].[vASR_STD1] TO [CORP\cbrady] AS [dbo]
