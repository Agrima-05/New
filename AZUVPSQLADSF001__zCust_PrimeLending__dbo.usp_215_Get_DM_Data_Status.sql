SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF







CREATE PROCEDURE [dbo].[usp_215_Get_DM_Data_Status] 
AS
BEGIN


	DECLARE @FIPS int, @REFID bigint

	TRUNCATE TABLE dbo.w_DM_Data

		DECLARE DM_DATA CURSOR FOR   
			SELECT FIPS,REF_ID	
			FROM w_UniqueRefId
			order by FIPS,REF_ID
  
		OPEN DM_DATA  
  
		FETCH NEXT FROM DM_DATA   
		INTO @FIPS, @REFID  
  
		WHILE @@FETCH_STATUS = 0  
			BEGIN  

				EXEC('INSERT INTO dbo.w_DM_Data 
				Select *
				FROM OPENQUERY([AZUVPSQLDTDB029.datatree.local],''Select [id],[dm_DocEdge_id],[Fips],[Property_Id],[SR_Unique_Id],[APN],[Owners],[Legal_Description],[Use_Code],[Year_Built],[Lot_Sqrft],[Residence_Sqrft],[Bathrooms],[Bedrooms],[Rooms],[Val_Transfer],[Date_Transfer],[SR_Seller],[Loan_Value],[Street_Number],[Street_Dir],[Street_Name],[Street_Type],[Street_Post_Dir],[Unit_Type],[Unit],[City],[State],[Zip],[Date_Transfer_Latest],[SR_Unique_Id_Latest],[SR_Buyer_Latest],[Loan_Value_Latest],[Market_Value],[Arms_Length_Id],[Updated],[Created],[SA_PRIVACY_CODE],[Status],[Document_Title],[FCDocRecordingDate],[FCDocBookPage],[FCDocInstrumentnumber],[RelatedDocumentInstrumentNumber],[RelatedDocumentRecordingDate],[CaseNumber],[Trustee_Reference_Number],[BorrowerName],[LenderName],[TrusteeName],[OriginalLoanAmount],[AuctionAddress],[AuctionCity],[RecordedAuctionDate],[RecordedOpeningBid],[MLS_Price],[MLS_Days_On_Market],[Data_Capture_Date],[Original_Date_Listed],[LenderFirstName],[TitleCompanyName],[CensusTract],[RelatedDocDocumentBookPage],[JudgmentAmount],[Lender_First_Name_Latest],[Title_Company_Name_Latest],[SR_Buyer],[Latest_Loan_Value ],[P_ID_IRIS_FRMTD],[Foreclosure_Flag],[REO_Sale_Flag],[POOL_CODE],[Latitude],[Longitude],[est_LotSqrfoot],[Do_Not_Mail],[Ethnicity],[LastMarket_Recording_Date],[LastMarket_SalePrice_varchar],[New_Construction],[LastMarket_SalePrice_null],[LastMarket_SalePrice],[OwnerName1Full],[Owner1FirstNameMiddleInitial],[Owner1LastName],[Owner1Suffix],[OwnerName2Full],[Owner2FirstNameMiddleInitial],[Owner2LastName],[Owner2Suffix],[OwnerName3Full],[OwnerName4Full],[OwnCorpInd1],[PlaceName],[own_etal_indicator],[ownership_rights_code],[owner_relationship_type] from CustomSearch.dbo.DM_Data with(NOLOCK) WHERE (FIPS = '+@FIPS+' and Property_ID = '+@RefID+')'') a 
				')
				FETCH NEXT FROM DM_DATA   
				INTO @FIPS, @REFID    
			END 
  
		CLOSE DM_DATA;  
		DEALLOCATE DM_DATA;  
	


END








