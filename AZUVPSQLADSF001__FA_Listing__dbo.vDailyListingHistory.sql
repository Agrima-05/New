SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vDailyListingHistory]
AS
Select lh.[Listing_ID]
,lh.[UPDATE_FLAG_DATE_STD]
,lh.[UpdateSeq]
,lh.[UpdateTimestamp]
,lh.[Original_UPDATE_FLAG_DATE_STD]
from dbo.ListingHistory lh WITH(NOLOCK) 
inner join vDailyListings t
on t.Listing_ID=lh.Listing_ID and t.UpdateSeq=lh.UpdateSeq 

