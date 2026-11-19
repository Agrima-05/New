SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vListingPriorValues]
AS
	SELECT
		lc.Listing_ID
		,MAX(CASE WHEN FieldId = 2 AND RowNum = 1 THEN Value END) AS Last_MLS_LIST_PRICE_STD
		,MAX(CASE WHEN FieldId = 2 AND RowNum = 2 THEN Value END) AS Prior_MLS_LIST_PRICE_STD
		,MAX(CASE WHEN FieldId = 2 AND RowNum = 1 THEN Original_UPDATE_FLAG_DATE_STD END) AS Last_MLS_LIST_PRICE_STD_Date
		,MAX(CASE WHEN FieldId = 2 AND RowNum = 2 THEN Original_UPDATE_FLAG_DATE_STD END) AS Prior_MLS_LIST_PRICE_STD_Date
		,MAX(CASE WHEN FieldId = 3 AND RowNum = 1 THEN Value END) AS Last_SOLD_PRICE_STD
		,MAX(CASE WHEN FieldId = 3 AND RowNum = 2 THEN Value END) AS Prior_SOLD_PRICE_STD
		,MAX(CASE WHEN FieldId = 3 AND RowNum = 1 THEN Original_UPDATE_FLAG_DATE_STD END) AS Last_SOLD_PRICE_STD_Date
		,MAX(CASE WHEN FieldId = 3 AND RowNum = 2 THEN Original_UPDATE_FLAG_DATE_STD END) AS Prior_SOLD_PRICE_STD_Date
		,MAX(CASE WHEN FieldId = 1 AND RowNum = 1 THEN Value END) AS Last_MLS_STATUS_STD
		,MAX(CASE WHEN FieldId = 1 AND RowNum = 2 THEN Value END) AS Prior_MLS_STATUS_STD
		,MAX(CASE WHEN FieldId = 1 AND RowNum = 1 THEN Original_UPDATE_FLAG_DATE_STD END) AS Last_MLS_STATUS_STD_Date
		,MAX(CASE WHEN FieldId = 1 AND RowNum = 2 THEN Original_UPDATE_FLAG_DATE_STD END) AS Prior_MLS_STATUS_STD_Date
		,MAX(CASE WHEN FieldId = 26 AND RowNum = 1 THEN Value END) AS Last_MLS_STATUS_SUB_TYPE_STD
		,MAX(CASE WHEN FieldId = 26 AND RowNum = 2 THEN Value END) AS Prior_MLS_STATUS_SUB_TYPE_STD
		,MAX(CASE WHEN FieldId = 26 AND RowNum = 1 THEN Original_UPDATE_FLAG_DATE_STD END) AS Last_MLS_STATUS_SUB_TYPE_STD_Date
		,MAX(CASE WHEN FieldId = 26 AND RowNum = 2 THEN Original_UPDATE_FLAG_DATE_STD END) AS Prior_MLS_STATUS_SUB_TYPE_STD_Date
	FROM (
		SELECT ChangeId, lc.Listing_ID, FieldId, ValueDate, lc.UpdateSeq, ChangeDate, Value, Original_UPDATE_FLAG_DATE_STD, ROW_NUMBER() OVER (PARTITION BY lc.Listing_ID, FieldId ORDER BY ChangeId DESC) AS RowNum
		FROM ListingChange lc WITH (NOLOCK) inner join ListingHistory lh on lh.Listing_ID=lc.Listing_ID and lh.UpdateSeq=lc.UpdateSeq
		WHERE FieldId IN (1, 2, 3, 26)
	) lc
	WHERE lc.RowNum <= 2
	GROUP BY lc.Listing_ID



