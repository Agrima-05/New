SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
CREATE PROCEDURE [Neo_Wrk].[CA23].[usp_AutoNameXref_Rule_A]                                              
AS                                                                              

/*** COUNTERS                                                       ***/        
   DECLARE @SUB                          INT                                    
   DECLARE @SUB1                         INT                                    
   DECLARE @SUB2                         INT                                    
   DECLARE @SUB3                         INT                                    
   DECLARE @SUB4	                     INT    
   DECLARE @SUB5	                     INT                                    
   DECLARE @SUB6	                     INT                                    
   DECLARE @SUB7	                     INT                                    
   DECLARE @SUB8	                     INT                                                                       
   DECLARE @START_SUB                    INT                                    
   DECLARE @STOP_SUB                     INT                                    
   DECLARE @MAX_SUB                      INT                                    
   DECLARE @INSERT_SUB                   INT                                    
   DECLARE @NEW_TBL_SUB                  INT                                    

   
   DECLARE @OLD_NM_LGL_NAME							CHAR(38)                     
   DECLARE @OLD_NM_XRF_REL                         CHAR(03)                      
   DECLARE @OLD_NM_XRF_NAME                        CHAR(38)                     
   
   DECLARE @NEW_NM_LGL_NAME                        CHAR(38)                     
   DECLARE @NEW_NM_XRF_REL                         CHAR(03)                      
   DECLARE @NEW_NM_XRF_NAME                        CHAR(38)                     

   DECLARE @T2_NM_LGL_NAME                        CHAR(38)                     
   DECLARE @T2_NM_XRF_REL                         CHAR(03)                      
   DECLARE @T2_NM_XRF_NAME                        CHAR(38)                     
   
   DECLARE @T3_NM_LGL_NAME                        CHAR(38)                     
   DECLARE @T3_NM_XRF_REL                         CHAR(03)                      
   DECLARE @T3_NM_XRF_NAME                        CHAR(38)                     

   DECLARE @T4_NM_LGL_NAME                        CHAR(38)                     
   DECLARE @T4_NM_XRF_REL                         CHAR(03)                      
   DECLARE @T4_NM_XRF_NAME                        CHAR(38)                     
                                                                                  
/*** #T0 TEMP TABLE FOR LAST NAME ROW ID IN DE_PTRAN_NAME           ***/        
   DECLARE @T0_LAST_ROW_ID                        INT                     
                                                                                  
/*** #T1 TEMP TABLE FOR ALL UNIQUE DOC_NBR AND DOC_NBR_SEQ AS KEY   ***/        
   DECLARE @T1_NM_DOC_NBR                          CHAR(18)                     
   DECLARE @T1_NM_DOC_NBR_SEQ                      CHAR(04)                     
   DECLARE @T1_NM_ENTITY_TYPE                      CHAR(01)          
                                                                                              
/*** #T2 TEMP TABLE FOR ALL NAME RECS OF DOC_NBR KEY                ***/        
/*** #T2 = PTRAN-TABLE-REC                                          ***/        
   DECLARE @T2_ROW_ID                              INT                          
   DECLARE @T2_NM_ROW_ID                           INT                          
   DECLARE @T2_NM_PARENT_ROW_ID                    INT                          
   DECLARE @T2_NM_STATE_CODE                       CHAR(02)                     
   DECLARE @T2_NM_COUNTY_CODE                      CHAR(02)                     
   DECLARE @T2_NM_DOC_NBR                          CHAR(18)                     
   DECLARE @T2_NM_DOC_NBR_SEQ                      CHAR(04)                     
   DECLARE @T2_NM_UPDATE_TYPE                      CHAR(01)                     
   DECLARE @T2_NM_ENTITY_TYPE                      CHAR(01)                     
   DECLARE @T2_NM_INDEX_CODE                       CHAR(01)                     
   DECLARE @T2_NM_RECORDING_DATE                   CHAR(08)                     
   DECLARE @T2_NM_SSN                              CHAR(09)                     
   DECLARE @T2_NM_ROLE                             CHAR(06)                     
   DECLARE @T2_NM_PARTY_IND                        CHAR(01)                     
   DECLARE @T2_NM_SEQ_NBR                          CHAR(04)                     
   DECLARE @T2_NM_FILLER1                          CHAR(02)                     
   DECLARE @T2_NM_ETAL_IND                         CHAR(01)                    
   DECLARE @T2_NM_SUFFIX                           CHAR(01)                     
   DECLARE @T2_NM_FILLER2                          CHAR(19)                     
   DECLARE @T2_NM_FILLER3                          CHAR(33)                     
   DECLARE @T2_NM_XRF_XIND                         CHAR(01)                     
   DECLARE @T2_NM_XRF_XREL                         CHAR(03)                     
   DECLARE @T2_NM_DOCTYPE                          CHAR(06)                     
   DECLARE @T2_NM_XRF_RULE                         CHAR(01)                     
   DECLARE @T2_NM_XRF_KEYED                        CHAR(01)                     
   DECLARE @T2_NM_XRF_GENNED                       CHAR(01)                     
   DECLARE @T2_NM_XRF_MTX_REL                      CHAR(03)                     
   DECLARE @T2_NM_REC_STATUS                       CHAR(01)                     
   DECLARE @T2_DE_PTRAN_ROW_ID                     INT                          
   DECLARE @T2_NM_POSTING_DATE                     CHAR(08)                     
   DECLARE @T2_NM_FUTURE_EXPANSION                 CHAR(07)                     
   DECLARE @T2_NM_QUESTIONABLE_IND                 CHAR(01)                     
   DECLARE @T2_NM_CORRECTION_IND                   CHAR(01)                     
   DECLARE @T2_NM_FEE_NUMBER                       CHAR(09)                     
   DECLARE @T2_NM_STATUS_IND                       CHAR(01)                     
   DECLARE @T2_NM_MAP_NAME                         CHAR(12)                     
                                                                                
/*** #T3 TEMP TABLE FOR ALL NAME RECS OF DOC_NBR KEY                ***/        
/*** #T3 = NEW-TRAN-REC                                             ***/        
   DECLARE @T3_ROW_ID                              INT                          
   DECLARE @T3_NM_ROW_ID                           INT                          
   DECLARE @T3_NM_PARENT_ROW_ID                    INT                          
   DECLARE @T3_NM_STATE_CODE                       CHAR(02)                     
   DECLARE @T3_NM_COUNTY_CODE                      CHAR(02)                     
   DECLARE @T3_NM_DOC_NBR                          CHAR(18)                     
   DECLARE @T3_NM_DOC_NBR_SEQ                      CHAR(04)                     
   DECLARE @T3_NM_UPDATE_TYPE                      CHAR(01)                     
   DECLARE @T3_NM_ENTITY_TYPE                      CHAR(01)                     
   DECLARE @T3_NM_INDEX_CODE                       CHAR(01)                     
   DECLARE @T3_NM_RECORDING_DATE                   CHAR(08)                     
   DECLARE @T3_NM_SSN                              CHAR(09)                     
   DECLARE @T3_NM_ROLE                             CHAR(06)                     
   DECLARE @T3_NM_PARTY_IND                        CHAR(01)                     
   DECLARE @T3_NM_SEQ_NBR                          CHAR(04)                     
   DECLARE @T3_NM_FILLER1                          CHAR(02)                     
   DECLARE @T3_NM_ETAL_IND                         CHAR(01)                      
   DECLARE @T3_NM_SUFFIX                           CHAR(01)                     
   DECLARE @T3_NM_FILLER2                          CHAR(19)                     
   DECLARE @T3_NM_FILLER3                          CHAR(33)                     
   DECLARE @T3_NM_XRF_XIND                         CHAR(01)                     
   DECLARE @T3_NM_XRF_XREL                         CHAR(03)                     
   DECLARE @T3_NM_DOCTYPE                          CHAR(06)                     
   DECLARE @T3_NM_XRF_RULE                         CHAR(01)                     
   DECLARE @T3_NM_XRF_KEYED                        CHAR(01)                     
   DECLARE @T3_NM_XRF_GENNED                       CHAR(01)                     
   DECLARE @T3_NM_XRF_MTX_REL                      CHAR(03)                     
   DECLARE @T3_NM_REC_STATUS                       CHAR(01)                     
   DECLARE @T3_DE_PTRAN_ROW_ID                     INT                          
   DECLARE @T3_NM_POSTING_DATE                     CHAR(08)                     
   DECLARE @T3_NM_FUTURE_EXPANSION                 CHAR(07)                     
   DECLARE @T3_NM_QUESTIONABLE_IND                 CHAR(01)                     
   DECLARE @T3_NM_CORRECTION_IND                   CHAR(01)                     
   DECLARE @T3_NM_FEE_NUMBER                       CHAR(09)                     
   DECLARE @T3_NM_STATUS_IND                       CHAR(01)                     
   DECLARE @T3_NM_MAP_NAME                         CHAR(12)                     
                                                                                
/*** #T4 = NEW-TRAN-REC (2ND REC WITHIN #T2)                        ***/        
   DECLARE @T4_ROW_ID                              INT                          
   DECLARE @T4_NM_ROW_ID                           INT                          
   DECLARE @T4_NM_PARENT_ROW_ID                    INT                          
   DECLARE @T4_NM_STATE_CODE                       CHAR(02)                     
   DECLARE @T4_NM_COUNTY_CODE                      CHAR(02)                     
   DECLARE @T4_NM_DOC_NBR                          CHAR(18)                     
   DECLARE @T4_NM_DOC_NBR_SEQ                      CHAR(04)                     
   DECLARE @T4_NM_UPDATE_TYPE                      CHAR(01)                     
   DECLARE @T4_NM_ENTITY_TYPE                      CHAR(01)                     
   DECLARE @T4_NM_INDEX_CODE                       CHAR(01)                     
   DECLARE @T4_NM_RECORDING_DATE                   CHAR(08)                     
   DECLARE @T4_NM_SSN                              CHAR(09)                     
   DECLARE @T4_NM_ROLE                             CHAR(06)                     
   DECLARE @T4_NM_PARTY_IND                        CHAR(01)                     
   DECLARE @T4_NM_SEQ_NBR                          CHAR(04)                     
   DECLARE @T4_NM_FILLER1                          CHAR(02)                     
   DECLARE @T4_NM_ETAL_IND                         CHAR(01)                      
   DECLARE @T4_NM_SUFFIX                           CHAR(01)                     
   DECLARE @T4_NM_FILLER2                          CHAR(19)                     
   DECLARE @T4_NM_FILLER3                          CHAR(33)                     
   DECLARE @T4_NM_XRF_XIND                         CHAR(01)                     
   DECLARE @T4_NM_XRF_XREL                         CHAR(03)                     
   DECLARE @T4_NM_DOCTYPE                          CHAR(06)                     
   DECLARE @T4_NM_XRF_RULE                         CHAR(01)                     
   DECLARE @T4_NM_XRF_KEYED                        CHAR(01)                     
   DECLARE @T4_NM_XRF_GENNED                       CHAR(01)                     
   DECLARE @T4_NM_XRF_MTX_REL                      CHAR(03)                     
   DECLARE @T4_NM_REC_STATUS                       CHAR(01)                     
   DECLARE @T4_DE_PTRAN_ROW_ID                     INT                          
   DECLARE @T4_NM_POSTING_DATE                     CHAR(08)                     
   DECLARE @T4_NM_FUTURE_EXPANSION                 CHAR(07)                     
   DECLARE @T4_NM_QUESTIONABLE_IND                 CHAR(01)                     
   DECLARE @T4_NM_CORRECTION_IND                   CHAR(01)                     
   DECLARE @T4_NM_FEE_NUMBER                       CHAR(09)                     
   DECLARE @T4_NM_STATUS_IND                       CHAR(01)                     
   DECLARE @T4_NM_MAP_NAME                         CHAR(12)                     
                                                                                
/*** FIELDS FOR #T2 TEMP TABLE (I.E. PTRAN-TABLE-REC)               ***/        
   DECLARE @OLD_ROW_ID                             INT                          
   DECLARE @OLD_NM_ROW_ID                          INT                          
   DECLARE @OLD_NM_PARENT_ROW_ID                   INT                   
   DECLARE @OLD_NM_STATE_CODE                      CHAR(02)                     
   DECLARE @OLD_NM_COUNTY_CODE                     CHAR(02)                     
   DECLARE @OLD_NM_DOC_NBR                         CHAR(18)                     
   DECLARE @OLD_NM_DOC_NBR_SEQ                     CHAR(04)                     
   DECLARE @OLD_NM_UPDATE_TYPE                     CHAR(01)                     
   DECLARE @OLD_NM_ENTITY_TYPE                     CHAR(01)                     
   DECLARE @OLD_NM_INDEX_CODE                      CHAR(01)                     
   DECLARE @OLD_NM_RECORDING_DATE                  CHAR(08)                     
   DECLARE @OLD_NM_SSN                             CHAR(09)                     
   DECLARE @OLD_NM_ROLE                            CHAR(06)                     
   DECLARE @OLD_NM_PARTY_IND                       CHAR(01)                     
   DECLARE @OLD_NM_SEQ_NBR                         CHAR(04)                     
   DECLARE @OLD_NM_FILLER1                         CHAR(02)                     
   DECLARE @OLD_NM_ETAL_IND                        CHAR(01)                      
   DECLARE @OLD_NM_SUFFIX                          CHAR(01)                     
   DECLARE @OLD_NM_FILLER2                         CHAR(19)                     
   DECLARE @OLD_NM_FILLER3                         CHAR(33)                     
   DECLARE @OLD_NM_XRF_XIND                        CHAR(01)                     
   DECLARE @OLD_NM_XRF_XREL                        CHAR(03)                     
   DECLARE @OLD_NM_DOCTYPE                         CHAR(06)                     
   DECLARE @OLD_NM_XRF_RULE                        CHAR(01)                     
   DECLARE @OLD_NM_XRF_KEYED                       CHAR(01)                     
   DECLARE @OLD_NM_XRF_GENNED                      CHAR(01)                     
   DECLARE @OLD_NM_XRF_MTX_REL                     CHAR(03)                     
   DECLARE @OLD_NM_REC_STATUS                      CHAR(01)                     
   DECLARE @OLD_DE_PTRAN_ROW_ID                    INT                          
   DECLARE @OLD_NM_POSTING_DATE                    CHAR(08)                     
   DECLARE @OLD_NM_FUTURE_EXPANSION                CHAR(07)                     
   DECLARE @OLD_NM_QUESTIONABLE_IND                CHAR(01)                     
   DECLARE @OLD_NM_CORRECTION_IND                  CHAR(01)                     
   DECLARE @OLD_NM_FEE_NUMBER                      CHAR(09)                     
   DECLARE @OLD_NM_STATUS_IND                      CHAR(01)                     
   DECLARE @OLD_NM_MAP_NAME                        CHAR(12)                     
                                                                              
/*** FIELDS FOR #T3 TEMP TABLE (I.E. NEW-TRAN-REC)                  ***/       
   DECLARE @NEW_ROW_ID                             INT                          
   DECLARE @NEW_NM_ROW_ID                          INT                          
   DECLARE @NEW_NM_PARENT_ROW_ID                   INT                           
   DECLARE @NEW_NM_STATE_CODE                      CHAR(02)                     
   DECLARE @NEW_NM_COUNTY_CODE                     CHAR(02)                     
   DECLARE @NEW_NM_DOC_NBR                         CHAR(18)                     
   DECLARE @NEW_NM_DOC_NBR_SEQ                     CHAR(04)                     
   DECLARE @NEW_NM_UPDATE_TYPE                     CHAR(01)                     
   DECLARE @NEW_NM_ENTITY_TYPE                     CHAR(01)                     
   DECLARE @NEW_NM_INDEX_CODE                      CHAR(01)                     
   DECLARE @NEW_NM_RECORDING_DATE                  CHAR(08)                     
   DECLARE @NEW_NM_SSN                             CHAR(09)                     
   DECLARE @NEW_NM_ROLE                            CHAR(06)                     
   DECLARE @NEW_NM_PARTY_IND                       CHAR(01)                     
   DECLARE @NEW_NM_SEQ_NBR                         CHAR(04)                     
   DECLARE @NEW_NM_FILLER1                         CHAR(02)                     
   DECLARE @NEW_NM_ETAL_IND                        CHAR(01)                      
   DECLARE @NEW_NM_SUFFIX                          CHAR(01)                     
   DECLARE @NEW_NM_FILLER2                         CHAR(19)                     
   DECLARE @NEW_NM_FILLER3                         CHAR(33)                     
   DECLARE @NEW_NM_XRF_XIND                        CHAR(01)                     
   DECLARE @NEW_NM_XRF_XREL                        CHAR(03)                     
   DECLARE @NEW_NM_DOCTYPE                         CHAR(06)                     
   DECLARE @NEW_NM_XRF_RULE                        CHAR(01)                     
   DECLARE @NEW_NM_XRF_KEYED                       CHAR(01)                     
   DECLARE @NEW_NM_XRF_GENNED                      CHAR(01)                     
   DECLARE @NEW_NM_XRF_MTX_REL                     CHAR(03)                     
   DECLARE @NEW_NM_REC_STATUS                      CHAR(01)                     
   DECLARE @NEW_DE_PTRAN_ROW_ID                    INT                          
   DECLARE @NEW_NM_POSTING_DATE                    CHAR(08)                     
   DECLARE @NEW_NM_FUTURE_EXPANSION                CHAR(07)                     
   DECLARE @NEW_NM_QUESTIONABLE_IND                CHAR(01)                     
   DECLARE @NEW_NM_CORRECTION_IND                  CHAR(01)                     
   DECLARE @NEW_NM_FEE_NUMBER                      CHAR(09)                     
   DECLARE @NEW_NM_STATUS_IND                      CHAR(01)                     
   DECLARE @NEW_NM_MAP_NAME                        CHAR(12)                     
                                                                                                                                                          
/*** Alter #T0 TEMP TABLE TO GET LAST NAME ROW ID                  ***/        
Create TABLE #T0 (                                                              
    [T0_LAST_ROW_ID]                     [INT] NOT NULL           
)   
                                                                                                                                                          
/*** Alter #T1 TEMP TABLE TO HOLD UNIQUE DOC_NBR KEY               ***/        
SELECT DISTINCT                                                                 
   [DE_PTRAN_NM_DOCUMENT_NBR]         AS [T1_NM_DOC_NBR]                        
  ,[DE_PTRAN_NM_DOCUMENT_NBR_SEQ]     AS [T1_NM_DOC_NBR_SEQ]       
  ,[DE_PTRAN_NM_ENTITY_TYPE]		  AS [T1_NM_ENTITY_TYPE]                           
INTO #T1                                                                        
FROM [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                                           
WHERE [DE_PTRAN_NM_XRF_RULE] = 'A'
ORDER BY                                                                        
   [DE_PTRAN_NM_DOCUMENT_NBR]         ASC                                       
  ,[DE_PTRAN_NM_DOCUMENT_NBR_SEQ]     ASC     
  ,[DE_PTRAN_NM_ENTITY_TYPE]		  ASC                                  
                                                                              
/*** Alter #T2 TEMP TABLE TO GET ALL NAME RECS WITH SAME DOC_NBR KEY */        
Create TABLE #T2 (                                                              
    [T2_ROW_ID]                          [INT] IDENTITY(1,1) NOT NULL           
   ,[T2_NM_ROW_ID]                       [INT] NOT NULL                         
   ,[T2_NM_PARENT_ROW_ID]                [INT] NOT NULL                         
   ,[T2_NM_STATE_CODE]                   [CHAR] (02) NOT NULL                   
   ,[T2_NM_COUNTY_CODE]                  [CHAR] (02) NOT NULL                   
   ,[T2_NM_DOC_NBR]                      [CHAR] (18) NOT NULL                   
   ,[T2_NM_DOC_NBR_SEQ]                  [CHAR] (04) NOT NULL                   
   ,[T2_NM_UPDATE_TYPE]                  [CHAR] (01) NOT NULL                   
   ,[T2_NM_ENTITY_TYPE]                  [CHAR] (01) NOT NULL                   
   ,[T2_NM_INDEX_CODE]                   [CHAR] (01) NOT NULL                   
   ,[T2_NM_RECORDING_DATE]               [CHAR] (08) NOT NULL                   
   ,[T2_NM_LGL_NAME]                     [CHAR] (38) NOT NULL                   
   ,[T2_NM_SSN]                          [CHAR] (09) NULL                       
   ,[T2_NM_ROLE]                         [CHAR] (06) NOT NULL                   
   ,[T2_NM_PARTY_IND]                    [CHAR] (01) NOT NULL                   
   ,[T2_NM_SEQ_NBR]                      [CHAR] (04) NOT NULL                   
   ,[T2_NM_FILLER1]                      [CHAR] (02) NOT NULL                   
   ,[T2_NM_ETAL_IND]                     [CHAR] (01) NOT NULL                   
   ,[T2_NM_SUFFIX]                       [CHAR] (01) NOT NULL                   
   ,[T2_NM_FILLER2]                      [CHAR] (19) NOT NULL                   
   ,[T2_NM_XRF_REL]                      [CHAR] (03) NOT NULL                   
   ,[T2_NM_XRF_NAME]                     [CHAR] (38) NOT NULL                   
   ,[T2_NM_FILLER3]                      [CHAR] (33) NOT NULL                   
   ,[T2_NM_XRF_XIND]                     [CHAR] (01) NOT NULL                   
   ,[T2_NM_XRF_XREL]                     [CHAR] (03) NOT NULL                   
   ,[T2_NM_DOCTYPE]                      [CHAR] (06) NOT NULL                   
   ,[T2_NM_XRF_RULE]                     [CHAR] (01) NOT NULL                   
   ,[T2_NM_XRF_KEYED]                    [CHAR] (01) NOT NULL                   
   ,[T2_NM_XRF_GENNED]                   [CHAR] (01) NOT NULL                   
   ,[T2_NM_XRF_MTX_REL]                  [CHAR] (03) NOT NULL                   
   ,[T2_NM_REC_STATUS]                   [CHAR] (01) NOT NULL                   
   ,[T2_DE_PTRAN_ROW_ID]                 [INT]       NOT NULL                   
   ,[T2_NM_POSTING_DATE]                 [CHAR] (08) NOT NULL                   
   ,[T2_NM_FUTURE_EXPANSION]             [CHAR] (07) NOT NULL                   
   ,[T2_NM_QUESTIONABLE_IND]             [CHAR] (01) NOT NULL                   
   ,[T2_NM_CORRECTION_IND]               [CHAR] (01) NOT NULL                   
   ,[T2_NM_FEE_NUMBER]                   [CHAR] (09) NOT NULL                   
   ,[T2_NM_STATUS_IND]                   [CHAR] (01) NOT NULL                   
   ,[T2_NM_MAP_NAME]                     [CHAR] (12) NOT NULL                   
)                                                                               
                                                                                
/*** Alter #T3 TEMP TABLE TO GET NAME REC FOR COMPARISON           ***/        
Create TABLE #T3 (                                                              
    [T3_ROW_ID]                          [INT] IDENTITY(1,1) NOT NULL           
   ,[T3_NM_ROW_ID]                       [INT] NOT NULL                         
   ,[T3_NM_PARENT_ROW_ID]                [INT] NOT NULL                         
   ,[T3_NM_STATE_CODE]                   [CHAR] (02) NOT NULL                   
   ,[T3_NM_COUNTY_CODE]                  [CHAR] (02) NOT NULL                   
   ,[T3_NM_DOC_NBR]                      [CHAR] (18) NOT NULL                   
   ,[T3_NM_DOC_NBR_SEQ]                  [CHAR] (04) NOT NULL                   
   ,[T3_NM_UPDATE_TYPE]                  [CHAR] (01) NOT NULL                   
   ,[T3_NM_ENTITY_TYPE]                  [CHAR] (01) NOT NULL                   
   ,[T3_NM_INDEX_CODE]                   [CHAR] (01) NOT NULL                   
   ,[T3_NM_RECORDING_DATE]               [CHAR] (08) NOT NULL                   
   ,[T3_NM_LGL_NAME]                     [CHAR] (38) NOT NULL                   
   ,[T3_NM_SSN]                          [CHAR] (09) NULL                       
   ,[T3_NM_ROLE]                         [CHAR] (06) NOT NULL                   
   ,[T3_NM_PARTY_IND]                    [CHAR] (01) NOT NULL                   
   ,[T3_NM_SEQ_NBR]                      [CHAR] (04) NOT NULL                   
   ,[T3_NM_FILLER1]                      [CHAR] (02) NOT NULL                   
   ,[T3_NM_ETAL_IND]                     [CHAR] (01) NOT NULL                   
   ,[T3_NM_SUFFIX]                       [CHAR] (01) NOT NULL                   
   ,[T3_NM_FILLER2]                      [CHAR] (19) NOT NULL                   
   ,[T3_NM_XRF_REL]                      [CHAR] (03) NOT NULL                   
   ,[T3_NM_XRF_NAME]                     [CHAR] (38) NOT NULL                   
   ,[T3_NM_FILLER3]                      [CHAR] (33) NOT NULL                   
   ,[T3_NM_XRF_XIND]                     [CHAR] (01) NOT NULL                   
   ,[T3_NM_XRF_XREL]                     [CHAR] (03) NOT NULL                   
   ,[T3_NM_DOCTYPE]                      [CHAR] (06) NOT NULL                   
   ,[T3_NM_XRF_RULE]                     [CHAR] (01) NOT NULL                   
   ,[T3_NM_XRF_KEYED]                    [CHAR] (01) NOT NULL                   
   ,[T3_NM_XRF_GENNED]                   [CHAR] (01) NOT NULL                   
   ,[T3_NM_XRF_MTX_REL]                  [CHAR] (03) NOT NULL                   
   ,[T3_NM_REC_STATUS]                   [CHAR] (01) NOT NULL                   
   ,[T3_DE_PTRAN_ROW_ID]                 [INT]       NOT NULL                   
   ,[T3_NM_POSTING_DATE]                 [CHAR] (08) NOT NULL                   
   ,[T3_NM_FUTURE_EXPANSION]             [CHAR] (07) NOT NULL                   
   ,[T3_NM_QUESTIONABLE_IND]             [CHAR] (01) NOT NULL                   
   ,[T3_NM_CORRECTION_IND]               [CHAR] (01) NOT NULL                   
   ,[T3_NM_FEE_NUMBER]                   [CHAR] (09) NOT NULL                   
   ,[T3_NM_STATUS_IND]                   [CHAR] (01) NOT NULL                   
   ,[T3_NM_MAP_NAME]                     [CHAR] (12) NOT NULL                   
)                                                                               
                                                                              
/*** Alter CURSOR TO GET UNIQUE DOC_NBR KEY ONE AT A TIME          ***/        
DECLARE UNQ_DOC CURSOR LOCAL FOR                                                
SELECT                                                                          
    [T1_NM_DOC_NBR]                                                             
   ,[T1_NM_DOC_NBR_SEQ]  
   ,[T1_NM_ENTITY_TYPE]                                                         
FROM #T1                                                                        
ORDER BY                                                                        
    [T1_NM_DOC_NBR]                     ASC                                     
   ,[T1_NM_DOC_NBR_SEQ]                 ASC    
   ,[T1_NM_ENTITY_TYPE]					ASC                                 
                                                                                
OPEN UNQ_DOC                                                                    

/*** GET FIRST DOC KEY FOR PROCESSING                               ***/                                                                                        
FETCH NEXT FROM UNQ_DOC INTO                                                    
    @T1_NM_DOC_NBR                                                              
   ,@T1_NM_DOC_NBR_SEQ                                                          
   ,@T1_NM_ENTITY_TYPE       
                                                   
WHILE @@FETCH_STATUS = 0                                                        
BEGIN   

/*** INITIALIZE TEMP TABLE #T2 AND INSERT ALL NAME RECORDS WITH THE ***/
/*** SAME DOC KEY                                                   ***/                                                                                        
	SET @INSERT_SUB = ISNULL((SELECT TOP 1 DE_PTRAN_NM_ROW_ID    
							  FROM Neo_Wrk.CA23.DE_PTRAN_NAME 
							  ORDER BY DE_PTRAN_NM_ROW_ID DESC), 0)  
	TRUNCATE TABLE #T0
	INSERT INTO #T0 ([T0_LAST_ROW_ID])
	SELECT @INSERT_SUB
	                                                                                  
    TRUNCATE TABLE #T2                                                                       
    INSERT INTO #T2 (                                                           
        [T2_NM_ROW_ID]                                                          
       ,[T2_NM_PARENT_ROW_ID]                                                   
       ,[T2_NM_STATE_CODE]                                                      
       ,[T2_NM_COUNTY_CODE]                                                     
       ,[T2_NM_DOC_NBR]                                                         
       ,[T2_NM_DOC_NBR_SEQ]                                                     
       ,[T2_NM_UPDATE_TYPE]                                                     
       ,[T2_NM_ENTITY_TYPE]                                                     
       ,[T2_NM_INDEX_CODE]                                                      
       ,[T2_NM_RECORDING_DATE]                                                  
       ,[T2_NM_LGL_NAME]                                                        
       ,[T2_NM_SSN]                                                             
       ,[T2_NM_ROLE]                                                            
       ,[T2_NM_PARTY_IND]                                                       
       ,[T2_NM_SEQ_NBR]                                                         
       ,[T2_NM_FILLER1]                                                         
       ,[T2_NM_ETAL_IND]                                                        
       ,[T2_NM_SUFFIX]                                                          
       ,[T2_NM_FILLER2]                                                         
       ,[T2_NM_XRF_REL]                                                         
       ,[T2_NM_XRF_NAME]                                                        
       ,[T2_NM_FILLER3]                                                         
       ,[T2_NM_XRF_XIND]                                                        
       ,[T2_NM_XRF_XREL]                                                        
       ,[T2_NM_DOCTYPE]                                                         
       ,[T2_NM_XRF_RULE]                                                        
       ,[T2_NM_XRF_KEYED]                                                       
       ,[T2_NM_XRF_GENNED]                                                      
       ,[T2_NM_XRF_MTX_REL]                                                     
       ,[T2_NM_REC_STATUS]                                                      
       ,[T2_DE_PTRAN_ROW_ID]                                                    
       ,[T2_NM_POSTING_DATE]                                                    
       ,[T2_NM_FUTURE_EXPANSION]                                                
       ,[T2_NM_QUESTIONABLE_IND]                                                
       ,[T2_NM_CORRECTION_IND]                                                  
       ,[T2_NM_FEE_NUMBER]                                                      
       ,[T2_NM_STATUS_IND]                                                      
       ,[T2_NM_MAP_NAME])                                                       
    SELECT                                                                      
        [DE_PTRAN_NM_ROW_ID]                                                    
       ,[DE_PTRAN_NM_PARENT_ROW_ID]                                             
       ,[DE_PTRAN_NM_STATE_CODE]                                                
       ,[DE_PTRAN_NM_COUNTY_CODE]                                               
       ,[DE_PTRAN_NM_DOCUMENT_NBR]                                              
       ,[DE_PTRAN_NM_DOCUMENT_NBR_SEQ]                                          
       ,[DE_PTRAN_NM_UPDATE_TYPE]                                               
       ,[DE_PTRAN_NM_ENTITY_TYPE]                                               
       ,[DE_PTRAN_NM_INDEX_CODE]                                                
       ,[DE_PTRAN_NM_RECORDING_DATE]                                            
       ,[DE_PTRAN_NM_LGL_NAME]                                                  
       ,[DE_PTRAN_NM_SSN]                                                       
       ,[DE_PTRAN_NM_ROLE]                                                      
       ,[DE_PTRAN_NM_PARTY_IND]                                                 
       ,[DE_PTRAN_NM_SEQ_NBR]                                                   
       ,[DE_PTRAN_NM_FILLER1]                                                   
       ,[DE_PTRAN_NM_ETAL_IND]                                                  
       ,[DE_PTRAN_NM_SUFFIX]                                                    
       ,[DE_PTRAN_NM_FILLER2]                                                   
       ,[DE_PTRAN_NM_XRF_REL]                                                   
       ,[DE_PTRAN_NM_XRF_NAME]                                                  
       ,[DE_PTRAN_NM_FILLER3]                                                   
       ,[DE_PTRAN_NM_XRF_XIND]                                                  
       ,[DE_PTRAN_NM_XRF_XREL]                                                  
       ,[DE_PTRAN_NM_DOCTYPE]                                                   
       ,[DE_PTRAN_NM_XRF_RULE]                                                  
       ,[DE_PTRAN_NM_XRF_KEYED]                                                 
       ,[DE_PTRAN_NM_XRF_GENNED]                                                
       ,[DE_PTRAN_NM_XRF_MTX_REL]                                               
       ,[DE_PTRAN_NM_REC_STATUS]                                                
       ,[DE_PTRAN_ROW_ID]                                                       
       ,[DE_PTRAN_NM_POSTING_DATE]                                              
       ,[DE_PTRAN_NM_FUTURE_EXPANSION]                                          
       ,[DE_PTRAN_NM_QUESTIONABLE_IND]                                          
       ,[DE_PTRAN_NM_CORRECTION_IND]                                            
       ,[DE_PTRAN_NM_FEE_NUMBER]                                                
       ,[DE_PTRAN_NM_STATUS_IND]                                                
       ,[DE_PTRAN_NM_MAP_NAME]                                                  
    FROM [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                                       
     WHERE                                                                      
         [DE_PTRAN_NM_DOCUMENT_NBR]      = @T1_NM_DOC_NBR                       
     AND [DE_PTRAN_NM_DOCUMENT_NBR_SEQ]  = @T1_NM_DOC_NBR_SEQ                   
     AND [DE_PTRAN_NM_ENTITY_TYPE]		 = @T1_NM_ENTITY_TYPE            
     ORDER BY                                                                   
         [DE_PTRAN_NM_DOCUMENT_NBR]      ASC                                    
        ,[DE_PTRAN_NM_DOCUMENT_NBR_SEQ]  ASC   
        ,[DE_PTRAN_NM_ENTITY_TYPE]		 ASC                                  
                                                                                
/*** 400-EXPLICIT-XREF                                              ***/        
    
     SET @MAX_SUB    = ISNULL((SELECT COUNT(*) FROM #T2), 0)                    
     SET @STOP_SUB   = @MAX_SUB                                                 
     SET @SUB        = 1                                                        

WHILE @SUB <= @STOP_SUB                                                         
BEGIN                                                                           
    SELECT                                                                      
        @T2_ROW_ID                  = T2_ROW_ID                                 
       ,@T2_NM_ROW_ID               = T2_NM_ROW_ID                              
       ,@T2_NM_PARENT_ROW_ID        = T2_NM_PARENT_ROW_ID                       
       ,@T2_NM_STATE_CODE           = T2_NM_STATE_CODE                          
       ,@T2_NM_COUNTY_CODE          = T2_NM_COUNTY_CODE                         
       ,@T2_NM_DOC_NBR              = T2_NM_DOC_NBR                             
       ,@T2_NM_DOC_NBR_SEQ          = T2_NM_DOC_NBR_SEQ                         
       ,@T2_NM_UPDATE_TYPE          = T2_NM_UPDATE_TYPE                         
       ,@T2_NM_ENTITY_TYPE          = T2_NM_ENTITY_TYPE                         
       ,@T2_NM_INDEX_CODE           = T2_NM_INDEX_CODE                          
       ,@T2_NM_RECORDING_DATE       = T2_NM_RECORDING_DATE                      
       ,@T2_NM_LGL_NAME             = T2_NM_LGL_NAME                            
       ,@T2_NM_SSN                  = T2_NM_SSN                                 
       ,@T2_NM_ROLE                 = T2_NM_ROLE                                
       ,@T2_NM_PARTY_IND            = T2_NM_PARTY_IND                           
       ,@T2_NM_SEQ_NBR              = T2_NM_SEQ_NBR                             
       ,@T2_NM_FILLER1              = T2_NM_FILLER1                             
       ,@T2_NM_ETAL_IND             = T2_NM_ETAL_IND                            
       ,@T2_NM_SUFFIX               = T2_NM_SUFFIX                              
       ,@T2_NM_FILLER2              = T2_NM_FILLER2                             
       ,@T2_NM_XRF_REL              = T2_NM_XRF_REL                             
       ,@T2_NM_XRF_NAME             = T2_NM_XRF_NAME                            
       ,@T2_NM_FILLER3              = T2_NM_FILLER3                             
       ,@T2_NM_XRF_XIND             = T2_NM_XRF_XIND                            
       ,@T2_NM_XRF_XREL             = T2_NM_XRF_XREL                            
       ,@T2_NM_DOCTYPE              = T2_NM_DOCTYPE                             
       ,@T2_NM_XRF_RULE             = T2_NM_XRF_RULE                            
       ,@T2_NM_XRF_KEYED            = T2_NM_XRF_KEYED                           
       ,@T2_NM_XRF_GENNED           = T2_NM_XRF_GENNED                          
       ,@T2_NM_XRF_MTX_REL          = T2_NM_XRF_MTX_REL                         
       ,@T2_NM_REC_STATUS           = T2_NM_REC_STATUS                          
       ,@T2_DE_PTRAN_ROW_ID         = T2_DE_PTRAN_ROW_ID                        
       ,@T2_NM_POSTING_DATE         = T2_NM_POSTING_DATE                        
       ,@T2_NM_FUTURE_EXPANSION     = T2_NM_FUTURE_EXPANSION                        
       ,@T2_NM_QUESTIONABLE_IND     = T2_NM_QUESTIONABLE_IND                        
       ,@T2_NM_CORRECTION_IND       = T2_NM_CORRECTION_IND                      
       ,@T2_NM_FEE_NUMBER           = T2_NM_FEE_NUMBER                          
       ,@T2_NM_STATUS_IND           = T2_NM_STATUS_IND                          
       ,@T2_NM_MAP_NAME             = T2_NM_MAP_NAME                            
    FROM #T2                                                                    
    WHERE T2_ROW_ID = @SUB                                                     
    
    SELECT @T0_LAST_ROW_ID = T0_LAST_ROW_ID FROM #T0
                                                                                
    IF  @T2_NM_XRF_KEYED = 'Y'
   AND (@T2_NM_XRF_XIND  = 'N'
    OR  @T2_NM_XRF_XIND  = 'X') 
                                              
        BEGIN                                                                   
            TRUNCATE TABLE #T3                                                  
            SET @T3_NM_LGL_NAME     = @T2_NM_XRF_NAME                           
            SET @T3_NM_SSN          = ' '                                     
            SET @T3_NM_ETAL_IND     = ' '                                       
            SET @T3_NM_SUFFIX       = ' '                                       
            SET @T3_NM_XRF_KEYED    = 'N'                                       
            SET @T3_NM_XRF_GENNED   = 'Y'                                       
            SET @T3_NM_REC_STATUS   = 'N'                                       
                                                                                
            IF  @T2_NM_XRF_XIND     = 'X'                                       
                BEGIN
					SET @T3_NM_XRF_REL  = @T2_NM_XRF_XREL                           
					SET @T3_NM_XRF_NAME = @T2_NM_LGL_NAME
                END                                       
            ELSE 
                BEGIN
					SET @T3_NM_XRF_REL  = ' '                                       
					SET @T3_NM_XRF_NAME = ' '
                END                        
                                                                                
     /*** GET DE_PTRAN_NAME LAST ROW ID                                  ***/        
            SELECT @T0_LAST_ROW_ID	= T0_LAST_ROW_ID 
            FROM #T0   
                                                                                                                                                          
            INSERT INTO #T3 (                                                   
                [T3_NM_ROW_ID]                                                  
               ,[T3_NM_PARENT_ROW_ID]                                           
               ,[T3_NM_STATE_CODE]                                              
               ,[T3_NM_COUNTY_CODE]                                             
               ,[T3_NM_DOC_NBR]                                                 
               ,[T3_NM_DOC_NBR_SEQ]                                             
               ,[T3_NM_UPDATE_TYPE]                                             
               ,[T3_NM_ENTITY_TYPE]                                             
               ,[T3_NM_INDEX_CODE]                                              
               ,[T3_NM_RECORDING_DATE]                                          
               ,[T3_NM_LGL_NAME]                                                
               ,[T3_NM_SSN]                                                     
               ,[T3_NM_ROLE]                                                    
               ,[T3_NM_PARTY_IND]                                               
               ,[T3_NM_SEQ_NBR]                                                 
               ,[T3_NM_FILLER1]                                                 
               ,[T3_NM_ETAL_IND]                                                
               ,[T3_NM_SUFFIX]                                                  
               ,[T3_NM_FILLER2]                                                 
               ,[T3_NM_XRF_REL]                                                 
               ,[T3_NM_XRF_NAME]                                                
               ,[T3_NM_FILLER3]                                                 
               ,[T3_NM_XRF_XIND]                                                
               ,[T3_NM_XRF_XREL]                                                
               ,[T3_NM_DOCTYPE]                                                 
               ,[T3_NM_XRF_RULE]                                                
               ,[T3_NM_XRF_KEYED]                                               
               ,[T3_NM_XRF_GENNED]                                              
               ,[T3_NM_XRF_MTX_REL]                                             
               ,[T3_NM_REC_STATUS]                                              
               ,[T3_DE_PTRAN_ROW_ID]                                            
               ,[T3_NM_POSTING_DATE]                                            
               ,[T3_NM_FUTURE_EXPANSION]                                        
               ,[T3_NM_QUESTIONABLE_IND]                                        
               ,[T3_NM_CORRECTION_IND]                                          
               ,[T3_NM_FEE_NUMBER]                                              
               ,[T3_NM_STATUS_IND]                                              
               ,[T3_NM_MAP_NAME])                                               
            VALUES (                                                            
                @T0_LAST_ROW_ID + 1                                                   
               ,@T2_NM_PARENT_ROW_ID                                            
               ,@T2_NM_STATE_CODE                                               
               ,@T2_NM_COUNTY_CODE                                              
               ,@T2_NM_DOC_NBR                                                  
               ,@T2_NM_DOC_NBR_SEQ                                              
               ,@T2_NM_UPDATE_TYPE                                              
               ,@T2_NM_ENTITY_TYPE                                              
               ,@T2_NM_INDEX_CODE                                               
               ,@T2_NM_RECORDING_DATE                                           
               ,@T3_NM_LGL_NAME                                                 
               ,@T3_NM_SSN                                                      
               ,@T2_NM_ROLE                                                     
               ,@T2_NM_PARTY_IND                                                
               ,@T2_NM_SEQ_NBR                                                  
               ,@T2_NM_FILLER1                                                  
               ,@T3_NM_ETAL_IND                                                 
               ,@T3_NM_SUFFIX                                                   
               ,@T2_NM_FILLER2                                                  
               ,@T3_NM_XRF_REL                                                  
               ,@T3_NM_XRF_NAME                                                 
               ,@T2_NM_FILLER3                                                  
               ,@T2_NM_XRF_XIND                                                 
               ,@T2_NM_XRF_XREL                                                 
               ,@T2_NM_DOCTYPE                                                  
               ,@T2_NM_XRF_RULE                                                 
               ,@T3_NM_XRF_KEYED                                                
               ,@T3_NM_XRF_GENNED                                               
               ,@T2_NM_XRF_MTX_REL                                              
               ,@T3_NM_REC_STATUS                                               
               ,@T2_DE_PTRAN_ROW_ID                                             
               ,@T2_NM_POSTING_DATE                                             
               ,@T2_NM_FUTURE_EXPANSION                                         
               ,@T2_NM_QUESTIONABLE_IND                                         
               ,@T2_NM_CORRECTION_IND    
               ,@T2_NM_FEE_NUMBER 
               ,@T2_NM_STATUS_IND 
               ,@T2_NM_MAP_NAME                                                 
            )  

/*** 700-INSERT-NEW-INTO-TABLE                                      ***/                                                                                      
            SET @SUB1     = ISNULL((SELECT COUNT(*) FROM #T3), 0)               
            WHILE @SUB1 <= @MAX_SUB                                             
            BEGIN                                                               
                SELECT                                                          
                    @NEW_ROW_ID               = T3_ROW_ID                       
                   ,@NEW_NM_ROW_ID            = T3_NM_ROW_ID                    
                   ,@NEW_NM_PARENT_ROW_ID     = T3_NM_PARENT_ROW_ID             
                   ,@NEW_NM_STATE_CODE        = T3_NM_STATE_CODE                
                   ,@NEW_NM_COUNTY_CODE       = T3_NM_COUNTY_CODE               
                   ,@NEW_NM_DOC_NBR           = T3_NM_DOC_NBR                   
                   ,@NEW_NM_DOC_NBR_SEQ       = T3_NM_DOC_NBR_SEQ               
                   ,@NEW_NM_UPDATE_TYPE       = T3_NM_UPDATE_TYPE               
                   ,@NEW_NM_ENTITY_TYPE       = T3_NM_ENTITY_TYPE               
                   ,@NEW_NM_INDEX_CODE        = T3_NM_INDEX_CODE                
                   ,@NEW_NM_RECORDING_DATE    = T3_NM_RECORDING_DATE            
                   ,@NEW_NM_LGL_NAME          = T3_NM_LGL_NAME                  
                   ,@NEW_NM_SSN               = T3_NM_SSN                       
                   ,@NEW_NM_ROLE              = T3_NM_ROLE                      
                   ,@NEW_NM_PARTY_IND         = T3_NM_PARTY_IND                 
                   ,@NEW_NM_SEQ_NBR           = T3_NM_SEQ_NBR                   
                   ,@NEW_NM_FILLER1           = T3_NM_FILLER1                   
                   ,@NEW_NM_ETAL_IND          = T3_NM_ETAL_IND                  
                   ,@NEW_NM_SUFFIX            = T3_NM_SUFFIX                    
                   ,@NEW_NM_FILLER2           = T3_NM_FILLER2                   
                   ,@NEW_NM_XRF_REL           = T3_NM_XRF_REL                   
                   ,@NEW_NM_XRF_NAME          = T3_NM_XRF_NAME                  
                   ,@NEW_NM_FILLER3           = T3_NM_FILLER3                   
                   ,@NEW_NM_XRF_XIND          = T3_NM_XRF_XIND                  
                   ,@NEW_NM_XRF_XREL          = T3_NM_XRF_XREL                  
                   ,@NEW_NM_DOCTYPE           = T3_NM_DOCTYPE                   
                   ,@NEW_NM_XRF_RULE          = T3_NM_XRF_RULE                  
                   ,@NEW_NM_XRF_KEYED         = T3_NM_XRF_KEYED                 
                   ,@NEW_NM_XRF_GENNED        = T3_NM_XRF_GENNED                
                   ,@NEW_NM_XRF_MTX_REL       = T3_NM_XRF_MTX_REL               
                   ,@NEW_NM_REC_STATUS        = T3_NM_REC_STATUS                
                   ,@NEW_DE_PTRAN_ROW_ID      = T3_DE_PTRAN_ROW_ID              
                   ,@NEW_NM_POSTING_DATE      = T3_NM_POSTING_DATE              
                   ,@NEW_NM_FUTURE_EXPANSION  = T3_NM_FUTURE_EXPANSION          
                   ,@NEW_NM_QUESTIONABLE_IND  = T3_NM_QUESTIONABLE_IND          
                   ,@NEW_NM_CORRECTION_IND    = T3_NM_CORRECTION_IND            
                   ,@NEW_NM_FEE_NUMBER        = T3_NM_FEE_NUMBER                
                   ,@NEW_NM_STATUS_IND        = T3_NM_STATUS_IND                
                   ,@NEW_NM_MAP_NAME          = T3_NM_MAP_NAME                  
                FROM #T3                                                        
                                                                                
                SELECT                                                          
                    @OLD_ROW_ID               = T2_ROW_ID                       
                   ,@OLD_NM_ROW_ID            = T2_NM_ROW_ID                    
                   ,@OLD_NM_PARENT_ROW_ID     = T2_NM_PARENT_ROW_ID             
                   ,@OLD_NM_STATE_CODE        = T2_NM_STATE_CODE                
                   ,@OLD_NM_COUNTY_CODE       = T2_NM_COUNTY_CODE               
                   ,@OLD_NM_DOC_NBR           = T2_NM_DOC_NBR                   
                   ,@OLD_NM_DOC_NBR_SEQ       = T2_NM_DOC_NBR_SEQ               
                   ,@OLD_NM_UPDATE_TYPE       = T2_NM_UPDATE_TYPE               
                   ,@OLD_NM_ENTITY_TYPE       = T2_NM_ENTITY_TYPE               
                   ,@OLD_NM_INDEX_CODE        = T2_NM_INDEX_CODE                
                   ,@OLD_NM_RECORDING_DATE    = T2_NM_RECORDING_DATE            
                   ,@OLD_NM_LGL_NAME          = T2_NM_LGL_NAME                  
                   ,@OLD_NM_SSN               = T2_NM_SSN                       
                   ,@OLD_NM_ROLE              = T2_NM_ROLE                      
                   ,@OLD_NM_PARTY_IND         = T2_NM_PARTY_IND                 
                   ,@OLD_NM_SEQ_NBR           = T2_NM_SEQ_NBR                   
                   ,@OLD_NM_FILLER1           = T2_NM_FILLER1                   
                   ,@OLD_NM_ETAL_IND          = T2_NM_ETAL_IND                  
                   ,@OLD_NM_SUFFIX            = T2_NM_SUFFIX                    
                   ,@OLD_NM_FILLER2           = T2_NM_FILLER2                   
                   ,@OLD_NM_XRF_REL           = T2_NM_XRF_REL                   
                   ,@OLD_NM_XRF_NAME          = T2_NM_XRF_NAME                  
                   ,@OLD_NM_FILLER3           = T2_NM_FILLER3                   
                   ,@OLD_NM_XRF_XIND          = T2_NM_XRF_XIND                  
                   ,@OLD_NM_XRF_XREL          = T2_NM_XRF_XREL                  
                   ,@OLD_NM_DOCTYPE           = T2_NM_DOCTYPE                   
                   ,@OLD_NM_XRF_RULE          = T2_NM_XRF_RULE                  
                   ,@OLD_NM_XRF_KEYED         = T2_NM_XRF_KEYED                 
                   ,@OLD_NM_XRF_GENNED        = T2_NM_XRF_GENNED                
                   ,@OLD_NM_XRF_MTX_REL       = T2_NM_XRF_MTX_REL               
                   ,@OLD_NM_REC_STATUS        = T2_NM_REC_STATUS                
                   ,@OLD_DE_PTRAN_ROW_ID      = T2_DE_PTRAN_ROW_ID              
                   ,@OLD_NM_POSTING_DATE      = T2_NM_POSTING_DATE              
                   ,@OLD_NM_FUTURE_EXPANSION  = T2_NM_FUTURE_EXPANSION          
                   ,@OLD_NM_QUESTIONABLE_IND  = T2_NM_QUESTIONABLE_IND          
                   ,@OLD_NM_CORRECTION_IND    = T2_NM_CORRECTION_IND            
                   ,@OLD_NM_FEE_NUMBER        = T2_NM_FEE_NUMBER                
                   ,@OLD_NM_STATUS_IND        = T2_NM_STATUS_IND                
                   ,@OLD_NM_MAP_NAME          = T2_NM_MAP_NAME                  
                FROM #T2                                                        
                WHERE T2_ROW_ID = @SUB1                                         
                                                                                
                                                                                
                IF   @OLD_NM_LGL_NAME         = @NEW_NM_LGL_NAME                
                AND (@OLD_NM_XRF_NAME         = @NEW_NM_XRF_NAME                
                OR   @OLD_NM_XRF_NAME         = ' ')                          
                    BEGIN                                                       
                    IF  @NEW_NM_XRF_GENNED    = 'Y'                            
                        BEGIN                                                   
							SET @OLD_NM_XRF_REL			= @NEW_NM_XRF_REL
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							SET DE_PTRAN_NM_XRF_REL		= @NEW_NM_XRF_REL
							   ,DE_PTRAN_NM_XRF_GENNED	= @NEW_NM_XRF_GENNED
							WHERE DE_PTRAN_NM_ROW_ID	= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							SET T2_NM_XRF_REL			= @NEW_NM_XRF_REL
							   ,T2_NM_XRF_GENNED		= @NEW_NM_XRF_GENNED
							WHERE T2_ROW_ID             = @OLD_ROW_ID                 
                        END 
                    IF  @OLD_NM_XRF_REL					= ' '                            
                        BEGIN                                                   
							SET @OLD_NM_XRF_REL			= @NEW_NM_XRF_REL
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							SET DE_PTRAN_NM_XRF_REL		= @NEW_NM_XRF_REL
							WHERE DE_PTRAN_NM_ROW_ID	= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							SET T2_NM_XRF_REL			= @NEW_NM_XRF_REL
							WHERE T2_ROW_ID             = @OLD_ROW_ID
							IF  @OLD_NM_REC_STATUS <> 'N'
						    BEGIN
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							   SET DE_PTRAN_NM_REC_STATUS  = 'U'            
							WHERE DE_PTRAN_NM_ROW_ID	= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							   SET T2_NM_REC_STATUS		= 'U'                       
							WHERE T2_ROW_ID             = @OLD_ROW_ID
						    END
                 
                        END                                                                                                   
                    IF @OLD_NM_XRF_NAME				    = ' '
						BEGIN
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
						    SET DE_PTRAN_NM_XRF_NAME	= @NEW_NM_XRF_NAME 
							WHERE DE_PTRAN_NM_ROW_ID	= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							SET T2_NM_XRF_NAME			= @NEW_NM_XRF_NAME 
							WHERE T2_ROW_ID             = @OLD_ROW_ID
							IF  @OLD_NM_REC_STATUS <> 'N'
						    BEGIN
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							   SET DE_PTRAN_NM_REC_STATUS  = 'U'            
							WHERE DE_PTRAN_NM_ROW_ID= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							   SET T2_NM_REC_STATUS	= 'U'                       
							WHERE T2_ROW_ID             = @OLD_ROW_ID
						    END 
						END                                               
					SET @SUB1                  = @MAX_SUB                       
					TRUNCATE TABLE #T3    
					BREAK                                      
                    END                                                         
                ELSE                                                            
                    SET @SUB1  = @SUB1 + 1
            END                                                                 
            BEGIN                                                               
                SET @SUB2      = ISNULL((SELECT COUNT(*) FROM #T3), 0)         
                IF  @SUB2      > 0                                              
                    BEGIN                                                       
                        INSERT INTO [Neo_Wrk].[CA23].[DE_PTRAN_NAME] (          
							[DE_PTRAN_NM_PARENT_ROW_ID]                         
                           ,[DE_PTRAN_NM_STATE_CODE]                            
                           ,[DE_PTRAN_NM_COUNTY_CODE]                           
                           ,[DE_PTRAN_NM_DOCUMENT_NBR]                               
                           ,[DE_PTRAN_NM_DOCUMENT_NBR_SEQ]                           
                           ,[DE_PTRAN_NM_UPDATE_TYPE]                           
                           ,[DE_PTRAN_NM_ENTITY_TYPE]                           
                           ,[DE_PTRAN_NM_INDEX_CODE]                            
                           ,[DE_PTRAN_NM_RECORDING_DATE]                        
                           ,[DE_PTRAN_NM_LGL_NAME]                              
                           ,[DE_PTRAN_NM_SSN]                                   
                           ,[DE_PTRAN_NM_ROLE]                                  
                           ,[DE_PTRAN_NM_PARTY_IND]                             
                           ,[DE_PTRAN_NM_SEQ_NBR]                               
                           ,[DE_PTRAN_NM_FILLER1]                               
                           ,[DE_PTRAN_NM_ETAL_IND]                              
                           ,[DE_PTRAN_NM_SUFFIX]                                
                           ,[DE_PTRAN_NM_FILLER2]                               
                           ,[DE_PTRAN_NM_XRF_REL]                               
                           ,[DE_PTRAN_NM_XRF_NAME]                              
                           ,[DE_PTRAN_NM_FILLER3]                               
                           ,[DE_PTRAN_NM_XRF_XIND]                              
                           ,[DE_PTRAN_NM_XRF_XREL]                              
                           ,[DE_PTRAN_NM_DOCTYPE]                               
                           ,[DE_PTRAN_NM_XRF_RULE]                              
                           ,[DE_PTRAN_NM_XRF_KEYED]                             
                           ,[DE_PTRAN_NM_XRF_GENNED]                            
                           ,[DE_PTRAN_NM_XRF_MTX_REL]                           
                           ,[DE_PTRAN_NM_REC_STATUS]                            
                           ,[DE_PTRAN_ROW_ID]                                   
                           ,[DE_PTRAN_NM_POSTING_DATE]                          
                           ,[DE_PTRAN_NM_FUTURE_EXPANSION]                      
                           ,[DE_PTRAN_NM_QUESTIONABLE_IND]                      
                           ,[DE_PTRAN_NM_CORRECTION_IND]                        
                           ,[DE_PTRAN_NM_FEE_NUMBER]                            
                           ,[DE_PTRAN_NM_STATUS_IND]                            
                           ,[DE_PTRAN_NM_MAP_NAME]                              
                        )                                                       
                        VALUES (                                                                                     
                            @NEW_DE_PTRAN_ROW_ID                                
                           ,@NEW_NM_STATE_CODE                                  
                           ,@NEW_NM_COUNTY_CODE                                 
                           ,@NEW_NM_DOC_NBR                                     
                           ,@NEW_NM_DOC_NBR_SEQ                                 
                           ,@NEW_NM_UPDATE_TYPE                                 
                           ,@NEW_NM_ENTITY_TYPE                                 
                           ,@NEW_NM_INDEX_CODE                                  
                           ,@NEW_NM_RECORDING_DATE                              
                           ,@NEW_NM_LGL_NAME                                    
                           ,@NEW_NM_SSN                                         
                           ,@NEW_NM_ROLE                                        
                           ,@NEW_NM_PARTY_IND                                   
                           ,@NEW_NM_SEQ_NBR                                     
                           ,@NEW_NM_FILLER1                                     
                           ,@NEW_NM_ETAL_IND                                    
                           ,@NEW_NM_SUFFIX                                      
                           ,@NEW_NM_FILLER2                                     
                           ,@NEW_NM_XRF_REL                                     
                           ,@NEW_NM_XRF_NAME                                    
                           ,@NEW_NM_FILLER3                                     
                           ,@NEW_NM_XRF_XIND                                    
                           ,@NEW_NM_XRF_XREL                                    
                           ,@NEW_NM_DOCTYPE                                     
                           ,@NEW_NM_XRF_RULE                                    
                           ,@NEW_NM_XRF_KEYED                                   
                           ,@NEW_NM_XRF_GENNED                                  
                           ,@NEW_NM_XRF_MTX_REL                                 
                           ,@NEW_NM_REC_STATUS                                  
                           ,@NEW_DE_PTRAN_ROW_ID                                
                           ,@NEW_NM_POSTING_DATE                                
                           ,@NEW_NM_FUTURE_EXPANSION                            
                           ,@NEW_NM_QUESTIONABLE_IND                            
                           ,@NEW_NM_CORRECTION_IND                              
                           ,@NEW_NM_FEE_NUMBER                                  
                           ,@NEW_NM_STATUS_IND                                  
                           ,@NEW_NM_MAP_NAME                                    
                        )       
                        SET @NEW_TBL_SUB = ISNULL((SELECT TOP 1 DE_PTRAN_NM_ROW_ID    
							  FROM Neo_Wrk.CA23.DE_PTRAN_NAME 
							  ORDER BY DE_PTRAN_NM_ROW_ID DESC), 0)  
                        SET @NEW_NM_ROW_ID = @NEW_TBL_SUB                                                                        
                        INSERT INTO #T2 (                                       
                            [T2_NM_ROW_ID]                                      
                           ,[T2_NM_PARENT_ROW_ID]                               
                           ,[T2_NM_STATE_CODE]                                  
                           ,[T2_NM_COUNTY_CODE]                                 
                           ,[T2_NM_DOC_NBR]                                     
                           ,[T2_NM_DOC_NBR_SEQ]                                 
                           ,[T2_NM_UPDATE_TYPE]                                 
                           ,[T2_NM_ENTITY_TYPE]                                 
                           ,[T2_NM_INDEX_CODE]                                  
                           ,[T2_NM_RECORDING_DATE]                              
                           ,[T2_NM_LGL_NAME]                                    
                           ,[T2_NM_SSN]                                         
                           ,[T2_NM_ROLE]                                        
                           ,[T2_NM_PARTY_IND]                                   
                           ,[T2_NM_SEQ_NBR]                                     
                           ,[T2_NM_FILLER1]                                     
                           ,[T2_NM_ETAL_IND]                                    
                           ,[T2_NM_SUFFIX]                                      
                           ,[T2_NM_FILLER2]                                     
                           ,[T2_NM_XRF_REL]                                     
                           ,[T2_NM_XRF_NAME]                                    
                           ,[T2_NM_FILLER3]                                     
                           ,[T2_NM_XRF_XIND]                                    
                           ,[T2_NM_XRF_XREL]                                    
                           ,[T2_NM_DOCTYPE]                                     
                           ,[T2_NM_XRF_RULE]                                    
                           ,[T2_NM_XRF_KEYED]                                   
                           ,[T2_NM_XRF_GENNED]                                  
                           ,[T2_NM_XRF_MTX_REL]                                 
                           ,[T2_NM_REC_STATUS]                                  
                           ,[T2_DE_PTRAN_ROW_ID]                                
                           ,[T2_NM_POSTING_DATE]                                
                           ,[T2_NM_FUTURE_EXPANSION]                            
                           ,[T2_NM_QUESTIONABLE_IND]                            
                           ,[T2_NM_CORRECTION_IND]                              
                           ,[T2_NM_FEE_NUMBER]                                  
                           ,[T2_NM_STATUS_IND]                                  
                           ,[T2_NM_MAP_NAME]                                    
                        )                                                       
                        VALUES (                                                
                            @NEW_NM_ROW_ID                                      
                           ,@NEW_DE_PTRAN_ROW_ID                                
                           ,@NEW_NM_STATE_CODE                                  
                           ,@NEW_NM_COUNTY_CODE                                 
                           ,@NEW_NM_DOC_NBR                                     
                           ,@NEW_NM_DOC_NBR_SEQ                                 
                           ,@NEW_NM_UPDATE_TYPE                                 
                           ,@NEW_NM_ENTITY_TYPE                                 
                           ,@NEW_NM_INDEX_CODE                                  
                           ,@NEW_NM_RECORDING_DATE                              
                           ,@NEW_NM_LGL_NAME                                    
                           ,@NEW_NM_SSN                                         
                           ,@NEW_NM_ROLE                                        
                           ,@NEW_NM_PARTY_IND                                   
                           ,@NEW_NM_SEQ_NBR                                     
                           ,@NEW_NM_FILLER1                                     
                           ,@NEW_NM_ETAL_IND                                    
                           ,@NEW_NM_SUFFIX                                      
                           ,@NEW_NM_FILLER2                                     
                           ,@NEW_NM_XRF_REL                                     
                           ,@NEW_NM_XRF_NAME                                    
                           ,@NEW_NM_FILLER3                                     
                           ,@NEW_NM_XRF_XIND                                    
                           ,@NEW_NM_XRF_XREL                                    
                           ,@NEW_NM_DOCTYPE                                     
                           ,@NEW_NM_XRF_RULE                                    
                           ,@NEW_NM_XRF_KEYED                                   
                           ,@NEW_NM_XRF_GENNED                                  
                           ,@NEW_NM_XRF_MTX_REL                                 
                           ,@NEW_NM_REC_STATUS                                  
                           ,@NEW_DE_PTRAN_ROW_ID                                
                           ,@NEW_NM_POSTING_DATE                                
                           ,@NEW_NM_FUTURE_EXPANSION                            
                           ,@NEW_NM_QUESTIONABLE_IND                            
                           ,@NEW_NM_CORRECTION_IND                              
                           ,@NEW_NM_FEE_NUMBER                                  
                           ,@NEW_NM_STATUS_IND                                  
                           ,@NEW_NM_MAP_NAME                                    
                        )    
                        SET @MAX_SUB     = @MAX_SUB + 1
                        UPDATE #T0 SET T0_LAST_ROW_ID = @NEW_NM_ROW_ID                                                                            
                        TRUNCATE TABLE #T3                                            
                    END                                                         
            END                                                                 
        END                                                                     
            SET @SUB = @SUB + 1    
                                                                
END    
/*** 400-EXPLICIT-XREF-EXIT                                         ***/        

/*** 500-ALL-XREF                                                   ***/      
/*** READ NAME RECS SEQUENTIALLY BASED ON DOC KEY                   ***/        
                                                                                
SET @MAX_SUB    = ISNULL((SELECT COUNT(*) FROM #T2), 0)                         
SET @STOP_SUB   = @MAX_SUB                                                      
SET @SUB3       = 1                                                             

WHILE @SUB3	   <=	@STOP_SUB                                                     
BEGIN                                                                           
	/*** READ 1ST NAME REC                                      ***/        
                                                                                
    SELECT                                                                      
        @T2_ROW_ID                  = T2_ROW_ID                                 
       ,@T2_NM_ROW_ID               = T2_NM_ROW_ID                              
       ,@T2_NM_PARENT_ROW_ID        = T2_NM_PARENT_ROW_ID                       
       ,@T2_NM_STATE_CODE           = T2_NM_STATE_CODE                          
       ,@T2_NM_COUNTY_CODE          = T2_NM_COUNTY_CODE                         
       ,@T2_NM_DOC_NBR              = T2_NM_DOC_NBR                             
       ,@T2_NM_DOC_NBR_SEQ          = T2_NM_DOC_NBR_SEQ                         
       ,@T2_NM_UPDATE_TYPE          = T2_NM_UPDATE_TYPE                         
       ,@T2_NM_ENTITY_TYPE          = T2_NM_ENTITY_TYPE                         
       ,@T2_NM_INDEX_CODE           = T2_NM_INDEX_CODE                          
       ,@T2_NM_RECORDING_DATE       = T2_NM_RECORDING_DATE                      
       ,@T2_NM_LGL_NAME             = T2_NM_LGL_NAME                            
       ,@T2_NM_SSN                  = T2_NM_SSN                                 
       ,@T2_NM_ROLE                 = T2_NM_ROLE                                
       ,@T2_NM_PARTY_IND            = T2_NM_PARTY_IND                           
       ,@T2_NM_SEQ_NBR              = T2_NM_SEQ_NBR                             
       ,@T2_NM_FILLER1              = T2_NM_FILLER1                             
       ,@T2_NM_ETAL_IND             = T2_NM_ETAL_IND                            
       ,@T2_NM_SUFFIX               = T2_NM_SUFFIX                              
       ,@T2_NM_FILLER2              = T2_NM_FILLER2                             
       ,@T2_NM_XRF_REL              = T2_NM_XRF_REL                             
       ,@T2_NM_XRF_NAME             = T2_NM_XRF_NAME                            
       ,@T2_NM_FILLER3              = T2_NM_FILLER3                             
       ,@T2_NM_XRF_XIND             = T2_NM_XRF_XIND                            
       ,@T2_NM_XRF_XREL             = T2_NM_XRF_XREL                            
       ,@T2_NM_DOCTYPE              = T2_NM_DOCTYPE                             
       ,@T2_NM_XRF_RULE             = T2_NM_XRF_RULE                            
       ,@T2_NM_XRF_KEYED            = T2_NM_XRF_KEYED                           
       ,@T2_NM_XRF_GENNED           = T2_NM_XRF_GENNED                          
       ,@T2_NM_XRF_MTX_REL          = T2_NM_XRF_MTX_REL                         
       ,@T2_NM_REC_STATUS           = T2_NM_REC_STATUS                          
       ,@T2_DE_PTRAN_ROW_ID         = T2_DE_PTRAN_ROW_ID                        
       ,@T2_NM_POSTING_DATE         = T2_NM_POSTING_DATE                        
       ,@T2_NM_FUTURE_EXPANSION     = T2_NM_FUTURE_EXPANSION                    
       ,@T2_NM_QUESTIONABLE_IND     = T2_NM_QUESTIONABLE_IND                    
       ,@T2_NM_CORRECTION_IND       = T2_NM_CORRECTION_IND                      
       ,@T2_NM_FEE_NUMBER           = T2_NM_FEE_NUMBER                          
       ,@T2_NM_STATUS_IND           = T2_NM_STATUS_IND                          
       ,@T2_NM_MAP_NAME             = T2_NM_MAP_NAME                            
    FROM #T2                                                                    
    WHERE T2_ROW_ID = @SUB3    
                                                                                                                                  
    SET @START_SUB	 = @SUB3 + 1		                                               
    SET @SUB4		 = @START_SUB                                                    
                                                                                
   	WHILE @SUB4	<=	@STOP_SUB                                                    
	   BEGIN                                                                       
/*** READ NEXT LEGAL RECORD FOR COMPARISON                          ***/        
                                                                                
	   SELECT                                                                      
                                                                                
        @T4_ROW_ID                  = T2_ROW_ID                                 
       ,@T4_NM_ROW_ID               = T2_NM_ROW_ID                              
       ,@T4_NM_PARENT_ROW_ID        = T2_NM_PARENT_ROW_ID                       
       ,@T4_NM_STATE_CODE           = T2_NM_STATE_CODE                          
       ,@T4_NM_COUNTY_CODE          = T2_NM_COUNTY_CODE                         
       ,@T4_NM_DOC_NBR              = T2_NM_DOC_NBR                             
       ,@T4_NM_DOC_NBR_SEQ          = T2_NM_DOC_NBR_SEQ                         
       ,@T4_NM_UPDATE_TYPE          = T2_NM_UPDATE_TYPE                         
       ,@T4_NM_ENTITY_TYPE          = T2_NM_ENTITY_TYPE                         
       ,@T4_NM_INDEX_CODE           = T2_NM_INDEX_CODE                          
       ,@T4_NM_RECORDING_DATE       = T2_NM_RECORDING_DATE                      
       ,@T4_NM_LGL_NAME             = T2_NM_LGL_NAME                            
       ,@T4_NM_SSN                  = T2_NM_SSN                                 
       ,@T4_NM_ROLE                 = T2_NM_ROLE                                
       ,@T4_NM_PARTY_IND            = T2_NM_PARTY_IND                           
       ,@T4_NM_SEQ_NBR              = T2_NM_SEQ_NBR                             
       ,@T4_NM_FILLER1              = T2_NM_FILLER1                             
       ,@T4_NM_ETAL_IND             = T2_NM_ETAL_IND                            
       ,@T4_NM_SUFFIX               = T2_NM_SUFFIX                              
       ,@T4_NM_FILLER2              = T2_NM_FILLER2                             
       ,@T4_NM_XRF_REL              = T2_NM_XRF_REL                             
       ,@T4_NM_XRF_NAME             = T2_NM_XRF_NAME                            
       ,@T4_NM_FILLER3              = T2_NM_FILLER3                             
       ,@T4_NM_XRF_XIND             = T2_NM_XRF_XIND                            
       ,@T4_NM_XRF_XREL             = T2_NM_XRF_XREL                            
       ,@T4_NM_DOCTYPE              = T2_NM_DOCTYPE                             
       ,@T4_NM_XRF_RULE             = T2_NM_XRF_RULE                            
       ,@T4_NM_XRF_KEYED            = T2_NM_XRF_KEYED                           
       ,@T4_NM_XRF_GENNED           = T2_NM_XRF_GENNED                          
       ,@T4_NM_XRF_MTX_REL          = T2_NM_XRF_MTX_REL                         
       ,@T4_NM_REC_STATUS           = T2_NM_REC_STATUS                          
       ,@T4_DE_PTRAN_ROW_ID         = T2_DE_PTRAN_ROW_ID                        
       ,@T4_NM_POSTING_DATE         = T2_NM_POSTING_DATE                        
       ,@T4_NM_FUTURE_EXPANSION     = T2_NM_FUTURE_EXPANSION                    
       ,@T4_NM_QUESTIONABLE_IND     = T2_NM_QUESTIONABLE_IND                    
       ,@T4_NM_CORRECTION_IND       = T2_NM_CORRECTION_IND                      
       ,@T4_NM_FEE_NUMBER           = T2_NM_FEE_NUMBER                          
       ,@T4_NM_STATUS_IND           = T2_NM_STATUS_IND                          
       ,@T4_NM_MAP_NAME             = T2_NM_MAP_NAME                            
    FROM #T2                                                                    
    WHERE T2_ROW_ID = @SUB4                                                     
                                                                                
/*** COMPARE 1ST AND 2ND RECORDS AND IF THEY ARE DIFFERENT THEN     ***/        
/*** PUSH 1ST REC LGL_NAME AND 2ND REC LGL NAME INTO TEMP TABLE #T3 ***/        
/*** AS NEW REC LGL_NAME AND XRF_NAME                               ***/        
		IF	@T2_NM_LGL_NAME = @T4_NM_LGL_NAME                                    
          	SET @SUB4	= @SUB4 + 1                                                                                                           
/***IF	@T2_NM_LGL_NAME <> @T4_NM_LGL_NAME                          ***/         
		ELSE                                                                        
/*** Alter NEW-TRAN-REC                                            ***/        
      		BEGIN   -- IF	@T2_NM_LGL_NAME <> @T4_NM_LGL_NAME                                                                
            TRUNCATE TABLE #T3                                                  
            SET @T3_NM_LGL_NAME     = @T2_NM_LGL_NAME                           
            SET @T3_NM_XRF_NAME     = @T4_NM_LGL_NAME                           
            SET @T3_NM_XRF_KEYED    = 'N'                                       
            SET @T3_NM_XRF_GENNED   = 'N'                                       
            SET @T3_NM_REC_STATUS   = 'N'                                       
    --013013                                                                            
            --IF  @T2_NM_ROLE			= @T4_NM_ROLE                                     
            --    BEGIN                                                           
                    SET @T3_NM_XRF_REL = @T2_NM_XRF_MTX_REL                     
            --    END                                                             
            --ELSE                                                                
            -- 	BEGIN                                                           
            --        SET @T3_NM_XRF_REL = @T4_NM_XRF_MTX_REL                                   
            --    END                                                             
/*** GET DE_PTRAN_NAME LAST ROW ID                                  ***/        
            SELECT @T0_LAST_ROW_ID	= T0_LAST_ROW_ID 
            FROM #T0   
                                                                               
            INSERT INTO #T3 (                                                   
                [T3_NM_ROW_ID]                                                  
               ,[T3_NM_PARENT_ROW_ID]                                           
               ,[T3_NM_STATE_CODE]                                              
               ,[T3_NM_COUNTY_CODE]                                             
               ,[T3_NM_DOC_NBR]                                                 
               ,[T3_NM_DOC_NBR_SEQ]                                             
               ,[T3_NM_UPDATE_TYPE]                                             
               ,[T3_NM_ENTITY_TYPE]                                             
               ,[T3_NM_INDEX_CODE]                                              
               ,[T3_NM_RECORDING_DATE]                                          
               ,[T3_NM_LGL_NAME]                                                
               ,[T3_NM_SSN]                                                     
               ,[T3_NM_ROLE]                                                    
               ,[T3_NM_PARTY_IND]                                               
               ,[T3_NM_SEQ_NBR]                                                 
               ,[T3_NM_FILLER1]                                                 
               ,[T3_NM_ETAL_IND]                                                
               ,[T3_NM_SUFFIX]                                                  
               ,[T3_NM_FILLER2]                                                 
               ,[T3_NM_XRF_REL]                                                 
               ,[T3_NM_XRF_NAME]                                                
               ,[T3_NM_FILLER3]                                                 
               ,[T3_NM_XRF_XIND]                                                
               ,[T3_NM_XRF_XREL]                                                
               ,[T3_NM_DOCTYPE]                                                 
               ,[T3_NM_XRF_RULE]                                                
               ,[T3_NM_XRF_KEYED]                                               
               ,[T3_NM_XRF_GENNED]                                              
               ,[T3_NM_XRF_MTX_REL]                                             
               ,[T3_NM_REC_STATUS]                                              
               ,[T3_DE_PTRAN_ROW_ID]                                            
               ,[T3_NM_POSTING_DATE]                                            
               ,[T3_NM_FUTURE_EXPANSION]                                        
               ,[T3_NM_QUESTIONABLE_IND]                                        
               ,[T3_NM_CORRECTION_IND]                                          
               ,[T3_NM_FEE_NUMBER]                                              
               ,[T3_NM_STATUS_IND]                                              
               ,[T3_NM_MAP_NAME])                                               
            VALUES (                                                            
                @T0_LAST_ROW_ID + 1                                                   
               ,@T2_NM_PARENT_ROW_ID                                            
               ,@T2_NM_STATE_CODE                                               
               ,@T2_NM_COUNTY_CODE                                              
               ,@T2_NM_DOC_NBR                                                  
               ,@T2_NM_DOC_NBR_SEQ                                              
               ,@T2_NM_UPDATE_TYPE                                              
               ,@T2_NM_ENTITY_TYPE                                              
               ,@T2_NM_INDEX_CODE                                               
               ,@T2_NM_RECORDING_DATE                                           
               ,@T3_NM_LGL_NAME                                                 
               ,@T2_NM_SSN                                                      
               ,@T2_NM_ROLE                                                     
               ,@T2_NM_PARTY_IND                                                
               ,@T2_NM_SEQ_NBR                                                  
               ,@T2_NM_FILLER1                                                  
               ,@T2_NM_ETAL_IND                                                 
               ,@T2_NM_SUFFIX                                                   
               ,@T2_NM_FILLER2                                                  
               ,@T3_NM_XRF_REL                                                  
               ,@T3_NM_XRF_NAME                                                 
               ,@T2_NM_FILLER3                                                  
               ,@T2_NM_XRF_XIND                                                 
               ,@T2_NM_XRF_XREL                                                 
               ,@T2_NM_DOCTYPE                                                  
               ,@T2_NM_XRF_RULE                                                 
               ,@T3_NM_XRF_KEYED                                                
               ,@T3_NM_XRF_GENNED                                               
               ,@T2_NM_XRF_MTX_REL                                              
               ,@T3_NM_REC_STATUS                                               
               ,@T2_DE_PTRAN_ROW_ID                                             
               ,@T2_NM_POSTING_DATE                                             
               ,@T2_NM_FUTURE_EXPANSION                                         
               ,@T2_NM_QUESTIONABLE_IND                                         
               ,@T2_NM_CORRECTION_IND                                           
               ,@T2_NM_FEE_NUMBER                                               
               ,@T2_NM_STATUS_IND                                               
               ,@T2_NM_MAP_NAME                                                 
                )                                                               
                                                                                
/*** 700-INSERT-NEW-INTO-TABLE                                      ***/        
        SET @SUB5	 = ISNULL((SELECT COUNT(*) FROM #T3), 0)                   
                                                                                
        WHILE @SUB5	<= @MAX_SUB                                                 
         	BEGIN --@SUB5	<= @MAX_SUB     
            SELECT                                                              
                @OLD_ROW_ID               = T2_ROW_ID                           
               ,@OLD_NM_ROW_ID            = T2_NM_ROW_ID                        
               ,@OLD_NM_PARENT_ROW_ID     = T2_NM_PARENT_ROW_ID                 
               ,@OLD_NM_STATE_CODE        = T2_NM_STATE_CODE                    
               ,@OLD_NM_COUNTY_CODE       = T2_NM_COUNTY_CODE                   
               ,@OLD_NM_DOC_NBR           = T2_NM_DOC_NBR                       
               ,@OLD_NM_DOC_NBR_SEQ       = T2_NM_DOC_NBR_SEQ                   
               ,@OLD_NM_UPDATE_TYPE       = T2_NM_UPDATE_TYPE                   
               ,@OLD_NM_ENTITY_TYPE       = T2_NM_ENTITY_TYPE                   
               ,@OLD_NM_INDEX_CODE        = T2_NM_INDEX_CODE                    
               ,@OLD_NM_RECORDING_DATE    = T2_NM_RECORDING_DATE                
               ,@OLD_NM_LGL_NAME          = T2_NM_LGL_NAME                      
               ,@OLD_NM_SSN               = T2_NM_SSN                           
               ,@OLD_NM_ROLE              = T2_NM_ROLE                          
               ,@OLD_NM_PARTY_IND         = T2_NM_PARTY_IND                     
               ,@OLD_NM_SEQ_NBR           = T2_NM_SEQ_NBR                       
               ,@OLD_NM_FILLER1           = T2_NM_FILLER1                       
               ,@OLD_NM_ETAL_IND          = T2_NM_ETAL_IND                      
               ,@OLD_NM_SUFFIX            = T2_NM_SUFFIX                        
               ,@OLD_NM_FILLER2           = T2_NM_FILLER2                       
               ,@OLD_NM_XRF_REL           = T2_NM_XRF_REL                       
               ,@OLD_NM_XRF_NAME          = T2_NM_XRF_NAME                      
               ,@OLD_NM_FILLER3           = T2_NM_FILLER3                       
               ,@OLD_NM_XRF_XIND          = T2_NM_XRF_XIND                      
               ,@OLD_NM_XRF_XREL          = T2_NM_XRF_XREL                      
               ,@OLD_NM_DOCTYPE           = T2_NM_DOCTYPE                       
               ,@OLD_NM_XRF_RULE          = T2_NM_XRF_RULE                      
               ,@OLD_NM_XRF_KEYED         = T2_NM_XRF_KEYED                     
               ,@OLD_NM_XRF_GENNED        = T2_NM_XRF_GENNED                    
               ,@OLD_NM_XRF_MTX_REL       = T2_NM_XRF_MTX_REL                   
               ,@OLD_NM_REC_STATUS        = T2_NM_REC_STATUS                    
               ,@OLD_DE_PTRAN_ROW_ID      = T2_DE_PTRAN_ROW_ID                  
               ,@OLD_NM_POSTING_DATE      = T2_NM_POSTING_DATE                  
               ,@OLD_NM_FUTURE_EXPANSION  = T2_NM_FUTURE_EXPANSION              
               ,@OLD_NM_QUESTIONABLE_IND  = T2_NM_QUESTIONABLE_IND              
               ,@OLD_NM_CORRECTION_IND    = T2_NM_CORRECTION_IND                
               ,@OLD_NM_FEE_NUMBER        = T2_NM_FEE_NUMBER                    
               ,@OLD_NM_STATUS_IND        = T2_NM_STATUS_IND                    
               ,@OLD_NM_MAP_NAME          = T2_NM_MAP_NAME                      
            FROM #T2                                                            
            WHERE T2_ROW_ID = @SUB5                                             
                                                                         
            SELECT                                                              
                @NEW_ROW_ID               = T3_ROW_ID                           
               ,@NEW_NM_ROW_ID            = T3_NM_ROW_ID                        
               ,@NEW_NM_PARENT_ROW_ID     = T3_NM_PARENT_ROW_ID                 
               ,@NEW_NM_STATE_CODE        = T3_NM_STATE_CODE                    
               ,@NEW_NM_COUNTY_CODE       = T3_NM_COUNTY_CODE                   
               ,@NEW_NM_DOC_NBR           = T3_NM_DOC_NBR                       
               ,@NEW_NM_DOC_NBR_SEQ       = T3_NM_DOC_NBR_SEQ                   
               ,@NEW_NM_UPDATE_TYPE       = T3_NM_UPDATE_TYPE                   
               ,@NEW_NM_ENTITY_TYPE       = T3_NM_ENTITY_TYPE                   
               ,@NEW_NM_INDEX_CODE        = T3_NM_INDEX_CODE                    
               ,@NEW_NM_RECORDING_DATE    = T3_NM_RECORDING_DATE                
               ,@NEW_NM_LGL_NAME          = T3_NM_LGL_NAME                      
               ,@NEW_NM_SSN               = T3_NM_SSN                           
               ,@NEW_NM_ROLE              = T3_NM_ROLE                          
               ,@NEW_NM_PARTY_IND         = T3_NM_PARTY_IND                     
               ,@NEW_NM_SEQ_NBR           = T3_NM_SEQ_NBR                       
               ,@NEW_NM_FILLER1           = T3_NM_FILLER1                       
               ,@NEW_NM_ETAL_IND          = T3_NM_ETAL_IND                      
               ,@NEW_NM_SUFFIX            = T3_NM_SUFFIX                        
               ,@NEW_NM_FILLER2           = T3_NM_FILLER2                       
               ,@NEW_NM_XRF_REL           = T3_NM_XRF_REL                       
               ,@NEW_NM_XRF_NAME          = T3_NM_XRF_NAME                      
               ,@NEW_NM_FILLER3           = T3_NM_FILLER3                       
               ,@NEW_NM_XRF_XIND          = T3_NM_XRF_XIND                      
               ,@NEW_NM_XRF_XREL          = T3_NM_XRF_XREL                      
               ,@NEW_NM_DOCTYPE           = T3_NM_DOCTYPE                       
               ,@NEW_NM_XRF_RULE          = T3_NM_XRF_RULE                      
               ,@NEW_NM_XRF_KEYED         = T3_NM_XRF_KEYED                     
               ,@NEW_NM_XRF_GENNED        = T3_NM_XRF_GENNED                    
               ,@NEW_NM_XRF_MTX_REL       = T3_NM_XRF_MTX_REL                   
               ,@NEW_NM_REC_STATUS        = T3_NM_REC_STATUS                    
               ,@NEW_DE_PTRAN_ROW_ID      = T3_DE_PTRAN_ROW_ID                  
               ,@NEW_NM_POSTING_DATE      = T3_NM_POSTING_DATE                  
               ,@NEW_NM_FUTURE_EXPANSION  = T3_NM_FUTURE_EXPANSION              
               ,@NEW_NM_QUESTIONABLE_IND  = T3_NM_QUESTIONABLE_IND              
               ,@NEW_NM_CORRECTION_IND    = T3_NM_CORRECTION_IND                
               ,@NEW_NM_FEE_NUMBER        = T3_NM_FEE_NUMBER                    
               ,@NEW_NM_STATUS_IND        = T3_NM_STATUS_IND                    
               ,@NEW_NM_MAP_NAME          = T3_NM_MAP_NAME                      
            FROM #T3                                                            
                                                                                
            IF   @OLD_NM_LGL_NAME         = @NEW_NM_LGL_NAME                
                AND (@OLD_NM_XRF_NAME         = @NEW_NM_XRF_NAME                
                OR   @OLD_NM_XRF_NAME         = ' ')                          
                    BEGIN                                                       
                    IF  @NEW_NM_XRF_GENNED     = 'Y'                            
                        BEGIN                                                   
                        SET @OLD_NM_XRF_REL    = @NEW_NM_XRF_REL
                        UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							SET DE_PTRAN_NM_XRF_REL		= @NEW_NM_XRF_REL
							   ,DE_PTRAN_NM_XRF_GENNED	= @NEW_NM_XRF_GENNED
						WHERE DE_PTRAN_NM_ROW_ID		= @OLD_NM_ROW_ID               
						UPDATE #T2                                                  
							SET T2_NM_XRF_REL       = @NEW_NM_XRF_REL
							   ,T2_NM_XRF_GENNED	= @NEW_NM_XRF_GENNED
						WHERE T2_ROW_ID             = @OLD_ROW_ID                 
                        END 
                    IF  @OLD_NM_XRF_REL        = ' '                            
                        BEGIN                                                   
                        SET @OLD_NM_XRF_REL    = @NEW_NM_XRF_REL
                        UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							SET DE_PTRAN_NM_XRF_REL		= @NEW_NM_XRF_REL
						WHERE DE_PTRAN_NM_ROW_ID		= @OLD_NM_ROW_ID               
						UPDATE #T2                                                  
							SET T2_NM_XRF_REL       = @NEW_NM_XRF_REL
						WHERE T2_ROW_ID             = @OLD_ROW_ID
						IF  @OLD_NM_REC_STATUS <> 'N'
						    BEGIN
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							   SET DE_PTRAN_NM_REC_STATUS  = 'U'            
							WHERE DE_PTRAN_NM_ROW_ID= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							   SET T2_NM_REC_STATUS	= 'U'                       
							WHERE T2_ROW_ID             = @OLD_ROW_ID
						    END
                 
                        END                                                                                                   
                    IF @OLD_NM_XRF_NAME         = ' '
                    BEGIN
						UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
						    SET DE_PTRAN_NM_XRF_NAME	= @NEW_NM_XRF_NAME 
						WHERE DE_PTRAN_NM_ROW_ID		= @OLD_NM_ROW_ID               
						UPDATE #T2                                                  
							SET T2_NM_XRF_NAME     = @NEW_NM_XRF_NAME 
						WHERE T2_ROW_ID            = @OLD_ROW_ID 
						IF  @OLD_NM_REC_STATUS <> 'N'
						    BEGIN
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							   SET DE_PTRAN_NM_REC_STATUS  = 'U'            
							WHERE DE_PTRAN_NM_ROW_ID= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							   SET T2_NM_REC_STATUS	= 'U'                       
							WHERE T2_ROW_ID             = @OLD_ROW_ID
						    END
                    END                           
                SET @SUB5                  = @MAX_SUB                           
                TRUNCATE TABLE #T3                                              
                BREAK                                                           
                END	                                                            
            ELSE 
                BEGIN                                                               
                SET @SUB5  = @SUB5 + 1
                END                                                                                       
        END --@SUB5	<= @MAX_SUB   	                                                                
                                                                                
        BEGIN  -- @SUB6 INSERT NEW RECORD FROM #T3                                                                 
            SET @SUB6      = ISNULL((SELECT COUNT(*) FROM #T3), 0) 
                         
            IF  @SUB6      > 0                                                  
                BEGIN   -- IF  @SUB6      > 0                                                         
                    INSERT INTO [Neo_Wrk].[CA23].[DE_PTRAN_NAME] (              
						[DE_PTRAN_NM_PARENT_ROW_ID]                             
                       ,[DE_PTRAN_NM_STATE_CODE]                                
                       ,[DE_PTRAN_NM_COUNTY_CODE]                               
                       ,[DE_PTRAN_NM_DOCUMENT_NBR]                              
                       ,[DE_PTRAN_NM_DOCUMENT_NBR_SEQ]                          
                       ,[DE_PTRAN_NM_UPDATE_TYPE]                               
                       ,[DE_PTRAN_NM_ENTITY_TYPE]                               
                       ,[DE_PTRAN_NM_INDEX_CODE]                                
                       ,[DE_PTRAN_NM_RECORDING_DATE]                            
                       ,[DE_PTRAN_NM_LGL_NAME]                                  
                       ,[DE_PTRAN_NM_SSN]                                       
                       ,[DE_PTRAN_NM_ROLE]                                      
                       ,[DE_PTRAN_NM_PARTY_IND]                                 
                       ,[DE_PTRAN_NM_SEQ_NBR]                                   
                       ,[DE_PTRAN_NM_FILLER1]                                   
                       ,[DE_PTRAN_NM_ETAL_IND]                                  
                       ,[DE_PTRAN_NM_SUFFIX]                                    
                       ,[DE_PTRAN_NM_FILLER2]                                   
                       ,[DE_PTRAN_NM_XRF_REL]                                   
                       ,[DE_PTRAN_NM_XRF_NAME]                                  
                       ,[DE_PTRAN_NM_FILLER3]                                   
                       ,[DE_PTRAN_NM_XRF_XIND]                                  
                       ,[DE_PTRAN_NM_XRF_XREL]                                  
                       ,[DE_PTRAN_NM_DOCTYPE]                                   
                       ,[DE_PTRAN_NM_XRF_RULE]                                  
                       ,[DE_PTRAN_NM_XRF_KEYED]                                 
                       ,[DE_PTRAN_NM_XRF_GENNED]                                
                       ,[DE_PTRAN_NM_XRF_MTX_REL]                               
                       ,[DE_PTRAN_NM_REC_STATUS]                                
                       ,[DE_PTRAN_ROW_ID]                                       
                       ,[DE_PTRAN_NM_POSTING_DATE]                              
                       ,[DE_PTRAN_NM_FUTURE_EXPANSION]                          
                       ,[DE_PTRAN_NM_QUESTIONABLE_IND]                          
                       ,[DE_PTRAN_NM_CORRECTION_IND]                            
                       ,[DE_PTRAN_NM_FEE_NUMBER]                                
                       ,[DE_PTRAN_NM_STATUS_IND]                                
                       ,[DE_PTRAN_NM_MAP_NAME]                                  
                        )                                                       
                    VALUES (                                                    
                        @NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_STATE_CODE                                      
                       ,@NEW_NM_COUNTY_CODE                                     
                       ,@NEW_NM_DOC_NBR                                         
                       ,@NEW_NM_DOC_NBR_SEQ                                     
                       ,@NEW_NM_UPDATE_TYPE                                     
                       ,@NEW_NM_ENTITY_TYPE                                     
                       ,@NEW_NM_INDEX_CODE                                      
                       ,@NEW_NM_RECORDING_DATE                                  
                       ,@NEW_NM_LGL_NAME                                        
                       ,@NEW_NM_SSN                                             
                       ,@NEW_NM_ROLE                                            
                       ,@NEW_NM_PARTY_IND                                       
                       ,@NEW_NM_SEQ_NBR                                         
                       ,@NEW_NM_FILLER1                                         
                       ,@NEW_NM_ETAL_IND                                        
                       ,@NEW_NM_SUFFIX                                          
                       ,@NEW_NM_FILLER2                                         
                       ,@NEW_NM_XRF_REL                                         
                       ,@NEW_NM_XRF_NAME                                        
                       ,@NEW_NM_FILLER3                                         
                       ,@NEW_NM_XRF_XIND                                        
                       ,@NEW_NM_XRF_XREL                                        
                       ,@NEW_NM_DOCTYPE                                         
                       ,@NEW_NM_XRF_RULE                                        
                       ,@NEW_NM_XRF_KEYED                                       
                       ,@NEW_NM_XRF_GENNED                                      
                       ,@NEW_NM_XRF_MTX_REL                                     
                       ,@NEW_NM_REC_STATUS                                      
                       ,@NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_POSTING_DATE                                    
                       ,@NEW_NM_FUTURE_EXPANSION                                
                       ,@NEW_NM_QUESTIONABLE_IND                                
                       ,@NEW_NM_CORRECTION_IND                                  
                       ,@NEW_NM_FEE_NUMBER                                      
                       ,@NEW_NM_STATUS_IND                                      
                       ,@NEW_NM_MAP_NAME                                        
                    )
                        SET @NEW_TBL_SUB = ISNULL((SELECT TOP 1 DE_PTRAN_NM_ROW_ID    
							  FROM Neo_Wrk.CA23.DE_PTRAN_NAME 
							  ORDER BY DE_PTRAN_NM_ROW_ID DESC), 0)  
                        SET @NEW_NM_ROW_ID = @NEW_TBL_SUB                                                                        
                                                                               
                    INSERT INTO #T2 (                                           
                        [T2_NM_ROW_ID]                                          
                       ,[T2_NM_PARENT_ROW_ID]                                   
                       ,[T2_NM_STATE_CODE]                                      
                       ,[T2_NM_COUNTY_CODE]                                     
                       ,[T2_NM_DOC_NBR]                                         
                       ,[T2_NM_DOC_NBR_SEQ]                                     
                       ,[T2_NM_UPDATE_TYPE]                                     
                       ,[T2_NM_ENTITY_TYPE]                                     
                       ,[T2_NM_INDEX_CODE]                                      
                       ,[T2_NM_RECORDING_DATE]                                  
                       ,[T2_NM_LGL_NAME]                                        
                       ,[T2_NM_SSN]                                             
                       ,[T2_NM_ROLE]                                            
                       ,[T2_NM_PARTY_IND]                                       
                       ,[T2_NM_SEQ_NBR]                                         
                       ,[T2_NM_FILLER1]                                         
                       ,[T2_NM_ETAL_IND]                                        
                       ,[T2_NM_SUFFIX]                                          
                       ,[T2_NM_FILLER2]                                         
                       ,[T2_NM_XRF_REL]                                         
                       ,[T2_NM_XRF_NAME]                                        
                       ,[T2_NM_FILLER3]                                         
                       ,[T2_NM_XRF_XIND]                                        
                       ,[T2_NM_XRF_XREL]                                        
                       ,[T2_NM_DOCTYPE]                                         
                       ,[T2_NM_XRF_RULE]                                        
                       ,[T2_NM_XRF_KEYED]                                       
                       ,[T2_NM_XRF_GENNED]                                      
                       ,[T2_NM_XRF_MTX_REL]                                     
                       ,[T2_NM_REC_STATUS]                                      
                       ,[T2_DE_PTRAN_ROW_ID]                                    
                       ,[T2_NM_POSTING_DATE]                                    
                       ,[T2_NM_FUTURE_EXPANSION]                                
                       ,[T2_NM_QUESTIONABLE_IND]                                
                       ,[T2_NM_CORRECTION_IND]                                  
                       ,[T2_NM_FEE_NUMBER]                                      
                       ,[T2_NM_STATUS_IND]                                      
                       ,[T2_NM_MAP_NAME]                                        
                    )                                                           
                    VALUES (                                                    
                        @NEW_NM_ROW_ID                                          
                       ,@NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_STATE_CODE                                      
                       ,@NEW_NM_COUNTY_CODE                                     
                       ,@NEW_NM_DOC_NBR                                         
                       ,@NEW_NM_DOC_NBR_SEQ                                     
                       ,@NEW_NM_UPDATE_TYPE                                     
                       ,@NEW_NM_ENTITY_TYPE                                     
                       ,@NEW_NM_INDEX_CODE                                      
                       ,@NEW_NM_RECORDING_DATE                                  
                       ,@NEW_NM_LGL_NAME                                        
                       ,@NEW_NM_SSN                                             
                       ,@NEW_NM_ROLE                                            
                       ,@NEW_NM_PARTY_IND                                       
                       ,@NEW_NM_SEQ_NBR                                         
                       ,@NEW_NM_FILLER1                                         
                       ,@NEW_NM_ETAL_IND                                        
                       ,@NEW_NM_SUFFIX                                          
                       ,@NEW_NM_FILLER2                                         
                       ,@NEW_NM_XRF_REL                                         
                       ,@NEW_NM_XRF_NAME                                        
                       ,@NEW_NM_FILLER3                                         
                       ,@NEW_NM_XRF_XIND                                        
                       ,@NEW_NM_XRF_XREL                                        
                       ,@NEW_NM_DOCTYPE                                         
                       ,@NEW_NM_XRF_RULE                                        
                       ,@NEW_NM_XRF_KEYED                                       
                       ,@NEW_NM_XRF_GENNED                                      
                       ,@NEW_NM_XRF_MTX_REL                                     
                       ,@NEW_NM_REC_STATUS                                      
                       ,@NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_POSTING_DATE                                    
                       ,@NEW_NM_FUTURE_EXPANSION                                
                       ,@NEW_NM_QUESTIONABLE_IND                                
                       ,@NEW_NM_CORRECTION_IND                                  
                       ,@NEW_NM_FEE_NUMBER                                      
                       ,@NEW_NM_STATUS_IND                                      
                       ,@NEW_NM_MAP_NAME                                        
                    )                                                           
                    SET @MAX_SUB     = @MAX_SUB + 1    
                    UPDATE #T0 SET T0_LAST_ROW_ID = @NEW_NM_ROW_ID                         
                    TRUNCATE TABLE #T3  
                END	 -- IF  @SUB6      > 0                                                                  
        END	 -- @SUB6                                                                   
/*** FINISH 1ST WHILE - 1ST AND 2ND REC INSERT                      ***/   
/*** 700-INSERT-NEW-INTO-TABLE-EXIT                                 ***/             

/*** START 2ND WHILE - 2ND AND 1ST REC INSERT                       ***/        
        TRUNCATE TABLE #T3                                                      
      	SET @T3_NM_LGL_NAME     = @T4_NM_LGL_NAME                               
		SET @T3_NM_XRF_NAME     = @T2_NM_LGL_NAME     
		SET @T3_NM_XRF_KEYED    = 'N'                                       
        SET @T3_NM_XRF_GENNED   = 'N'                                       
        SET @T3_NM_REC_STATUS   = 'N'                                       
   --013013                                                                                
        --IF  @T2_NM_ROLE			= @T4_NM_ROLE                                     
        --    BEGIN                                                           
                SET @T3_NM_XRF_REL = @T4_NM_XRF_MTX_REL                     
        --    END                                                             
        --ELSE                                                                
        -- 	BEGIN                                                           
        --        SET @T3_NM_XRF_REL = @T2_NM_XRF_MTX_REL                                   
        --    END    
            
        SELECT @T0_LAST_ROW_ID = T0_LAST_ROW_ID FROM #T0    
                                                                                                                                         
      	INSERT INTO #T3 (                                                       
            [T3_NM_ROW_ID]                                                      
           ,[T3_NM_PARENT_ROW_ID]                                               
           ,[T3_NM_STATE_CODE]                                                  
           ,[T3_NM_COUNTY_CODE]                                                 
           ,[T3_NM_DOC_NBR]                                                     
           ,[T3_NM_DOC_NBR_SEQ]                                                 
           ,[T3_NM_UPDATE_TYPE]                                                 
           ,[T3_NM_ENTITY_TYPE]                                                 
           ,[T3_NM_INDEX_CODE]                                                  
           ,[T3_NM_RECORDING_DATE]                                              
           ,[T3_NM_LGL_NAME]                                                    
           ,[T3_NM_SSN]                                                         
           ,[T3_NM_ROLE]                                                        
           ,[T3_NM_PARTY_IND]                                                   
           ,[T3_NM_SEQ_NBR]                                                     
           ,[T3_NM_FILLER1]                                                     
           ,[T3_NM_ETAL_IND]                                                    
           ,[T3_NM_SUFFIX]                                                      
           ,[T3_NM_FILLER2]                                                     
           ,[T3_NM_XRF_REL]                                                     
           ,[T3_NM_XRF_NAME]                                                    
           ,[T3_NM_FILLER3]                                                     
           ,[T3_NM_XRF_XIND]                                                    
           ,[T3_NM_XRF_XREL]                                                    
           ,[T3_NM_DOCTYPE]                                                     
           ,[T3_NM_XRF_RULE]                                                    
           ,[T3_NM_XRF_KEYED]                                                   
           ,[T3_NM_XRF_GENNED]                                                  
           ,[T3_NM_XRF_MTX_REL]                                                 
           ,[T3_NM_REC_STATUS]                                                  
           ,[T3_DE_PTRAN_ROW_ID]                                                
           ,[T3_NM_POSTING_DATE]                                                
           ,[T3_NM_FUTURE_EXPANSION]                                            
           ,[T3_NM_QUESTIONABLE_IND]                                            
           ,[T3_NM_CORRECTION_IND]                                              
           ,[T3_NM_FEE_NUMBER]                                                  
           ,[T3_NM_STATUS_IND]                                                  
           ,[T3_NM_MAP_NAME])                                                   
        VALUES (                                                                
            @T0_LAST_ROW_ID + 1                                                     
           ,@T4_NM_PARENT_ROW_ID                                                
           ,@T4_NM_STATE_CODE                                                   
           ,@T4_NM_COUNTY_CODE                                                  
           ,@T4_NM_DOC_NBR                                                      
           ,@T4_NM_DOC_NBR_SEQ                                                  
           ,@T4_NM_UPDATE_TYPE                                                  
           ,@T4_NM_ENTITY_TYPE                                                  
           ,@T4_NM_INDEX_CODE                                                   
           ,@T4_NM_RECORDING_DATE                                               
           ,@T3_NM_LGL_NAME                                                     
           ,@T4_NM_SSN                                                          
           ,@T4_NM_ROLE                                                         
           ,@T4_NM_PARTY_IND                                                    
           ,@T4_NM_SEQ_NBR                                                      
           ,@T4_NM_FILLER1                                                      
           ,@T4_NM_ETAL_IND                                                     
           ,@T4_NM_SUFFIX                                                       
           ,@T4_NM_FILLER2                                                      
           ,@T3_NM_XRF_REL                                                      
           ,@T3_NM_XRF_NAME                                                     
           ,@T4_NM_FILLER3                                                      
           ,@T4_NM_XRF_XIND                                                     
           ,@T4_NM_XRF_XREL                                                     
           ,@T4_NM_DOCTYPE                                                      
           ,@T4_NM_XRF_RULE                                                     
           ,@T3_NM_XRF_KEYED                                                    
           ,@T3_NM_XRF_GENNED                                                   
           ,@T4_NM_XRF_MTX_REL                                                  
           ,@T3_NM_REC_STATUS                                                   
           ,@T4_DE_PTRAN_ROW_ID                                                 
           ,@T4_NM_POSTING_DATE                                                 
           ,@T4_NM_FUTURE_EXPANSION                                             
           ,@T4_NM_QUESTIONABLE_IND                                             
           ,@T4_NM_CORRECTION_IND                                               
           ,@T4_NM_FEE_NUMBER                                                   
           ,@T4_NM_STATUS_IND                                                   
           ,@T4_NM_MAP_NAME                                                     
            )                                                                   
                                                                                
/*** 700-INSERT-NEW-INTO-TABLE                                      ***/        
        SET @SUB7     = ISNULL((SELECT COUNT(*) FROM #T3), 0)         
                  
        WHILE @SUB7	 <= @MAX_SUB                                                
     		BEGIN  -- WHILE @SUB7	 <= @MAX_SUB                                                                    
            SELECT                                                              
                @NEW_ROW_ID               = T3_ROW_ID                           
               ,@NEW_NM_ROW_ID            = T3_NM_ROW_ID                        
               ,@NEW_NM_PARENT_ROW_ID     = T3_NM_PARENT_ROW_ID                 
               ,@NEW_NM_STATE_CODE        = T3_NM_STATE_CODE                    
               ,@NEW_NM_COUNTY_CODE       = T3_NM_COUNTY_CODE                   
               ,@NEW_NM_DOC_NBR           = T3_NM_DOC_NBR                       
               ,@NEW_NM_DOC_NBR_SEQ       = T3_NM_DOC_NBR_SEQ                   
               ,@NEW_NM_UPDATE_TYPE       = T3_NM_UPDATE_TYPE                   
               ,@NEW_NM_ENTITY_TYPE       = T3_NM_ENTITY_TYPE                   
               ,@NEW_NM_INDEX_CODE        = T3_NM_INDEX_CODE                    
               ,@NEW_NM_RECORDING_DATE    = T3_NM_RECORDING_DATE                
               ,@NEW_NM_LGL_NAME          = T3_NM_LGL_NAME                      
               ,@NEW_NM_SSN               = T3_NM_SSN                           
               ,@NEW_NM_ROLE              = T3_NM_ROLE                          
               ,@NEW_NM_PARTY_IND         = T3_NM_PARTY_IND                     
               ,@NEW_NM_SEQ_NBR           = T3_NM_SEQ_NBR                       
               ,@NEW_NM_FILLER1           = T3_NM_FILLER1                       
               ,@NEW_NM_ETAL_IND          = T3_NM_ETAL_IND                      
               ,@NEW_NM_SUFFIX            = T3_NM_SUFFIX                        
               ,@NEW_NM_FILLER2           = T3_NM_FILLER2                       
               ,@NEW_NM_XRF_REL           = T3_NM_XRF_REL                       
               ,@NEW_NM_XRF_NAME          = T3_NM_XRF_NAME                      
               ,@NEW_NM_FILLER3           = T3_NM_FILLER3                       
               ,@NEW_NM_XRF_XIND          = T3_NM_XRF_XIND                      
               ,@NEW_NM_XRF_XREL          = T3_NM_XRF_XREL                      
               ,@NEW_NM_DOCTYPE           = T3_NM_DOCTYPE                       
               ,@NEW_NM_XRF_RULE          = T3_NM_XRF_RULE                      
               ,@NEW_NM_XRF_KEYED         = T3_NM_XRF_KEYED                     
               ,@NEW_NM_XRF_GENNED        = T3_NM_XRF_GENNED                    
               ,@NEW_NM_XRF_MTX_REL       = T3_NM_XRF_MTX_REL                   
               ,@NEW_NM_REC_STATUS        = T3_NM_REC_STATUS                    
               ,@NEW_DE_PTRAN_ROW_ID      = T3_DE_PTRAN_ROW_ID                  
               ,@NEW_NM_POSTING_DATE      = T3_NM_POSTING_DATE                  
               ,@NEW_NM_FUTURE_EXPANSION  = T3_NM_FUTURE_EXPANSION              
               ,@NEW_NM_QUESTIONABLE_IND  = T3_NM_QUESTIONABLE_IND              
               ,@NEW_NM_CORRECTION_IND    = T3_NM_CORRECTION_IND                
               ,@NEW_NM_FEE_NUMBER        = T3_NM_FEE_NUMBER                    
               ,@NEW_NM_STATUS_IND        = T3_NM_STATUS_IND                    
               ,@NEW_NM_MAP_NAME          = T3_NM_MAP_NAME                      
           FROM #T3                                                             
                                                                                
           SELECT                                                               
                @OLD_ROW_ID               = T2_ROW_ID                           
               ,@OLD_NM_ROW_ID            = T2_NM_ROW_ID                        
               ,@OLD_NM_PARENT_ROW_ID     = T2_NM_PARENT_ROW_ID                 
               ,@OLD_NM_STATE_CODE        = T2_NM_STATE_CODE                    
               ,@OLD_NM_COUNTY_CODE       = T2_NM_COUNTY_CODE                   
               ,@OLD_NM_DOC_NBR           = T2_NM_DOC_NBR                       
               ,@OLD_NM_DOC_NBR_SEQ       = T2_NM_DOC_NBR_SEQ                   
               ,@OLD_NM_UPDATE_TYPE       = T2_NM_UPDATE_TYPE                   
               ,@OLD_NM_ENTITY_TYPE       = T2_NM_ENTITY_TYPE                   
               ,@OLD_NM_INDEX_CODE        = T2_NM_INDEX_CODE                    
               ,@OLD_NM_RECORDING_DATE    = T2_NM_RECORDING_DATE                
               ,@OLD_NM_LGL_NAME          = T2_NM_LGL_NAME                      
               ,@OLD_NM_SSN               = T2_NM_SSN                           
               ,@OLD_NM_ROLE              = T2_NM_ROLE                          
               ,@OLD_NM_PARTY_IND         = T2_NM_PARTY_IND                     
               ,@OLD_NM_SEQ_NBR           = T2_NM_SEQ_NBR                       
               ,@OLD_NM_FILLER1           = T2_NM_FILLER1                       
               ,@OLD_NM_ETAL_IND          = T2_NM_ETAL_IND                      
               ,@OLD_NM_SUFFIX            = T2_NM_SUFFIX                        
               ,@OLD_NM_FILLER2           = T2_NM_FILLER2                       
               ,@OLD_NM_XRF_REL           = T2_NM_XRF_REL                       
               ,@OLD_NM_XRF_NAME          = T2_NM_XRF_NAME                      
               ,@OLD_NM_FILLER3           = T2_NM_FILLER3                       
               ,@OLD_NM_XRF_XIND          = T2_NM_XRF_XIND                      
               ,@OLD_NM_XRF_XREL          = T2_NM_XRF_XREL                      
               ,@OLD_NM_DOCTYPE           = T2_NM_DOCTYPE                       
               ,@OLD_NM_XRF_RULE          = T2_NM_XRF_RULE                      
               ,@OLD_NM_XRF_KEYED         = T2_NM_XRF_KEYED                     
               ,@OLD_NM_XRF_GENNED        = T2_NM_XRF_GENNED                    
               ,@OLD_NM_XRF_MTX_REL       = T2_NM_XRF_MTX_REL                   
               ,@OLD_NM_REC_STATUS        = T2_NM_REC_STATUS                    
               ,@OLD_DE_PTRAN_ROW_ID      = T2_DE_PTRAN_ROW_ID                  
               ,@OLD_NM_POSTING_DATE      = T2_NM_POSTING_DATE                  
               ,@OLD_NM_FUTURE_EXPANSION  = T2_NM_FUTURE_EXPANSION              
               ,@OLD_NM_QUESTIONABLE_IND  = T2_NM_QUESTIONABLE_IND              
               ,@OLD_NM_CORRECTION_IND    = T2_NM_CORRECTION_IND                
               ,@OLD_NM_FEE_NUMBER        = T2_NM_FEE_NUMBER                    
               ,@OLD_NM_STATUS_IND        = T2_NM_STATUS_IND                    
               ,@OLD_NM_MAP_NAME          = T2_NM_MAP_NAME                      
            FROM #T2                                                            
            WHERE T2_ROW_ID = @SUB7   
                                                          
            IF   @OLD_NM_LGL_NAME         = @NEW_NM_LGL_NAME                
                AND (@OLD_NM_XRF_NAME         = @NEW_NM_XRF_NAME                
                OR   @OLD_NM_XRF_NAME         = ' ')                          
                    BEGIN                                                       
                    IF  @NEW_NM_XRF_GENNED     = 'Y'                            
                        BEGIN                                                   
                        SET @OLD_NM_XRF_REL    = @NEW_NM_XRF_REL
                        UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							SET DE_PTRAN_NM_XRF_REL		= @NEW_NM_XRF_REL
							   ,DE_PTRAN_NM_XRF_GENNED	= @NEW_NM_XRF_GENNED
						WHERE DE_PTRAN_NM_ROW_ID		= @OLD_NM_ROW_ID               
						UPDATE #T2                                                  
							SET T2_NM_XRF_REL       = @NEW_NM_XRF_REL
							   ,T2_NM_XRF_GENNED	= @NEW_NM_XRF_GENNED
						WHERE T2_ROW_ID             = @OLD_ROW_ID                 
                        END 
                    IF  @OLD_NM_XRF_REL        = ' '                            
                        BEGIN                                                   
                        SET @OLD_NM_XRF_REL    = @NEW_NM_XRF_REL
                        UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							SET DE_PTRAN_NM_XRF_REL		= @NEW_NM_XRF_REL
						WHERE DE_PTRAN_NM_ROW_ID		= @OLD_NM_ROW_ID               
						UPDATE #T2                                                  
							SET T2_NM_XRF_REL       = @NEW_NM_XRF_REL
						WHERE T2_ROW_ID             = @OLD_ROW_ID                 
                        IF  @OLD_NM_REC_STATUS <> 'N'
						    BEGIN
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							   SET DE_PTRAN_NM_REC_STATUS  = 'U'            
							WHERE DE_PTRAN_NM_ROW_ID= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							   SET T2_NM_REC_STATUS	= 'U'                       
							WHERE T2_ROW_ID             = @OLD_ROW_ID
						    END
						END                                                                                                   
                    IF @OLD_NM_XRF_NAME         = ' '
                    BEGIN
						UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
						    SET DE_PTRAN_NM_XRF_NAME	= @NEW_NM_XRF_NAME 
						WHERE DE_PTRAN_NM_ROW_ID		= @OLD_NM_ROW_ID               
						UPDATE #T2                                                  
							SET T2_NM_XRF_NAME     = @NEW_NM_XRF_NAME 
						WHERE T2_ROW_ID            = @OLD_ROW_ID
						IF  @OLD_NM_REC_STATUS <> 'N'
						    BEGIN
							UPDATE [Neo_Wrk].[CA23].[DE_PTRAN_NAME]                     
							   SET DE_PTRAN_NM_REC_STATUS  = 'U'            
							WHERE DE_PTRAN_NM_ROW_ID= @OLD_NM_ROW_ID               
							UPDATE #T2                                                  
							   SET T2_NM_REC_STATUS	= 'U'                       
							WHERE T2_ROW_ID             = @OLD_ROW_ID
						    END
                    END                             
                SET @SUB7                  = @MAX_SUB                           
                TRUNCATE TABLE #T3                                              
                BREAK                                                           
                END	                                                            
            ELSE                                                                
                BEGIN                                                           
                    SET @SUB7  = @SUB7 + 1                                      
                END	                                                            
            END  -- WHILE @SUB7	 <= @MAX_SUB	                                                                
                                                                                
            BEGIN     -- @SUB8                                                          
            SET @SUB8      = ISNULL((SELECT COUNT(*) FROM #T3), 0)       
                     
            IF  @SUB8      > 0                                                  
                BEGIN   -- IF  @SUB8      > 0                                                         
                    INSERT INTO [Neo_Wrk].[CA23].[DE_PTRAN_NAME] (              
                  		[DE_PTRAN_NM_PARENT_ROW_ID]                             
                       ,[DE_PTRAN_NM_STATE_CODE]                                
                       ,[DE_PTRAN_NM_COUNTY_CODE]                               
                       ,[DE_PTRAN_NM_DOCUMENT_NBR]                              
                       ,[DE_PTRAN_NM_DOCUMENT_NBR_SEQ]                          
                       ,[DE_PTRAN_NM_UPDATE_TYPE]                               
                       ,[DE_PTRAN_NM_ENTITY_TYPE]                               
                       ,[DE_PTRAN_NM_INDEX_CODE]                                
                       ,[DE_PTRAN_NM_RECORDING_DATE]                            
                       ,[DE_PTRAN_NM_LGL_NAME]                                  
                       ,[DE_PTRAN_NM_SSN]                                       
                       ,[DE_PTRAN_NM_ROLE]                                      
                       ,[DE_PTRAN_NM_PARTY_IND]                                 
                       ,[DE_PTRAN_NM_SEQ_NBR]                                   
                       ,[DE_PTRAN_NM_FILLER1]                                   
                       ,[DE_PTRAN_NM_ETAL_IND]                                  
                       ,[DE_PTRAN_NM_SUFFIX]                                    
                       ,[DE_PTRAN_NM_FILLER2]                                   
                       ,[DE_PTRAN_NM_XRF_REL]                                   
                       ,[DE_PTRAN_NM_XRF_NAME]                                  
                       ,[DE_PTRAN_NM_FILLER3]                                   
                       ,[DE_PTRAN_NM_XRF_XIND]                                  
                       ,[DE_PTRAN_NM_XRF_XREL]                                  
                       ,[DE_PTRAN_NM_DOCTYPE]                                   
                       ,[DE_PTRAN_NM_XRF_RULE]                                  
                       ,[DE_PTRAN_NM_XRF_KEYED]                                 
                       ,[DE_PTRAN_NM_XRF_GENNED]                                
                       ,[DE_PTRAN_NM_XRF_MTX_REL]                               
                       ,[DE_PTRAN_NM_REC_STATUS]                                
                       ,[DE_PTRAN_ROW_ID]                                       
                       ,[DE_PTRAN_NM_POSTING_DATE]                              
                       ,[DE_PTRAN_NM_FUTURE_EXPANSION]                          
                       ,[DE_PTRAN_NM_QUESTIONABLE_IND]                          
                       ,[DE_PTRAN_NM_CORRECTION_IND]                            
                       ,[DE_PTRAN_NM_FEE_NUMBER]                                
                       ,[DE_PTRAN_NM_STATUS_IND]                                
                       ,[DE_PTRAN_NM_MAP_NAME]                                  
                        )                                                       
                    VALUES (                                                    
                        @NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_STATE_CODE                                      
                       ,@NEW_NM_COUNTY_CODE                                     
                       ,@NEW_NM_DOC_NBR                                         
                       ,@NEW_NM_DOC_NBR_SEQ                                     
                       ,@NEW_NM_UPDATE_TYPE                                     
                       ,@NEW_NM_ENTITY_TYPE                                     
                       ,@NEW_NM_INDEX_CODE                                      
                       ,@NEW_NM_RECORDING_DATE                                  
                       ,@NEW_NM_LGL_NAME                                        
                       ,@NEW_NM_SSN                                             
                       ,@NEW_NM_ROLE                                            
                       ,@NEW_NM_PARTY_IND                                       
                       ,@NEW_NM_SEQ_NBR                                         
                       ,@NEW_NM_FILLER1                                         
                       ,@NEW_NM_ETAL_IND                                        
                       ,@NEW_NM_SUFFIX                                          
                       ,@NEW_NM_FILLER2                                         
                       ,@NEW_NM_XRF_REL                                         
                       ,@NEW_NM_XRF_NAME                                        
                       ,@NEW_NM_FILLER3                                         
                       ,@NEW_NM_XRF_XIND                                        
                       ,@NEW_NM_XRF_XREL                                        
                       ,@NEW_NM_DOCTYPE                                         
                       ,@NEW_NM_XRF_RULE                                        
                       ,@NEW_NM_XRF_KEYED                                       
                       ,@NEW_NM_XRF_GENNED                                      
                       ,@NEW_NM_XRF_MTX_REL                                     
                       ,@NEW_NM_REC_STATUS                                      
                       ,@NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_POSTING_DATE                                    
                       ,@NEW_NM_FUTURE_EXPANSION                                
                       ,@NEW_NM_QUESTIONABLE_IND                                
                       ,@NEW_NM_CORRECTION_IND                                  
                       ,@NEW_NM_FEE_NUMBER                                      
                       ,@NEW_NM_STATUS_IND                                      
                       ,@NEW_NM_MAP_NAME                                        
                    )
                        SET @NEW_TBL_SUB = ISNULL((SELECT TOP 1 DE_PTRAN_NM_ROW_ID    
							  FROM Neo_Wrk.CA23.DE_PTRAN_NAME 
							  ORDER BY DE_PTRAN_NM_ROW_ID DESC), 0)  
                        SET @NEW_NM_ROW_ID = @NEW_TBL_SUB                                                                        
                                                                               
                    INSERT INTO #T2 (                                           
                        [T2_NM_ROW_ID]                                          
                       ,[T2_NM_PARENT_ROW_ID]                                   
                       ,[T2_NM_STATE_CODE]                                      
                       ,[T2_NM_COUNTY_CODE]                                     
                       ,[T2_NM_DOC_NBR]                                         
                       ,[T2_NM_DOC_NBR_SEQ]                                     
                       ,[T2_NM_UPDATE_TYPE]                                     
                       ,[T2_NM_ENTITY_TYPE]                                     
                       ,[T2_NM_INDEX_CODE]                                      
                       ,[T2_NM_RECORDING_DATE]                                  
                       ,[T2_NM_LGL_NAME]                                        
                       ,[T2_NM_SSN]                                             
                       ,[T2_NM_ROLE]                                            
                       ,[T2_NM_PARTY_IND]                                       
                       ,[T2_NM_SEQ_NBR]                                         
                       ,[T2_NM_FILLER1]                                         
                       ,[T2_NM_ETAL_IND]                                        
                       ,[T2_NM_SUFFIX]                                          
                       ,[T2_NM_FILLER2]                                         
                       ,[T2_NM_XRF_REL]                                         
                       ,[T2_NM_XRF_NAME]                                        
                       ,[T2_NM_FILLER3]                                         
                       ,[T2_NM_XRF_XIND]                                        
                       ,[T2_NM_XRF_XREL]                                        
                       ,[T2_NM_DOCTYPE]                                         
                       ,[T2_NM_XRF_RULE]                                        
                       ,[T2_NM_XRF_KEYED]                                       
                       ,[T2_NM_XRF_GENNED]                                      
                       ,[T2_NM_XRF_MTX_REL]                                     
                       ,[T2_NM_REC_STATUS]                                      
                       ,[T2_DE_PTRAN_ROW_ID]                                    
                       ,[T2_NM_POSTING_DATE]                                    
                       ,[T2_NM_FUTURE_EXPANSION]                                
                       ,[T2_NM_QUESTIONABLE_IND]                                
                       ,[T2_NM_CORRECTION_IND]                                  
                       ,[T2_NM_FEE_NUMBER]                                      
                       ,[T2_NM_STATUS_IND]                                      
                       ,[T2_NM_MAP_NAME]                                        
                    )                                                           
                    VALUES (                                                    
                        @NEW_NM_ROW_ID                                          
                       ,@NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_STATE_CODE                                      
                       ,@NEW_NM_COUNTY_CODE                                     
                       ,@NEW_NM_DOC_NBR                                         
                       ,@NEW_NM_DOC_NBR_SEQ                                     
                       ,@NEW_NM_UPDATE_TYPE                                     
                       ,@NEW_NM_ENTITY_TYPE                                     
                       ,@NEW_NM_INDEX_CODE                                      
                       ,@NEW_NM_RECORDING_DATE                                  
                       ,@NEW_NM_LGL_NAME                                        
                       ,@NEW_NM_SSN                                             
                       ,@NEW_NM_ROLE                                            
                       ,@NEW_NM_PARTY_IND                                       
                       ,@NEW_NM_SEQ_NBR                                         
                       ,@NEW_NM_FILLER1                                         
                       ,@NEW_NM_ETAL_IND                                        
                       ,@NEW_NM_SUFFIX                                          
                       ,@NEW_NM_FILLER2                                         
                       ,@NEW_NM_XRF_REL                                         
                       ,@NEW_NM_XRF_NAME                                        
                       ,@NEW_NM_FILLER3                                         
                       ,@NEW_NM_XRF_XIND                                        
                       ,@NEW_NM_XRF_XREL                                        
                       ,@NEW_NM_DOCTYPE                                         
                       ,@NEW_NM_XRF_RULE                                        
                       ,@NEW_NM_XRF_KEYED                                       
                       ,@NEW_NM_XRF_GENNED                                      
                       ,@NEW_NM_XRF_MTX_REL                                     
                       ,@NEW_NM_REC_STATUS                                      
                       ,@NEW_DE_PTRAN_ROW_ID                                    
                       ,@NEW_NM_POSTING_DATE                                    
                       ,@NEW_NM_FUTURE_EXPANSION                                
                       ,@NEW_NM_QUESTIONABLE_IND                                
                       ,@NEW_NM_CORRECTION_IND                                  
                       ,@NEW_NM_FEE_NUMBER                                      
                       ,@NEW_NM_STATUS_IND                                      
                       ,@NEW_NM_MAP_NAME                                        
                    )                                                           
                    UPDATE #T0 SET T0_LAST_ROW_ID = @NEW_NM_ROW_ID
                    SET @MAX_SUB     = @MAX_SUB + 1                             
                    TRUNCATE TABLE #T3   
                END	 --IF  @SUB8      > 0                                                            
           	END   -- @SUB8                                                            
/*** FINISH 2ND WHILE 2ND AND 1ST REC INSERT                        ***/        
        END                                                                     
        SET @SUB4  = @SUB4 + 1                                                  
   	END -- WHILE @SUB4 <= @STOP_SUB                                                                          
    SET @SUB3  = @SUB3 + 1                                                      
END -- WHILE @SUB3 <= @STOP_SUB                                                  
                                                 
/*** 500-ALL-XREF-EXIT                                              ***/  
/*** GET NEXT DOC KEY FOR PROCESSING                                ***/      
FETCH NEXT FROM UNQ_DOC INTO                                                    
    @T1_NM_DOC_NBR                                                              
   ,@T1_NM_DOC_NBR_SEQ            
   ,@T1_NM_ENTITY_TYPE        
                                           
END  --@@FETCH_STATUS = 0          


RETURN
GO
