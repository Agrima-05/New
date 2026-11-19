SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


 CREATE view [dbo].[vPhotoLinks--] 
 as
 ---- PHOTO LINKS WITH REF_ID

	 Select b.FIPS,b.REF_ID,a.* from src_PlatLabs_photoLinks.[dbo].[vAllPhotos] a with(NOLOCK) JOIN listing.listingFull b  with(NOLOCK)
		on a.mls_id = b.mls_id 
		and a.mls_listing_id = b.mls_listing_id
		where b.mls_id in(Select mls_id from platlabs_update_config where code like '%_39' and active = '1')



