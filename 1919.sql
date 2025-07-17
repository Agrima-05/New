.IF ERRORCODE <> 0 THEN .QUIT 66;

----------------------------------------
-- delete the CABS WEST STB IOSC records
----------------------------------------
DELETE FROM NORDIC_ETL.DLY_POOL_ALL
WHERE inp_sce_cd        = 'A'
  AND inp_sce_other_cd  = 'AS'
  AND ord_status_cat_cd = '5'
  AND prod_cd = ' STB-ORDER'
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO ISRT_01;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_02;

.label WARN_02;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                   AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                   AS SCRIPT_NM
   , 'DLY_POOL_ALL'               AS SCE_TBL_NM
   , 'DLY_POOL_INIT'              AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)         AS WARNING_TS
   , 'No rows Inserted to target' AS WARNING_MSG_TX
   , 'WARN_02'                    AS STEP_ID
;
 
-------------------------------------------------------------
-- Ensure the only activity to process is from the latest
-- file load per order.
-------------------------------------------------------------
.label ISRT_01;
DELETE
FROM NORDIC_ETL.DLY_POOL_ALL DPS
WHERE
( ORD_KEY,FILE_ID_TS ) NOT IN
( SELECT ORD_KEY, MAX(FILE_ID_TS)
  FROM NORDIC_ETL.DLY_POOL_ALL
  group by 1 );

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO DLTD_02;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_03;

.label WARN_03;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                     AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                     AS SCRIPT_NM
   , ''                             AS SCE_TBL_NM
   , 'DLY_POOL_ALL'                 AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)           AS WARNING_TS
   , 'No dup Order activity, good!' AS WARNING_MSG_TX
   , 'WARN_03'                      AS STEP_ID
;
 
-------------------------------------------------------------
-- GET A SNAPSHOT OF ALL PRODUCT ACTIVITY THAT WOULD SUM TO ZERO
-- and load into a temp table.
-------------------------------------------------------------
.label DLTD_02;
INSERT INTO NORDIC_ETL.Y_J3X11_DLY_SUM_0
(
ORD_KEY, WTN_CKT, PROD_CD, SALES_AGT_ID, ADDL_KEY, SUM_QTY, AUDT_TS
)
SELECT ORD_KEY, WTN_CKT, PROD_CD, SALES_AGT_ID, ADDL_KEY, 
       cast((SUM(CASE WHEN COALESCE(last_qty,'0') = 0 
                 THEN COALESCE(Origl_qty,'0') 
                 ELSE COALESCE(last_qty,'0')  END )
            ) AS INTEGER) as SUM_QTY, 
       CURRENT_TIMESTAMP
FROM NORDIC_ETL.DLY_POOL_ALL
GROUP BY ORD_KEY, WTN_CKT, PROD_CD, SALES_AGT_ID, ADDL_KEY
HAVING SUM_QTY = 0
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO ISRT_02;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_05;

.label WARN_05;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                   AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                   AS SCRIPT_NM
   , 'DLY_POOL_ALL'               AS SCE_TBL_NM
   , 'Y_J3X11_DLY_SUM_0'          AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)         AS WARNING_TS
   , 'No activity sum to zero today' AS WARNING_MSG_TX
   , 'WARN_05'                    AS STEP_ID
;
-------------------------------------------------------------
-- Clean out temp table Y_J3X11_DLY_POOL_SUM0_STB
-------------------------------------------------------------
.label ISRT_02;
DELETE
FROM NORDIC_ETL.Y_J3X11_DLY_POOL_SUM0_STB
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO DLTD_04;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_06;

.label WARN_06;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                     AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                     AS SCRIPT_NM
   , ''                             AS SCE_TBL_NM
   , 'Y_J3X11_DLY_POOL_SUM0_STB'    AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)           AS WARNING_TS
   , 'No activity deleted from tmp' AS WARNING_MSG_TX
   , 'WARN_06'                      AS STEP_ID
;
 
-------------------------------------------------------------
-- Load temp table with one record per ORD_KEY.  Candidate orders 
-- will later be turned into ' STB' Records and loaded back
-- to dly_pool.
-------------------------------------------------------------
.label DLTD_04;
INSERT INTO NORDIC_ETL.Y_J3X11_DLY_POOL_SUM0_STB
Select DP.*
FROM NORDIC_ETL.DLY_POOL_ALL DP
INNER JOIN NORDIC_ETL.Y_J3X11_DLY_SUM_0 X
ON  DP.ORD_KEY       = X.ORD_KEY
AND DP.WTN_CKT       = X.WTN_CKT 
AND DP.PROD_CD       = X.PROD_CD
AND COALESCE(DP.SALES_AGT_ID,'')  = COALESCE(X.SALES_AGT_ID,'')
AND COALESCE(DP.ADDL_KEY,'')      = COALESCE(X.ADDL_KEY,'')
AND DP.ORD_STATUS_CAT_CD = '5'
QUALIFY ROW_NUMBER() OVER
  (PARTITION BY DP.ORD_KEY
       ORDER BY DP.ORD_KEY)=1
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO ISRT_03;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_07;

.label WARN_07;       -- stm 2014-06-18   changed from WARN_06 to WARN_07
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                   AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                   AS SCRIPT_NM
   , 'DLY_POOL_ALL'               AS SCE_TBL_NM
   , 'Y_J3X11_DLY_POOL_SUM0_STB'  AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)         AS WARNING_TS
   , 'Candidate Ordrs for STB IOSC' AS WARNING_MSG_TX
   , 'WARN_07'                    AS STEP_ID
;
-------------------------------------------------------------
-- REMOVE ALL ACTIVITY FROM DLY_POOL THAT WOULD SUM TO ZERO
-------------------------------------------------------------
.label ISRT_03;
DELETE DP
FROM NORDIC_ETL.DLY_POOL_ALL DP,
     NORDIC_ETL.Y_J3X11_DLY_SUM_0 X
WHERE
DP.ORD_KEY       = X.ORD_KEY
AND DP.WTN_CKT       = X.WTN_CKT 
AND DP.PROD_CD       = X.PROD_CD
AND COALESCE(DP.SALES_AGT_ID,'')  = COALESCE(X.SALES_AGT_ID,'')
AND COALESCE(DP.ADDL_KEY,'')      = COALESCE(X.ADDL_KEY,'')
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO DLTD_05;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_08;

.label WARN_08;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                     AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                     AS SCRIPT_NM
   , 'Y_J3X11_DLY_SUM_0'            AS SCE_TBL_NM
   , 'DLY_POOL_ALL'                 AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)           AS WARNING_TS
   , 'No sum activity deleted'      AS WARNING_MSG_TX
   , 'WARN_08'                      AS STEP_ID
;
 
-------------------------------------------------------------
-- After the above DELETE, if there is still activity on DLY_POOL
-- for that ORD_KEY, then remove it from the tmp table.  The 
-- activity remaining on the temp table is Status=5 and there are 
-- no other records on the ORD_KEY to pass through.  
-------------------------------------------------------------
.label DLTD_05;
DELETE X
FROM 
NORDIC_ETL.Y_J3X11_DLY_POOL_SUM0_STB X,
NORDIC_ETL.DLY_POOL_ALL DP
WHERE
   X.ORD_KEY       = DP.ORD_KEY
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO DLTD_06;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_09;

.label WARN_09;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                     AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                     AS SCRIPT_NM
   , 'DLY_POOL_ALL'                 AS SCE_TBL_NM
   , 'Y_J3X11_DLY_POOL_SUM0_STB'    AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)           AS WARNING_TS
   , 'No sum activity deleted'      AS WARNING_MSG_TX
   , 'WARN_09'                      AS STEP_ID
;
-------------------------------------------------------------
-- Update all activity on the below table to a ' STB' IOSC.
-- This temp table will be merged back into DLY_POOL.
-------------------------------------------------------------
.label DLTD_06;
UPDATE NORDIC_ETL.Y_J3X11_DLY_POOL_SUM0_STB
SET
  PROD_CD          = ' STB',
  SALES_AGT_ID     = 'NO SALES',
  PROD_CHG_CD      = 'S',
  WTN_CKT          = '',
  ADDL_KEY         = '',
  ORIGL_QTY        = 1,
  RATE_AMT         = 0,
  LAST_PRCS_CD     = '',
  LAST_PRCS_CYC_DT = '1900-01-01',
  PROD_ACTN_CD     = 'A',
  PROD_ACTN_CAT_CD = '+'
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO UPDT_01;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_10;

.label WARN_10;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                     AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                     AS SCRIPT_NM
   , ''                             AS SCE_TBL_NM
   , 'Y_J3X11_DLY_POOL_SUM0_STB'    AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)           AS WARNING_TS
   , 'No activity to update'        AS WARNING_MSG_TX
   , 'WARN_10'                      AS STEP_ID
;
-------------------------------------------------------------
-- Clean out temp table Y_J3X11_DLY_SUM_NOT_0
-------------------------------------------------------------
.label UPDT_01;
DELETE
FROM NORDIC_ETL.Y_J3X11_DLY_SUM_NOT_0
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO DLTD_07;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_11;

.label WARN_11;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                      AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                      AS SCRIPT_NM
   , ''                              AS SCE_TBL_NM
   , 'Y_J3X11_DLY_SUM_NOT_0'         AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)            AS WARNING_TS
   , 'No data to clean from tmp tbl' AS WARNING_MSG_TX
   , 'WARN_11'                       AS STEP_ID
;
-------------------------------------------------------------
-- Build a temp table that would house the sum qty
-------------------------------------------------------------
.label DLTD_07;
INSERT INTO NORDIC_ETL.Y_J3X11_DLY_SUM_NOT_0
(
ORD_KEY, WTN_CKT, PROD_CD, SALES_AGT_ID, ADDL_KEY, SUM_QTY
)
SELECT ORD_KEY, WTN_CKT, PROD_CD, SALES_AGT_ID, ADDL_KEY,
cast((SUM(CASE WHEN COALESCE(last_qty,'0') = 0 THEN COALESCE(Origl_qty,'0') 
       ELSE COALESCE(last_qty,'0')  END )) AS INTEGER) as SUM_QTY
FROM NORDIC_ETL.DLY_POOL_ALL
GROUP BY ORD_KEY, WTN_CKT, PROD_CD, SALES_AGT_ID, ADDL_KEY
HAVING SUM_QTY <> 0
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO ISRT_04;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_12;

.label WARN_12;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                   AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                   AS SCRIPT_NM
   , 'DLY_POOL_ALL'               AS SCE_TBL_NM
   , 'Y_J3X11_DLY_SUM_NOT_0'      AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)         AS WARNING_TS
   , 'no sum qty for any activity' AS WARNING_MSG_TX
   , 'WARN_12'                    AS STEP_ID
;
-------------------------------------------------------------
-- Update the qty from the sum_qty on the tmp table.
-------------------------------------------------------------
.label ISRT_04;
UPDATE 
  NORDIC_ETL.DLY_POOL_ALL FROM
  NORDIC_ETL.Y_J3X11_DLY_SUM_NOT_0 X
SET
  ORIGL_QTY = X.SUM_QTY,
  LAST_QTY  = 0 
WHERE DLY_POOL_ALL.ORD_KEY       = X.ORD_KEY
  AND DLY_POOL_ALL.WTN_CKT       = X.WTN_CKT 
  AND DLY_POOL_ALL.PROD_CD       = X.PROD_CD
  AND COALESCE(DLY_POOL_ALL.SALES_AGT_ID,'')  = COALESCE(X.SALES_AGT_ID,'')
  AND COALESCE(DLY_POOL_ALL.ADDL_KEY,'')      = COALESCE(X.ADDL_KEY,'')
;

.IF ERRORCODE    <> 0 THEN .QUIT 66;
.IF ACTIVITYCOUNT > 0 THEN .GOTO UPDT_02;
.IF ACTIVITYCOUNT = 0 THEN .GOTO WARN_13;

.label WARN_13;
INSERT INTO NORDIC_ETL.ETL_WARNING
(JOB_ID
,SCRIPT_NM
,SCE_TBL_NM
,TRGT_TBL_NM
,WARNING_TS
,WARNING_MSG_TX
,STEP_ID
)
SEL  '<job_id>'                     AS JOB_ID
   , 'NRDB3X11_DLY_POOL_DataCleansing.bteq'                     AS SCRIPT_NM
   , 'Y_J3X11_DLY_SUM_NOT_0'        AS SCE_TBL_NM
   , 'DLY_POOL_ALL'                 AS TRGT_TBL_NM
   , CURRENT_TIMESTAMP(6)           AS WARNING_TS
   , 'No sum qty activity to update' AS WARNING_MSG_TX
   , 'WARN_13'                      AS STEP_ID
;

-------------------------------------------------------------
-- The table DLY_POOL creation.
-------------------------------------------------------------
