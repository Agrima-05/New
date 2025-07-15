#! /usr/bin/ksh
#################################################################################################################################
#                                                                                                                               #
#                                                                                                                               #
#                                                  MDR_DW_FEEDS_LOAD.ksh                                                        #
#                                              Copyright (c) 2013, Verizon, Inc.                                                #
#                                              Changed by Tirun Kumar Yarlagadda                                                #
#                                                     All Rights Reserved.                                                      #
#                                                                                                                               #
#         Description:Generation of Parameter file based on the below tables which have the interval times                      #
#                                                MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG                                              #
#                                                DW_SSP_TBLSV.VZAI_INTERVAL_DIM                                                  #
#                                                MDR_DW.MDR_DW_FEEDS_SESSIONS_DB_CONN                                           #        
#                                                                                                                               #
#################################################################################################################################
# The list of workflows and SYS_CD which can uset hese script are listed below for future reference				  #
#			WORKLFOW							SYS_CD							  #
#		Wkfl_MDR_BQT_PYV_FIOS_DAILY_FEED				PYV_FIOS_DAILY_FEED 						  #
#		Wkfl_MDR_LEC_BILLING_WEEKLY					CMB_LEC							  #
#		Wkfl_CMPS_CUBE_CMB_FEED_WEELY_FEED				CMPS_CUBE_CMB_FEED 					  	  #
#		Wkfl_NORM_CMB_FEED_WEELY_FEED				NORM_CMB_FEED						         #
#		Wkfl_MDR_NORM_LFA_VSO_DAILY_FEED				NORM_LFA_VSO_FEED					         #
#		Wkfl_MDR_SPOT_FEED						MDR_SPOT_FEED					         	  #
#		Wkfl_VIDEO_METRICS_ZIP_FEED_MONTHLY			VIDEO_ZIP_FEED					         #
#		Wkfl_CANCEL_REP_FEEDS					CANCEL_REP_FEED					         #
#		Wkfl_MDR_aEDW_DAILY_SALES_FEED				AEDW_SALES_FEED					         #
#		Wkfl_MDR_CMB_FEEDS_DAILY_LOAD				CMB_DAILY					      	   	  #
#		Wkfl_MDR_aEDW_DAILY_CANCELS_FEED				AEDW_CANCEL_FEED					         #
#		Wkfl_MDR_BQT_PYV_CORE_DAILY_FEED				PYV_CORE_DAILY_FEED					         #
#		Wkfl_PACER_CMB_FEED_WEELY_FEED				PACER_CMB_FEED					         #
#		Wkfl_VFORECAST_CMB_FEED_WEELY_FEED				VFORECAST_CMB_FEED					         #
#		Wkfl_MDR_CMB_FEEDS_WEELY_FEED				CMB_WEEKLY					       	  #
#		Wkfl_PYV_FIOS_DLY						PYV_FIOS_BUNDLES					         #
#		Wkfl_PYV_PSTN_DLY						PYV_PSTN_BUNDLES					         #
#		wkfl_DAILY_WBN_FEED						WBN_FEED					       	  #
#		Wkfl_MDR_INTUIT_WEBHOSTING_SETLMTS_MTHLY_FEED		INTUIT_SETLMT_FEED					         #
#		Wkfl_MDR_aEDW_POWER_COACH_FEED				POWER_COACH_FEED					         #
#		Wkfl_CMPS_CMB_FEED_WEELY_FEED				CMPS_CMB_FEED					         	  #
#		Wkfl_CREDIT_BYPASS_FEED					CREDIT_BYPASS					       	  #
#################################################################################################################################
#   RCS Information
#       $Header: $$
#       $Log: $$

 
################################## ENVIRONMENT VARIABLES LIST ###############################
#
# Directory list
#set -vx

typeset -u ENV_VAR

CURR_DIR="$ETL_HOME/ETL_SCRIPTS/SSP_DM_DIM"
BIN_DIR="$CURR_DIR/Bin"
PARA_DIR="$CURR_DIR/Params"
LOG_DIR="$CURR_DIR/Log"
ARCH_DIR="$CURR_DIR/Archive"
LOGON_DIR="$ETL_HOME/ETL_SCRIPTS/SHARED_DB_CONNECTIONS"

T_DATE=`date +'%m%d%Y'`

################################## COMMAND LIST DECLARATION ##################################

sed=/usr/bin/sed
echo=/usr/bin/echo
date=/usr/bin/date
cut=/usr/bin/cut
cal=/usr/bin/cal
cd=/usr/bin/cd
crypt=/usr/bin/crypt
cat=/usr/bin/cat
grep=/usr/bin/grep
head=/usr/bin/head
tail=/usr/bin/tail
fmt=/usr/bin/fmt
expr=/usr/bin/expr
date=/usr/bin/date
rm=/usr/bin/rm
wc=/usr/bin/wc
cat=/usr/bin/cat 
mv=/usr/bin/mv 
touch=/usr/bin/touch
mailx=/usr/bin/mailx
basename=/usr/bin/basename
gzip=/usr/bin/gzip
cp=/usr/bin/cp
chmod=/usr/bin/chmod
awk=/usr/bin/awk
nawk=/usr/bin/nawk
sleep=/usr/bin/sleep
ls=/usr/bin/ls

################################## FILE LIST DECLARATION ##################################
config_file=$BIN_DIR/.SSP_DM_DIM.ini
LOGON_FILE=$LOGON_DIR/.DPPDDDWE.bteq.logon
VZ_AI_fact_log="$2"_log

################################## REMOVING LOG FILES #####################################

logfiles_remove()
{
 
for file in "$LOG_DIR"/"$VZ_AI_fact_log".txt "$LOG_DIR"/"$VZ_AI_fact_log"1.txt "$LOG_DIR"/"$VZ_AI_fact_log"2.txt "$LOG_DIR"/"$VZ_AI_fact_log"3.txt "$LOG_DIR"/"$VZ_AI_fact_log"4.txt "$LOG_DIR"/"$VZ_AI_fact_log"5.txt "$LOG_DIR"/"$VZ_AI_fact_log"6.txt "$LOG_DIR"/"$VZ_AI_fact_log"7.txt "$LOG_DIR"/"$VZ_AI_fact_log"8.txt;
do
    if [ -f $file ]
    then
        "$rm" -f $file
    fi
done
for filea in "$LOG_DIR"/"$VZ_AI_fact_log"a.txt "$LOG_DIR"/"$VZ_AI_fact_log"1a.txt "$LOG_DIR"/"$VZ_AI_fact_log"2a.txt "$LOG_DIR"/"$VZ_AI_fact_log"3a.txt "$LOG_DIR"/"$VZ_AI_fact_log"4a.txt "$LOG_DIR"/"$VZ_AI_fact_log"5a.txt "$LOG_DIR"/"$VZ_AI_fact_log"6a.txt "$LOG_DIR"/"$VZ_AI_fact_log"7a.txt "$LOG_DIR"/"$VZ_AI_fact_log"8a.txt;
do
    if [ -f $filea ]
    then
        "$rm" -f $filea
    fi
done
}


########################### END OF REMOVING LOG FILES ######################################

#########################################################################################################################
#                                                                                                                       #
#                    Functions to validate the presence of directories and the parameters of the ini file               #
#                                                                                                                       #
#########################################################################################################################

initial_validate()
		
{
  
if [ ! -d "$CURR_DIR"/. ]
then
    "$echo" "Current Directory [$CURR_DIR] non-existent or inaccessible" > /dev/null
    exit 3
fi

if [ ! -d "$BIN_DIR"/. ]
then
    "$echo" "Bin Directory [$BIN_DIR] non-existent or inaccessible" > /dev/null
    exit 3
fi

if [ ! -d "$PARA_DIR"/. ]
then
    "$echo" "Params Directory [$PARA_DIR] non-existent or inaccessible" > /dev/null
    exit 3
fi

if [ ! -d "$ARCH_DIR"/. ]
then
    "$echo" "Archive Directory [$ARCH_DIR] non-existent or inaccessible" > /dev/null
    exit 3
fi

#Check whether the .ini file is present or not
if ! [ -f $config_file ]
then
   "$echo" "$config_file does not exist"
   exit 3
fi
 
#Teradata PassKey
td_pass_key=`<$config_file "$sed" -n '/^[ \t]*TDPassKey[ \t]*=[ \t]*/s/^[ \t]*TDPassKey[ \t]*=[ ]*\(.*\)[ \t]*$/\1/p'`
if [ -z "$td_pass_key" ]
then
    "$echo" "Teradata PassKey keyword not found in configuration file $config_file"
    exit 3
fi


#EmailOnFail
email_on_fail=`<$config_file "$sed" -n '/^[ \t]*EmailOnFail[ \t]*=[ \t]*/s/^[ \t]*EmailOnFail[ \t]*=[ ]*\(.*\)[ \t]*$/\1/p'`
if [ -z "$email_on_fail" ]
then
    "$echo" "email_on_fail keyword not found in configuration file $config_file"
    exit 3
fi



if [[ -f ${LOGON_FILE} ]]
then 
      #CONNECT_STRING_MDR="`decrypt -a aes -k $VCMETLEncryptKey -i ${LOGON_FILE}`"
      CONNECT_STRING_MDR=`openssl enc -pbkdf2 -d -in $LOGON_FILE -base64 -k $VCMETLEncryptKey`
fi 

}
"$echo" "$T_DATE"

#################################### END-Initial Validate ##############################

#########################################################################################################################
#                                                                                                                       #
#                                Function to capture the orcale errors                                                  #
#                                                                                                                       #
#########################################################################################################################

td_err()
{
  logfile=$1
  td_err_1=`"$grep" Failure "$logfile"|"$wc" -l |"$sed" -e '/^$/d'`
                                             
  td_err_1_SP2=`"$grep" Skipped "$logfile"|"$wc" -l| "$sed" -e '/^$/d'`
                     
  if [ "$td_err_1" -ge 1 -o "$td_err_1_SP2" -ge 1 -o "$RC" -ge 1 ]
  then
     "$echo" "\n Error while executing Teradata script"
	"$echo" "BTEQ return Code : "$RC 
     "$echo" " Please go through $logfile\n" | $mailx -s "MDR ODS script failed due to Logon issue" $email_on_fail

      exit 3;
  fi  
}

#########################################################################################################################
#                                                                                                                       #
#                                        Job run CHECK for the DAY                                                      #
#                                                                                                                       #
#########################################################################################################################

initial_validate
logfiles_remove
wkfl_name=$1
system_name=$2

RPT7="$LOG_DIR"/"$VZ_AI_fact_log"7.txt

bteq<<EOF 1> "$LOG_DIR"/"$VZ_AI_fact_log"7a.txt
$CONNECT_STRING_MDR
.WIDTH 400;
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;
.EXPORT REPORT FILE = "$RPT7";

SELECT CAST((LOAD_END_DT (format 'MMDDYYYY')) AS CHAR(8))( title ' ') from MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG WHERE SYS_CD='$system_name' AND PROCESS_NM='$wkfl_name' 
AND STATUS='SUCCESS' and AUDIT_SK=(SELECT MAX(AUDIT_SK) FROM MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG WHERE SYS_CD='$system_name' and PROCESS_NM='$wkfl_name');

.EXPORT RESET;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$?


logfile="$LOG_DIR"/"$VZ_AI_fact_log"7a.txt

td_err $logfile

JOB_RUN_DAY=`"$cat" "$LOG_DIR"/"$VZ_AI_fact_log"7.txt | "$head" -1`

 if [[ $JOB_RUN_DAY = $T_DATE ]]
 then
 echo "Today's MDR ODS FEEDS -  <$wkfl_name> has already run,so exiting the load process.Check the MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG table `date` " | tee -a $LOG_FILE
 jaf_mess="$BIN_DIR/`"$basename" $0`:The <$wkfl_name> has already ran once for the day.Check MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG table & ETL_AUDIT_INTERVAL table."
 jaf_subject="MDR_ODS_FEEDS_<$wkfl_name>_already_ran_for_the_day:`"$basename" $0`"
 "$echo" $jaf_mess | $mailx -s $jaf_subject $email_on_fail
 exit 1
 else
 echo "Job hasn't run today so proceeding with the rest of the process `date` " | tee -a $LOG_FILE
 fi

######################################################################################################################### 
#                                                                                                                       #
#                                        Function for pre-session execution                                             #                                
#                                                                                                                       #
#########################################################################################################################

pre_sess()
{
wkfl_name=$1
system_name=$2

RPT="$LOG_DIR"/"$VZ_AI_fact_log".txt
bteq<<EOF 1> "$LOG_DIR"/"$VZ_AI_fact_log"a.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;
.EXPORT REPORT FILE = "$RPT";
Select max(audit_sk)(title ' ') from MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG WHERE SYS_CD='$system_name' and PROCESS_NM='$wkfl_name' AND STATUS is null group by SYS_CD;

.EXPORT RESET;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$?
   
             
logfile="$LOG_DIR"/"$VZ_AI_fact_log".txt

td_err "$LOG_DIR"/"$VZ_AI_fact_log"a.txt
  
MAX_AUDIT_SK_NULL=`"$cat" "$LOG_DIR"/"$VZ_AI_fact_log".txt | "$head" -1`

if [ ! -z $MAX_AUDIT_SK_NULL ]
then
bteq<<EOF 1> "$LOG_DIR"/"$VZ_AI_fact_log".txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;

     update  MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG set STATUS='FAILURE',LOAD_END_DT=CURRENT_TIMESTAMP  where SYS_CD='$system_name' and PROCESS_NM='$wkfl_name' AND audit_sk=$MAX_AUDIT_SK_NULL;  
     
.LABEL Done;
.logoff;
.quit;
EOF
RC=$?
logfile="$LOG_DIR"/"$VZ_AI_fact_log".txt

td_err $logfile

fi

RPT1="$LOG_DIR"/"$VZ_AI_fact_log"1.txt
bteq<<EOF 1> "$LOG_DIR"/"$VZ_AI_fact_log"1a.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;
.EXPORT REPORT FILE = "$RPT1";

    SELECT intvl_sk(title ' ') FROM MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG WHERE audit_sk=(Select max(audit_sk) from  MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG 
      where SYS_CD='$system_name' and PROCESS_NM='$wkfl_name' AND  STATUS='SUCCESS' group by SYS_CD) and SYS_CD='$system_name' and PROCESS_NM='$wkfl_name' AND  STATUS='SUCCESS';

.EXPORT RESET;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$?  


logfile="$LOG_DIR"/"$VZ_AI_fact_log"1a.txt

td_err $logfile

MAX_INTVL_SK_AUDIT_LOG=`"$cat" "$LOG_DIR"/"$VZ_AI_fact_log"1.txt | "$sed" -e 's/.*\ //' | "$head" -1`

        if [ ! -z $MAX_INTVL_SK_AUDIT_LOG ]
        then
            MAX_INTVL_SK_AUDIT_LOG=`"$expr" $MAX_INTVL_SK_AUDIT_LOG + 1`;
        else
            "$echo" "No latest records exist in the table-MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG with SYS_CD=$system_name and PROCESS_NM=$wkfl_name and STATUS='SUCCESS'"
             exit 3
        fi     

RPT8="$LOG_DIR"/"$VZ_AI_fact_log"8.txt
bteq<<EOF 1> "$LOG_DIR"/"$VZ_AI_fact_log"8a.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;
.EXPORT REPORT FILE = "$RPT8";

    SELECT MAX(audit_sk)(title ' ') FROM MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG;

.EXPORT RESET;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$?  


logfile="$LOG_DIR"/"$VZ_AI_fact_log"8a.txt

td_err $logfile
#########################################################################################################################
#                                                                                                                       #
#    MAX_AUDIT_SK_AUDIT_LOG  variable is incremented by 25 because the script is used to create the Parameter file for	 #
#				multiple workflows,so for safer side incrementing with 25					 #
#  WHERE audit_sk=(Select max(audit_sk) from MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG						 #
#    where SYS_CD='$system_name' and PROCESS_NM='$wkfl_name' AND  STATUS='SUCCESS' group by SYS_CD)incrementing with 25 #                                                                                                                     #
#########################################################################################################################
MAX_AUDIT_SK_AUDIT_LOG=`"$cat" "$LOG_DIR"/"$VZ_AI_fact_log"8.txt | "$sed" -e 's/.*\ //' | "$sed" -e 's/.$//'| "$head" -1`

        if [ ! -z $MAX_AUDIT_SK_AUDIT_LOG ]
        then
            MAX_AUDIT_SK_AUDIT_LOG=`"$expr" $MAX_AUDIT_SK_AUDIT_LOG + 1`;
        else
            "$echo" "No latest records exist in the table-MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG with SYS_CD=$system_name and PROCESS_NM=$wkfl_name and STATUS='SUCCESS'"
             exit 3
        fi     

#########################################################################################################################
#                                                                                                                       #
#                                        VZAI_INTERVAL_DIM LOGIC                                                        #
#                                                                                                                       #
#########################################################################################################################

RPT2="$LOG_DIR"/"$VZ_AI_fact_log"2.txt  
bteq<<EOF 1> "$LOG_DIR"/"$VZ_AI_fact_log"2a.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;
.EXPORT REPORT FILE = "$RPT2";

SELECT  CAST((INTVL_START_DT (format 'MM/DD/YYYY')) AS CHAR(10))( title ' ') FROM DW_SSP_TBLSV.VZAI_INTERVAL_DIM  WHERE INTVL_SK_DAY=$MAX_INTVL_SK_AUDIT_LOG;
SELECT CAST((INTVL_END_DT (format 'MM/DD/YYYY')) AS CHAR(10))( title ' ') FROM DW_SSP_TBLSV.VZAI_INTERVAL_DIM WHERE INTVL_SK_DAY=$MAX_INTVL_SK_AUDIT_LOG;

.EXPORT RESET;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$?
     

logfile="$LOG_DIR"/"$VZ_AI_fact_log"2a.txt

td_err $logfile
       
INTVL_START_DATE=`"$cat" "$LOG_DIR"/"$VZ_AI_fact_log"2.txt | "$sed" -e '/^$/d' | "$head" -1  ` #" 00:00:00"
        
INTVL_END_DATE=`"$cat" "$LOG_DIR"/"$VZ_AI_fact_log"2.txt | "$sed" -e '/^$/d' | "$tail" -1   ` #" 23:59:59"

INTVL_START_DATE1=`"$echo" "$INTVL_START_DATE"" 00:00:00"`

INTVL_END_DATE1=`"$echo" "$INTVL_END_DATE"" 23:59:59" `

#########################################################################################################################
#                                                                                                                       #
#                  INSERT INTO MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG                                                      #
#                                                                                                                       #
#########################################################################################################################
 #CAST (sum( (sel max(AUDIT_SK) from DW_SSP.PERIODIC_LOAD_AUDIT_LOG) +1 ) over( rows unbounded preceding ) AS INT)

bteq<<EOF 1>"$LOG_DIR"/"$VZ_AI_fact_log"3.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;

INSERT INTO MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG VALUES ($MAX_AUDIT_SK_AUDIT_LOG,'$wkfl_name',CAST(CURRENT_TIME(0) AS TIMESTAMP(2)),NULL,$MAX_INTVL_SK_AUDIT_LOG,CAST(('$INTVL_START_DATE1' (TIMESTAMP(0),Format 'MM/DD/YYYYBHH:MI:SS')) AS TIMESTAMP(0)),CAST(('$INTVL_END_DATE1' (TIMESTAMP(0),Format 'MM/DD/YYYYBHH:MI:SS')) AS TIMESTAMP(0)),'$system_name',NULL);
.if errorcode > 0 then .GOTO Done;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$? 


        logfile="$LOG_DIR"/"$VZ_AI_fact_log"3.txt

         td_err $logfile

#########################################################################################################################
#                                                                                                                       #
#                                        PARAMETER FILE GENERATION LOGIC                                                #
#                                                                                                                       #
#########################################################################################################################

RPT4="$LOG_DIR"/"$VZ_AI_fact_log"4.txt
bteq<<EOF 1>"$LOG_DIR"/"$VZ_AI_fact_log"4a.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;
.EXPORT REPORT FILE = "$RPT4";

SELECT  '['||COALESCE (SESSION_NM,'#') || '],' || COALESCE (CONNECTION1,'#') || ',' || COALESCE (CONNECTION2,'#') || ',' || COALESCE (CONNECTION3,'#') ||',' || COALESCE (CONNECTION4,'#') ||',' || COALESCE (CONNECTION5,'#') ||',' || COALESCE (CONNECTION6,'#') ||',' || COALESCE (CONNECTION7,'#') ||',' || COALESCE (CONNECTION8,'#') ( title ' ')  FROM  MDR_DW.MDR_DW_FEEDS_SESSIONS_DB_CONN  WHERE SYS_CD='$system_name';
.if errorcode > 0 then .GOTO Done;
.EXPORT RESET;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$? 
            
logfile="$LOG_DIR"/"$VZ_AI_fact_log"4.txt

td_err $logfile

"$cat" "$logfile"|"$sed" -e '/^$/d'>"$LOG_DIR"/"$VZ_AI_fact_log"_temp.txt

"$mv" "$LOG_DIR"/"$VZ_AI_fact_log"_temp.txt "$logfile"


if [ -f "$PARA_DIR"/$system_name"_sessions".par ]
then
        "$rm" -f "$PARA_DIR"/$system_name"_sessions".par
fi

"$touch" "$PARA_DIR"/$system_name"_sessions".par

for i in `"$cat" "$logfile"`
do
"$echo" $i | "$sed" -e 's/#.*//;' | "$awk" 'gsub(",","\n")'  >>"$PARA_DIR"/$system_name"_sessions".par
"$echo" "\$\$START_TIME=$INTVL_START_DATE1" >>"$PARA_DIR"/$system_name"_sessions".par
"$echo" "\$\$END_TIME=$INTVL_END_DATE1" >>"$PARA_DIR"/$system_name"_sessions".par
"$echo"  >>"$PARA_DIR"/$system_name"_sessions".par

done
"$cat" "$PARA_DIR"/$system_name"_sessions".par  |"$sed" -e '/^$/d' > "$PARA_DIR"/$system_name"_sessions_temp".par
"$cat" "$PARA_DIR"/$system_name"_sessions_temp".par |"$sed" -e 's/tirun/ /' > "$PARA_DIR"/$system_name"_sessions".par
"$rm" -f "$PARA_DIR"/$system_name"_sessions_temp".par
"$chmod" 777  "$PARA_DIR"/$system_name"_sessions".par

#########################################################################################################################
#                                                                                                                       #
#                                        ARCHIVING THE FILE TO ARCHIVE FOLDER                                           #
#                                                                                                                       #
#########################################################################################################################

dt=`"$date" '+%m%d%Y'`

arch_file=$system_name"_sessions_$dt".par

"$cp" "$PARA_DIR"/$system_name"_sessions".par "$PARA_DIR"/$arch_file

"$chmod" 777 "$PARA_DIR"/$arch_file

if [ -f "$PARA_DIR"/$arch_file ]
then

        "$gzip" -f "$PARA_DIR"/$arch_file

if [ -f $ARCH_DIR/$arch_file".gz" ]
then
        "$rm" -f $ARCH_DIR/$arch_file".gz"
fi

"$mv" "$PARA_DIR"/$arch_file".gz" $ARCH_DIR/$arch_file".gz"
fi

exit 0

}

#########################################################################################################################
#                                                                                                                       #
#                                        FUNCTION FOR POST-SESSION LOGIC                                                #
#                                                                                                                       #
#########################################################################################################################


post_sess()
{
wkfl_name=$1
system_name=$2
status=$3

if [ $status != "SUCCESS"  ]
then 
     if [ $status != "FAILURE" ]
     then   
          "$echo" "Parameter STATUS passed to the the script:"$BIN_DIR/"`basename $0` is other than-SUCCESS or FAILURE"
            exit 3
     fi       
fi

RPT="$LOG_DIR"/"$VZ_AI_fact_log".txt
bteq<<EOF 1>"$LOG_DIR"/"$VZ_AI_fact_log"a.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;
.EXPORT REPORT FILE ="$RPT" ;

Select max(audit_sk)( title ' ') from MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG WHERE SYS_CD='$system_name' and PROCESS_NM='$wkfl_name' AND STATUS is null group by SYS_CD;        

.if errorcode > 0 then .GOTO Done;
.EXPORT RESET;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$? 


logfile="$LOG_DIR"/"$VZ_AI_fact_log".txt

td_err $logfile


MAX_AUDIT_SK_NULL=`"$cat" "$LOG_DIR"/"$VZ_AI_fact_log".txt | "$sed" -e 's/.*\ //' | "$sed" -e 's/.$//'| "$head" -1`

if [ ! -z $MAX_AUDIT_SK_NULL ]
then

bteq<<EOF 1>"$LOG_DIR"/"$VZ_AI_fact_log"6.txt
$CONNECT_STRING_MDR
.WIDTH 400
.SET FORMAT OFF;
.SET TITLEDASHES OFF;
.if errorcode > 0 then .GOTO Done;

update MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG set STATUS='$status' ,LOAD_END_DT=CAST(CURRENT_TIME(0) AS TIMESTAMP(2)) where SYS_CD='$system_name' and PROCESS_NM='$wkfl_name' AND audit_sk=$MAX_AUDIT_SK_NULL;      
      
.if errorcode > 0 then .GOTO Done;
.LABEL Done;
.logoff;
.quit;
EOF
RC=$? 

logfile="$LOG_DIR"/"$VZ_AI_fact_log"6.txt

td_err $logfile

else
      e_mess="$BIN_DIR/`"$basename" $0`:The <$wkfl_name> load does not have the necessary pre-requisite valid records in the MDR_DW.MDR_DW_FEEDS_ETL_AUDIT_LOG table. Please look into this issue as soon as possible" 
      subject="No prerequisite valid records in the log table-Script:`"$basename" $0`"
     "$echo" "$e_mess" | $mailx -s "$subject" "$email_on_fail"
fi

exit 0

}

#########################################################################################################################
#                                                                                                                       #
#                                        SCRIPT EXECUTION BEGINS HERE                                                   #
#                                                                                                                       #
#########################################################################################################################
                        

#Calling the initial_validate function

initial_validate
logfiles_remove
num_param_script=$#
process_nm=$1
sys_cd=$2
status=$3

if [ $num_param_script -eq 2 ]
then
      pre_sess $process_nm $sys_cd
else 
     if [ $num_param_script -eq 3 ]
     then
         post_sess $process_nm $sys_cd $status
     else
         "$echo" "Parameter to the script are not specified properly"
         "$echo" "Correct usage: `basename $0` PROCESS_NM SYS_CD or `basename $0` PROCESS_NM SYS_CD STATUS"
          exit 3     
     fi
   
fi     

exit 0
