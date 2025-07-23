BEGIN
DECLARE _ERROR_CODE INT64;
DECLARE _ERROR_MESSAGE STRING;
DECLARE _GLOBAL_ERROR_CODE INT64 DEFAULT 0;
--PSOCOMMENT--#!/bin/ksh
--PSOCOMMENT--#------------------------------------------------------------------------------
--PSOCOMMENT--# @(#) Verizon Wireless / SEDW
--PSOCOMMENT--# @(#) Retail_SC_Store_Fact.ksh Version 1.0
--PSOCOMMENT--# @(#) Created by Vootkuri, Kavya & Giridhar on 2024-04-14 
--PSOCOMMENT--# @(#) Modified on:
--PSOCOMMENT--#------------------------------------------------------------------------------
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                           CONTROL functions - START                          #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                           Function: validate_parms                           #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--function validate_parms
--PSOCOMMENT--{
--PSOCOMMENT--ANY_ERROR=N
--PSOCOMMENT--case ${SEND_EMAIL}
--PSOCOMMENT--  in
--PSOCOMMENT--N) ;;
--PSOCOMMENT--Y) ;;
--PSOCOMMENT--*) echo "ERROR => Unknown value for PARM SEND_EMAIL => (${SEND_EMAIL})"
--PSOCOMMENT--   ANY_ERROR=Y
--PSOCOMMENT--   ;;
--PSOCOMMENT--esac
--PSOCOMMENT--case ${ESP_DT}
--PSOCOMMENT--  in
--PSOCOMMENT--NOVALUE) echo "ERROR => Invalid value for PARM ESP_DT     => (${ESP_DT})"
--PSOCOMMENT--         ANY_ERROR=Y
--PSOCOMMENT--         ;;
--PSOCOMMENT--      *) ;;
--PSOCOMMENT--esac
--PSOCOMMENT--case ${ANY_ERROR}
--PSOCOMMENT--  in
--PSOCOMMENT--N) ;;
--PSOCOMMENT--Y) echo " "
--PSOCOMMENT--   echo " "
--PSOCOMMENT--   date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--   STEP_NAME=validate_parms
--PSOCOMMENT--   send_eml FAILURE
--PSOCOMMENT--   exit 1
--PSOCOMMENT--   ;;
--PSOCOMMENT--*) echo "ERROR => Unknown value for ANY_ERROR => (${ANY_ERROR})"
--PSOCOMMENT--   echo " "
--PSOCOMMENT--   echo " "
--PSOCOMMENT--   date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--   STEP_NAME=validate_parms
--PSOCOMMENT--   send_eml FAILURE
--PSOCOMMENT--   exit 1
--PSOCOMMENT--   ;;
--PSOCOMMENT--esac
--PSOCOMMENT--echo "********************************************************************************"
--PSOCOMMENT--echo "********************************************************************************"
--PSOCOMMENT--echo " "
--PSOCOMMENT--echo "Parms used for this run:"
--PSOCOMMENT--echo " "
--PSOCOMMENT--echo "ESP_DT     => ${ESP_DT}"
--PSOCOMMENT--echo " "
--PSOCOMMENT--echo "STGDB      => ${STGDB}"
--PSOCOMMENT--echo "TRGDB      => ${TRGDB}"
--PSOCOMMENT--echo "WKDIR      => ${WKDIR}"
--PSOCOMMENT--echo " "
--PSOCOMMENT--echo "SFX        => ${SFX}"
--PSOCOMMENT--echo " "
--PSOCOMMENT--echo "Send email => ${SEND_EMAIL}"
--PSOCOMMENT--echo "EMAIL_LIST => ${EMAIL_LIST}"
--PSOCOMMENT--echo " "
--PSOCOMMENT--echo "FUNC LIST  => ${SCRIPT_FUNC_LIST}"
--PSOCOMMENT--echo "REST FILE  => ${SCRIPT_STEP_REST}"
--PSOCOMMENT--echo " "
--PSOCOMMENT--echo "********************************************************************************"
--PSOCOMMENT--echo "********************************************************************************"
--PSOCOMMENT--return 0
--PSOCOMMENT--}
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                         Function:create_restart_file                         #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--function create_restart_file
--PSOCOMMENT--{
--PSOCOMMENT--echo `grep -w ${STEP_NAME} ${SCRIPT_FUNC_LIST}` > ${SCRIPT_STEP_REST}
--PSOCOMMENT--RTN_CD=$?
--PSOCOMMENT--case ${RTN_CD}
--PSOCOMMENT--  in
--PSOCOMMENT--  0) ;;
--PSOCOMMENT--  *) echo " "
--PSOCOMMENT--     echo "          INFO => ERROR creating ${SCRIPT_STEP_REST}"
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... ABENDS ... FAILURE" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--     send_eml FAILURE
--PSOCOMMENT--     exit 1
--PSOCOMMENT--     ;;
--PSOCOMMENT--esac
--PSOCOMMENT--}
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                           Function: remv_rest_file                           #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--function remv_rest_file
--PSOCOMMENT--{
--PSOCOMMENT--create_restart_file
--PSOCOMMENT--fileinfo=`ls ${SCRIPT_STEP_REST}`
--PSOCOMMENT--rm ${SCRIPT_STEP_REST}
--PSOCOMMENT--case ${RTN_CD}
--PSOCOMMENT--  in
--PSOCOMMENT--  0) ;;
--PSOCOMMENT--  *) echo " "
--PSOCOMMENT--     echo "          INFO => ERROR rm ${SCRIPT_STEP_REST}"
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... ABENDS ... FAILURE" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--     send_eml FAILURE
--PSOCOMMENT--     exit 1
--PSOCOMMENT--     ;;
--PSOCOMMENT--esac
--PSOCOMMENT--}
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                            Function: arch_log_file                           #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--function arch_log_file
--PSOCOMMENT--{
--PSOCOMMENT--#create_restart_file
--PSOCOMMENT--echo "create_restart_file complete"
--PSOCOMMENT--if [ ! -d ${LOG_SAVE_DIR} ]
--PSOCOMMENT--then
--PSOCOMMENT--       mkdir ${LOG_SAVE_DIR}
--PSOCOMMENT--       RTN_CD=$?
--PSOCOMMENT--       case ${RTN_CD}
--PSOCOMMENT--         in
--PSOCOMMENT--         0) ;;
--PSOCOMMENT--         *) echo " "
--PSOCOMMENT--            echo "          INFO => ERROR mkdir ${LOG_SAVE_DIR}"
--PSOCOMMENT--            echo " "
--PSOCOMMENT--            echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... ABENDS ... FAILURE" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--            echo " "
--PSOCOMMENT--            echo " "
--PSOCOMMENT--            date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--            send_eml FAILURE
--PSOCOMMENT--            exit 1
--PSOCOMMENT--            ;;
--PSOCOMMENT--       esac
--PSOCOMMENT--fi
--PSOCOMMENT--mv ${lf} ${LOG_SAVE_DIR}
--PSOCOMMENT--RTN_CD=$?
--PSOCOMMENT--case ${RTN_CD}
--PSOCOMMENT--  in
--PSOCOMMENT--  0) ;;
--PSOCOMMENT--  *) echo " "
--PSOCOMMENT--     echo "          INFO => ERROR mv ${lf} ${LOG_SAVE_DIR}"
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... ABENDS ... FAILURE" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--     send_eml FAILURE
--PSOCOMMENT--     exit 1
--PSOCOMMENT--     ;;
--PSOCOMMENT--esac
--PSOCOMMENT--}
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                              Function: send_eml                              #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--function send_eml
--PSOCOMMENT--{
--PSOCOMMENT--case ${SEND_EMAIL}
--PSOCOMMENT--  in
--PSOCOMMENT--  Y) ;;
--PSOCOMMENT--  *) return 0
--PSOCOMMENT--     ;;
--PSOCOMMENT--esac
--PSOCOMMENT--EML_TYPE=${1:-NOVALUE}
--PSOCOMMENT--case ${EML_TYPE}
--PSOCOMMENT--  in
--PSOCOMMENT--SUCCESS) SUBJECT="(${SERVER}) ${SCRIPT}.ksh ${ESP_DT} - Completion Status => SUCCESS"
--PSOCOMMENT--         grep Driver ${LOG_SAVE_DIR}/`basename ${lf}` > ${RUNTIMES}
--PSOCOMMENT--         ;;
--PSOCOMMENT--FAILURE) SUBJECT="(${SERVER}) ${SCRIPT}.ksh ${ESP_DT} - Completion Status => FAILURE in ${STEP_NAME}"
--PSOCOMMENT--         grep Driver ${lf} > ${RUNTIMES}
--PSOCOMMENT--         ;;
--PSOCOMMENT--      *) SUBJECT="(${SERVER}) ${SCRIPT}.ksh ${ESP_DT}  - Completion Status => UNKNOWN"
--PSOCOMMENT--         grep Driver ${lf} > ${RUNTIMES}
--PSOCOMMENT--         ;;
--PSOCOMMENT--esac
--PSOCOMMENT--case ${SERVER}
--PSOCOMMENT--  in
--PSOCOMMENT--tdclpalova001) echo | mailx -a ${RUNTIMES} -s "${SUBJECT}" ${EMAIL_LIST}
--PSOCOMMENT--               ;;
--PSOCOMMENT--            *) uuencode ${RUNTIMES} ${RUNTIMEF} 2>/dev/null | mailx -s "${SUBJECT}" ${EMAIL_LIST}
--PSOCOMMENT--               ;;
--PSOCOMMENT--esac
--PSOCOMMENT--return 0
--PSOCOMMENT--}
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                           CONTROL functions -   END                          #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                            DATA functions - START                            #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                      Function: load_Retail_SC_Store_Fact                     #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--function load_Retail_SC_Store_Fact
--PSOCOMMENT--{
--PSOCOMMENT--create_restart_file
--PSOCOMMENT--bteq <<-EOF
--PSOCOMMENT-- --.LOGON ${LOGON_STRING}; 
--PSOCOMMENT-- --.Set Width 155;
BEGIN
SET _ERROR_CODE  =  0;
DELETE FROM udm_prd_tbls.retail_sc_store_fact
WHERE report_date = CURRENT_DATE;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
END;

IF _ERROR_CODE <> 0 THEN

    IF _ERROR_CODE <> 0 THEN
        SELECT ERROR('RC (return code)=' || FORMAT('%11d', _ERROR_CODE) || _ERROR_MESSAGE) AS `A12180`;
        RETURN;
    END IF;

    SELECT 'RC (return code) = ' || FORMAT('%11d', _ERROR_CODE) AS `A12180`;
    RETURN;
END IF;

BEGIN
SET _ERROR_CODE  =  0;
INSERT INTO udm_prd_tbls.retail_sc_store_fact
SELECT DISTINCT CURRENT_DATE AS report_date,
  a.vlm_cd,
  a.channel_type AS channel,
  REPLACE(a.loc_store_nm, ',', ' ') AS location_nm,
  REPLACE(a.location_type, ',', ' ') AS location_type,
  REPLACE(a.addr_line1, ',', ' ') AS address_1,
  REPLACE(a.addr_line2, ',', ' ') AS address_2,
  a.zip5_cd AS zip_code,
  a.city_nm AS city,
  a.state_cd AS state,
  e.county_nm AS county,
  a.tel_num AS phone_number,
  d.tm_zone AS time_zone,
  a.latitude,
  a.longitude,
  a.store_open_dt AS open_dt,
  a.store_close_dt AS close_dt,
  a.store_design,
  a.loc_lang_desc AS merchandising_language,
  b.vz2_area_desc AS area_desc,
  b.vz2_area_cd AS area_code,
  b.vz2_region_desc AS region_desc,
  b.vz2_region_cd AS region_cd,
  REPLACE(b.territory_desc, ',', ' ') AS b_territory_desc,
  b.territory_cd,
  b.district_desc,
  b.district_cd,
  b.zone_desc,
  b.zone_cd,
  a.store_num AS pos_location_code,
  a.site_status AS location_status,
  e.svc_5g_desc AS home_internet_sales,
  a.wsap_code AS wsap_customer_id,
  a.insert_dt AS created_dt
 FROM udm_prd_tbls.outlet AS a
  LEFT JOIN ntl_prd_allvm.consumer_hierarchy_v AS b ON LOWER(a.zref_id) = LOWER(b.zref_id)
  LEFT JOIN udm_prd_tbls.zip AS d ON LOWER(a.zip5_cd) = LOWER(d.zip5_cd)
  LEFT JOIN ntl_prd_allvm.vlm_location_v AS e ON LOWER(a.vlm_cd) = LOWER(e.vlm_cd)
 WHERE LOWER(a.channel_type) = LOWER('RET')
  AND a.vlm_cd IS NOT NULL
 EXCEPT DISTINCT
 SELECT report_date,
  vlm_cd,
  channel,
  location_nm,
  location_type,
  address_1,
  address_2,
  zip_code,
  city,
  state,
  county,
  phone_number,
  time_zone,
  latitude,
  longitude,
  open_dt,
  close_dt,
  store_design,
  merchandising_language,
  area_desc,
  area_code,
  region_desc,
  region_cd,
  territory_desc,
  territory_cd,
  district_desc,
  district_cd,
  zone_desc,
  zone_cd,
  pos_location_code,
  location_status,
  home_internet_sales,
  wsap_customer_id,
  created_dt
 FROM udm_prd_tbls.retail_sc_store_fact;
EXCEPTION WHEN ERROR THEN
SET _ERROR_CODE  =  1;
SET _GLOBAL_ERROR_CODE  =  1;
SET _ERROR_MESSAGE  =  @@error.message;
END;

IF _ERROR_CODE <> 0 THEN

    IF _ERROR_CODE <> 0 THEN
        SELECT ERROR('RC (return code)=' || FORMAT('%11d', _ERROR_CODE) || _ERROR_MESSAGE) AS `A12180`;
        RETURN;
    END IF;

    SELECT 'RC (return code) = ' || FORMAT('%11d', _ERROR_CODE) AS `A12180`;
    RETURN;
END IF;


IF _GLOBAL_ERROR_CODE > 0 THEN
    SELECT ERROR('RC (return code)=' || FORMAT('%11d', _GLOBAL_ERROR_CODE) || _ERROR_MESSAGE) AS `A12180`;
    RETURN;
END IF;

SELECT 'RC (return code) = ' || FORMAT('%11d', _GLOBAL_ERROR_CODE) AS `A12180`;
RETURN;
END;
