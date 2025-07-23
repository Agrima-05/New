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

del from udm_prd_tbls.Retail_SC_Store_Fact
where Report_Date=current_date;

.IF ERRORCODE != 0 THEN .QUIT ERRORCODE

insert into udm_prd_tbls.Retail_SC_Store_Fact 
SELECT 
Current_date as Report_Date,
a.VLM_CD,
a.CHANNEL_TYPE AS CHANNEL,
OREPLACE(a.LOC_STORE_NM ,',',' ') AS LOCATION_NM,
OReplace(a.LOCATION_TYPE,',',' ') AS LOCATION_TYPE,
OREPLACE(a.ADDR_LINE1,',',' ') as ADDRESS_1,
OREPLACE(a.ADDR_LINE2 ,',',' ') as ADDRESS_2,
a.ZIP5_CD AS ZIP_CODE,
a.CITY_NM as CITY,
a.STATE_cd AS STATE,
e.COUNTY_NM AS COUNTY,
a.TEL_NUM AS PHONE_NUMBER,
d.TM_ZONE AS TIME_ZONE,
a.LATITUDE,
a.LONGITUDE,
a.STORE_OPEN_DT AS OPEN_DT,
a.STORE_CLOSE_DT AS CLOSE_DT,
a.STORE_DESIGN,
a.LOC_LANG_DESC AS MERCHANDISING_LANGUAGE,
b.VZ2_AREA_DESC AS AREA_DESC,
b.VZ2_AREA_CD AS AREA_CODE,
b.VZ2_REGION_DESC AS REGION_DESC,
b.VZ2_REGION_CD AS REGION_CD,
OREPLACE(b.TERRITORY_DESC,',',' '),b.TERRITORY_CD,
b.DISTRICT_DESC ,
b.DISTRICT_CD,
b.ZONE_DESC,
b.ZONE_CD,
a.STORE_NUM AS POS_LOCATION_CODE, 
a.SITE_STATUS AS LOCATION_STATUS,
e.SVC_5G_DESC as HOME_INTERNET_SALES,
a.WSAP_CODE AS WSAP_CUSTOMER_ID, 
a.INSERT_DT as CREATED_DT
FROM udm_prd_tbls.outlet a
left join NTL_PRD_ALLVM.CONSUMER_HIERARCHY_V b
on a.ZREF_ID=b.ZREF_ID 
LEFT join udm_prd_tbls.zip d
on a.ZIP5_CD=d.ZIP5_CD 
left join NTL_PRD_ALLVM.VLM_LOCATION_V e
on a.VLM_CD=E.VLM_CD
WHERE a.VLM_CD is not null and CHANNEL='RET'
;


.If Errorcode  != 0 Then .Quit Errorcode

.Quit Errorcode;

--PSOCOMMENT--EOF

--PSOCOMMENT--RTN_CD=$?

--PSOCOMMENT--case ${RTN_CD}
--PSOCOMMENT--  in

--PSOCOMMENT--  0) ;;

--PSOCOMMENT--  *) echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... ABENDS ... FAILURE" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"

--PSOCOMMENT--     send_eml FAILURE
--PSOCOMMENT--     exit 1
--PSOCOMMENT--     ;;

--PSOCOMMENT--esac

--PSOCOMMENT--}

--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                     Function: extract_file                                   #
--PSOCOMMENT--################################################################################

--PSOCOMMENT--function extract_file
--PSOCOMMENT--{

--PSOCOMMENT--create_restart_file

--PSOCOMMENT--if [ -f ${OUTDIR1}/Retail_ShowCase_Store_header_$(date +'%Y%m%d').csv ];
--PSOCOMMENT--then
--PSOCOMMENT--rm -f ${OUTDIR1}/Retail_ShowCase_Store_header_$(date +'%Y%m%d').csv
--PSOCOMMENT--fi


--PSOCOMMENT--if [ -f ${OUTDIR1}/${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv ];
--PSOCOMMENT--then
--PSOCOMMENT--rm -f ${OUTDIR1}/${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv
--PSOCOMMENT--fi


--PSOCOMMENT--bteq <<-EOF

--PSOCOMMENT-- --.LOGON ${LOGON_STRING}; 

--PSOCOMMENT-- --.Set Width 155;

--PSOCOMMENT-- --.set errorout stdout;
--PSOCOMMENT-- --.SET ERRORLEVEL UNKNOWN SEVERITY 8;
--PSOCOMMENT-- --.SET WIDTH 1100;
--PSOCOMMENT-- --.SET PAGELENGTH 32767;
--PSOCOMMENT-- --.SET separator '|';	
--PSOCOMMENT--.IF errorlevel != 0 THEN .goto ERRORCODE;


.Export REPORT File=${OUTDIR1}/Retail_ShowCase_Store_header_$(date +'%Y%m%d').csv;

--comment the below if Header is not required 
sel 'VLM_CD,CHANNEL,LOCATION_NM,LOCATION_TYPE,ADDRESS_1,ADDRESS_2,ZIP_CODE,CITY,STATE,COUNTY,PHONE_NUMBER,TIME_ZONE,LATITUDE,LONGITUDE,OPEN_DT,CLOSE_DT,STORE_DESIGN,MERCHANDISING_LANGUAGE,AREA_DESC,AREA_CODE,REGION_DESC,REGION_CD,TERRITORY_DESC,TERRITORY_CD,DISTRICT_DESC,DISTRICT_CD,ZONE_DESC,ZONE_CD,POS_LOCATION_CODE,LOCATION_STATUS,HOME_INTERNET_SALES,WSAP_CUSTOMER_ID,CREATED_DT'  (TITLE '');
--sel 'VLM_CD|CHANNEL|LOCATION_NM|LOCATION_TYPE|ADDRESS_1|ADDRESS_2|ZIP_CODE|CITY|STATE|COUNTY|PHONE_NUMBER|TIME_ZONE|LATITUDE|LONGITUDE|OPEN_DT|CLOSE_DT|STORE_DESIGN|MERCHANDISING_LANGUAGE|AREA_DESC|AREA_CODE|REGION_DESC|REGION_CD|TERRITORY_DESC|TERRITORY_CD|DISTRICT_DESC|DISTRICT_CD|ZONE_DESC|ZONE_CD|POS_LOCATION_CODE|LOCATION_STATUS|HOME_INTERNET_SALES|WSAP_CUSTOMER_ID|CREATED_DT'  (TITLE '');

sel 
trim(case when  VLM_CD   is null then '' else VLM_CD  end (char(20)))||trim(',')||
trim(case when  CHANNEL   is null then '' else CHANNEL end (char(50)))||trim(',')||
trim(case when  LOCATION_NM   is null then '' else LOCATION_NM  end (char(50)))||trim(',')||
trim(case when  LOCATION_TYPE   is null then '' else LOCATION_TYPE end (char(35)))||trim(',')||
trim(case when  ADDRESS_1   is null then '' else ADDRESS_1 end (char(50)))||trim(',')||
trim(case when  ADDRESS_2   is null then '' else ADDRESS_2 end (char(50)))||trim(',')||
trim(case when  ZIP_CODE   is null then '' else ZIP_CODE  end (char(5)))||trim(',')||
trim(case when  CITY   is null then '' else CITY end (char(60)))||trim(',')||
trim(case when  STATE   is null then '' else STATE end (char(2)))||trim(',')||
trim(case when  COUNTY   is null then '' else COUNTY end (char(250)))||trim(',')||
trim(case when  PHONE_NUMBER   is null then '' else PHONE_NUMBER end (char(10)))||trim(',')||
trim(case when  TIME_ZONE   is null then '' else  TIME_ZONE end (char(15)))||trim(',')||
trim(case when  LATITUDE   is null then '' else LATITUDE  end (char(25)))||trim(',')||
trim(case when  LONGITUDE   is null then '' else  LONGITUDE end (char(25)))||trim(',')||
trim(case when OPEN_DT is null then '' else cast(cast(OPEN_DT as date format 'YYYY-MM-DD') as char(10))   end (char(10)))||trim(',')||
trim(case when CLOSE_DT is null then '' else cast(cast(CLOSE_DT as date format 'YYYY-MM-DD') as char(10))   end (char(10)))||trim(',')||
trim(case when  STORE_DESIGN   is null then '' else STORE_DESIGN end (char(20)))||trim(',')||
trim(case when  MERCHANDISING_LANGUAGE   is null then '' else MERCHANDISING_LANGUAGE end (char(100)))||trim(',')||
trim(case when  AREA_DESC   is null then '' else AREA_DESC  end (char(5)))||trim(',')||
trim(case when  AREA_CODE   is null then '' else AREA_CODE end (char(2)))||trim(',')||
trim(case when  REGION_DESC   is null then '' else REGION_DESC end (char(50)))||trim(',')||
trim(case when  REGION_CD   is null then '' else REGION_CD end (char(2)))||trim(',')||
trim(case when  TERRITORY_DESC   is null then '' else TERRITORY_DESC end (char(50)))||trim(',')||
trim(case when  TERRITORY_CD   is null then '' else TERRITORY_CD end (char(3)))||trim(',')||
trim(case when  DISTRICT_DESC   is null then '' else DISTRICT_DESC end (char(50)))||trim(',')||
trim(case when  DISTRICT_CD   is null then '' else DISTRICT_CD end (char(2)))||trim(',')||
trim(case when  ZONE_DESC   is null then '' else ZONE_DESC end (char(50)))||trim(',')||
trim(case when  ZONE_CD   is null then '' else ZONE_CD end (char(2)))||trim(',')||
trim(case when  POS_LOCATION_CODE   is null then '' else POS_LOCATION_CODE end (char(7)))||trim(',')||
trim(case when  LOCATION_STATUS   is null then '' else LOCATION_STATUS end (char(10)))||trim(',')||
trim(case when  HOME_INTERNET_SALES   is null then '' else HOME_INTERNET_SALES end (char(30)))||trim(',')||
trim(case when  WSAP_CUSTOMER_ID   is null then '' else WSAP_CUSTOMER_ID  end (char(20)))||trim(',')||
trim(case when CREATED_DT is null then '' else cast(cast(CREATED_DT as date format 'YYYY-MM-DD') as char(10))   end (char(10)))
from udm_prd_tbls.Retail_SC_Store_Fact 
where Report_Date=current_date;


.EXPORT RESET;
.IF ERRORCODE = 0 THEN .GOTO ENDOFFILE;
.IF ERRORCODE <> 0 THEN .GOTO ERRORCODE;

--PSOCOMMENT--.LABEL ERRORCODE
--PSOCOMMENT--.exit 1
     
--PSOCOMMENT--.LABEL ENDOFFILE


.Quit Errorcode;

--PSOCOMMENT--EOF

--PSOCOMMENT--RTN_CD=$?
--PSOCOMMENT--echo "RTN_CD $RTN_CD"


--PSOCOMMENT--cat ${OUTDIR1}/Retail_ShowCase_Store_header_$(date +'%Y%m%d').csv | sed -e '2,3d' 	> ${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv

--PSOCOMMENT--rm ${OUTDIR1}/Retail_ShowCase_Store_header_$(date +'%Y%m%d').csv

--PSOCOMMENT--case ${RTN_CD}
--PSOCOMMENT--  in

--PSOCOMMENT--  0) ;;

--PSOCOMMENT--  *) echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... ABENDS ... FAILURE" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"

--PSOCOMMENT--     send_eml FAILURE
--PSOCOMMENT--     exit 1
--PSOCOMMENT--     ;;

--PSOCOMMENT--esac

--PSOCOMMENT--}

--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                     Function: send_file                                  #
--PSOCOMMENT--################################################################################
--PSOCOMMENT--function send_file
--PSOCOMMENT--{

--PSOCOMMENT--create_restart_file

--PSOCOMMENT--msg_box "Step: Transfer files, sluice scan initiated"

--PSOCOMMENT--echo ""
--PSOCOMMENT--echo "sluice.sh ${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv 5fa65193-1da2-4021-ac14-ae59c1f5cd15"
--PSOCOMMENT--sluice.sh ${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv 5fa65193-1da2-4021-ac14-ae59c1f5cd15

--PSOCOMMENT--logpath="/opt/vrz/sedw/prod/sluice/log"
--PSOCOMMENT--CURRENTDATE=`date +%Y%m%d`

--PSOCOMMENT--if  grep -i 'SCANNED_WITH_VIOLATIONS' $(ls -1rt ${logpath}/Retail_ShowCase_Store_$(date +'%Y%m%d')* | tail -1)
--PSOCOMMENT--then 
--PSOCOMMENT--RC=205
--PSOCOMMENT--send_eml FAILURE
--PSOCOMMENT--exit $RC	
--PSOCOMMENT--fi

		
--PSOCOMMENT--	echo "/opt/cyberfusion/cfsend t:/opt/vrz/sedw/prod/code/bin/cfi_unix.tpl lf:${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv rf:/2Sennco/* n:MFTIS uid:dw_sftp_out cmp:zlib7"

--PSOCOMMENT--	/opt/cyberfusion/cfsend t:/opt/vrz/sedw/prod/code/bin/cfi_unix.tpl lf:${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv rf:/2Sennco/* n:MFTIS uid:dw_sftp_out cmp:zlib7	  
--PSOCOMMENT--	cfi_status=$? 	  

--PSOCOMMENT--case ${cfi_status}
--PSOCOMMENT--  in

--PSOCOMMENT--  0) ;;

--PSOCOMMENT--  *) echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... ABENDS ... FAILURE" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     echo " "
--PSOCOMMENT--     date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"

--PSOCOMMENT--     send_eml FAILURE
--PSOCOMMENT--     exit 1
--PSOCOMMENT--     ;;

--PSOCOMMENT--esac
--PSOCOMMENT--}


--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                                Function: main                                #
--PSOCOMMENT--################################################################################

--PSOCOMMENT--function main
--PSOCOMMENT--{

--PSOCOMMENT--echo ""
--PSOCOMMENT--echo ""
--PSOCOMMENT--date +"Driver - ${SCRIPT}.ksh - BEGINS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--echo ""
--PSOCOMMENT--echo ""

--PSOCOMMENT--validate_parms

--PSOCOMMENT--if [ -s ${SCRIPT_STEP_REST} ]
--PSOCOMMENT--then
--PSOCOMMENT--       echo ""
--PSOCOMMENT--       echo ""
--PSOCOMMENT--       echo "RESTART File START"
--PSOCOMMENT--       echo ""
--PSOCOMMENT--       ls -lrt ${SCRIPT_STEP_REST}
--PSOCOMMENT--       echo ""
--PSOCOMMENT--       echo "RESTART File   END"
--PSOCOMMENT--       echo ""
--PSOCOMMENT--       echo ""
--PSOCOMMENT--       echo "RESTART - running script from point of last failure"
--PSOCOMMENT--fi

--PSOCOMMENT--while [[ ${STEP_REST} -le ${STEP_MAXX} ]]

--PSOCOMMENT--do

--PSOCOMMENT--       echo ""
--PSOCOMMENT--       echo ""
--PSOCOMMENT--       echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ... BEGINS ...         "`date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`

--PSOCOMMENT--       ${STEP_NAME}

--PSOCOMMENT--       RTN_CD=$?

--PSOCOMMENT--       case ${RTN_CD}
--PSOCOMMENT--         in

--PSOCOMMENT--         0) echo "LOOP => STEP ${STEP_FIND} - ${STEP_NAME} ...   ENDS ... SUCCESS" `date +"${PCT}Y-${PCT}m-${PCT}d ${PCT}T"`
--PSOCOMMENT--            ;;

--PSOCOMMENT--         *) echo ""
--PSOCOMMENT--            echo ""
--PSOCOMMENT--            echo "ERROR => Unexpected return code main processing loop"
--PSOCOMMENT--            echo " "
--PSOCOMMENT--            echo " "
--PSOCOMMENT--            date +"Driver - ${SCRIPT}.ksh - ABENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"

--PSOCOMMENT--            send_eml FAILURE
--PSOCOMMENT--            exit 1
--PSOCOMMENT--            ;;

--PSOCOMMENT--       esac

--PSOCOMMENT--       let STEP_REST=STEP_REST+1
--PSOCOMMENT--       STEP_FIND=${STEP_REST}
--PSOCOMMENT--       STEP_NAME=`grep ^"${STEP_FIND}," ${SCRIPT_FUNC_LIST} | cut -d, -f2`
       
--PSOCOMMENT--done

--PSOCOMMENT--if [ -f   ${SCRIPT_STEP_REST} ]
--PSOCOMMENT--then
--PSOCOMMENT--       rm ${SCRIPT_STEP_REST}
--PSOCOMMENT--fi

--PSOCOMMENT--echo ""
--PSOCOMMENT--echo ""
--PSOCOMMENT--date +"Driver - ${SCRIPT}.ksh -   ENDS ${PCT}Y-${PCT}m-${PCT}d ${PCT}T"
--PSOCOMMENT--echo ""
--PSOCOMMENT--echo ""

--PSOCOMMENT--arch_log_file
--PSOCOMMENT--send_eml SUCCESS
--PSOCOMMENT--mv -f ${OUTDIR1}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv ${BKUPDIR}/Retail_ShowCase_Store_$(date +'%Y%m%d').csv
--PSOCOMMENT--}

--PSOCOMMENT--################################################################################
--PSOCOMMENT--#            Process: START Of Script - Set Global Processing Parms            #
--PSOCOMMENT--################################################################################

--PSOCOMMENT--export ESP_DT=${1:-NOVALUE}

--PSOCOMMENT--SCRIPT=`basename $0 .ksh`
--PSOCOMMENT--export PCT='%'

--PSOCOMMENT--case ${ESP_DT}
--PSOCOMMENT--  in

--PSOCOMMENT--NOVALUE) ESP_DT=`date +"${PCT}Y-${PCT}m-${PCT}d"`
--PSOCOMMENT--         ;;

--PSOCOMMENT--      *) ;;

--PSOCOMMENT--esac

--PSOCOMMENT--export SOURCE=udm

--PSOCOMMENT--. ${VRZ_BASE_PATH}/code/common/common_funcs

--PSOCOMMENT--get_logon_string
--PSOCOMMENT--get_log_file_date

									   

--PSOCOMMENT--################################################################################
--PSOCOMMENT--# Std Variables ... so bteq code is static for any Table/View DB changes       #
--PSOCOMMENT--################################################################################

--PSOCOMMENT--export STGDB=${UDMSTGDB}
--PSOCOMMENT--export TRGDB=${UDMDB}

--PSOCOMMENT--export WKDIR=${OUTDIR}


--PSOCOMMENT--export LDAP=
--PSOCOMMENT--export OUTDIR1=${OUTDIR}
--PSOCOMMENT--export PUSRC=--
--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                Turn script notification Email On or OFF (Y/N)                #
--PSOCOMMENT--################################################################################

--PSOCOMMENT--export SEND_EMAIL=Y

--PSOCOMMENT--#export EMAIL_LIST="Scott.Sheftic2@Verizonwireless.com"
--PSOCOMMENT--export EMAIL_LIST="giridhar.sharma@verizon.com,Kavya.vootkuri@verizon.com"
--PSOCOMMENT--#export EMAIL_LIST="Kavya.vootkuri@verizon.com,Manish.Modha@verizon.com,aravind.mechineni@Verizon.com,trinh.tat@verizon.com"


--PSOCOMMENT--export RUNTIMEF=${SCRIPT}_runtime.txt
--PSOCOMMENT--export RUNTIMES=${WKDIR}/${RUNTIMEF}

--PSOCOMMENT--export SERVER=`hostname`
--PSOCOMMENT--SERVER=`basename ${SERVER} .verizon.com`

--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                          Restart Functionality PARMS                         #
--PSOCOMMENT--################################################################################

--PSOCOMMENT--typeset -Z2 STEP_REST
--PSOCOMMENT--typeset -Z2 STEP_MAXX
--PSOCOMMENT--typeset -Z2 STEP_FIND

--PSOCOMMENT--export STEP_REST=01
--PSOCOMMENT--export STEP_MAXX=03
--PSOCOMMENT--export STEP_FIND
--PSOCOMMENT--export STEP_NAME
--PSOCOMMENT--export STEP_LFIL

--PSOCOMMENT--export SCRIPT_FUNC_LIST=${WKDIR}/${SCRIPT}_function_list.txt
--PSOCOMMENT--export SCRIPT_STEP_REST=${WKDIR}/${SCRIPT}_restart_step.txt

--PSOCOMMENT--echo "01,load_Retail_SC_Store_Fact"                > ${SCRIPT_FUNC_LIST}
--PSOCOMMENT--echo "02,extract_file"                            >> ${SCRIPT_FUNC_LIST}
--PSOCOMMENT--echo "03,send_file"                            >> ${SCRIPT_FUNC_LIST}


--PSOCOMMENT--if [ -e ${SCRIPT_STEP_REST} ]
--PSOCOMMENT--then
--PSOCOMMENT--       STEP_REST=`cat ${SCRIPT_STEP_REST} | cut -d, -f1`
--PSOCOMMENT--       STEP_NAME=`cat ${SCRIPT_STEP_REST} | cut -d, -f2`
--PSOCOMMENT--       STEP_LFIL=${SCRIPT}__${ESP_DT}__RESTART_log.${ds}
--PSOCOMMENT--       export lf=${VRZ_LOG_PATH}/${STEP_LFIL}
--PSOCOMMENT--else
--PSOCOMMENT--       STEP_REST=`grep ^"01," ${SCRIPT_FUNC_LIST} | cut -d, -f1`
--PSOCOMMENT--       STEP_NAME=`grep ^"01," ${SCRIPT_FUNC_LIST} | cut -d, -f2`
--PSOCOMMENT--       STEP_LFIL=${SCRIPT}__${ESP_DT}__log.${ds}
--PSOCOMMENT--       export lf=${VRZ_LOG_PATH}/${STEP_LFIL}
--PSOCOMMENT--fi

--PSOCOMMENT--STEP_FIND=${STEP_REST}

--PSOCOMMENT--################################################################################
--PSOCOMMENT--#                    Process: Execute Main Processing Logic                    #
--PSOCOMMENT--################################################################################

--PSOCOMMENT--main > $lf 2>&1
