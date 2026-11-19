SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 CREATE view [dbo].[HW_Offices_V2] 
 as
		SELECT o.[SrcOfficeID]
			  ,o.[SrcMLSID]
			  ,o.[SrcMLSOfficeID]
			  ,o.[SrcOfficeName]
			  ,o.[Address1]
			  ,o.[Address2]
			  ,o.[City]
			  ,o.[State]
			  ,o.[CountyID]
			  ,o.[Zip]
			  ,o.[Phone]
			  ,o.[Email]
			  ,o.[DateCreated]
			  ,o.[LastModifiedDate]
			  ,o.[DW_TimeStamp]
			  ,o.[Longitude]
			  ,o.[Latitude]
			  ,o.[FASTOfficeAddrBookID]
			  ,o.[OfficeRank]
			  ,o.[SourceAddress1]
			  ,o.[SourceAddress2]
			  ,o.[SourceCity]
			  ,o.[SourceState]
			  ,o.[SourceZip]
			  ,o.[CassCertifiedAddress1]
			  ,o.[CassCertifiedAddress2]
			  ,o.[CassCertifiedCity]
			  ,o.[CassCertifiedState]
			  ,o.[CassCertifiedZip]
			  ,o.[IsActive]
			  ,o.[ID]
			  ,o.[Platlabs_uid]
			  ,o.[Platlabs_mls_id]
			  ,o.[LoadDate]
			  ,s.FullStreetAddress as StandardizedFullStreetAddress
			  ,s.HouseNbr as StandardizedHouseNbr
			  ,s.LeftDirection as StandardizedLeftDirection
			  ,s.street as StandardizedStreet
			  ,s.Mode as StandardizedMode
			  ,s.RightDirection as StandardizedRightDirection
			  ,s.UnitType as StandardizedUnitType
			  ,s.UnitNumber as StandardizedUnitNumber
			  ,s.City as StandardizedCity
			  ,s.[State] as StandardizedState
			  ,s.[Zip] as StandardizedZip
		  FROM [Platlabs].[dbo].[Platlabs_Src_Offices] o
		  JOIN Reports.dbo.SentToHW_Listings b  ON o.SrcMLSID = b.mls_id
		  JOIN ASP_Offcycle.addr.StandardizedAddress_Office s on o.SrcMLSID = s.mls_id and o.SrcMLSOfficeID = s.dp_office_id 
		  WHERE o.[LoadDate] > b.[DateSentUpdates]


