.RUN FILE = 'C:\Reporting\TD_PW\HLAVSMA\UMKTNTLDBRP.txt';

sel time as a;

del from hqmkt_prd_qmtbls.knw_cons_base_1 a
where a.ssf_rpt_mth = 
(sel a.curr_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)
;

sel time as a;

--drop table hqmkt_prd_qmtbls.knw_cons_base_1;
--create set table hqmkt_prd_qmtbls.knw_cons_base_1
insert into hqmkt_prd_qmtbls.knw_cons_base_1
--as
--(
sel
'A' as section,
a.rpt_mth as ssf_rpt_mth,
add_months (a.rpt_mth, 1) as ssf_base_mth,

a.cust_id as ssf_cust_id,
a.acct_num as ssf_acct_num,
a.cust_line_seq_id as ssf_cust_line_seq_id,
a.mtn as ssf_mtn,
a.vsn_cust_type_cd as ssf_vsn_cust_type_cd,
a.vz2_segmt_cd as ssf_vz2_segmt_cd,

coalesce (a.device_prod_nm, a.prod_nm) as ssf_prod_nm,
ssf_dev.data_tier_fin as ssf_data_tier,
ssf_dev.device_grouping as ssf_device_grouping,

case when ssf_dev.device_brand_nm like '%eSIM'
then substr (ssf_dev.device_brand_nm, 1, length (ssf_dev.device_brand_nm) -5)
else ssf_dev.device_brand_nm end as ssf_device_brand_nm,

ssf_dev.device_generation as ssf_device_generation,

case when ssf_dev.data_tier_fin = 'Smartphone' and ssf_dev.device_grouping = 'Apple' then 'sp_apple'
when ssf_dev.data_tier_fin = 'Smartphone' and ssf_dev.device_grouping = 'Android' then 'sp_android'
when ssf_dev.data_tier_fin = 'Smartphone' and coalesce (ssf_dev.device_grouping, 'XX') not in ('Apple','Android') then 'sp_other'
when ssf_dev.data_tier_fin = 'Basic' then 'bas'
when ssf_dev.device_grouping = 'Tablet' then 'tab'
when ssf_dev.device_grouping = 'Wearable Devices' then 'wear'
when ssf_dev.device_grouping = 'Camera' then 'camera'
when ssf_dev.device_grouping = 'Home Phone Connect' then 'hpc'
when ssf_dev.device_grouping = 'Automotive' then 'auto'
when ssf_dev.device_grouping = 'Mobile Hotspot' then 'jetpack'
when ssf_dev.data_tier_fin = 'Internet' and coalesce (ssf_dev.device_grouping, 'XX') not in
(
'Tablet',
'Wearable Devices',
'Camera',
'Home Phone Connect',
'Automotive',
'Mobile Hotspot'
)
then 'oth_inet'
else 'zz oth' end as ssf_dev_typ,

ssf_dev.cdma as ssf_cdma,

ssf_dev.mfg_nm as ssf_mfg_nm,
ssf_dev.trade_promo_grp as ssf_trade_promo_grp,

trim (a.curr_contract_term) as ssf_curr_contract_term,
a.loan_num as ssf_loan_num,

a.pplan_cd as ssf_pplan_cd,
a.pplan_mkt_cd as ssf_pplan_mkt_cd,
coalesce (pp.coe_pplan_sub_type_desc, 'Unknown Postpaid') as ssf_pplan_sub_type_desc,

--case when pp.coe_pplan_sub_type_desc is null then 'z) Null'
case when pp.coe_pplan_sub_type_desc like any ('%above%','%beyond%')
or pp.coe_pplan_sub_type_desc in
(
'Do Unlimited',
'Get Unlimited',
'Play Unlimited',
'Do Unlimited 3.0',
'Get Unlimited 3.0',
'Play Unlimited 3.0',
'Play Unlimited 4.0',
'Do Unlimited 4.0',
'Get Unlimited 4.0',
'One Unlimited',
'Business Unlimited',
'Business Unlimited Evolution'
)
then 'a) Prem' 
when pp.coe_pplan_sub_type_desc in
(
'4G LTE Home',
'4G LTE Business Internet',
'5G (Non Phone) Unlimited',
'5G Home',
'5G Moto Mod Business Unlimited',
'5G Moto Mod Unlimited',
'Business Share Unlimited Data',
'Business Unlimited',
'Connected Unlimited',
'Go Unlimited 1.0',
'Go Unlimited 2.0',
'Go Unlimited 55+',
'Just Kids 3.0',
'Line Level Unlimited Data',
'Primary Share Unlimited Data',
'Secondary Share Unlimited Data',
'Start Unlimited Trial',
'Start Unlimited',
'Start Unlimited 4.0',
'Welcome Unlimited 4.5',
'5G Business Internet',
'Bluegrass Connected Unlimited',
'Bluegrass Unlimited'
)
then 'b) Entry'
when pp.coe_pplan_sub_type_desc in
(
'Verizon Unlimited'
)
then 'c) Vz Unl'
else 'd) Oth' end as plan_typ,

trim (a.channel_type) as ssf_chan_cd,

case when a.channel_type = 'M' then 'd1) Stores'
when a.channel_type = 'D' then 'd2) B2B'
when a.channel_type = 'T' then 'd3) Telesales'
when a.channel_type = 'N' then 'd4) Internet'
when a.channel_type = 'NC' then 'd5) Non Comm'
when a.channel_type = 'A' then 'i1) Local Agent'
when a.channel_type = 'I' then 'i1) Local Agent'
when a.channel_type = 'R' then 'i2) Nat Retail'
when a.channel_type = 'IN' then 'i3) Ind Internet'
when a.channel_type = 'V' then 'i4) VAD/EOM'
else 'z1) Other' end as ssf_chan_nm,

a.ending_customers as ssf_tot_lines,
a.acct_fraction as ssf_frac_accts,
case when ssf_dev.data_tier_fin in ('Basic','Smartphone') then a.ending_customers else 0 end as ssf_vce_lines,
case when ssf_dev.data_tier_fin = 'Smartphone' then a.ending_customers else 0 end as ssf_sp_lines,
case when ssf_dev.device_grouping = 'Tablet' then a.ending_customers else 0 end as ssf_tab_lines,
case when ssf_dev.device_grouping = 'Wearable Devices' then a.ending_customers else 0 end as ssf_wear_lines,

case when dpp.loan_num is not null then 'Y' else 'N' end as dpp_loan_num,

dpp.eqp_prod_nm as dpp_prod_nm,
dpp_dev.data_tier_fin as dpp_data_tier,
dpp_dev.device_grouping as dpp_device_grouping,

case when dpp_dev.device_brand_nm like '%eSIM'
then substr (dpp_dev.device_brand_nm, 1, length (dpp_dev.device_brand_nm) -5)
else dpp_dev.device_brand_nm end as dpp_device_brand_nm,

dpp_dev.device_generation as dpp_device_generation,

case when dpp_dev.data_tier_fin = 'Smartphone' and dpp_dev.device_grouping = 'Apple' then 'sp_apple'
when dpp_dev.data_tier_fin = 'Smartphone' and dpp_dev.device_grouping = 'Android' then 'sp_android'
when dpp_dev.data_tier_fin = 'Smartphone' and coalesce (dpp_dev.device_grouping, 'XX') not in ('Apple','Android') then 'sp_other'
when dpp_dev.data_tier_fin = 'Basic' then 'bas'
when dpp_dev.device_grouping = 'Tablet' then 'tab'
when dpp_dev.device_grouping = 'Wearable Devices' then 'wear'
when dpp_dev.device_grouping = 'Camera' then 'camera'
when dpp_dev.device_grouping = 'Home Phone Connect' then 'hpc'
when dpp_dev.device_grouping = 'Automotive' then 'auto'
when dpp_dev.device_grouping = 'Mobile Hotspot' then 'jetpack'
when dpp_dev.data_tier_fin = 'Internet' and coalesce (dpp_dev.device_grouping, 'XX') not in
(
'Tablet',
'Wearable Devices',
'Camera',
'Home Phone Connect',
'Automotive',
'Mobile Hotspot'
)
then 'oth_inet'
else 'zz oth' end as dpp_dev_typ,

dpp_dev.cdma as dpp_cdma,

dpp_dev.mfg_nm as dpp_mfg_nm,
dpp_dev.trade_promo_grp as dpp_trade_promo_grp,

case when dpp.loan_status_ind in ('A','AA','AR') then 'A'
when dpp.loan_status_ind = 'S' then 'S'
else 'Z'
end as dpp_loan_status_ind,

dpp.loan_create_dt as dpp_loan_create_dt,
dpp.loan_term_mth_qty as dpp_loan_term_mth_qty,

add_months (dpp.loan_create_dt, dpp.loan_term_mth_qty) as dpp_loan_exp_dt,

dpp.upg_elig_cd as dpp_upg_elig_cd,
dpp.loan_upg_pct as dpp_loan_upg_pct,
dpp.orig_device_amt as dpp_orig_device_amt,
dpp.install_loan_amt as dpp_orig_loan_amt,
dpp.loan_mth_pymnt_amt as dpp_loan_mth_pymnt_amt,
dpp.full_outstanding_bal_amt as dpp_remaining_loan_bal,
dpp.install_pymnt_outstanding_cnt as dpp_remaining_payments,

dpp.orig_device_amt - dpp.full_outstanding_bal_amt as dpp_device_amt_paid,
dpp.install_loan_amt - dpp.full_outstanding_bal_amt as dpp_loan_amt_paid,

cast ((dpp_device_amt_paid / dpp.orig_device_amt) as decimal(10,2)) as dpp_device_pct_paid,
cast ((dpp_loan_amt_paid / dpp.install_loan_amt) as decimal(10,2)) as dpp_loan_pct_paid,

case when (((dpp.loan_mth_pymnt_amt *0) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_00_Pay'
when (((dpp.loan_mth_pymnt_amt *1) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_01_Pay'
when (((dpp.loan_mth_pymnt_amt *2) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_02_Pay'
when (((dpp.loan_mth_pymnt_amt *3) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_03_Pay'
when (((dpp.loan_mth_pymnt_amt *4) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_04_Pay'
when (((dpp.loan_mth_pymnt_amt *5) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_05_Pay'
when (((dpp.loan_mth_pymnt_amt *6) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_06_Pay'
when (((dpp.loan_mth_pymnt_amt *7) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_07_Pay'
when (((dpp.loan_mth_pymnt_amt *8) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_08_Pay'
when (((dpp.loan_mth_pymnt_amt *9) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_09_Pay'
when (((dpp.loan_mth_pymnt_amt *10) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_10_Pay'
when (((dpp.loan_mth_pymnt_amt *11) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_11_Pay'
when (((dpp.loan_mth_pymnt_amt *12) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_12_Pay'
when (((dpp.loan_mth_pymnt_amt *13) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_12_Pay'
when (((dpp.loan_mth_pymnt_amt *14) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_12_Pay'
when (((dpp.loan_mth_pymnt_amt *15) + (dpp.orig_device_amt - dpp.full_outstanding_bal_amt)) * 100 / dpp.orig_device_amt) >= 50 then '50_12_Pay'
else null end as dpp_au_pay_status,

coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) as calh_esn_redempt_dt,

case when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) is null then '99) Null'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -13 then '38) OOC'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -12 then '37) T+12'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -11 then '36) T+11'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -10 then '35) T+10'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -9 then '34) T+9'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -8 then '33) T+8'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -7 then '32) T+7'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -6 then '31) T+6'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -5 then '30) T+5'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -4 then '29) T+4'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -3 then '28) T+3'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -2 then '27) T+2'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * -1 then '26) T+1'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 0 then '25) T-0'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 1 then '24) T-1'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 2 then '23) T-2'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 3 then '22) T-3'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 4 then '21) T-4'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 5 then '20) T-5'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 6 then '19) T-6'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 7 then '18) T-7'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 8 then '17) T-8'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 9 then '16) T-9'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 10 then '15) T-10'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 11 then '14) T-11'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 12 then '13) T-12'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 13 then '12) T-13'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 14 then '11) T-14'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 15 then '10) T-15'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 16 then '09) T-16'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 17 then '08) T-17'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 18 then '07) T-18'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 19 then '06) T-19'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 20 then '05) T-20'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 21 then '04) T-21'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 22 then '03) T-22'
when coalesce (calh.esn_redempt_dt, cal.esn_redempt_dt) - add_months (a.rpt_mth, 1) <= 30 * 23 then '02) T-23'
else '01) T-24' end as calh_t_mth,

coalesce (calh.line_act_dt, cal.line_act_dt) as calh_line_act_dt,
coalesce (calh.mtn_act_dt, cal.mtn_act_dt) as calh_mtn_act_dt,
coalesce (ca.orig_acct_estb_dt, ca.acct_estb_dt) as acct_estb_dt,

case when coalesce (calh_esn_redempt_dt, ssf_base_mth) <= add_months (ssf_base_mth, 1) - 1
and a.curr_contract_term in ('MTM Contract','Out of Contract')
then 'Y' else 'N' end as upg_elig,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp.eqp_prod_nm else coalesce (a.device_prod_nm, a.prod_nm) end as rialto_prod_nm,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_dev.data_tier_fin else ssf_dev.data_tier_fin end as rialto_data_tier,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_dev.device_grouping else ssf_dev.device_grouping end as rialto_dev_grp,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_device_brand_nm else ssf_device_brand_nm end as rialto_brand_nm,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_dev.device_generation else ssf_dev.device_generation end as rialto_dev_gen,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_dev_typ else ssf_dev_typ end as rialto_dev_typ,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_cdma else ssf_cdma end as rialto_cdma,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_mfg_nm else ssf_mfg_nm end as rialto_mfg_nm,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then dpp_trade_promo_grp else ssf_trade_promo_grp end as rialto_trade_promo_grp,

case when coalesce (rialto_data_tier, 'ZZ') <> 'Smartphone' 
or coalesce (rialto_dev_grp, 'ZZ') <> 'Apple' 
then 'z) Not'
when rialto_brand_nm like any
(
'iPhone 11%',
'iPhone X%'
) then 'a) X/11'
when rialto_brand_nm like any
(
'iPhone 8%'
) then 'b) 8'
when rialto_brand_nm like any
(
'iPhone 12%'
) then 'e) 12'
when rialto_brand_nm in
(
'iPhone 4',
'iPhone 4S',
'iPhone 5',
'iPhone 5C',
'iPhone 5S',
'iPhone SE',
'Other'
) then 'd) Old'
else 'c) Oth' end as rialto_short_nm,

case when rialto_short_nm = 'a) X/11' then 440
when rialto_short_nm = 'b) 8' then 440
when rialto_short_nm = 'c) Oth' then 100
else 0 end as rialto_dpp_tiv,

case when a.curr_contract_term in ('1 YR CONTRACT','2 YR CONTRACT') then 'SVC'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and dpp.upg_elig_cd = '50_UO'
then 'DP-AU'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') then 'DP'
else 'OOC' end as rialto_cntrct1,

case when a.curr_contract_term in ('1 YR CONTRACT','2 YR CONTRACT') then 'IC'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
then 'IC'
else 'OOC' end as rialto_cntrct2,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and dpp.upg_elig_cd = '50_UO'
and dpp_au_pay_status = '50_00_Pay'
then 'a) AU pay 0'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and dpp.upg_elig_cd = '50_UO'
and dpp_au_pay_status = '50_01_Pay'
then 'b) AU pay 1'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and dpp.upg_elig_cd = '50_UO'
and dpp_au_pay_status = '50_02_Pay'
then 'c) AU pay 2'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and dpp.upg_elig_cd = '50_UO'
then 'd) AU pay 3+'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
then 'e) DP No AU'
when a.curr_contract_term in ('1 YR CONTRACT','2 YR CONTRACT') then 'f) SVC'
else 'g) OOC' end as rialto_cntrct3,

case when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and rialto_dpp_tiv >= dpp.full_outstanding_bal_amt
then 'a) Trade Pay 0'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and rialto_dpp_tiv >= dpp.full_outstanding_bal_amt - (dpp.loan_mth_pymnt_amt * 1)
then 'b) Trade Pay 1'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
and rialto_dpp_tiv >= dpp.full_outstanding_bal_amt - (dpp.loan_mth_pymnt_amt * 2)
then 'c) Trade Pay 2'
when a.curr_contract_term in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') 
then 'd) Trade Pay 3+'
when a.curr_contract_term in ('1 YR CONTRACT','2 YR CONTRACT') then 'e) SVC'
else 'f) OOC' end as rialto_cntrct4,

case when rialto_cntrct3 = 'a) AU pay 0' and 
case when a.curr_contract_term not in ('DEVICE PAYMENT','EDGE CONTRACT','EDGE') then null
when dpp.install_pymnt_outstanding_cnt < 1 then 1
when dpp.install_pymnt_outstanding_cnt > 24 then 24
else dpp.install_pymnt_outstanding_cnt end
> 6 then 'a) AU pay 0'
when rialto_cntrct3 in ('b) AU pay 1','c) AU pay 2') then 'b) AU pay 1-2'
when rialto_cntrct4 = 'a) Trade Pay 0' then 'c) Trade Pay 0'
when rialto_cntrct4 in ('b) Trade Pay 1','c) Trade Pay 2') then 'd) Trade Pay 1-2'
when a.curr_contract_term in 
('1 YR CONTRACT','2 YR CONTRACT','DEVICE PAYMENT','EDGE CONTRACT','EDGE')
then 'e) IC'
else 'f) OOC' end as rialto_cntrct5,

case when eu.cust_id is not null then 'Y' else 'N' end as ever_upg,

case when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'a) X/11' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'b) 8' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'c) Oth' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'd) Old' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'a) X/11' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'b) 8' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'c) Oth' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'd) Old' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'a) X/11' then 'b) Nat Promo'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'b) 8' then 'b) Nat Promo'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'c) Oth' then 'b) Nat Promo'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'd) Old' then 'b) Nat Promo'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'a) X/11' then 'b) Nat Promo'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'b) 8' then 'b) Nat Promo'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'c) Oth' then 'b) Nat Promo'
when plan_typ = 'a) Prem' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'd) Old' then 'b) Nat Promo'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'a) X/11' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'b) 8' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'c) Oth' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'd) Old' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'a) X/11' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'b) 8' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'c) Oth' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'd) Old' then 'a) DP-AU / Trade / Aware'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'a) X/11' then 'b) Nat Promo'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'b) 8' then 'b) Nat Promo'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'c) Oth' then 'b) Nat Promo'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'd) Old' then 'b) Nat Promo'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'a) X/11' then 'c) Reactive $200'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'b) 8' then 'c) Reactive $200'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'c) Oth' then 'c) Reactive $200'
when plan_typ in ('b) Entry','c) Vz Unl') and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'd) Old' then 'c) Reactive $200'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'a) X/11' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'b) 8' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'c) Oth' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'Y' and rialto_short_nm = 'd) Old' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'a) X/11' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'b) 8' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'c) Oth' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'IC' and ever_upg = 'N' and rialto_short_nm = 'd) Old' then 'a) DP-AU / Trade / Aware'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'a) X/11' then 'c) Reactive $200'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'b) 8' then 'c) Reactive $200'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'c) Oth' then 'c) Reactive $200'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'Y' and rialto_short_nm = 'd) Old' then 'c) Reactive $200'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'a) X/11' then 'c) Reactive $200'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'b) 8' then 'd) Reactive $10 SE'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'c) Oth' then 'd) Reactive $10 SE'
when plan_typ = 'd) Oth' and rialto_cntrct2 = 'OOC' and ever_upg = 'N' and rialto_short_nm = 'd) Old' then 'd) Reactive $10 SE'
else 'z) Other' end as rialto_offer,

case when dpe.cust_id is not null then 'Y' else 'N' end as dpp_elig,

case when phog.cust_id is not null then 'Y' else 'N' end as phog,
coalesce (ohog.ohog_AAL, 'N') as ohog_AAL,
coalesce (ohog.ohog_Pricing, 'N') as ohog_Pricing,
coalesce (ohog.ohog_Product, 'N') as ohog_Product,
coalesce (ohog.ohog_Upgrade, 'N') as ohog_Upgrade,

dmsf.in_mkt as dmsf_in_mkt,
dmsf.highest_in_mkt_score_on_acct as dmsf_max_in_mkt

from ntl_prd_allvm.subs_sum_fact_v a

inner join ntl_prd_allvm.cust_acct_line_v cal
on a.cust_id = cal.cust_id
and a.cust_line_seq_id = cal.cust_line_seq_id
and a.sor_id = cal.sor_id

left outer join ntl_prd_allvm.cust_acct_line_dly_hist_v calh
on a.cust_id = calh.cust_id
and a.cust_line_seq_id = calh.cust_line_seq_id
and a.sor_id = calh.sor_id
and calh.exp_dt >= (sel a.curr_end_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)
and (sel a.curr_end_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1) between calh.eff_dt and calh.exp_dt

inner join ntl_prd_allvm.cust_acct_v ca
on a.cust_id = ca.cust_id
and a.acct_num = ca.acct_num
and a.sor_id = ca.sor_id

left outer join ntl_prd_allvm.loan_sum_fact_v dpp
on a.cust_id = dpp.cust_id
and a.cust_line_seq_id = dpp.cust_line_seq_id
and a.rpt_mth = dpp.rpt_mth
and a.loan_num = dpp.loan_num
and a.sor_id = dpp.sor_id
and dpp.rpt_mth = (sel a.curr_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)

left outer join ntl_prd_allvm.price_plan_v pp
on a.pplan_cd = pp.pplan_cd
and a.pplan_mkt_cd = pp.pplan_mkt_cd
and a.sor_id = pp.sor_id

left outer join ntl_prd_qmtmptbls.knw_mc_07_dm_device_xref ssf_dev
on coalesce (a.device_prod_nm, a.prod_nm) = ssf_dev.prod_nm

left outer join ntl_prd_qmtmptbls.knw_mc_07_dm_device_xref dpp_dev
on dpp.eqp_prod_nm = dpp_dev.prod_nm

left outer join ntl_prd_qmtmptbls.knw_mc_06_ever_upg eu
on a.cust_id = eu.cust_id
and a.cust_line_seq_id = eu.cust_line_seq_id
and eu.min_upg_dt < add_months (a.rpt_mth, 1)

left outer join 
(
sel
a.cust_id,
a.acct_num

from ntl_prd_allvm.edge_qualify_detail_v a

where a.qualified_chk_ind = 'Y'

group by 1,2

) dpe on a.cust_id = dpe.cust_id
and a.acct_num = dpe.acct_num

left outer join 
(
sel
a.cust_id,
a.acct_num

from udm_prdusr_allvm.crm_cust_acct_phog_v a

group by 1,2

) phog on a.cust_id = phog.cust_id
and a.acct_num = phog.acct_num

left outer join 
(
sel
a.cust_id,
a.acct_num,
max (case when a.ohog_ctrgy_type = 'AAL' then 'Y' else 'N' end) as ohog_AAL,
max (case when a.ohog_ctrgy_type = 'Pricing' then 'Y' else 'N' end) as ohog_Pricing,
max (case when a.ohog_ctrgy_type = 'Product' then 'Y' else 'N' end) as ohog_Product,
max (case when a.ohog_ctrgy_type = 'Upgrade' then 'Y' else 'N' end) as ohog_Upgrade

from udm_prdusr_allvm.crm_cust_acct_ohog_v a

where (sel a.curr_end_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)
between a.score_date and a.ohog_dt
and a.ohog_ctrgy_type in
(
'AAL',
'Pricing',
'Product',
'Upgrade'
)

group by 1,2

) ohog on a.cust_id = ohog.cust_id
and a.acct_num = ohog.acct_num

left outer join udm_prdusr_allvm.dm_subs_fact_v dmsf
on a.cust_id = dmsf.cust_id
and a.cust_line_seq_id = dmsf.cust_line_seq_id
and dmsf.prepaid_ind = 'N'
and dmsf.line_type_cd in ('I','W')
and dmsf.base_mth = (sel a.next_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)
and dmsf.rpt_mth = (sel a.curr_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)

where a.sor_id = 'V'
and a.prepaid_ind = 'N'
and a.line_type_cd in ('I','W')
and a.rev_gen_ind = 'Y'
and a.vz2_segmt_cd in ('PFSGL00015','PFSGL00016','PFSGL00017')
and a.rpt_mth = (sel a.curr_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)

/*
) with data
primary index (ssf_cust_id, ssf_cust_line_seq_id)
--index (ssf_cust_id, ssf_acct_num)
partition by 
(
range_n (ssf_rpt_mth between 1180101 AND 1221201 each interval '1' month, no range, unknown)
--,range_n (activity_dt between 1180101 AND 1211231 each interval '1' day, no range, unknown)
)
;

show table hqmkt_prd_qmtbls.knw_cons_base_1;
*/
;

sel time as a;

collect stat on hqmkt_prd_qmtbls.knw_cons_base_1;
--index (ssf_cust_id, ssf_cust_line_seq_id)
--;

/*
collect stat on hqmkt_prd_qmtbls.knw_cons_base_1
index (ssf_cust_id, ssf_acct_num)
;
*/

sel time as a;

/*
grant all on
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

--where a.ssf_rpt_mth = (sel a.curr_start_dt from hqmkt_prd_qmtbls.knw_report_dates a where a.rpt_id = 1)

group by 1
order by 1
;

sel
top 100 a.*
from hqmkt_prd_qmtbls.knw_cons_base_1 a
;

sel time as a;

/*
insert into 
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

grant select on ntl_prd_qmtmptbls.knw_mc_00_score_dates_1 to v542982;
grant select on ntl_prd_qmtmptbls.knw_mc_06_ever_upg_1 to v542982;
grant select on ntl_prd_qmtmptbls.knw_mc_25_rtgt_t1_1 to v542982;
grant select on ntl_prd_qmtmptbls.knw_cons_esf_1 to v542982;

sel time as a;  

.LOGOFF
.QUIT
