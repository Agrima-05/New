BEGIN
DECLARE _ERROR_CODE INT64;
DECLARE _ERROR_MESSAGE STRING DEFAULT '';
DECLARE _GLOBAL_ERROR_CODE INT64 DEFAULT 0;

CALL hqmkt_prd_qmtbls.umktntldbrp();

BEGIN
SET _ERROR_CODE  =  0;
SELECT FLOOR((EXTRACT(HOUR FROM CURRENT_TIME('Etc/GMT+4')) * 10000 + EXTRACT(MINUTE FROM CURRENT_TIME('Etc/GMT+4')) * 100 + EXTRACT(SECOND FROM CURRENT_TIME('Etc/GMT+4')) + EXTRACT(MICROSECOND FROM CURRENT_TIME('Etc/GMT+4')) * 0.000001) * 100) / 100 AS a;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
BEGIN
SET _ERROR_CODE  =  0;
DELETE FROM hqmkt_prd_qmtbls.knw_cons_base_1 AS a
WHERE ssf_rpt_mth = (SELECT curr_start_dt
        FROM hqmkt_prd_qmtbls.knw_report_dates AS a
        WHERE rpt_id = 1);
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
BEGIN
SET _ERROR_CODE  =  0;
SELECT FLOOR((EXTRACT(HOUR FROM CURRENT_TIME('Etc/GMT+4')) * 10000 + EXTRACT(MINUTE FROM CURRENT_TIME('Etc/GMT+4')) * 100 + EXTRACT(SECOND FROM CURRENT_TIME('Etc/GMT+4')) + EXTRACT(MICROSECOND FROM CURRENT_TIME('Etc/GMT+4')) * 0.000001) * 100) / 100 AS a;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
--drop table hqmkt_prd_qmtbls.knw_cons_base_1;
--create set table hqmkt_prd_qmtbls.knw_cons_base_1
--as
--(
--case when pp.coe_pplan_sub_type_desc is null then 'z) Null'
/*) with data
primary index (ssf_cust_id, ssf_cust_line_seq_id)
--index (ssf_cust_id, ssf_acct_num)
partition by 
(
range_n (ssf_rpt_mth between 1180101 AND 1221201 each interval '1' month)
--,range_n (activity_dt between 1180101 AND 1211231 each interval '1' day)
)
;

show table hqmkt_prd_qmtbls.knw_cons_base_1;
*/
BEGIN
SET _ERROR_CODE  =  0;
INSERT INTO hqmkt_prd_qmtbls.knw_cons_base_1
SELECT DISTINCT 'A' AS section,
  rpt_mth AS ssf_rpt_mth,
  DATE_ADD(rpt_mth, INTERVAL 1 MONTH) AS ssf_base_mth,
  SUBSTR(cust_id, 1, 9) AS ssf_cust_id,
  SUBSTR(acct_num, 1, 3) AS ssf_acct_num,
  SUBSTR(cust_line_seq_id, 1, 3) AS ssf_cust_line_seq_id,
  mtn AS ssf_mtn,
  vsn_cust_type_cd AS ssf_vsn_cust_type_cd,
  SUBSTR(vz2_segmt_cd, 1, 10) AS ssf_vz2_segmt_cd,
  SUBSTR(COALESCE(device_prod_nm, prod_nm), 1, 32) AS ssf_prod_nm,
  SUBSTR(data_tier_fin, 1, 14) AS ssf_data_tier,
  SUBSTR(device_grouping0, 1, 23) AS ssf_device_grouping,
   CASE
   WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
   THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
   ELSE device_brand_nm0
   END AS ssf_device_brand_nm,
  device_generation0 AS ssf_device_generation,
   CASE
   WHEN LOWER(data_tier_fin) = LOWER('Smartphone') AND LOWER(device_grouping0) = LOWER('Apple')
   THEN 'sp_apple'
   WHEN LOWER(data_tier_fin) = LOWER('Smartphone') AND LOWER(device_grouping0) = LOWER('Android')
   THEN 'sp_android'
   WHEN LOWER(data_tier_fin) = LOWER('Smartphone') AND LOWER(COALESCE(device_grouping0, 'XX')) NOT IN (LOWER('Apple'),
      LOWER('Android'))
   THEN 'sp_other'
   WHEN LOWER(data_tier_fin) = LOWER('Basic')
   THEN 'bas'
   WHEN LOWER(device_grouping0) = LOWER('Tablet')
   THEN 'tab'
   WHEN LOWER(device_grouping0) = LOWER('Wearable Devices')
   THEN 'wear'
   WHEN LOWER(device_grouping0) = LOWER('Camera')
   THEN 'camera'
   WHEN LOWER(device_grouping0) = LOWER('Home Phone Connect')
   THEN 'hpc'
   WHEN LOWER(device_grouping0) = LOWER('Automotive')
   THEN 'auto'
   WHEN LOWER(device_grouping0) = LOWER('Mobile Hotspot')
   THEN 'jetpack'
   WHEN LOWER(data_tier_fin) = LOWER('Internet') AND LOWER(COALESCE(device_grouping0, 'XX')) NOT IN (LOWER('Tablet'),
      LOWER('Wearable Devices'), LOWER('Camera'), LOWER('Home Phone Connect'), LOWER('Automotive'), LOWER('Mobile Hotspot'
       ))
   THEN 'oth_inet'
   ELSE 'zz oth'
   END AS ssf_dev_typ,
  cdma AS ssf_cdma,
  mfg_nm AS ssf_mfg_nm,
  SUBSTR(trade_promo_grp, 1, 2) AS ssf_trade_promo_grp,
  SUBSTR(TRIM(curr_contract_term), 1, 15) AS ssf_curr_contract_term,
  loan_num AS ssf_loan_num,
  SUBSTR(pplan_cd, 1, 5) AS ssf_pplan_cd,
  pplan_mkt_cd AS ssf_pplan_mkt_cd,
  SUBSTR(COALESCE(coe_pplan_sub_type_desc0, 'Unknown Postpaid'), 1, 40) AS ssf_pplan_sub_type_desc,
   CASE
   WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%')
    OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'), LOWER('Do Unlimited 3.0'
       ), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'), LOWER('Do Unlimited 4.0'
       ), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'), LOWER('Business Unlimited Evolution'
       ))
   THEN 'a) Prem'
   WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
      ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
      ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
      ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
      ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
      ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'), LOWER('Bluegrass Unlimited'
      ))
   THEN 'b) Entry'
   WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
   THEN 'c) Vz Unl'
   ELSE 'd) Oth'
   END AS plan_typ,
  SUBSTR(TRIM(channel_type), 1, 2) AS ssf_chan_cd,
   CASE
   WHEN LOWER(channel_type) = LOWER('M')
   THEN 'd1) Stores'
   WHEN LOWER(channel_type) = LOWER('D')
   THEN 'd2) B2B'
   WHEN LOWER(channel_type) = LOWER('T')
   THEN 'd3) Telesales'
   WHEN LOWER(channel_type) = LOWER('N')
   THEN 'd4) Internet'
   WHEN LOWER(channel_type) = LOWER('NC')
   THEN 'd5) Non Comm'
   WHEN LOWER(channel_type) = LOWER('A')
   THEN 'i1) Local Agent'
   WHEN LOWER(channel_type) = LOWER('I')
   THEN 'i1) Local Agent'
   WHEN LOWER(channel_type) = LOWER('R')
   THEN 'i2) Nat Retail'
   WHEN LOWER(channel_type) = LOWER('IN')
   THEN 'i3) Ind Internet'
   WHEN LOWER(channel_type) = LOWER('V')
   THEN 'i4) VAD/EOM'
   ELSE 'z1) Other'
   END AS ssf_chan_nm,
  ending_customers AS ssf_tot_lines,
  acct_fraction AS ssf_frac_accts,
   CASE
   WHEN LOWER(data_tier_fin) IN (LOWER('Basic'), LOWER('Smartphone'))
   THEN ending_customers
   ELSE 0
   END AS ssf_vce_lines,
   CASE
   WHEN LOWER(data_tier_fin) = LOWER('Smartphone')
   THEN ending_customers
   ELSE 0
   END AS ssf_sp_lines,
   CASE
   WHEN LOWER(device_grouping0) = LOWER('Tablet')
   THEN ending_customers
   ELSE 0
   END AS ssf_tab_lines,
   CASE
   WHEN LOWER(device_grouping0) = LOWER('Wearable Devices')
   THEN ending_customers
   ELSE 0
   END AS ssf_wear_lines,
   CASE
   WHEN loan_num0 IS NOT NULL
   THEN 'Y'
   ELSE 'N'
   END AS dpp_loan_num,
  eqp_prod_nm0 AS dpp_prod_nm,
  SUBSTR(data_tier_fin0, 1, 14) AS dpp_data_tier,
  SUBSTR(device_grouping1, 1, 23) AS dpp_device_grouping,
   CASE
   WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
   THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
   ELSE device_brand_nm1
   END AS dpp_device_brand_nm,
  device_generation1 AS dpp_device_generation,
   CASE
   WHEN LOWER(data_tier_fin0) = LOWER('Smartphone') AND LOWER(device_grouping1) = LOWER('Apple')
   THEN 'sp_apple'
   WHEN LOWER(data_tier_fin0) = LOWER('Smartphone') AND LOWER(device_grouping1) = LOWER('Android')
   THEN 'sp_android'
   WHEN LOWER(data_tier_fin0) = LOWER('Smartphone') AND LOWER(COALESCE(device_grouping1, 'XX')) NOT IN (LOWER('Apple'),
      LOWER('Android'))
   THEN 'sp_other'
   WHEN LOWER(data_tier_fin0) = LOWER('Basic')
   THEN 'bas'
   WHEN LOWER(device_grouping1) = LOWER('Tablet')
   THEN 'tab'
   WHEN LOWER(device_grouping1) = LOWER('Wearable Devices')
   THEN 'wear'
   WHEN LOWER(device_grouping1) = LOWER('Camera')
   THEN 'camera'
   WHEN LOWER(device_grouping1) = LOWER('Home Phone Connect')
   THEN 'hpc'
   WHEN LOWER(device_grouping1) = LOWER('Automotive')
   THEN 'auto'
   WHEN LOWER(device_grouping1) = LOWER('Mobile Hotspot')
   THEN 'jetpack'
   WHEN LOWER(data_tier_fin0) = LOWER('Internet') AND LOWER(COALESCE(device_grouping1, 'XX')) NOT IN (LOWER('Tablet'),
      LOWER('Wearable Devices'), LOWER('Camera'), LOWER('Home Phone Connect'), LOWER('Automotive'), LOWER('Mobile Hotspot'
       ))
   THEN 'oth_inet'
   ELSE 'zz oth'
   END AS dpp_dev_typ,
  cdma0 AS dpp_cdma,
  mfg_nm0 AS dpp_mfg_nm,
  SUBSTR(trade_promo_grp0, 1, 2) AS dpp_trade_promo_grp,
   CASE
   WHEN LOWER(loan_status_ind) IN (LOWER('A'), LOWER('AA'), LOWER('AR'))
   THEN 'A'
   WHEN LOWER(loan_status_ind) = LOWER('S')
   THEN 'S'
   ELSE 'Z'
   END AS dpp_loan_status_ind,
  loan_create_dt AS dpp_loan_create_dt,
  loan_term_mth_qty AS dpp_loan_term_mth_qty,
  DATE_ADD(loan_create_dt, INTERVAL loan_term_mth_qty MONTH) AS dpp_loan_exp_dt,
  SUBSTR(upg_elig_cd, 1, 6) AS dpp_upg_elig_cd,
  CAST(loan_upg_pct AS INTEGER) AS dpp_loan_upg_pct,
  orig_device_amt AS dpp_orig_device_amt,
  install_loan_amt AS dpp_orig_loan_amt,
  loan_mth_pymnt_amt AS dpp_loan_mth_pymnt_amt,
  full_outstanding_bal_amt AS dpp_remaining_loan_bal,
  install_pymnt_outstanding_cnt AS dpp_remaining_payments,
   orig_device_amt - full_outstanding_bal_amt AS dpp_device_amt_paid,
   install_loan_amt - full_outstanding_bal_amt AS dpp_loan_amt_paid,
  ROUND(CAST((orig_device_amt - full_outstanding_bal_amt) / orig_device_amt AS NUMERIC), 2) AS dpp_device_pct_paid,
  ROUND(CAST((install_loan_amt - full_outstanding_bal_amt) / install_loan_amt AS NUMERIC), 2) AS dpp_loan_pct_paid,
   CASE
   WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_00_Pay'
   WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >=
    50
   THEN '50_01_Pay'
   WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_02_Pay'
   WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_03_Pay'
   WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_04_Pay'
   WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_05_Pay'
   WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_06_Pay'
   WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_07_Pay'
   WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_08_Pay'
   WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_09_Pay'
   WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_10_Pay'
   WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_11_Pay'
   WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_12_Pay'
   WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_12_Pay'
   WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_12_Pay'
   WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
   THEN '50_12_Pay'
   ELSE NULL
   END AS dpp_au_pay_status,
  COALESCE(esn_redempt_dt0, esn_redempt_dt) AS calh_esn_redempt_dt,
   CASE
   WHEN COALESCE(esn_redempt_dt0, esn_redempt_dt) IS NULL
   THEN '99) Null'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 13
   THEN '38) OOC'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 12
   THEN '37) T+12'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 11
   THEN '36) T+11'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 10
   THEN '35) T+10'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 9
   THEN '34) T+9'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 8
   THEN '33) T+8'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 7
   THEN '32) T+7'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 6
   THEN '31) T+6'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 5
   THEN '30) T+5'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 4
   THEN '29) T+4'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 3
   THEN '28) T+3'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 2
   THEN '27) T+2'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * - 1
   THEN '26) T+1'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 0
   THEN '25) T-0'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30
   THEN '24) T-1'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 2
   THEN '23) T-2'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 3
   THEN '22) T-3'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 4
   THEN '21) T-4'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 5
   THEN '20) T-5'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 6
   THEN '19) T-6'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 7
   THEN '18) T-7'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 8
   THEN '17) T-8'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 9
   THEN '16) T-9'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 10
   THEN '15) T-10'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 11
   THEN '14) T-11'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 12
   THEN '13) T-12'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 13
   THEN '12) T-13'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 14
   THEN '11) T-14'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 15
   THEN '10) T-15'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 16
   THEN '09) T-16'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 17
   THEN '08) T-17'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 18
   THEN '07) T-18'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 19
   THEN '06) T-19'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 20
   THEN '05) T-20'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 21
   THEN '04) T-21'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 22
   THEN '03) T-22'
   WHEN DATE_DIFF(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH), DAY) <= 30 * 23
   THEN '02) T-23'
   ELSE '01) T-24'
   END AS calh_t_mth,
  COALESCE(line_act_dt0, line_act_dt) AS calh_line_act_dt,
  COALESCE(mtn_act_dt0, mtn_act_dt) AS calh_mtn_act_dt,
  COALESCE(orig_acct_estb_dt, acct_estb_dt) AS acct_estb_dt,
   CASE
   WHEN COALESCE(COALESCE(esn_redempt_dt0, esn_redempt_dt), DATE_ADD(rpt_mth, INTERVAL 1 MONTH)) <= DATE_SUB(DATE_ADD(DATE_ADD(rpt_mth
        ,INTERVAL 1 MONTH), INTERVAL 1 MONTH), INTERVAL 1 DAY) AND LOWER(curr_contract_term) IN (LOWER('MTM Contract'),
      LOWER('Out of Contract'))
   THEN 'Y'
   ELSE 'N'
   END AS upg_elig,
  SUBSTR(CASE
    WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
    THEN eqp_prod_nm0
    ELSE COALESCE(device_prod_nm, prod_nm)
    END, 1, 32) AS rialto_prod_nm,
  SUBSTR(CASE
    WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
    THEN data_tier_fin0
    ELSE data_tier_fin
    END, 1, 14) AS rialto_data_tier,
  SUBSTR(CASE
    WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
    THEN device_grouping1
    ELSE device_grouping0
    END, 1, 23) AS rialto_dev_grp,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN CASE
    WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
    THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
    ELSE device_brand_nm1
    END
   ELSE CASE
    WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
    THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
    ELSE device_brand_nm0
    END
   END AS rialto_brand_nm,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN device_generation1
   ELSE device_generation0
   END AS rialto_dev_gen,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN CASE
    WHEN LOWER(data_tier_fin0) = LOWER('Smartphone') AND LOWER(device_grouping1) = LOWER('Apple')
    THEN 'sp_apple'
    WHEN LOWER(data_tier_fin0) = LOWER('Smartphone') AND LOWER(device_grouping1) = LOWER('Android')
    THEN 'sp_android'
    WHEN LOWER(data_tier_fin0) = LOWER('Smartphone') AND LOWER(COALESCE(device_grouping1, 'XX')) NOT IN (LOWER('Apple')
       , LOWER('Android'))
    THEN 'sp_other'
    WHEN LOWER(data_tier_fin0) = LOWER('Basic')
    THEN 'bas'
    WHEN LOWER(device_grouping1) = LOWER('Tablet')
    THEN 'tab'
    WHEN LOWER(device_grouping1) = LOWER('Wearable Devices')
    THEN 'wear'
    WHEN LOWER(device_grouping1) = LOWER('Camera')
    THEN 'camera'
    WHEN LOWER(device_grouping1) = LOWER('Home Phone Connect')
    THEN 'hpc'
    WHEN LOWER(device_grouping1) = LOWER('Automotive')
    THEN 'auto'
    WHEN LOWER(device_grouping1) = LOWER('Mobile Hotspot')
    THEN 'jetpack'
    WHEN LOWER(data_tier_fin0) = LOWER('Internet') AND LOWER(COALESCE(device_grouping1, 'XX')) NOT IN (LOWER('Tablet'),
       LOWER('Wearable Devices'), LOWER('Camera'), LOWER('Home Phone Connect'), LOWER('Automotive'), LOWER('Mobile Hotspot'
        ))
    THEN 'oth_inet'
    ELSE 'zz oth'
    END
   ELSE CASE
    WHEN LOWER(data_tier_fin) = LOWER('Smartphone') AND LOWER(device_grouping0) = LOWER('Apple')
    THEN 'sp_apple'
    WHEN LOWER(data_tier_fin) = LOWER('Smartphone') AND LOWER(device_grouping0) = LOWER('Android')
    THEN 'sp_android'
    WHEN LOWER(data_tier_fin) = LOWER('Smartphone') AND LOWER(COALESCE(device_grouping0, 'XX')) NOT IN (LOWER('Apple'),
       LOWER('Android'))
    THEN 'sp_other'
    WHEN LOWER(data_tier_fin) = LOWER('Basic')
    THEN 'bas'
    WHEN LOWER(device_grouping0) = LOWER('Tablet')
    THEN 'tab'
    WHEN LOWER(device_grouping0) = LOWER('Wearable Devices')
    THEN 'wear'
    WHEN LOWER(device_grouping0) = LOWER('Camera')
    THEN 'camera'
    WHEN LOWER(device_grouping0) = LOWER('Home Phone Connect')
    THEN 'hpc'
    WHEN LOWER(device_grouping0) = LOWER('Automotive')
    THEN 'auto'
    WHEN LOWER(device_grouping0) = LOWER('Mobile Hotspot')
    THEN 'jetpack'
    WHEN LOWER(data_tier_fin) = LOWER('Internet') AND LOWER(COALESCE(device_grouping0, 'XX')) NOT IN (LOWER('Tablet'),
       LOWER('Wearable Devices'), LOWER('Camera'), LOWER('Home Phone Connect'), LOWER('Automotive'), LOWER('Mobile Hotspot'
        ))
    THEN 'oth_inet'
    ELSE 'zz oth'
    END
   END AS rialto_dev_typ,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN cdma0
   ELSE cdma
   END AS rialto_cdma,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN mfg_nm0
   ELSE mfg_nm
   END AS rialto_mfg_nm,
  SUBSTR(CASE
    WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
    THEN trade_promo_grp0
    ELSE trade_promo_grp
    END, 1, 2) AS rialto_trade_promo_grp,
   CASE
   WHEN LOWER(COALESCE(CASE
        WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
        THEN data_tier_fin0
        ELSE data_tier_fin
        END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
        WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
        THEN device_grouping1
        ELSE device_grouping0
        END, 'ZZ')) <> LOWER('Apple')
   THEN 'z) Not'
   WHEN LOWER(CASE
       WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
       THEN CASE
        WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
        THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
        ELSE device_brand_nm1
        END
       ELSE CASE
        WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
        THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
        ELSE device_brand_nm0
        END
       END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
       WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
       THEN CASE
        WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
        THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
        ELSE device_brand_nm1
        END
       ELSE CASE
        WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
        THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
        ELSE device_brand_nm0
        END
       END) LIKE LOWER('iPhone X%')
   THEN 'a) X/11'
   WHEN LOWER(CASE
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
      THEN CASE
       WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
       THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
       ELSE device_brand_nm1
       END
      ELSE CASE
       WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
       THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
       ELSE device_brand_nm0
       END
      END) LIKE LOWER('iPhone 8%')
   THEN 'b) 8'
   WHEN LOWER(CASE
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
      THEN CASE
       WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
       THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
       ELSE device_brand_nm1
       END
      ELSE CASE
       WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
       THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
       ELSE device_brand_nm0
       END
      END) LIKE LOWER('iPhone 12%')
   THEN 'e) 12'
   WHEN LOWER(CASE
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
      THEN CASE
       WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
       THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
       ELSE device_brand_nm1
       END
      ELSE CASE
       WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
       THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
       ELSE device_brand_nm0
       END
      END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'), LOWER('iPhone SE'
      ), LOWER('Other'))
   THEN 'd) Old'
   ELSE 'c) Oth'
   END AS rialto_short_nm,
   CASE
   WHEN LOWER(CASE
      WHEN LOWER(COALESCE(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN data_tier_fin0
           ELSE data_tier_fin
           END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN device_grouping1
           ELSE device_grouping0
           END, 'ZZ')) <> LOWER('Apple')
      THEN 'z) Not'
      WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone X%')
      THEN 'a) X/11'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) LIKE LOWER('iPhone 8%')
      THEN 'b) 8'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) LIKE LOWER('iPhone 12%')
      THEN 'e) 12'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
        LOWER('iPhone SE'), LOWER('Other'))
      THEN 'd) Old'
      ELSE 'c) Oth'
      END) = LOWER('a) X/11')
   THEN 440
   WHEN LOWER(CASE
      WHEN LOWER(COALESCE(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN data_tier_fin0
           ELSE data_tier_fin
           END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN device_grouping1
           ELSE device_grouping0
           END, 'ZZ')) <> LOWER('Apple')
      THEN 'z) Not'
      WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone X%')
      THEN 'a) X/11'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) LIKE LOWER('iPhone 8%')
      THEN 'b) 8'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) LIKE LOWER('iPhone 12%')
      THEN 'e) 12'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
        LOWER('iPhone SE'), LOWER('Other'))
      THEN 'd) Old'
      ELSE 'c) Oth'
      END) = LOWER('b) 8')
   THEN 440
   WHEN LOWER(CASE
      WHEN LOWER(COALESCE(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN data_tier_fin0
           ELSE data_tier_fin
           END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN device_grouping1
           ELSE device_grouping0
           END, 'ZZ')) <> LOWER('Apple')
      THEN 'z) Not'
      WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone X%')
      THEN 'a) X/11'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) LIKE LOWER('iPhone 8%')
      THEN 'b) 8'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) LIKE LOWER('iPhone 12%')
      THEN 'e) 12'
      WHEN LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN CASE
          WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
          ELSE device_brand_nm1
          END
         ELSE CASE
          WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
          THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
          ELSE device_brand_nm0
          END
         END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
        LOWER('iPhone SE'), LOWER('Other'))
      THEN 'd) Old'
      ELSE 'c) Oth'
      END) = LOWER('c) Oth')
   THEN 100
   ELSE 0
   END AS rialto_dpp_tiv,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
   THEN 'SVC'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
      ) = LOWER('50_UO')
   THEN 'DP-AU'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN 'DP'
   ELSE 'OOC'
   END AS rialto_cntrct1,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
   THEN 'IC'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN 'IC'
   ELSE 'OOC'
   END AS rialto_cntrct2,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
       ) = LOWER('50_UO') AND LOWER(CASE
       WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_00_Pay'
       WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt
          >= 50
       THEN '50_01_Pay'
       WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_02_Pay'
       WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_03_Pay'
       WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_04_Pay'
       WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_05_Pay'
       WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_06_Pay'
       WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_07_Pay'
       WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_08_Pay'
       WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_09_Pay'
       WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_10_Pay'
       WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_11_Pay'
       WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       ELSE NULL
       END) = LOWER('50_00_Pay')
   THEN 'a) AU pay 0'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
       ) = LOWER('50_UO') AND LOWER(CASE
       WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_00_Pay'
       WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt
          >= 50
       THEN '50_01_Pay'
       WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_02_Pay'
       WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_03_Pay'
       WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_04_Pay'
       WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_05_Pay'
       WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_06_Pay'
       WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_07_Pay'
       WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_08_Pay'
       WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_09_Pay'
       WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_10_Pay'
       WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_11_Pay'
       WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       ELSE NULL
       END) = LOWER('50_01_Pay')
   THEN 'b) AU pay 1'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
       ) = LOWER('50_UO') AND LOWER(CASE
       WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_00_Pay'
       WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt
          >= 50
       THEN '50_01_Pay'
       WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_02_Pay'
       WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_03_Pay'
       WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_04_Pay'
       WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_05_Pay'
       WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_06_Pay'
       WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_07_Pay'
       WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_08_Pay'
       WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_09_Pay'
       WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_10_Pay'
       WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_11_Pay'
       WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
       THEN '50_12_Pay'
       ELSE NULL
       END) = LOWER('50_02_Pay')
   THEN 'c) AU pay 2'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
      ) = LOWER('50_UO')
   THEN 'd) AU pay 3+'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN 'e) DP No AU'
   WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
   THEN 'f) SVC'
   ELSE 'g) OOC'
   END AS rialto_cntrct3,
   CASE
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('a) X/11')
      THEN 440
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('b) 8')
      THEN 440
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('c) Oth')
      THEN 100
      ELSE 0
      END >= full_outstanding_bal_amt
   THEN 'a) Trade Pay 0'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('a) X/11')
      THEN 440
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('b) 8')
      THEN 440
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('c) Oth')
      THEN 100
      ELSE 0
      END >= full_outstanding_bal_amt - CAST(loan_mth_pymnt_amt AS NUMERIC)
   THEN 'b) Trade Pay 1'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('a) X/11')
      THEN 440
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('b) 8')
      THEN 440
      WHEN LOWER(CASE
         WHEN LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN data_tier_fin0
              ELSE data_tier_fin
              END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
              WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
              THEN device_grouping1
              ELSE device_grouping0
              END, 'ZZ')) <> LOWER('Apple')
         THEN 'z) Not'
         WHEN LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
             WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
             THEN CASE
              WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
              ELSE device_brand_nm1
              END
             ELSE CASE
              WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
              THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
              ELSE device_brand_nm0
              END
             END) LIKE LOWER('iPhone X%')
         THEN 'a) X/11'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 8%')
         THEN 'b) 8'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) LIKE LOWER('iPhone 12%')
         THEN 'e) 12'
         WHEN LOWER(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN CASE
             WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
             ELSE device_brand_nm1
             END
            ELSE CASE
             WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
             THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
             ELSE device_brand_nm0
             END
            END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
           LOWER('iPhone SE'), LOWER('Other'))
         THEN 'd) Old'
         ELSE 'c) Oth'
         END) = LOWER('c) Oth')
      THEN 100
      ELSE 0
      END >= full_outstanding_bal_amt - loan_mth_pymnt_amt * 2
   THEN 'c) Trade Pay 2'
   WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
   THEN 'd) Trade Pay 3+'
   WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
   THEN 'e) SVC'
   ELSE 'f) OOC'
   END AS rialto_cntrct4,
   CASE
   WHEN LOWER(CASE
       WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
           ) = LOWER('50_UO') AND LOWER(CASE
           WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_00_Pay'
           WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 /
             orig_device_amt >= 50
           THEN '50_01_Pay'
           WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_02_Pay'
           WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_03_Pay'
           WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_04_Pay'
           WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_05_Pay'
           WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_06_Pay'
           WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_07_Pay'
           WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_08_Pay'
           WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_09_Pay'
           WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_10_Pay'
           WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_11_Pay'
           WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           ELSE NULL
           END) = LOWER('50_00_Pay')
       THEN 'a) AU pay 0'
       WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
           ) = LOWER('50_UO') AND LOWER(CASE
           WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_00_Pay'
           WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 /
             orig_device_amt >= 50
           THEN '50_01_Pay'
           WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_02_Pay'
           WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_03_Pay'
           WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_04_Pay'
           WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_05_Pay'
           WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_06_Pay'
           WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_07_Pay'
           WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_08_Pay'
           WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_09_Pay'
           WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_10_Pay'
           WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_11_Pay'
           WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           ELSE NULL
           END) = LOWER('50_01_Pay')
       THEN 'b) AU pay 1'
       WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
           ) = LOWER('50_UO') AND LOWER(CASE
           WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_00_Pay'
           WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 /
             orig_device_amt >= 50
           THEN '50_01_Pay'
           WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_02_Pay'
           WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_03_Pay'
           WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_04_Pay'
           WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_05_Pay'
           WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_06_Pay'
           WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_07_Pay'
           WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_08_Pay'
           WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_09_Pay'
           WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_10_Pay'
           WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_11_Pay'
           WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
           THEN '50_12_Pay'
           ELSE NULL
           END) = LOWER('50_02_Pay')
       THEN 'c) AU pay 2'
       WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
          ) = LOWER('50_UO')
       THEN 'd) AU pay 3+'
       WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
       THEN 'e) DP No AU'
       WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
       THEN 'f) SVC'
       ELSE 'g) OOC'
       END) = LOWER('a) AU pay 0') AND CASE
      WHEN LOWER(curr_contract_term) NOT IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
      THEN NULL
      WHEN install_pymnt_outstanding_cnt < 1
      THEN 1
      WHEN install_pymnt_outstanding_cnt > 24
      THEN 24
      ELSE install_pymnt_outstanding_cnt
      END > 6
   THEN 'a) AU pay 0'
   WHEN LOWER(CASE
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
          ) = LOWER('50_UO') AND LOWER(CASE
          WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_00_Pay'
          WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 /
            orig_device_amt >= 50
          THEN '50_01_Pay'
          WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_02_Pay'
          WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_03_Pay'
          WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_04_Pay'
          WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_05_Pay'
          WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_06_Pay'
          WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_07_Pay'
          WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_08_Pay'
          WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_09_Pay'
          WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_10_Pay'
          WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_11_Pay'
          WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          ELSE NULL
          END) = LOWER('50_00_Pay')
      THEN 'a) AU pay 0'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
          ) = LOWER('50_UO') AND LOWER(CASE
          WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_00_Pay'
          WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 /
            orig_device_amt >= 50
          THEN '50_01_Pay'
          WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_02_Pay'
          WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_03_Pay'
          WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_04_Pay'
          WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_05_Pay'
          WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_06_Pay'
          WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_07_Pay'
          WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_08_Pay'
          WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_09_Pay'
          WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_10_Pay'
          WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_11_Pay'
          WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          ELSE NULL
          END) = LOWER('50_01_Pay')
      THEN 'b) AU pay 1'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
          ) = LOWER('50_UO') AND LOWER(CASE
          WHEN (loan_mth_pymnt_amt * 0 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_00_Pay'
          WHEN (CAST(loan_mth_pymnt_amt AS NUMERIC) + (orig_device_amt - full_outstanding_bal_amt)) * 100 /
            orig_device_amt >= 50
          THEN '50_01_Pay'
          WHEN (loan_mth_pymnt_amt * 2 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_02_Pay'
          WHEN (loan_mth_pymnt_amt * 3 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_03_Pay'
          WHEN (loan_mth_pymnt_amt * 4 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_04_Pay'
          WHEN (loan_mth_pymnt_amt * 5 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_05_Pay'
          WHEN (loan_mth_pymnt_amt * 6 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_06_Pay'
          WHEN (loan_mth_pymnt_amt * 7 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_07_Pay'
          WHEN (loan_mth_pymnt_amt * 8 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_08_Pay'
          WHEN (loan_mth_pymnt_amt * 9 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_09_Pay'
          WHEN (loan_mth_pymnt_amt * 10 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_10_Pay'
          WHEN (loan_mth_pymnt_amt * 11 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_11_Pay'
          WHEN (loan_mth_pymnt_amt * 12 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 13 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 14 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          WHEN (loan_mth_pymnt_amt * 15 + (orig_device_amt - full_outstanding_bal_amt)) * 100 / orig_device_amt >= 50
          THEN '50_12_Pay'
          ELSE NULL
          END) = LOWER('50_02_Pay')
      THEN 'c) AU pay 2'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND LOWER(upg_elig_cd
         ) = LOWER('50_UO')
      THEN 'd) AU pay 3+'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
      THEN 'e) DP No AU'
      WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
      THEN 'f) SVC'
      ELSE 'g) OOC'
      END) IN (LOWER('b) AU pay 1'), LOWER('c) AU pay 2'))
   THEN 'b) AU pay 1-2'
   WHEN LOWER(CASE
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('a) X/11')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('b) 8')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('c) Oth')
         THEN 100
         ELSE 0
         END >= full_outstanding_bal_amt
      THEN 'a) Trade Pay 0'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('a) X/11')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('b) 8')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('c) Oth')
         THEN 100
         ELSE 0
         END >= full_outstanding_bal_amt - CAST(loan_mth_pymnt_amt AS NUMERIC)
      THEN 'b) Trade Pay 1'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('a) X/11')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('b) 8')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('c) Oth')
         THEN 100
         ELSE 0
         END >= full_outstanding_bal_amt - loan_mth_pymnt_amt * 2
      THEN 'c) Trade Pay 2'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
      THEN 'd) Trade Pay 3+'
      WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
      THEN 'e) SVC'
      ELSE 'f) OOC'
      END) = LOWER('a) Trade Pay 0')
   THEN 'c) Trade Pay 0'
   WHEN LOWER(CASE
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('a) X/11')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('b) 8')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('c) Oth')
         THEN 100
         ELSE 0
         END >= full_outstanding_bal_amt
      THEN 'a) Trade Pay 0'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('a) X/11')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('b) 8')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('c) Oth')
         THEN 100
         ELSE 0
         END >= full_outstanding_bal_amt - CAST(loan_mth_pymnt_amt AS NUMERIC)
      THEN 'b) Trade Pay 1'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE')) AND CASE
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('a) X/11')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('b) 8')
         THEN 440
         WHEN LOWER(CASE
            WHEN LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN data_tier_fin0
                 ELSE data_tier_fin
                 END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
                 WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                 THEN device_grouping1
                 ELSE device_grouping0
                 END, 'ZZ')) <> LOWER('Apple')
            THEN 'z) Not'
            WHEN LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
                WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
                THEN CASE
                 WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                 ELSE device_brand_nm1
                 END
                ELSE CASE
                 WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                 THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                 ELSE device_brand_nm0
                 END
                END) LIKE LOWER('iPhone X%')
            THEN 'a) X/11'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 8%')
            THEN 'b) 8'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) LIKE LOWER('iPhone 12%')
            THEN 'e) 12'
            WHEN LOWER(CASE
               WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
               THEN CASE
                WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
                ELSE device_brand_nm1
                END
               ELSE CASE
                WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
                THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
                ELSE device_brand_nm0
                END
               END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'
               ), LOWER('iPhone SE'), LOWER('Other'))
            THEN 'd) Old'
            ELSE 'c) Oth'
            END) = LOWER('c) Oth')
         THEN 100
         ELSE 0
         END >= full_outstanding_bal_amt - loan_mth_pymnt_amt * 2
      THEN 'c) Trade Pay 2'
      WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
      THEN 'd) Trade Pay 3+'
      WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
      THEN 'e) SVC'
      ELSE 'f) OOC'
      END) IN (LOWER('b) Trade Pay 1'), LOWER('c) Trade Pay 2'))
   THEN 'd) Trade Pay 1-2'
   WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'), LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'
      ), LOWER('EDGE'))
   THEN 'e) IC'
   ELSE 'f) OOC'
   END AS rialto_cntrct5,
   CASE
   WHEN cust_id4 IS NOT NULL
   THEN 'Y'
   ELSE 'N'
   END AS ever_upg,
   CASE
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('a) Prem') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'b) Nat Promo'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) IN (LOWER('b) Entry'), LOWER('c) Vz Unl')) AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('IC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'a) DP-AU / Trade / Aware'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('Y') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('a) X/11')
   THEN 'c) Reactive $200'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('b) 8')
   THEN 'd) Reactive $10 SE'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('c) Oth')
   THEN 'd) Reactive $10 SE'
   WHEN LOWER(CASE
         WHEN LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%above%') OR LOWER(coe_pplan_sub_type_desc0) LIKE LOWER('%beyond%'
             ) OR LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Do Unlimited'), LOWER('Get Unlimited'), LOWER('Play Unlimited'
             ), LOWER('Do Unlimited 3.0'), LOWER('Get Unlimited 3.0'), LOWER('Play Unlimited 3.0'), LOWER('Play Unlimited 4.0'
             ), LOWER('Do Unlimited 4.0'), LOWER('Get Unlimited 4.0'), LOWER('One Unlimited'), LOWER('Business Unlimited'
             ), LOWER('Business Unlimited Evolution'))
         THEN 'a) Prem'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('4G LTE Home'), LOWER('4G LTE Business Internet'), LOWER('5G (Non Phone) Unlimited'
            ), LOWER('5G Home'), LOWER('5G Moto Mod Business Unlimited'), LOWER('5G Moto Mod Unlimited'), LOWER('Business Share Unlimited Data'
            ), LOWER('Business Unlimited'), LOWER('Connected Unlimited'), LOWER('Go Unlimited 1.0'), LOWER('Go Unlimited 2.0'
            ), LOWER('Go Unlimited 55+'), LOWER('Just Kids 3.0'), LOWER('Line Level Unlimited Data'), LOWER('Primary Share Unlimited Data'
            ), LOWER('Secondary Share Unlimited Data'), LOWER('Start Unlimited Trial'), LOWER('Start Unlimited'), LOWER('Start Unlimited 4.0'
            ), LOWER('Welcome Unlimited 4.5'), LOWER('5G Business Internet'), LOWER('Bluegrass Connected Unlimited'),
           LOWER('Bluegrass Unlimited'))
         THEN 'b) Entry'
         WHEN LOWER(coe_pplan_sub_type_desc0) IN (LOWER('Verizon Unlimited'))
         THEN 'c) Vz Unl'
         ELSE 'd) Oth'
         END) = LOWER('d) Oth') AND LOWER(CASE
         WHEN LOWER(curr_contract_term) IN (LOWER('1 YR CONTRACT'), LOWER('2 YR CONTRACT'))
         THEN 'IC'
         WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
         THEN 'IC'
         ELSE 'OOC'
         END) = LOWER('OOC') AND LOWER(CASE
        WHEN cust_id4 IS NOT NULL
        THEN 'Y'
        ELSE 'N'
        END) = LOWER('N') AND LOWER(CASE
       WHEN LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN data_tier_fin0
            ELSE data_tier_fin
            END, 'ZZ')) <> LOWER('Smartphone') OR LOWER(COALESCE(CASE
            WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
            THEN device_grouping1
            ELSE device_grouping0
            END, 'ZZ')) <> LOWER('Apple')
       THEN 'z) Not'
       WHEN LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone 11%') OR LOWER(CASE
           WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
           THEN CASE
            WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
            ELSE device_brand_nm1
            END
           ELSE CASE
            WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
            THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
            ELSE device_brand_nm0
            END
           END) LIKE LOWER('iPhone X%')
       THEN 'a) X/11'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 8%')
       THEN 'b) 8'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) LIKE LOWER('iPhone 12%')
       THEN 'e) 12'
       WHEN LOWER(CASE
          WHEN LOWER(curr_contract_term) IN (LOWER('DEVICE PAYMENT'), LOWER('EDGE CONTRACT'), LOWER('EDGE'))
          THEN CASE
           WHEN LOWER(device_brand_nm1) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm1, 1, LENGTH(device_brand_nm1) - 5)
           ELSE device_brand_nm1
           END
          ELSE CASE
           WHEN LOWER(device_brand_nm0) LIKE LOWER('%eSIM')
           THEN SUBSTR(device_brand_nm0, 1, LENGTH(device_brand_nm0) - 5)
           ELSE device_brand_nm0
           END
          END) IN (LOWER('iPhone 4'), LOWER('iPhone 4S'), LOWER('iPhone 5'), LOWER('iPhone 5C'), LOWER('iPhone 5S'),
         LOWER('iPhone SE'), LOWER('Other'))
       THEN 'd) Old'
       ELSE 'c) Oth'
       END) = LOWER('d) Old')
   THEN 'd) Reactive $10 SE'
   ELSE 'z) Other'
   END AS rialto_offer,
   CASE
   WHEN cust_id5 IS NOT NULL
   THEN 'Y'
   ELSE 'N'
   END AS dpp_elig,
   CASE
   WHEN cust_id6 IS NOT NULL
   THEN 'Y'
   ELSE 'N'
   END AS phog,
  COALESCE(ohog_aal, 'N') AS ohog_aal,
  COALESCE(ohog_pricing, 'N') AS ohog_pricing,
  COALESCE(ohog_product, 'N') AS ohog_product,
  COALESCE(ohog_upgrade, 'N') AS ohog_upgrade,
  in_mkt AS dmsf_in_mkt,
  highest_in_mkt_score_on_acct AS dmsf_max_in_mkt
 FROM (SELECT *
   FROM (SELECT *
     FROM ntl_prd_allvm.subs_sum_fact_v AS a
      INNER JOIN ntl_prd_allvm.cust_acct_line_v AS cal ON LOWER(a.cust_id) = LOWER(cal.cust_id) AND LOWER(a.cust_line_seq_id
          ) = LOWER(cal.cust_line_seq_id) AND LOWER(a.sor_id) = LOWER(cal.sor_id)
      LEFT JOIN (SELECT *
       FROM ntl_prd_allvm.cust_acct_line_dly_hist_v AS calh
        LEFT JOIN (SELECT curr_end_dt AS A1739006188
         FROM hqmkt_prd_qmtbls.knw_report_dates AS a
         WHERE rpt_id = 1) AS t0 ON TRUE
       WHERE (SELECT curr_end_dt
          FROM hqmkt_prd_qmtbls.knw_report_dates AS a
          WHERE rpt_id = 1) BETWEEN calh.eff_dt AND calh.exp_dt) AS t3 ON TRUE
     WHERE LOWER(a.cust_id) = LOWER(t3.cust_id)
      AND LOWER(a.cust_line_seq_id) = LOWER(t3.cust_line_seq_id)
      AND LOWER(a.sor_id) = LOWER(t3.sor_id)
      AND t3.exp_dt >= t3.A1739006188) AS t4
    INNER JOIN ntl_prd_allvm.cust_acct_v AS ca ON LOWER(t4.cust_id) = LOWER(ca.cust_id) AND LOWER(t4.acct_num) = LOWER(ca
        .acct_num) AND LOWER(t4.sor_id) = LOWER(ca.sor_id)
    LEFT JOIN (ntl_prd_allvm.loan_sum_fact_v AS dpp LEFT JOIN (SELECT curr_start_dt AS A850953683
      FROM hqmkt_prd_qmtbls.knw_report_dates AS a
      WHERE rpt_id = 1) AS t6 ON TRUE) ON LOWER(t4.cust_id) = LOWER(dpp.cust_id) AND LOWER(t4.cust_line_seq_id) = LOWER(dpp
           .cust_line_seq_id) AND t4.rpt_mth = dpp.rpt_mth AND LOWER(t4.loan_num) = LOWER(dpp.loan_num) AND LOWER(t4.sor_id
        ) = LOWER(dpp.sor_id) AND dpp.rpt_mth = t6.A850953683
    LEFT JOIN ntl_prd_allvm.price_plan_v AS pp ON LOWER(t4.pplan_cd) = LOWER(pp.pplan_cd) AND LOWER(t4.pplan_mkt_cd) =
       LOWER(pp.pplan_mkt_cd) AND LOWER(t4.sor_id) = LOWER(pp.sor_id)
    LEFT JOIN ntl_prd_qmtmptbls.knw_mc_07_dm_device_xref AS ssf_dev ON LOWER(COALESCE(t4.device_prod_nm, t4.prod_nm)) =
     LOWER(ssf_dev.prod_nm)
    LEFT JOIN ntl_prd_qmtmptbls.knw_mc_07_dm_device_xref AS dpp_dev ON LOWER(dpp.eqp_prod_nm) = LOWER(dpp_dev.prod_nm)
    LEFT JOIN ntl_prd_qmtmptbls.knw_mc_06_ever_upg AS eu ON LOWER(t4.cust_id) = LOWER(eu.cust_id) AND LOWER(t4.cust_line_seq_id
        ) = LOWER(eu.cust_line_seq_id) AND eu.min_upg_dt < DATE_ADD(t4.rpt_mth, INTERVAL 1 MONTH)
    LEFT JOIN (SELECT cust_id,
      acct_num
     FROM ntl_prd_allvm.edge_qualify_detail_v AS a
     WHERE LOWER(qualified_chk_ind) = LOWER('Y')
     GROUP BY cust_id,
      acct_num) AS dpe ON LOWER(t4.cust_id) = LOWER(dpe.cust_id) AND LOWER(t4.acct_num) = LOWER(dpe.acct_num)
    LEFT JOIN (SELECT *
     FROM udm_prdusr_allvm.crm_cust_acct_phog_v AS a
     GROUP BY cust_id,
      acct_num) AS phog0 ON LOWER(t4.cust_id) = LOWER(phog0.cust_id) AND LOWER(t4.acct_num) = LOWER(phog0.acct_num)
    LEFT JOIN (SELECT cust_id,
      acct_num,
      MAX(CASE
        WHEN LOWER(ohog_ctrgy_type) = LOWER('AAL')
        THEN 'Y'
        ELSE 'N'
        END) AS ohog_aal,
      MAX(CASE
        WHEN LOWER(ohog_ctrgy_type) = LOWER('Pricing')
        THEN 'Y'
        ELSE 'N'
        END) AS ohog_pricing,
      MAX(CASE
        WHEN LOWER(ohog_ctrgy_type) = LOWER('Product')
        THEN 'Y'
        ELSE 'N'
        END) AS ohog_product,
      MAX(CASE
        WHEN LOWER(ohog_ctrgy_type) = LOWER('Upgrade')
        THEN 'Y'
        ELSE 'N'
        END) AS ohog_upgrade
     FROM udm_prdusr_allvm.crm_cust_acct_ohog_v AS a
     WHERE (SELECT curr_end_dt
        FROM hqmkt_prd_qmtbls.knw_report_dates AS a
        WHERE rpt_id = 1) BETWEEN score_date AND ohog_dt
      AND LOWER(ohog_ctrgy_type) IN (LOWER('AAL'), LOWER('Pricing'), LOWER('Product'), LOWER('Upgrade'))
     GROUP BY cust_id,
      acct_num) AS ohog ON LOWER(t4.cust_id) = LOWER(ohog.cust_id) AND LOWER(t4.acct_num) = LOWER(ohog.acct_num)
    LEFT JOIN (SELECT *
     FROM udm_prdusr_allvm.dm_subs_fact_v AS dmsf
     WHERE base_mth = (SELECT next_start_dt
        FROM hqmkt_prd_qmtbls.knw_report_dates AS a
        WHERE rpt_id = 1)
      AND rpt_mth = (SELECT curr_start_dt
        FROM hqmkt_prd_qmtbls.knw_report_dates AS a
        WHERE rpt_id = 1)) AS t22 ON TRUE
   WHERE LOWER(t4.cust_id) = LOWER(t22.cust_id)
    AND LOWER(t4.cust_line_seq_id) = LOWER(t22.cust_line_seq_id)
    AND LOWER(t22.prepaid_ind) = LOWER('N')
    AND LOWER(t22.line_type_cd) IN (LOWER('I'), LOWER('W'))) AS t23
 WHERE LOWER(t23.sor_id) = LOWER('V')
  AND LOWER(t23.prepaid_ind) = LOWER('N')
  AND LOWER(t23.line_type_cd) IN (LOWER('I'), LOWER('W'))
  AND LOWER(t23.rev_gen_ind) = LOWER('Y')
  AND LOWER(t23.vz2_segmt_cd) IN (LOWER('PFSGL00015'), LOWER('PFSGL00016'), LOWER('PFSGL00017'))
  AND t23.rpt_mth = (SELECT curr_start_dt
    FROM hqmkt_prd_qmtbls.knw_report_dates AS a
    WHERE rpt_id = 1)
 EXCEPT DISTINCT
 SELECT *
 FROM hqmkt_prd_qmtbls.knw_cons_base_1;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
BEGIN
SET _ERROR_CODE  =  0;
SELECT FLOOR((EXTRACT(HOUR FROM CURRENT_TIME('Etc/GMT+4')) * 10000 + EXTRACT(MINUTE FROM CURRENT_TIME('Etc/GMT+4')) * 100 + EXTRACT(SECOND FROM CURRENT_TIME('Etc/GMT+4')) + EXTRACT(MICROSECOND FROM CURRENT_TIME('Etc/GMT+4')) * 0.000001) * 100) / 100 AS a;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
--collect stat on hqmkt_prd_qmtbls.knw_cons_base_1;
--index (ssf_cust_id, ssf_cust_line_seq_id)
--;
/*collect stat on hqmkt_prd_qmtbls.knw_cons_base_1
index (ssf_cust_id, ssf_acct_num)
;
*/
BEGIN
SET _ERROR_CODE  =  0;
SELECT FLOOR((EXTRACT(HOUR FROM CURRENT_TIME('Etc/GMT+4')) * 10000 + EXTRACT(MINUTE FROM CURRENT_TIME('Etc/GMT+4')) * 100 + EXTRACT(SECOND FROM CURRENT_TIME('Etc/GMT+4')) + EXTRACT(MICROSECOND FROM CURRENT_TIME('Etc/GMT+4')) * 0.000001) * 100) / 100 AS a;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
/*grant all on
hqmkt_prd_qmtbls.knw_cons_base_1
to hqmkt_prd_qmvm, greenda, lvi36u7, ufinntlaut, ufinntlhqbi, umktntldbrp,
v488108, v679791, v736613, werntku, hqmkt_prd_qmvm
with grant option
;

grant select on
hqmkt_prd_qmtbls.knw_cons_base_1
to co1wi, khanan1, liufang, maniki, swymede, tanyung, shiroke
with grant option
;

sel time as a;
*/
--where a.ssf_rpt_mth = (sel a.curr_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)
BEGIN
SET _ERROR_CODE  =  0;
SELECT ssf_base_mth, COUNT(*) AS cnt, COUNT(DISTINCT ssf_cust_id || ' ' || ssf_cust_line_seq_id) AS uniq, SUM(ssf_tot_lines) AS tot_lines, SUM(ssf_frac_accts) AS frac_accts, SUM(ssf_vce_lines) AS vce_lines, SUM(ssf_sp_lines) AS sp_lines, SUM(ssf_tab_lines) AS tab_lines, SUM(ssf_wear_lines) AS wear_lines
FROM hqmkt_prd_qmtbls.knw_cons_base_1 AS a
GROUP BY ssf_base_mth
ORDER BY 1;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
BEGIN
SET _ERROR_CODE  =  0;
SELECT *
FROM hqmkt_prd_qmtbls.knw_cons_base_1 AS a
LIMIT 100;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
BEGIN
SET _ERROR_CODE  =  0;
SELECT FLOOR((EXTRACT(HOUR FROM CURRENT_TIME('Etc/GMT+4')) * 10000 + EXTRACT(MINUTE FROM CURRENT_TIME('Etc/GMT+4')) * 100 + EXTRACT(SECOND FROM CURRENT_TIME('Etc/GMT+4')) + EXTRACT(MICROSECOND FROM CURRENT_TIME('Etc/GMT+4')) * 0.000001) * 100) / 100 AS a;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
/*insert into 
hqmkt_prd_qmtbls.knw_cons_base_1
sel * 
from ntl_prd_qmtmptbls.knw_cons_base_b
;

collect stat on hqmkt_prd_qmtbls.knw_cons_base_1;

sel
a.ssf_base_mth,
count (*) as cnt,
count (distinct (a.ssf_cust_id || ' ' || a.ssf_cust_line_seq_id)) as uniq,
sum (a.ssf_tot_lines) as tot_lines,
sum (a.ssf_frac_accts) as frac_accts,
sum (a.ssf_vce_lines) as vce_lines,
sum (a.ssf_sp_lines) as sp_lines,
sum (a.ssf_tab_lines) as tab_lines,
sum (a.ssf_wear_lines) as wear_lines

from hqmkt_prd_qmtbls.knw_cons_base_1 a

--where a.ssf_rpt_mth = 
--(sel a.curr_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)

group by 1
order by 1
;

drop table ntl_prd_qmtmptbls.knw_cons_base_a;
drop table ntl_prd_qmtmptbls.knw_cons_base_b;

sel time as a;
*/
BEGIN
SET _ERROR_CODE  =  0;
SELECT FLOOR((EXTRACT(HOUR FROM CURRENT_TIME('Etc/GMT+4')) * 10000 + EXTRACT(MINUTE FROM CURRENT_TIME('Etc/GMT+4')) * 100 + EXTRACT(SECOND FROM CURRENT_TIME('Etc/GMT+4')) + EXTRACT(MICROSECOND FROM CURRENT_TIME('Etc/GMT+4')) * 0.000001) * 100) / 100 AS a;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  CONCAT(_ERROR_MESSAGE, ' query = ', @@error.statement_text, ' errormsg = ', @@error.message, ' stacktrace = ', @@error.formatted_stack_trace);
END;
/*.LOGOFF;*/

IF _GLOBAL_ERROR_CODE > 0 THEN
    SELECT ERROR('RC (return code) = ' || FORMAT('%11d', _GLOBAL_ERROR_CODE) || _ERROR_MESSAGE) AS `A12180`;
    RETURN;
END IF;

SELECT 'RC (return code) = ' || FORMAT('%11d', _GLOBAL_ERROR_CODE) AS `A12180`;
RETURN;
END;
