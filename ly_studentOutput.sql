/*=========================================================================================================

--Creating Current Customer Base

--=========================================================================================================*/

--DROP TABLE {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.SKY_LY_STUDENT_DISCOUNT_BASE
BEGIN
DECLARE _ERROR_CODE INT64;
DECLARE _GLOBAL_ERROR_CODE INT64;
DECLARE _ERROR_MESSAGE STRING;

BEGIN

SET _ERROR_CODE  =  0;

CREATE OR REPLACE TABLE {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base
CLUSTER BY cust_id, acct_num, cust_line_seq_id
AS
SELECT DISTINCT CAST(a.cust_id AS STRING) AS cust_id,
  CAST(a.acct_num AS STRING) AS acct_num,
  CAST(a.cust_line_seq_id AS STRING) AS cust_line_seq_id,
  CASE
  WHEN LOWER(f.ecpd_profile_id) IN (LOWER('5601066'))
  THEN 'Y'
  ELSE 'N'
  END AS student_discount_ecpd,
  CASE
  WHEN LOWER(f.ecpd_profile_id) IN (LOWER('5108417'), LOWER('3186257'), LOWER('5583906'), LOWER('5567426'), LOWER('5108368'
     ), LOWER('4769885'))
  THEN 'Y'
  ELSE 'N'
  END AS stws_ind,
  CASE
  WHEN LOWER(b.pplan_cd) IN (LOWER('63217'), LOWER('63216'))
  THEN 'BAYOU Plus'
  WHEN LOWER(b.pplan_cd) IN (LOWER('69183'), LOWER('69185'))
  THEN 'BAYOU Ultimate'
  WHEN LOWER(b.pplan_cd) IN (LOWER('63214'), LOWER('63215'))
  THEN 'BAYOU Welcome'
  WHEN LOWER(b.pplan_cd) IN (LOWER('39387'), LOWER('26908'), LOWER('50432'), LOWER('39386'), LOWER('50431'), LOWER('26911'
     ))
  THEN 'Do More Unlimited'
  WHEN LOWER(b.pplan_cd) IN (LOWER('39388'), LOWER('50433'), LOWER('26926'), LOWER('50434'), LOWER('39390'), LOWER('26914'
     ))
  THEN 'Get More Unlimited'
  WHEN LOWER(b.pplan_cd) IN (LOWER('39384'), LOWER('26880'), LOWER('39385'), LOWER('26907'), LOWER('50428'), LOWER('50430'
     ))
  THEN 'Play More Unlimited'
  WHEN LOWER(b.pplan_cd) IN (LOWER('25582'))
  THEN 'Just Kids'
  WHEN LOWER(b.pplan_cd) IN (LOWER('50427'), LOWER('50420'), LOWER('26869'), LOWER('26872'))
  THEN 'Start Unlimited'
  WHEN LOWER(b.pplan_cd) IN (LOWER('17994'), LOWER('17990'), LOWER('17989'), LOWER('17993'), LOWER('17973'), LOWER('17991'
     ))
  THEN 'Legacy Go'
  ELSE 'Other'
  END AS line_plan_type,
 COUNT(a.cust_id || '_' || a.acct_num || '_' || a.cust_line_seq_id) OVER (PARTITION BY a.cust_id, a.acct_num
  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS total_voice_lines,
 COUNT(CASE
   WHEN LOWER(COALESCE(CASE
       WHEN LOWER(b.pplan_cd) IN (LOWER('63217'), LOWER('63216'))
       THEN 'BAYOU Plus'
       WHEN LOWER(b.pplan_cd) IN (LOWER('69183'), LOWER('69185'))
       THEN 'BAYOU Ultimate'
       WHEN LOWER(b.pplan_cd) IN (LOWER('63214'), LOWER('63215'))
       THEN 'BAYOU Welcome'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39387'), LOWER('26908'), LOWER('50432'), LOWER('39386'), LOWER('50431'), LOWER('26911'
          ))
       THEN 'Do More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39388'), LOWER('50433'), LOWER('26926'), LOWER('50434'), LOWER('39390'), LOWER('26914'
          ))
       THEN 'Get More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39384'), LOWER('26880'), LOWER('39385'), LOWER('26907'), LOWER('50428'), LOWER('50430'
          ))
       THEN 'Play More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('25582'))
       THEN 'Just Kids'
       WHEN LOWER(b.pplan_cd) IN (LOWER('50427'), LOWER('50420'), LOWER('26869'), LOWER('26872'))
       THEN 'Start Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('17994'), LOWER('17990'), LOWER('17989'), LOWER('17993'), LOWER('17973'), LOWER('17991'
          ))
       THEN 'Legacy Go'
       ELSE 'Other'
       END, 'NA')) IN (LOWER('BAYOU Welcome'), LOWER('BAYOU Plus'), LOWER('BAYOU Ultimate'))
   THEN a.cust_id || '_' || a.acct_num || '_' || a.cust_line_seq_id
   ELSE NULL
   END) OVER (PARTITION BY a.cust_id, a.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS
 total_bayou_lines,
 COUNT(CASE
   WHEN LOWER(COALESCE(CASE
       WHEN LOWER(b.pplan_cd) IN (LOWER('63217'), LOWER('63216'))
       THEN 'BAYOU Plus'
       WHEN LOWER(b.pplan_cd) IN (LOWER('69183'), LOWER('69185'))
       THEN 'BAYOU Ultimate'
       WHEN LOWER(b.pplan_cd) IN (LOWER('63214'), LOWER('63215'))
       THEN 'BAYOU Welcome'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39387'), LOWER('26908'), LOWER('50432'), LOWER('39386'), LOWER('50431'), LOWER('26911'
          ))
       THEN 'Do More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39388'), LOWER('50433'), LOWER('26926'), LOWER('50434'), LOWER('39390'), LOWER('26914'
          ))
       THEN 'Get More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39384'), LOWER('26880'), LOWER('39385'), LOWER('26907'), LOWER('50428'), LOWER('50430'
          ))
       THEN 'Play More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('25582'))
       THEN 'Just Kids'
       WHEN LOWER(b.pplan_cd) IN (LOWER('50427'), LOWER('50420'), LOWER('26869'), LOWER('26872'))
       THEN 'Start Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('17994'), LOWER('17990'), LOWER('17989'), LOWER('17993'), LOWER('17973'), LOWER('17991'
          ))
       THEN 'Legacy Go'
       ELSE 'Other'
       END, 'NA')) IN (LOWER('Play More Unlimited'), LOWER('Do More Unlimited'), LOWER('Get More Unlimited'), LOWER('Start Unlimited'
      ), LOWER('Just Kids'))
   THEN a.cust_id || '_' || a.acct_num || '_' || a.cust_line_seq_id
   ELSE NULL
   END) OVER (PARTITION BY a.cust_id, a.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS
 total_mnm_lines,
 COUNT(CASE
   WHEN LOWER(COALESCE(CASE
       WHEN LOWER(b.pplan_cd) IN (LOWER('63217'), LOWER('63216'))
       THEN 'BAYOU Plus'
       WHEN LOWER(b.pplan_cd) IN (LOWER('69183'), LOWER('69185'))
       THEN 'BAYOU Ultimate'
       WHEN LOWER(b.pplan_cd) IN (LOWER('63214'), LOWER('63215'))
       THEN 'BAYOU Welcome'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39387'), LOWER('26908'), LOWER('50432'), LOWER('39386'), LOWER('50431'), LOWER('26911'
          ))
       THEN 'Do More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39388'), LOWER('50433'), LOWER('26926'), LOWER('50434'), LOWER('39390'), LOWER('26914'
          ))
       THEN 'Get More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('39384'), LOWER('26880'), LOWER('39385'), LOWER('26907'), LOWER('50428'), LOWER('50430'
          ))
       THEN 'Play More Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('25582'))
       THEN 'Just Kids'
       WHEN LOWER(b.pplan_cd) IN (LOWER('50427'), LOWER('50420'), LOWER('26869'), LOWER('26872'))
       THEN 'Start Unlimited'
       WHEN LOWER(b.pplan_cd) IN (LOWER('17994'), LOWER('17990'), LOWER('17989'), LOWER('17993'), LOWER('17973'), LOWER('17991'
          ))
       THEN 'Legacy Go'
       ELSE 'Other'
       END, 'NA')) IN (LOWER('Legacy Go'))
   THEN a.cust_id || '_' || a.acct_num || '_' || a.cust_line_seq_id
   ELSE NULL
   END) OVER (PARTITION BY a.cust_id, a.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS
 total_legacy_go_lines,
  CASE
  WHEN COALESCE(COUNT(CASE
        WHEN LOWER(COALESCE(CASE
            WHEN LOWER(b.pplan_cd) IN (LOWER('63217'), LOWER('63216'))
            THEN 'BAYOU Plus'
            WHEN LOWER(b.pplan_cd) IN (LOWER('69183'), LOWER('69185'))
            THEN 'BAYOU Ultimate'
            WHEN LOWER(b.pplan_cd) IN (LOWER('63214'), LOWER('63215'))
            THEN 'BAYOU Welcome'
            WHEN LOWER(b.pplan_cd) IN (LOWER('39387'), LOWER('26908'), LOWER('50432'), LOWER('39386'), LOWER('50431'),
              LOWER('26911'))
            THEN 'Do More Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('39388'), LOWER('50433'), LOWER('26926'), LOWER('50434'), LOWER('39390'),
              LOWER('26914'))
            THEN 'Get More Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('39384'), LOWER('26880'), LOWER('39385'), LOWER('26907'), LOWER('50428'),
              LOWER('50430'))
            THEN 'Play More Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('25582'))
            THEN 'Just Kids'
            WHEN LOWER(b.pplan_cd) IN (LOWER('50427'), LOWER('50420'), LOWER('26869'), LOWER('26872'))
            THEN 'Start Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('17994'), LOWER('17990'), LOWER('17989'), LOWER('17993'), LOWER('17973'),
              LOWER('17991'))
            THEN 'Legacy Go'
            ELSE 'Other'
            END, 'NA')) IN (LOWER('BAYOU Welcome'), LOWER('BAYOU Plus'), LOWER('BAYOU Ultimate'))
        THEN a.cust_id || '_' || a.acct_num || '_' || a.cust_line_seq_id
        ELSE NULL
        END) OVER (PARTITION BY a.cust_id, a.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 0) >=
     1 OR COALESCE(COUNT(CASE
        WHEN LOWER(COALESCE(CASE
            WHEN LOWER(b.pplan_cd) IN (LOWER('63217'), LOWER('63216'))
            THEN 'BAYOU Plus'
            WHEN LOWER(b.pplan_cd) IN (LOWER('69183'), LOWER('69185'))
            THEN 'BAYOU Ultimate'
            WHEN LOWER(b.pplan_cd) IN (LOWER('63214'), LOWER('63215'))
            THEN 'BAYOU Welcome'
            WHEN LOWER(b.pplan_cd) IN (LOWER('39387'), LOWER('26908'), LOWER('50432'), LOWER('39386'), LOWER('50431'),
              LOWER('26911'))
            THEN 'Do More Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('39388'), LOWER('50433'), LOWER('26926'), LOWER('50434'), LOWER('39390'),
              LOWER('26914'))
            THEN 'Get More Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('39384'), LOWER('26880'), LOWER('39385'), LOWER('26907'), LOWER('50428'),
              LOWER('50430'))
            THEN 'Play More Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('25582'))
            THEN 'Just Kids'
            WHEN LOWER(b.pplan_cd) IN (LOWER('50427'), LOWER('50420'), LOWER('26869'), LOWER('26872'))
            THEN 'Start Unlimited'
            WHEN LOWER(b.pplan_cd) IN (LOWER('17994'), LOWER('17990'), LOWER('17989'), LOWER('17993'), LOWER('17973'),
              LOWER('17991'))
            THEN 'Legacy Go'
            ELSE 'Other'
            END, 'NA')) IN (LOWER('Play More Unlimited'), LOWER('Do More Unlimited'), LOWER('Get More Unlimited'), LOWER('Start Unlimited'
           ), LOWER('Just Kids'))
        THEN a.cust_id || '_' || a.acct_num || '_' || a.cust_line_seq_id
        ELSE NULL
        END) OVER (PARTITION BY a.cust_id, a.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 0) >=
     1 OR COALESCE(COUNT(CASE
       WHEN LOWER(COALESCE(CASE
           WHEN LOWER(b.pplan_cd) IN (LOWER('63217'), LOWER('63216'))
           THEN 'BAYOU Plus'
           WHEN LOWER(b.pplan_cd) IN (LOWER('69183'), LOWER('69185'))
           THEN 'BAYOU Ultimate'
           WHEN LOWER(b.pplan_cd) IN (LOWER('63214'), LOWER('63215'))
           THEN 'BAYOU Welcome'
           WHEN LOWER(b.pplan_cd) IN (LOWER('39387'), LOWER('26908'), LOWER('50432'), LOWER('39386'), LOWER('50431'),
             LOWER('26911'))
           THEN 'Do More Unlimited'
           WHEN LOWER(b.pplan_cd) IN (LOWER('39388'), LOWER('50433'), LOWER('26926'), LOWER('50434'), LOWER('39390'),
             LOWER('26914'))
           THEN 'Get More Unlimited'
           WHEN LOWER(b.pplan_cd) IN (LOWER('39384'), LOWER('26880'), LOWER('39385'), LOWER('26907'), LOWER('50428'),
             LOWER('50430'))
           THEN 'Play More Unlimited'
           WHEN LOWER(b.pplan_cd) IN (LOWER('25582'))
           THEN 'Just Kids'
           WHEN LOWER(b.pplan_cd) IN (LOWER('50427'), LOWER('50420'), LOWER('26869'), LOWER('26872'))
           THEN 'Start Unlimited'
           WHEN LOWER(b.pplan_cd) IN (LOWER('17994'), LOWER('17990'), LOWER('17989'), LOWER('17993'), LOWER('17973'),
             LOWER('17991'))
           THEN 'Legacy Go'
           ELSE 'Other'
           END, 'NA')) IN (LOWER('Legacy Go'))
       THEN a.cust_id || '_' || a.acct_num || '_' || a.cust_line_seq_id
       ELSE NULL
       END) OVER (PARTITION BY a.cust_id, a.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 0) >= 1
    
  THEN 'TARGET'
  ELSE 'OTHER'
  END AS plan_target_ind,
 f.ecpd_profile_id,
 RPAD(NULL, 1, ' ') AS trtmnt_ctrl_ind,
 RPAD(NULL, 5, ' ') AS acct_age_new,
 RPAD(NULL, 5, ' ') AS max_birth_year
FROM {{params.gk1v_do}}.ntl_prd_allvm.cust_acct_line_v AS a
 INNER JOIN {{params.gk1v_do}}.ntl_prd_allvm.cust_acct_line_pplan_v AS b ON a.cust_id = b.cust_id AND a.acct_num =
     B.acct_num AND a.cust_line_seq_id = b.cust_line_seq_id AND COALESCE(b.pplan_exp_dt,
    CURRENT_DATE("America/New_York")) >= CURRENT_DATE("America/New_York") --PLAN STILL ACTIVE
 LEFT JOIN {{params.gk1v_do}}.udm_prdusr_allvm.crm_cust_acct_line_camp_elig_v AS c ON a.cust_id = c.cust_id AND a.acct_num = c.acct_num AND a.cust_line_seq_id = c.cust_line_seq_id
 --Device type must be a phone
 INNER JOIN {{params.gk1v_do}}.udm_prdusr_allvm.dm_device_ref_v AS d ON LOWER(COALESCE(a.device_prod_nm, a.prod_nm)) = LOWER(d.prod_nm) AND
   LOWER(d.device_type) IN (LOWER('Smartphone'), LOWER('Basic'))
   --BE needs to have no ecpd
 LEFT JOIN {{params.gk1v_do}}.ntl_prd_allvm.cust_ecpd_v AS f ON a.cust_id = f.cust_id AND COALESCE(f.ecpd_term_dt,
    CURRENT_DATE("America/New_York")) >= CURRENT_DATE("America/New_York")
--ecpd has not expired
 LEFT JOIN {{params.gk1v_do}}.ntl_prd_allvm.cust_acct_line_dim_dly_hist_v AS calddh ON a.cust_id = calddh.cust_id AND a.cust_line_seq_id = calddh.cust_line_seq_id AND LOWER(calddh.dim_name) = LOWER('VZ2_SEGMT') AND CURRENT_DATE("America/New_York") BETWEEN calddh
   .eff_dt AND (COALESCE(calddh.exp_dt, PARSE_DATE('%Y%m%d', CAST(9991231 + 19000000 AS STRING))))
 LEFT JOIN {{params.gk1v_do}}.ntl_prd_allvm.vz2_segmt_dim_ref_v AS segmt ON LOWER(calddh.dim_value) = LOWER(segmt.vz2_segmt_cd) AND LOWER(segmt
    .curr_prev_ind) = LOWER('C')
WHERE LOWER(a.mtn_status_ind) IN (LOWER('A'), LOWER('S'))
 AND LOWER(a.prepaid_ind) <> LOWER('Y')
 AND LOWER(a.rev_gen_ind) = LOWER('Y')
 AND LOWER(c.cons_phog_univ) = LOWER('Y')
 AND LOWER(a.vsn_cust_type_cd) = LOWER('PE')
 AND LOWER(segmt.vz2_segmt_type_desc) = LOWER('Wireless Consumer Core Revenue')
 AND LOWER(a.line_type_cd) NOT IN (LOWER('H'), LOWER('O'), LOWER('T'));
 EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE,  ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;

 
 --drop table NTL_PRD_QMTMPTBLS.SKY_LY_STUDENT_DISCOUNT_BASE_FINAL

------------------------------------------------------------------------
-- Alloting Message Codes to the customer base
------------------------------------------------------------------------

BEGIN
SET _ERROR_CODE  =  0;
CREATE OR REPLACE TABLE {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base_final
--CLUSTER BY cust_id, acct_num, cust_line_seq_id, message_cd
AS
SELECT cust_id,
 acct_num,
 cust_line_seq_id,
 trtmnt_ctrl_ind,
  CASE
  WHEN total_voice_lines = 1
  THEN 'LY_GENZ_STUDENT_DISCOUNT_1'
  WHEN total_voice_lines = 2
  THEN 'LY_GENZ_STUDENT_DISCOUNT_2'
  ELSE 'Not Qualified'
  END AS message_cd
FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base
WHERE UPPER(acct_age_new) = UPPER('25-')
 AND UPPER(COALESCE(student_discount_ecpd, 'NA')) = UPPER('N')
 AND UPPER(COALESCE(stws_ind, 'N')) = UPPER('N')
 AND UPPER(plan_target_ind) = UPPER('TARGET');
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE,  ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;


BEGIN
BEGIN TRANSACTION;


BEGIN

/*



--Message Code Creation Date - 02/25/2024

--Message Code Owner - Surya Yeramilli





--Details - This script is used to create message codes for NRB Discounts



--Updates





*/
--.RUN FILE = 'C:\Reporting\TD_PW\HLAVSMA\UMKTNTLDBRP.txt';
------------------------------------------------------------------------
--Setting default database to NTL_PRD_ALLVM
------------------------------------------------------------------------
--DATABASE NTL_PRD_ALLVM;


/*=========================================================================================================

--Creating New Age

--=========================================================================================================*/

BEGIN
SET _ERROR_CODE  =  0;
UPDATE {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base AS t1 SET
    acct_age_new = T2.acct_age_new,
    max_birth_year = CAST(T2.max_birth_year AS STRING) FROM (SELECT s.rpt_mth, s.cust_id, s.acct_num, s.cust_line_seq_id, MAX(s.acct_birth_year) OVER (PARTITION BY s.rpt_mth, s.cust_id, s.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_birth_year, CASE WHEN EXTRACT(YEAR FROM s.rpt_mth) - (MAX(s.acct_birth_year) OVER (PARTITION BY s.rpt_mth, s.cust_id, s.acct_num RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)) <= 25 THEN '25-' ELSE '25+' END AS acct_age_new
        FROM {{params.k45v_enabdo}}.udm_prdusr_allvm.dmbm_churn_fact_v AS s
            LEFT JOIN {{params.gk1v_do}}.ntl_prd_allvm.cust_acct_line_dly_hist_v AS a ON s.cust_id = a.cust_id AND s.acct_num = a.acct_num AND s.cust_line_seq_id = a.cust_line_seq_id AND s.rpt_mth BETWEEN a.eff_dt AND a.exp_dt
        WHERE s.rpt_mth = (SELECT MAX(rpt_mth)
                    FROM {{params.k45v_enabdo}}.udm_prdusr_allvm.dmbm_churn_fact_v
                    WHERE (EXTRACT(YEAR FROM rpt_mth) - 1900) * 10000 + EXTRACT(MONTH FROM rpt_mth) * 100 + EXTRACT(DAY FROM rpt_mth) >= 1240101) AND LOWER(s.vsn_cust_type_cd) = LOWER('PE') AND LOWER(a.rev_gen_ind) = LOWER('Y') AND s.bom_customer_trans > 0) AS T2  --AND S.ACCT_BIRTH_YEAR > '1999'
WHERE t1.cust_id = T2.cust_id AND t1.acct_num = T2.acct_num AND t1.cust_line_seq_id = T2.cust_line_seq_id;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;
/*=========================================================================================================

--STEP 2a : Removing ineligible SVC_PROD_ID - ACCT Level (Exclusions Loyalty_SPO_LIST)

--=========================================================================================================*/
BEGIN
SET _ERROR_CODE  =  0;
DELETE FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base
WHERE (cust_id, acct_num) IN (SELECT (cust_id, acct_num)
        FROM {{params.gk1v_do}}.ntl_prd_allvm.cust_acct_svc_prod_trans_v
        WHERE CURRENT_DATE("America/New_York") BETWEEN svc_prod_eff_dt AND (COALESCE(svc_prod_deact_dt, DATE '9999-12-31')) AND LOWER(svc_prod_id) IN (LOWER('1025'), LOWER('1089'), LOWER('1122'), LOWER('1123'), LOWER('1124'), LOWER('1129'), LOWER('1130'), LOWER('1131'), LOWER('1173'), LOWER('1187'), LOWER('1233'), LOWER('1234'), LOWER('1259'), LOWER('1287'), LOWER('1288'), LOWER('1289'), LOWER('1290'), LOWER('1291'), LOWER('3390'), LOWER('3391'), LOWER('3392'), LOWER('3393'), LOWER('3394'), LOWER('3395'), LOWER('3396'), LOWER('3397'), LOWER('1335'), LOWER('1336'), LOWER('1361'), LOWER('1362'), LOWER('1363'), LOWER('1432'), LOWER('1433'), LOWER('1435'), LOWER('1509'), LOWER('1511'), LOWER('1512'), LOWER('1513'), LOWER('1514'), LOWER('1515'), LOWER('1667'), LOWER('1668'), LOWER('1669'), LOWER('1678'), LOWER('1679'), LOWER('1680'), LOWER('1689'), LOWER('1690'), LOWER('1691'), LOWER('1710'), LOWER('1711'), LOWER('1713'), LOWER('1714'), LOWER('1770'), LOWER('1771'), LOWER('1772'), LOWER('1773'), LOWER('1774'), LOWER('1775'), LOWER('1779'), LOWER('1781'), LOWER('1782'), LOWER('1927'), LOWER('2071'), LOWER('2074'), LOWER('2150'), LOWER('2151'), LOWER('2288'), LOWER('2453'), LOWER('2467'), LOWER('2468'), LOWER('2469'), LOWER('2502'), LOWER('2513'), LOWER('2514'), LOWER('2515'), LOWER('2516'), LOWER('2517'), LOWER('2565'), LOWER('2566'), LOWER('2567'), LOWER('2568'), LOWER('2569'), LOWER('2570'), LOWER('2571'), LOWER('2572'), LOWER('2572'), LOWER('2573'), LOWER('2657'), LOWER('2658'), LOWER('2659'), LOWER('2660'), LOWER('2810'), LOWER('2873'), LOWER('2885'), LOWER('2887'), LOWER('2888'), LOWER('2889'), LOWER('2904'), LOWER('2905'), LOWER('2906'), LOWER('2907'), LOWER('2908'), LOWER('2909'), LOWER('2910'), LOWER('2911'), LOWER('2915'), LOWER('2916'), LOWER('2917'), LOWER('2918'), LOWER('2919'), LOWER('2920'), LOWER('2921'), LOWER('2922'), LOWER('2923'), LOWER('2924'), LOWER('2925'), LOWER('2926'), LOWER('2927'), LOWER('2928'), LOWER('2929'), LOWER('2930'), LOWER('2931'), LOWER('2932'), LOWER('2933'), LOWER('2934'), LOWER('2935'), LOWER('2936'), LOWER('2937'), LOWER('2938'), LOWER('2939'), LOWER('2940'), LOWER('2941'), LOWER('2942'), LOWER('2943'), LOWER('2945'), LOWER('3200'), LOWER('3201'), LOWER('3202'), LOWER('3203'), LOWER('3262'), LOWER('3271'), LOWER('3272'), LOWER('3294'), LOWER('3295'), LOWER('3296'), LOWER('3297'), LOWER('3298'), LOWER('3306'), LOWER('3307'), LOWER('3308'), LOWER('3309'), LOWER('3336'), LOWER('3338'), LOWER('3386'), LOWER('3387'), LOWER('3388'), LOWER('3389'), LOWER('3390'), LOWER('3391'), LOWER('3392'), LOWER('3393'), LOWER('3394'), LOWER('3395'), LOWER('3396'), LOWER('3397'))
        GROUP BY cust_id, acct_num);
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;
/*=========================================================================================================

--STEP 2b : Removing ineligible SVC_PROD_ID - Line Level

--=========================================================================================================*/
BEGIN
SET _ERROR_CODE  =  0;
DELETE FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base
WHERE (cust_id, acct_num) IN (SELECT (cust_id, acct_num)
        FROM {{params.gk1v_do}}.ntl_prd_allvm.cust_acct_line_svc_prod_tran_v
        WHERE CURRENT_DATE("America/New_York") BETWEEN svc_prod_eff_dt AND (COALESCE(svc_prod_deact_dt, DATE '9999-12-31')) AND LOWER(svc_prod_id) IN (LOWER('1025'), LOWER('1089'), LOWER('1122'), LOWER('1123'), LOWER('1124'), LOWER('1129'), LOWER('1130'), LOWER('1131'), LOWER('1173'), LOWER('1187'), LOWER('1233'), LOWER('1234'), LOWER('1259'), LOWER('1287'), LOWER('1288'), LOWER('1289'), LOWER('1290'), LOWER('1291'), LOWER('3390'), LOWER('3391'), LOWER('3392'), LOWER('3393'), LOWER('3394'), LOWER('3395'), LOWER('3396'), LOWER('3397'), LOWER('1335'), LOWER('1336'), LOWER('1361'), LOWER('1362'), LOWER('1363'), LOWER('1432'), LOWER('1433'), LOWER('1435'), LOWER('1509'), LOWER('1511'), LOWER('1512'), LOWER('1513'), LOWER('1514'), LOWER('1515'), LOWER('1667'), LOWER('1668'), LOWER('1669'), LOWER('1678'), LOWER('1679'), LOWER('1680'), LOWER('1689'), LOWER('1690'), LOWER('1691'), LOWER('1710'), LOWER('1711'), LOWER('1713'), LOWER('1714'), LOWER('1770'), LOWER('1771'), LOWER('1772'), LOWER('1773'), LOWER('1774'), LOWER('1775'), LOWER('1779'), LOWER('1781'), LOWER('1782'), LOWER('1927'), LOWER('2071'), LOWER('2074'), LOWER('2150'), LOWER('2151'), LOWER('2288'), LOWER('2453'), LOWER('2467'), LOWER('2468'), LOWER('2469'), LOWER('2502'), LOWER('2513'), LOWER('2514'), LOWER('2515'), LOWER('2516'), LOWER('2517'), LOWER('2565'), LOWER('2566'), LOWER('2567'), LOWER('2568'), LOWER('2569'), LOWER('2570'), LOWER('2571'), LOWER('2572'), LOWER('2572'), LOWER('2573'), LOWER('2657'), LOWER('2658'), LOWER('2659'), LOWER('2660'), LOWER('2810'), LOWER('2873'), LOWER('2885'), LOWER('2887'), LOWER('2888'), LOWER('2889'), LOWER('2904'), LOWER('2905'), LOWER('2906'), LOWER('2907'), LOWER('2908'), LOWER('2909'), LOWER('2910'), LOWER('2911'), LOWER('2915'), LOWER('2916'), LOWER('2917'), LOWER('2918'), LOWER('2919'), LOWER('2920'), LOWER('2921'), LOWER('2922'), LOWER('2923'), LOWER('2924'), LOWER('2925'), LOWER('2926'), LOWER('2927'), LOWER('2928'), LOWER('2929'), LOWER('2930'), LOWER('2931'), LOWER('2932'), LOWER('2933'), LOWER('2934'), LOWER('2935'), LOWER('2936'), LOWER('2937'), LOWER('2938'), LOWER('2939'), LOWER('2940'), LOWER('2941'), LOWER('2942'), LOWER('2943'), LOWER('2945'), LOWER('3200'), LOWER('3201'), LOWER('3202'), LOWER('3203'), LOWER('3262'), LOWER('3271'), LOWER('3272'), LOWER('3294'), LOWER('3295'), LOWER('3296'), LOWER('3297'), LOWER('3298'), LOWER('3306'), LOWER('3307'), LOWER('3308'), LOWER('3309'), LOWER('3336'), LOWER('3338'), LOWER('3386'), LOWER('3387'), LOWER('3388'), LOWER('3389'), LOWER('3390'), LOWER('3391'), LOWER('3392'), LOWER('3393'), LOWER('3394'), LOWER('3395'), LOWER('3396'), LOWER('3397'))
        GROUP BY cust_id, acct_num);
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;
/*=========================================================================================================

--Excluding C100 & C99 & C98 Customers

--=========================================================================================================*/
BEGIN
SET _ERROR_CODE  =  0;
DELETE FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base
WHERE (cust_id, acct_num) IN (SELECT (cust_id, acct_num)
        FROM {{params.gk1v_do}}.ntl_prd_allvm.crm_cust_acct_line_message_v
        WHERE CURRENT_DATE("America/New_York") BETWEEN eff_dt AND exp_dt AND LOWER(message_cd) IN (LOWER('LY_PRC_IN_MKT_WK_C100_IC'), LOWER('LY_PRC_IN_MKT_WK_C100_OOC'), LOWER('LY_PRC_IN_MKT_WK_C100_IC_COMM'), LOWER('LY_PRC_IN_MKT_WK_C100_OOC_COMM'), LOWER('LY_PRC_IN_MKT_WK_C99_IC'), LOWER('LY_PRC_IN_MKT_WK_C99_OOC'), LOWER('LY_PRC_IN_MKT_WK_C99_IC_COMM'), LOWER('LY_PRC_IN_MKT_WK_C99_OOC_COMM'), LOWER('LY_PRC_IN_MKT_WK_C98_IC'), LOWER('LY_PRC_IN_MKT_WK_C98_OOC'), LOWER('LY_PRC_IN_MKT_WK_C98_IC_COMM'), LOWER('LY_PRC_IN_MKT_WK_C98_OOC_COMM'))
        GROUP BY cust_id, acct_num);
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;
/*=========================================================================================================

--Excluding INTENDERS & BENIN Customers

--=========================================================================================================*/
BEGIN
SET _ERROR_CODE  =  0;
DELETE FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base
WHERE (cust_id, acct_num) IN (SELECT (cust_id, acct_num)
        FROM {{params.k45v_msgcdo}}.udm_prdusr_tbls.cust_acct_line_message_manual
        WHERE CURRENT_DATE("America/New_York") BETWEEN eff_dt AND exp_dt AND LOWER(message_cd) IN (LOWER('LY_INTEND_EXP_MNM_BASIC_C01_79'), LOWER('LY_INTEND_EXP_MNM_BASIC_C80_94'), LOWER('LY_INTEND_EXP_MNM_BASIC_C95PLS'), LOWER('LY_INTENDER_EXP_MNM_C01_79'), LOWER('LY_INTENDER_EXP_MNM_C80_94'), LOWER('LY_INTENDER_EXP_MNM_C95PLUS'), LOWER('LY_INTENDER_EXP_MYP_C01_79'), LOWER('LY_INTENDER_EXP_MYP_C80_94'), LOWER('LY_INTENDER_EXP_MYP_C95PLUS'), LOWER('LY_INTENDER_EXP_OTH_C01_79'), LOWER('LY_INTENDER_EXP_OTH_C80_94'), LOWER('LY_INTENDER_EXP_OTH_C95PLUS'), LOWER('LY_BENIN_PRC_CHRT_A1_IN_MKT_HR'), LOWER('LY_BENIN_PRC_CHRT_A1_PO_WLY_HR'), LOWER('LY_BENIN_PRC_COHORT_A1'))
        GROUP BY cust_id, acct_num);
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;
------------------------------------------------------------------------
-- Removing 55+
------------------------------------------------------------------------
BEGIN
SET _ERROR_CODE  =  0;
DELETE FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base
WHERE (cust_id, acct_num) IN (SELECT (cust_id, acct_num)
        FROM {{params.k45v_enabdo}}.udm_prdusr_allvm.crm_cust_acct_line_prcng_mpng_v
        WHERE LOWER(pplan_cd) IN (LOWER('13610'), LOWER('13646'), LOWER('19965'))
        GROUP BY cust_id, acct_num);
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;
/*=========================================================================================================

UPDATE BASE WITH TRTMNT_CTRL_IND

=========================================================================================================*/

BEGIN
SET _ERROR_CODE  =  0;
UPDATE {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base AS a SET
    trtmnt_ctrl_ind = B.trtmnt_ctrl_ind FROM (SELECT b.cust_id, b.acct_num, b.cust_line_seq_id, MAX(CASE WHEN P.cust_id IS NOT NULL THEN 'P' WHEN O.cust_id IS NOT NULL THEN 'O' ELSE 'T' END) AS trtmnt_ctrl_ind
        FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base AS b
		--PHOG
            LEFT JOIN (SELECT cust_id, acct_num
                FROM {{params.gk1v_do}}.tntl_prdusr_allvm.crm_consumer_account_segment
                WHERE LOWER(curr_prev_ind) = LOWER('Y') AND CURRENT_DATE("America/New_York") BETWEEN insert_dt AND phog_dt AND phog_dt IS NOT NULL
                GROUP BY cust_id, acct_num) AS P ON b.cust_id = P.cust_id AND B.acct_num = P.acct_num  --OHOG
            LEFT JOIN (SELECT DISTINCT cust_id, acct_num
                FROM {{params.gk1v_do}}.udm_prdusr_allvm.crm_cust_acct_ohog_v
                WHERE ohog_dt > CURRENT_DATE("America/New_York") AND LOWER(curr_prev_ind) = LOWER('C') AND LOWER(ohog_ctrgy_type) = LOWER('PRICING') AND LOWER(ohog_list_cd) = LOWER('7005330')) AS O ON b.cust_id = O.cust_id AND B.acct_num = O.acct_num
        GROUP BY b.cust_id, b.acct_num, b.cust_line_seq_id) AS B
WHERE a.cust_id = b.cust_id AND a.acct_num = B.acct_num AND a.cust_line_seq_id = b.cust_line_seq_id;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;


------------------------------------------------------------------------
--Inserting data in manual table for producation load
------------------------------------------------------------------------
BEGIN
SET _ERROR_CODE  =  0;
INSERT INTO {{params.k45v_msgcdo}}.udm_prdusr_tbls.cust_acct_line_message_manual (sor_id, cust_id, cust_line_seq_id, eff_dt, exp_dt,
 curr_prev_ind, acct_num, message_cd, insert_timestamp, trtmnt_ctrl_ind, action_cd, src_load_id)
SELECT DISTINCT 'V' AS sor_id,
  cust_id,
  cust_line_seq_id,
  CURRENT_DATE("America/New_York") AS eff_dt,
  DATE '9999-12-31' AS exp_dt,
  'C' AS curr_prev_ind,
  acct_num,
  message_cd,
  CAST(CONCAT(CONCAT(CURRENT_DATE("America/New_York"), ' '), CURRENT_TIME("America/New_York")) AS DATETIME) AS insert_timestamp,
  trtmnt_ctrl_ind,
  'U' AS message_action_cd,
  'U' AS src_load_id
 FROM {{params.k45v_msgcdo}}.ntl_prd_qmtmptbls.sky_ly_student_discount_base_final
 WHERE LOWER(message_cd) IN (LOWER('LY_GENZ_STUDENT_DISCOUNT_1'), LOWER('LY_GENZ_STUDENT_DISCOUNT_2'))
 EXCEPT DISTINCT
 SELECT sor_id,
  cust_id,
  cust_line_seq_id,
  eff_dt,
  exp_dt,
  curr_prev_ind,
  acct_num,
  message_cd,
  insert_timestamp,
  trtmnt_ctrl_ind,
  action_cd,
  src_load_id
 FROM {{params.k45v_msgcdo}}.udm_prdusr_tbls.cust_acct_line_message_manual;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
END;

end;
commit transaction;
end;

end;
/************************************************************************************************************************************************/

--.LOGOFF
--.QUIT

