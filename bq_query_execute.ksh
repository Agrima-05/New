set -x
echo "function called ########"
  bq_output_file="$1"
  bq_log_file="$2"
  bq_out_format="${3:-csv}"
  bq_header_required="${4:-false}"
  bq_out_delimiter="${5:- }"
  bq_query_var="$6"
  bq_output_mode="${7:-file}"
  copy_bq_output_file="${8:-false}"

  echo "Function called############ $2"
  if [ -z "$bq_log_file" ] || [ -z "$bq_query_var" ]; then
    echo "Usage: bq_query_execute [bq_output_file] <bq_log_file> [bq_out_format] [bq_header_required] [bq_out_delimiter] <bq_query_var> [bq_output_mode]"
    return 1
  fi
  # If bq_output_file is empty and bq_output_mode is file, use a temp file
  if [ -z "$bq_output_file" ] && [ "$bq_output_mode" == "file" ]; then
    bq_output_file=$(mktemp)
    echo "No output file provided. Using temp file: $bq_output_file" >> "$bq_log_file"
  fi
  > "$bq_log_file"
  [ "$bq_output_mode" == "file" ] && > "$bq_output_file"
##  IFS=';' read -ra queries <<< "$bq_query_var"

## clear leading and traling spaces and newline character
# bq_query_var=$(echo "$bq_query_var" | perl -pe "s{'(.*?)'}{\$new=\$1; \$new =~ s/;/_pso_semi_colon_/g; '\$new'}ge")
bq_query_var=$(echo "$bq_query_var" | perl -pe "s{'(.*?)'}{\$new=\$1; \$new =~ s/;/_pso_semi_colon_/g; \"'\" . \$new . \"'\"}ge") #added for semicolon in quotes fix
bq_query_var=$(printf "%s" "$bq_query_var" | sed -e ':a;N;$!ba;' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

old_ifs=$IFS
  IFS=';'
set -A queries  $bq_query_var
IFS=$old_ifs
 bq_final_output=""
 i=0

  for query in "${queries[@]}"; do
    query=${query//_pso_semi_colon_/;}  #added for semicolon in quotes fix
    i=$((i+1))

    [ -z "$query" ] && continue
        echo "SQL_QUERY::: $i:::$query"
    echo "Running Query $i:" >> "$bq_log_file"
    echo "$query" >> "$bq_log_file"

    temp_result=$(mktemp)
   echo "project id :  $BQ_PROJECT_ID"
 ##   bq_output=$(bq query --quiet --nouse_legacy_sql --project_id="$BQ_PROJECT_ID" --format="$bq_out_format" "$query" 2>&1)

    bq_output=$(bq query --nouse_legacy_sql --project_id="$BQ_PROJECT_ID" \
    --label=run_id:${run_id:-null} \
    --label=instance_name:${instance_name:-null} \
    --label=job_id:${job_id:-null} \
    --label=task_id:${task_id:-null} \
    --label=task_type:${task_type:-null} \
    --format="$bq_out_format" "$query" 2>&1)
    bq_status=$?
    echo "##### $bq_status"
echo "##### $bq_output"
#JOB_ID=$(echo "$bq_output" | grep -oP 'job_[\w\d]+' | head -1)
#echo "Job_ID=$JOB_ID"
    if [ $bq_status -ne 0 ]; then
      echo " Query $i FAILED. Exiting early." >> "$bq_log_file"
      echo "Error Message:" >> "$bq_log_file"
      echo "$bq_output" >> "$bq_log_file"
      rm -f "$temp_result"

      return 1
    fi
    # added below line to remove WARNINGS from output
    bq_output=$(echo "$bq_output" | sed '/^WARNING:/d')
    if [ "$bq_header_required" == "false" ]; then
      bq_output=$(echo "$bq_output" | sed '1d')
    fi
    echo "$bq_output" | grep -v '^$' | sed "s/,/$bq_out_delimiter/g" > "$temp_result"
    if [ "$bq_output_mode" == "file" ]; then
      echo "CWD ===== `pwd`"
      echo "*******  writing to $bq_output_file using temp_result ; temp_result = $temp_result"
      
      cat "$temp_result" >> "$bq_output_file"
    else
      bq_final_output+="$(cat "$temp_result")"$'\n'
    fi
    echo "############3  Updated "
    echo "Query $i SUCCESS" >> "$bq_log_file"
    echo "RC (return code) = 0" >> "$bq_log_file"
    
    rm -f "temp_result"
  done

  if [ "$copy_bq_output_file" == "true" ]; then
      gsutil cp "$bq_output_file" "$GCS_OUTBOUND/mapping_output_as_file/${bq_output_file#/}"
  fi

  echo "All queries completed successfully." >> "$bq_log_file"

  if [ "$bq_output_mode" == "raw" ]; then
    echo "$bq_final_output"
  fi
  exit 0
