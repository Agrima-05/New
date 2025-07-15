import re
import os
import shutil
import csv
import glob, chardet
from rich.progress import track
import chardet
from beautysh import Beautify
import datetime


replaced_entries = []
timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# Precompile regexes for performance
# HEREDOC_START_RE = re.compile(r'^(\s*)--PSOCOMMENT--\s*["\']?\$?bteq["\']?\s*<<(\s*-?\s*([A-Z0-9_]+))', re.IGNORECASE)
# HEREDOC_END_RE = re.compile(r'^(\s*)--PSOCOMMENT--\s*-?\s*([A-Z0-9_]+)', re.IGNORECASE)
ERROR_VAR_DECL_RE = re.compile(
    r'^(\s*DECLARE\s+)(_ERROR_CODE|_ERROR_MESSAGE)\s+(INT64|STRING)(\s*;)', re.IGNORECASE
)
# RAVEN_ALIAS_RE = re.compile(r'(?i)\bAS\s+`(A\d+)`', re.IGNORECASE)
RAVEN_ALIAS_RE = re.compile(r'`([^`]+)`', re.IGNORECASE)

# Regular expressions for BTEQ block detection (from extrack_bteq_block.py)
HEREDOC_START_RE = re.compile(r'^\s*--PSOCOMMENT--\s*["\']?\s*\$?(?:bteq|fexp|mload\s+-b)\s*["\']?\s*<<\s*[-!]?\s*([A-Z0-9_]+)', re.IGNORECASE)

HEREDOC_END_RE = re.compile(r'^\s*--PSOCOMMENT--\s*[-!]?\s*([A-Z0-9_]+)', re.IGNORECASE)

# Regular expression for EXPORT DATA OPTIONS detection
EXPORT_DATA_RE = re.compile(r'EXPORT\s+DATA\s+OPTIONS\s*\([^)]*\)\s+(.*?;\n)', re.IGNORECASE | re.MULTILINE | re.DOTALL)

# Regular expression for URI extraction from EXPORT DATA OPTIONS
URI_EXTRACT_RE = re.compile(r"uri\s*=\s*.*?\|\|\s*([A-Za-z0-9_${}]+)\s*\|\|", re.IGNORECASE)

# This regex reliably extracts the raw value of the 'uri' attribute.
URI_VALUE_RE = re.compile(r"uri\s*=\s*(.*?)(?:,|\))", re.IGNORECASE | re.DOTALL)

# Regular expression for format extraction from EXPORT DATA OPTIONS
FORMAT_EXTRACT_RE = re.compile(r"format\s*=\s*['\"]([^'\"]+)['\"]", re.IGNORECASE)

# Regular expression for header extraction from EXPORT DATA OPTIONS
HEADER_EXTRACT_RE = re.compile(r"header\s*=\s*([^,\)]+)", re.IGNORECASE)

FOR_SESSION_RE = r"^(.* FOR\s+SESSION\s*;)"

# Regular expression for delimiter extraction from EXPORT DATA OPTIONS
DELIMITER_EXTRACT_RE = re.compile(r"field_delimiter\s*=\s*['\"]([^'\"]+)['\"]", re.IGNORECASE)

# Regular expression for log path extraction from BTEQ redirections
LOG_PATH_RE = re.compile(r'(?:bteq|fexp|mload\s+-b)\s*<<\s*[A-Z0-9_]+\s*>\s*([^\s\n]+)', re.IGNORECASE)

HEREDOC_START_RE_UNCOMMENT = re.compile(r'^\s*--PSOCOMMENT--\s*["\']?\s*\$?(?:bteq|fexp|mload\s+-b)\s*["\']?\s*<<\s*([-!]?\s*[A-Z0-9_]+)', re.IGNORECASE)

MAIN_FUN_CALL_RE = re.compile(r"^(--PSOCOMMENT--)?\s*main(?:\s*\$\{(\w+)\})?\s*>>?\s*\$lf\s*.*$")
# re.compile(r"^\s*main(?:\s+\$\{(\w+)\})?\s*>>\s*\$lf\s*2>&1\s*$")

tamp = ""
drop_pattern = r"DROP TABLE IF EXISTS (\S+\.\w+);"
create_pattern = r"CREATE TABLE IF NOT EXISTS (\S+\.\w+)([\s\S]*?);"
beginning_statement = "\nBEGIN\nBEGIN TRANSACTION;\n\n"
ending_statement ='\n\nCOMMIT TRANSACTION;\nEXCEPTION WHEN ERROR THEN\nRAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);\nROLLBACK TRANSACTION;\nEND;\n'
# wln_id = "vz-it-np-gk1v-dev-edwdo-0"
QUAL_BQ_PROJECT_ID = "${VZ_BQ_PROJECT}"

def replace_header_in_export(sql_text):
    return re.sub(
        r"(EXPORT\s+DATA\s+OPTIONS)\s*\(\s*(.*?)\s*\)",
        lambda m: f"{m.group(1)}(" + re.sub(
            r"\bheader\s*=\s*true\b", "header = false", m.group(2), flags=re.IGNORECASE
        ) + ")",
        sql_text,
        flags=re.DOTALL | re.IGNORECASE
    )


def replace_not_in_select_in_file(input_string):
    pattern = r"\bnot\s+in\s+\((\s*select\s+(?!distinct))"
    #a = re.search(pattern,  input_string, flags=re.IGNORECASE|re.DOTALL)
    ##print(a)
    return re.sub(pattern, 'NOT IN (SELECT DISTINCT ', input_string, flags=re.IGNORECASE|re.DOTALL)

def add_prd_id(sql_statement):
    pattern= re.compile(
    #  r'(?<!EXTRACT\(DAY)\s+FROM'     # Negative lookbehind to avoid EXTRACT(DAY FROM
    r'\b(from|JOIN|TABLE|INTO|UPDATE|MERGE INTO|DELETE FROM|VIEW)\b\s+([\w\$\`\'\"\{\}]+)\.+([\w\$\`\'\"\{\}]+)' # SQL keywords
     
    ,         # Match schema.table
    flags=re.DOTALL|re.IGNORECASE)

    def add_id(match):
        # print(match)
        # #print(match.group(1),match.group(2),"-=-=-=--=-=-=-=-")
        state = match.group(1)
        schema = match.group(2)
        table = match.group(3)
        if re.search(fr"(day|month|year)\s+from\s+({schema})\.+({table})", sql_statement,  flags=re.DOTALL|re.IGNORECASE):
            # #print(schema,"*"*10,re.search(fr"(day|month|year)\s+from\s+({schema})\.+({table})", sql_statement,  flags=re.DOTALL|re.IGNORECASE))
            return f"{state} {schema}.{table}"
        return f"{state} {QUAL_BQ_PROJECT_ID}.{schema}.{table}"

    return pattern.sub( add_id, sql_statement)

def remove_comments(content):
    content = re.sub(r'--.*', '', content)  # Remove single-line comments (--)
    content = re.sub(r'/\.?\/', '', content, flags=re.DOTALL)  # Remove multi-line comments (/ */)
    return content

def Add_timezone(content):
    try:
        fileobj = content
        fileobj = re.sub(r"(current_date[\w]*)\(.*?\)",r"\1",fileobj,flags=re.I)
        fileobj = re.sub(r"(current_time[\w]*)\(.*?\)",r"\1",fileobj,flags=re.I)
        fileobj = re.sub(r"\bcurrent_datetime\b","CURRENT_DATETIME('America/New_York')",fileobj,flags=re.I)
        fileobj = re.sub(r"\bcurrent_date\b","CURRENT_DATE('America/New_York')",fileobj,flags=re.I)
        fileobj = re.sub(r"\bcurrent_time\b","CURRENT_TIME('America/New_York')",fileobj,flags=re.I)

        
    except Exception as e:

        print("Error in Add_timezone")
      
    return fileobj

def modify_sql_content(content):
    uncommented_content = remove_comments(content)

    # create_statements = re.findall(r'^\s*\bcreate\s*table\s*.*?;', uncommented_content, re.IGNORECASE | re.MULTILINE | re.DOTALL)
    create_statements = re.findall(r'^\s*\bcreate\s*table\s+if\s+not\s+exists\s+.*?;', uncommented_content, re.IGNORECASE | re.MULTILINE | re.DOTALL)
    #print(create_statements)
    if create_statements:
        for stmt in create_statements:
            content = content.replace(stmt, "").strip()

        lines = content.split("\n")

        modified_content = []
        i = 0
        while i < len(lines) and (lines[i].strip().startswith("--%") or lines[i].strip().startswith("/*") or lines[i].strip() == ""):
            modified_content.append(lines[i])
            i += 1

        modified_content.extend(create_statements)
        # modified_content.append(beginning_statement)
        modified_content.extend(lines[i:])
        # modified_content.append(ending_statement)
    else:
        # modified_content = [beginning_statement, content, ending_statement]
        modified_content = [content]

    return "\n".join(modified_content)     

def process_sql_files(input_folder, output_folder):
    sql_files = [f for f in os.listdir(input_folder)]
    os.makedirs(output_folder, exist_ok=True)
    modified_count = 0
    modified_files = []  

    for sql_file in sql_files:
        input_file_path = os.path.join(input_folder, sql_file)
        output_file_path = os.path.join(output_folder, sql_file)

        try:
            with open(input_file_path, 'r', encoding='utf-8') as f:
                sql_statements = f.read()
                sql_statements = re.sub(r"END;\s*$", "", sql_statements, flags = re.I|re.DOTALL)
            print(f"Successfully wrote to {input_file_path} with UTF-8 encoding.")
        except UnicodeEncodeError as e:
            print(f"Error writing to {input_file_path}: {e}")
            print("Consider checking 'content' for problematic characters or using errors='replace'.")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

        sql_statements = modify_sql_content(sql_statements)
        drop_matches = re.findall(drop_pattern, sql_statements)
        create_matches = re.findall(create_pattern, sql_statements)

        modified = True

        for drop_table in drop_matches:
            for create_match in create_matches:
                if drop_table == create_match[0]:
                    modified = True
                    sql_statements = re.sub(rf"DROP TABLE IF EXISTS {re.escape(drop_table)};", "", sql_statements)

                    sql_statements = re.sub(rf"CREATE TABLE IF NOT EXISTS {re.escape(create_match[0])}([\s\S]*?);",
                                            rf"CREATE OR REPLACE TABLE {create_match[0]}{create_match[1]};",
                                            sql_statements)
                    break
        sql_statements = replace_not_in_select_in_file(sql_statements)
        
        sql_statements = add_prd_id(sql_statements)
        reg = r"set activityCount_var  =  \(/\*.*?Exception while translation of a query.*?-\*/\);"
        sql_statements = re.sub(reg, "", sql_statements)
        sql_statements = Add_timezone(sql_statements)
        sql_statements = replace_header_in_export(sql_statements)
        if modified:
            try:
                with open(output_file_path, 'w', encoding='utf-8') as f:
                    f.write(sql_statements)
                # print(f"Successfully wrote to {output_file_path} with UTF-8 encoding.")
            except UnicodeEncodeError as e:
                print(f"Error writing to {output_file_path}: {e}")
                print("Consider checking 'content' for problematic characters or using errors='replace'.")
            except Exception as e:
                print(f"An unexpected error occurred: {e}")
            modified_count += 1
            modified_files.append(sql_file)
        else:
            shutil.copy(input_file_path, output_file_path)

#utility for adding BEGIN TRANSECTION AND RELATED CODE FOR SQL PART BLOCKS

def add_begin_end_transection_in_code(input_path):
    HEREDOC_START_RE = re.compile(r'^--PSOCOMMENT--.*?(?:bteq|fexp|mload\s+-b)([\w+ \"!]*)<<([\w+ \"\\!]*)[ ]*(.*?)$', flags = re.I|re.M)
    
    HEREDOC_END_RE = re.compile(r'--PSOCOMMENT--[!]*(bteqend|(\w*)eof(\w*)|(\w*)eof[\w_]*)\s*$',flags = re.I|re.M)

    end_part = """
COMMIT TRANSACTION;
EXCEPTION WHEN ERROR THEN
RAISE USING MESSAGE = CONCAT("Exception while running query : ",FORMAT(@@error.message),@@error.formatted_stack_trace);
ROLLBACK TRANSACTION;
END;"""
    out = f"{input_path}"
    if not os.path.exists(out):
        os.makedirs(out, exist_ok=True)
    for file_name in os.listdir(input_path):
        
        try:
            with open(os.path.join(input_path, file_name), 'r', encoding='utf-8') as f:
                content = f.read()
            print(f"add_begin_end_transection_in_code {os.path.join(input_path, file_name)} with UTF-8 encoding.")
        except UnicodeEncodeError as e:
            print(f"Error writing to {os.path.join(input_path, file_name)}: {e}")
            print("Consider checking 'content' for problematic characters or using errors='replace'.")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

        # content = re.sub(r"^--", "# --", content, flags = re.M)
        global temp
        # #print(re.search(r"\bBEGIN\b(.*?)--PSOCOMMENT--", content, flags = re.I|re.DOTALL),"======",file_name)
        #print(content[-10:],"========start")

        content = re.sub(r"END;\s*$", "", content, flags = re.I|re.DOTALL)
        #print(content[-10:],"========end")
        content = re.sub(r"BEGIN\s+BEGIN\s+TRANSACTION;", "", content, flags = re.I|re.DOTALL)
        content = re.sub(r"(END;\s+)?COMMIT TRANSACTION;\s+EXCEPTION WHEN ERROR THEN\s+RAISE USING MESSAGE = CONCAT\(\"Exception while running query : \",FORMAT\(@@error.message\),@@error.formatted_stack_trace\);\s+ROLLBACK TRANSACTION;\s+END;", "", content, flags = re.I|re.DOTALL)
        temp = re.search(r"\bBEGIN\b\s+declare(.*?)--PSOCOMMENT--", content, flags = re.I|re.DOTALL)
        temp = f"Declare {temp.group(1)}" if temp else ""
        content = re.sub(r"\bBEGIN\b\s+declare.*?--PSOCOMMENT--", "--PSOCOMMENT--", content, flags = re.I|re.DOTALL)
        lines = content.splitlines()
        start_part = f"""BEGIN
{temp}
BEGIN TRANSACTION;"""
        output_lines = []
        in_sql_block = False

        for i, line in enumerate(lines):
            stripped = line
            if stripped.strip('\n').strip(' ') == '':
            
                output_lines.append(f"\n{line}")
                continue

            srch=HEREDOC_START_RE.match(stripped)
            if srch:
                output_lines.append(f"\n{line}")
                output_lines.append(f"\n{start_part}\n")
                # #print(temp,"============================")

                in_sql_block=True
            elif in_sql_block:
                srch_end=HEREDOC_END_RE.match(stripped)
                if srch_end:
                    output_lines.append(f"\n{end_part}\n")
                    output_lines.append(f"\n{line}")
                    in_sql_block=False
                else:
                    output_lines.append(f"\n{line}")
            elif not in_sql_block:
                output_lines.append(f"\n{line}")
        if in_sql_block:
            #print("im here")
            output_lines.append(f"\n{end_part}\n")  # Handle the final block
        # #print(output_lines)
        with open(os.path.join(out, file_name), 'rb') as f:
            result = chardet.detect(f.read())
            r = result['encoding']
        with open(os.path.join(out, file_name), "w", encoding=r) as file:
            file.writelines(output_lines)
#Anand TEAM utilitys


def extract_sql_from_bteq_content(content):
    """
    Extracts SQL queries that follow EXPORT DATA OPTIONS(...) AS using regex.s
    Each EXPORT block must include the 'AS' keyword followed by a SELECT or other SQL.
    """
    pattern = re.compile(
        r"""
        EXPORT\s+DATA\s+OPTIONS\s*     # Match 'EXPORT DATA OPTIONS'
        \([^)]*\)                      # Match the parenthesized options
        \s+AS\s+                       # Match 'AS' keyword
        (                              # Capture group for SQL
            (?:SELECT|WITH|INSERT|UPDATE|MERGE|DELETE)\b.*?  # SQL starts
            (?=;\n|\n\s*(?:EXPORT|END|RETURN|BTEQEOF|$))        # Until next control keyword or semicolon
        )
        """,
        re.IGNORECASE | re.DOTALL | re.VERBOSE
    )

    matches = pattern.findall(content)
    sql_statements = []

    for match in matches:
        if "ERROR('QUIT with ERROR:" in match:
            continue
        sql_statements.append(match.strip().rstrip(';') + ';')
    return sql_statements

def check_export_data_options(content):
    """Check if content contains EXPORT DATA OPTIONS blocks."""
    matches = EXPORT_DATA_RE.findall(content)
    # return len(matches) > 0, matches
    all_error_blocks = all("ERROR('QUIT with ERROR" in block for block in matches)

    has_export = len(matches) > 0 and not all_error_blocks

    return has_export, matches

def extract_log_path_from_bteq_line(bteq_line):
    """Extracts a log file path from a BTEQ/FEXP heredoc start line."""
    # This pattern handles quoted, unquoted, and concatenated path strings.
    # pattern = r'<<\s*[A-Z0-9_-]+\s*(?:>>|>)\s*(.*?)(?=\s*(?:[0-9]?>|;|\||&)|$)'
    pattern = r'<<\s*[A-Z0-9_-]+\s*(?:1?>>|1?>)\s*(.*?)(?=\s*(?:[0-9]?>|;|\||&)|$)'
    
    match = re.search(pattern, bteq_line, re.IGNORECASE)
    
    if match:
        path = match.group(1).strip()
        # Remove quotes if the entire path is enclosed in them
        if (path.startswith('"') and path.endswith('"')) or \
           (path.startswith("'") and path.endswith("'")):
            return path[1:-1]
        
        return path
        
    return None

def clean_uri_value(raw_uri):
    # --- Step 1: Initial Cleaning (handles concatenations and quotes) ---
    cleaned = raw_uri.strip()
    if '||' in cleaned:
        parts = cleaned.split('||')
        processed_uri = "".join([p.strip().strip("'") for p in parts])
    else:
        if cleaned.startswith("'") and cleaned.endswith("'"):
            processed_uri = cleaned[1:-1]
        else:
            processed_uri = cleaned

    final_uri = processed_uri

    # If the path starts with '/', decide whether to prepend or to strip the slash.
    if final_uri.startswith('/'):
        path_after_slash = final_uri[1:]
        
        # A path is considered "variable" if it starts with '$' or '${'
        is_variable_path = path_after_slash.startswith('${') or path_after_slash.startswith('$')

        # NEW RULE: If the path is static (not a variable), prepend /${SYSMNT}.
        if not is_variable_path:
            final_uri = '${SYSMNT}' + final_uri
        else:
            final_uri = path_after_slash
    
    # Rule 1: Replace any occurrence of '*. with '.'
    final_uri = final_uri.replace('*.', '.')
    if final_uri.endswith('.'):
        final_uri = final_uri[:-1]
        
    return final_uri

def extract_export_parameters_from_content(content):
    """Extract all export parameters from EXPORT DATA OPTIONS blocks."""
    export_body_reg = re.compile(r'EXPORT\s+DATA\s+OPTIONS\s*\([^)]*\)', re.IGNORECASE | re.MULTILINE | re.DOTALL)
    export_blocks = export_body_reg.findall(content)
    
    # Initialize default values
    uri_paths = []
    format_values = []
    header_values = []
    delimiter_values = []
    
    for block in export_blocks:
        # Extract URI paths

        uri_matches = URI_VALUE_RE.findall(block)
        if uri_matches:
            raw_uri_string = uri_matches[0]
            # The cleaning function now applies the new rules.
            cleaned_uri = clean_uri_value(raw_uri_string)
            uri_paths.append(cleaned_uri)
        
        # Extract format values
        format_matches = FORMAT_EXTRACT_RE.findall(block)
        format_values.extend(format_matches)
        
        # Extract header values
        header_matches = HEADER_EXTRACT_RE.findall(block)
        cleaned_headers = [h.strip().strip('"\'') for h in header_matches]
        header_values.extend(cleaned_headers)
        
        # Extract delimiter values
        delimiter_matches = DELIMITER_EXTRACT_RE.findall(block)
        delimiter_values.extend(delimiter_matches)
    
    # Return the first found value for each parameter, or default
    return {
        'uri_path': uri_paths[0] if uri_paths else "",
        'format': format_values[0] if format_values else "csv",
        'header': header_values[0] if header_values else "true",
        'delimiter': delimiter_values[0] if delimiter_values else " "
    }

def escape_enescaped_double_quotes(sql):
    return re.sub(r'(?<!\\)"', r'\\"', sql)
    

def generate_bq_query_execute_call(sql_statements, export_params, log_path, block_counter, is_mixed_sql_content):
    """Generate the appropriate bq_query_execute shell script call."""

    escaped_queries = [escape_enescaped_double_quotes(q) for q in sql_statements]

    # Prepare the queries string
    queries_str = ' '.join(escaped_queries) if escaped_queries else ""

    shell_lines = []


    # Export data to file case
    output_file = export_params.get('uri_path', f'query_output_{block_counter}.out')
    log_file = log_path if log_path else f'{os.path.basename(output_file).split('.')[0]}_log_{block_counter}.log'
    format_val = export_params.get('format', 'csv').lower()
    # header_val = export_params.get('header', 'false')
    # Currently we are passing header value as false by default
    header_val = 'false'
    delimiter_val = export_params.get('delimiter', ' ')

    # Remove "*" from the end of output_file if presentclear
    if output_file.endswith("*"):
        output_file = output_file[:-1]

    if is_mixed_sql_content:
        shell_lines.append(f'\n\n__ORIGINAL_RC=$?')

    shell_lines.append(f"\n# Generated bq_query_execute call for BTEQ Block {block_counter}\n")
    shell_lines.append(f'queries="{queries_str}"')

    if is_mixed_sql_content:
        shell_lines.append(f'\nif [ $__ORIGINAL_RC -eq 0 ]; then')
        shell_lines.append(f'\n   bq_query_execute "{output_file}" "{log_file}" {format_val} {header_val} "{delimiter_val}" "$queries" file')
        shell_lines.append(f'\n   __ORIGINAL_RC=$?')
        shell_lines.append(f'\nfi')
        shell_lines.append(f'\n')
        shell_lines.append(f'\n(eval "exit $__ORIGINAL_RC")')
        shell_lines.append(f'\n')
    else:    
        shell_lines.append(f'\n')
        shell_lines.append(f'\n   bq_query_execute "{output_file}" "{log_file}" {format_val} {header_val} "{delimiter_val}" "$queries" file')
        shell_lines.append(f'\n')

    # shell_lines.append("\n")
    # shell_lines.append("\nif [ $? -ne 0 ]; then")s
    # shell_lines.append(f'\n    echo "### {log_file} ###"')
    # shell_lines.append(f'\n    cat {log_file}')
    # shell_lines.append("\n    exit 1")
    # shell_lines.append("\nelse")
    # shell_lines.append(f'\n    echo "### {output_file} : $name ###"')
    # shell_lines.append(f'\n    cat {output_file}')
    # shell_lines.append("\nfi")
    shell_lines.append("")

    return shell_lines


def log_replacement(file_path, line_num, original, replacement):
    """Log a replacement action with details."""
    replaced_entries.append({
        'file_name': os.path.basename(file_path),
        'line_no': line_num,
        'remark': f'Replaced `{original.strip()}` → `{replacement.strip()}`'
    })


def remove_backticks_from_raven_alias(block_lines):
    """Remove backticks from Raven alias declarations like AS `A123` → AS A123."""
    block_lines_without_backticks = []
    for line in block_lines:
        modified_line = RAVEN_ALIAS_RE.sub(r'\1', line)
        # Commenting line which contains FOR SESSION
        modified_line = re.sub(FOR_SESSION_RE, r"-- \1", modified_line)
        block_lines_without_backticks.append(modified_line)

    return block_lines_without_backticks   

def add_default_to_error_variables(line, file_path, line_num):
    """
    Add default values to error variables declarations:
    e.g. DECLARE _ERROR_CODE INT64; → DECLARE _ERROR_CODE INT64 DEFAULT 0;
    """
    match = ERROR_VAR_DECL_RE.match(line)
    if match:
        indent, var_name, var_type, suffix = match.groups()
        var_type = var_type.upper()
        default_val = "DEFAULT 0" if var_name.upper() == "_ERROR_CODE" else "DEFAULT ''"
        replacement = f"{indent}{var_name} {var_type} {default_val}{suffix}\n"
        log_replacement(file_path, line_num, line, replacement)
        #print(f"  [Line {line_num}] Added default to {var_name}")
        return replacement
    return line

# def replace_heredoc_blocks(line, file_path, line_num, heredoc_block_started, heredoc_tag):
#     """
#     Replace heredoc-style comments starting and ending with bteq markers
#     into BigQuery compatible heredoc commands.
#     """
#     start_match = HEREDOC_START_RE.match(line)
#     if start_match:
#         indent = start_match.group(1)
#         heredoc_tag = start_match.group(3)
#         trailing = line[start_match.end():]  # preserve everything after the marker
#         replacement = f'{indent}bq query --use_legacy_sql=false <<{start_match.group(2)}{trailing}'
#         log_replacement(file_path, line_num, line, replacement)
#         heredoc_block_started = True        
#         return replacement, heredoc_block_started, heredoc_tag

#     end_match = HEREDOC_END_RE.match(line)
#     if end_match and heredoc_block_started and heredoc_tag == end_match.group(2):
#         replacement = re.sub(r'--PSOCOMMENT--', '', line)
#         log_replacement(file_path, line_num, line, replacement)
#         heredoc_block_started = False
#         return replacement, heredoc_block_started, None

#     return None, heredoc_block_started, heredoc_tag

def get_content_with_Correct_path(line):
    if not line.strip() or line.strip().startswith('#'):
        return line
    
    if not line.strip().startswith("--PSOCOMMENT--"):
        return line
    
    home_path_pattern = r'/\$(?:\{HOME\}|HOME)'

    # ALWAYS return the line if it contains the HOME path (with or without braces)
    if re.search(home_path_pattern, line, re.IGNORECASE):
        return line

    processed_line = line

    # Special handling for 'sed' commands to avoid modifying internal regex patterns.
    if "sed " in line and "s/" in line:
        # Split the line from the right by the last space to isolate the file path.
        parts = line.rsplit(' ', 1)
        if len(parts) == 2 and parts[1].startswith('/'):
            return f"{parts[0]} ${{SYSMNT}}{parts[1]}"

    # 1. Regex to handle paths immediately following an assignment operator.
    #    E.g., VAR=/path, VAR="/path", VAR='/path'
    #    It captures the assignment part (group 1), the initial slash (group 2),
    #    and the rest of the path (group 3). It then reconstructs with ${SYSMNT}/.
    #    This prevents issues with paths embedded directly after '='
    processed_line = re.sub(r'(=["\']?)(/)([^"\']*)', r'\1${SYSMNT}/\3', processed_line)

    # 2. Regex to handle standalone absolute paths that are arguments or commands.
    #    This looks for a '/' that is:
    #    - At the start of the line (`^`) OR preceded by a whitespace character (`(?<=\s)`)
    #    - Is NOT already preceded by '${SYSMNT}' (`(?<!\$\{SYSMNT})`) to prevent double-prepending.
    #    - Is NOT immediately followed by a non-whitespace character and an equals sign
    #      (`(?!\S*=)`), which helps avoid matching parts of URL-like strings or `key=value` patterns.
    #    - Is NOT immediately followed by an asterisk `*` (`(?![*])`), which prevents modification
    #      of the slash in C-style comment openers like `/*`.
    #    - The actual slash is captured as group 2. The remaining path is group 3.
    #    The `\1` ensures that the preceding whitespace or start-of-line anchor is preserved.
    processed_line = re.sub(r'(^|(?<=\s)|(?<=--PSOCOMMENT--))(/)(?!${SYSMNT})(?!\S*=)(?![*])(\S*)', r'\1${SYSMNT}/\3', processed_line)

    return processed_line

def comment_out_passkey_logic(script_content):
    # Comments out passkey assignments and validation blocks in the script.
    
    # It robustly finds the start of the block and non-greedily matches until 'exit 3' and 'fi'.
    if_block_regex = r"(?:--PSOCOMMENT--)?if\s+\[\s*-z\s+\"\$(?:PASS_KEY|PASSKEY|td_pass_key|oracle_pass_key|teradata_pass_key)\"\s*\].*?exit\s+.*?fi"

    processed_script = re.sub(
        if_block_regex,
        lambda m: "\n".join([
            # If the line (after stripping whitespace) already starts with '#', leave it alone.
            line if line.strip().startswith("#")
            # Otherwise, add the prefix.
            else "#PASSKEY_COMMENT#" + line
            for line in m.group(0).splitlines()
        ]),
        script_content,
        flags=re.DOTALL | re.IGNORECASE  # Use DOTALL flag for '.' to match newlines
    )

    # Process single-line passkey assignments
    # assignment_regex = r"^\s*(?:--PSOCOMMENT--)?\s*(?:PASS_KEY|td_pass_key|oracle_pass_key|teradata_pass_key)\s*=\s*(.*?)(?:\s+--.*)?$"
    assignment_regex = r"^(?!\s*#)(\s*(?:--PSOCOMMENT--)?\s*(?:PASS_KEY|PASSKEY|td_pass_key|oracle_pass_key|teradata_pass_key)\s*=\s*(?:.*?)(?:\s+--.*)?)$"

    processed_script = re.sub(
        assignment_regex,
        r"#PASSKEY_COMMENT#\g<0>",
        processed_script,
        flags=re.MULTILINE | re.IGNORECASE
    )
    
    return processed_script

def comment_out_export_data_section(bteq_content):
    """
    Finds EXPORT DATA OPTIONS blocks within a BTEQ block and prepends a comment
    marker to each line of the export section.
    """
    # This inner function will be called by re.sub for each match found.
    def comment_replacer(match):
        """Prepends a comment marker to each line of a matched block."""
        # match.group(0) contains the entire string of the matched export block.
        export_block = match.group(0)
        if "SELECT ERROR('QUIT with ERROR: " in match.group(1):
            return export_block
        
        export_block_lines = export_block.splitlines(True)
        
        # Prepend a comment to each line of the matched export block.
        commented_export_lines = [f"#BQ_Export_Comment {line}" for line in export_block_lines]
        commented_export_lines.append('\n')
        return "".join(commented_export_lines)

    # Use re.sub() to find all occurrences of the EXPORT DATA pattern and replace each one with the result of our comment_replacer function.
    modified_content = EXPORT_DATA_RE.sub(comment_replacer, bteq_content)
    
    return modified_content

def comment_single_line(line):
    if not line.strip().startswith('--PSOCOMMENT--'):
        return line

    pattern_assignment = r'CONNECT_STRING\s*=\s*"?[`]?\s*openssl\s+enc\s+-pbkdf2 -d -in'
    
    content_after_prefix = line.split('--PSOCOMMENT--', 1)[1]
    pattern_usage = content_after_prefix.strip().upper() == '$CONNECT_STRING'

    if re.search(pattern_assignment, line, re.IGNORECASE) or pattern_usage:
        return line.replace('--PSOCOMMENT--', '--PSOCOMMENT--#', 1)
    
    return line

def find_main_call_and_replace(line):
    match = MAIN_FUN_CALL_RE.match(line.strip())

    if match:
        original_command = line.strip()
        indentation = re.match(r"(\s*)", line, re.IGNORECASE).group(1)
        inner_indent = indentation + "    "
        then_block = f"""{indentation}( {original_command} )
{indentation}main_exit_code=$?
{indentation}echo "--- Start of Log File: $lf ---"
{indentation}fallback_filename=$(basename "$lf")
{indentation}fallback_log_file="${{LOG_SAVE_DIR}}/${{fallback_filename}}"
{indentation}if [ -f "$lf" ]; then
{indentation}    cat "$lf"
{indentation}elif [ -f "$fallback_log_file" ]; then
{indentation}    cat "$fallback_log_file"
{indentation}fi
{indentation}echo "--- End of Log File: $lf ---"
{indentation}(eval "exit $main_exit_code")
"""
        replacement_block = f"""{indentation}if [  -n "${{SHOW_DAG_LOGS}}" ] && [ "${{SHOW_DAG_LOGS}}" = "true" ]; then
{then_block}
{indentation}else
{inner_indent}{original_command}
{indentation}fi\n"""
        return replacement_block
    else:
        return line
    
def contains_other_sql(block_content):
    """
    Checks if a BTEQ block contains valid, semicolon-terminated SQL statements 
    other than the EXPORT command.
    """
    # 1. Create a new string with all EXPORT DATA blocks removed.
    content_without_exports = EXPORT_DATA_RE.sub('', block_content)

    # 2. Sequentially remove comments to avoid edge cases.
    content_no_ml_comments = re.sub(r'/\*.*?\*/', '', content_without_exports, flags=re.DOTALL)
    content_no_sl_comments = re.sub(r'--.*\n', '', content_no_ml_comments)
    
    # 3. Normalize the remaining content.
    normalized_content = ' '.join(content_no_sl_comments.split()).upper()

    if not normalized_content:
        return False

    # 4. Define regex patterns for common SQL statements, now requiring them to
    #    match all the way to a semicolon. The `.+?` is a non-greedy match for the
    #    body of the statement.
    sql_patterns = [
        # --- Data Manipulation Language (DML) ---
        r'SELECT\s+.+?\s+FROM.+?;',           # SELECT ... FROM ...;
        r'INSERT\s+INTO.+?;',                  # INSERT INTO ...;
        r'UPDATE\s+.+?\s+SET.+?;',             # UPDATE ... SET ...;
        r'DELETE\s+FROM.+?;',                  # DELETE FROM ...;
        r'MERGE\s+INTO.+?;',                   # MERGE INTO ...;
        r'CALL\s+[A-Z0-9_.]+.*?;',             # CALL my_proc();
        r'USING\s+.+?\s+INSERT.+?;',           # Parameterized INSERT

        # --- Data Definition Language (DDL) ---
        r'CREATE\s+(OR\s+REPLACE\s+)?(MULTISET|SET|TABLE|VIEW|PROCEDURE|MACRO|TRIGGER|INDEX).+?;',
        r'REPLACE\s+(VIEW|PROCEDURE|MACRO).+?;', # Teradata specific REPLACE
        r'DROP\s+(TABLE|VIEW|PROCEDURE|MACRO|USER|DATABASE|INDEX).+?;',
        r'ALTER\s+TABLE.+?;',
        r'TRUNCATE\s+TABLE.+?;',
        r'RENAME\s+TABLE.+?;',
        r'COMMENT\s+ON.+?;',                   # COMMENT ON TABLE ... IS ...;

        # --- Data Control Language (DCL) ---
        r'GRANT\s+.+?\s+ON.+?;',               # GRANT SELECT ON ...;
        r'REVOKE\s+.+?\s+ON.+?;',              # REVOKE INSERT ON ...;
        
        # --- Teradata-Specific & Transaction Control ---
        r'COLLECT\s+(STATISTICS|STATS).+?;',   # COLLECT STATISTICS ...;
        r'LOCKING\s+(TABLE|ROW|VIEW).+?;',     # LOCKING TABLE ... FOR ACCESS;
        # --- Diagnostic / Help Commands ---
        r'HELP\s+(TABLE|VIEW|INDEX|STATISTICS|COLUMN).+?;',
        r'SHOW\s+(TABLE|VIEW|INDEX|PROCEDURE|FUNCTION|MACRO).+?;',
    ]

    
    combined_sql_re = re.compile('|'.join(f'({pattern})' for pattern in sql_patterns), re.IGNORECASE)

    # 5. Search for any of these definitive, semicolon-terminated patterns.
    if combined_sql_re.search(normalized_content):
        return True  # A valid, terminated SQL statement was found.

    return False

def add_bteq_block_success_log_logic_in_log_file(log_path):
    """
    Returns a shell script block as a list of lines to log success 
    and preserve the original exit code.
    """
    shell_script = f"""
__ORIGINAL_RC=$?
if [ $__ORIGINAL_RC -eq 0 ]; then
    echo "RC (return code) = 0" >> {log_path}
fi

(eval "exit $__ORIGINAL_RC")
"""
    # The original function returns a list of lines, so we split the string
    return shell_script.splitlines(True)

def remove_code_block_and_keep_comment(file_content):
    code_block_pattern = (
        r"(\s*IF _GLOBAL_ERROR_CODE > 0 THEN\s*"
        r"SELECT ERROR\('RC \(return code\)=\' \|\| FORMAT\('%11d', _GLOBAL_ERROR_CODE\) \|\| _ERROR_MESSAGE\) AS `A12180`;\s*"
        r"RETURN;\s*"
        r"END IF;\s*"
        r"SELECT 'RC \(return code\) = ' \|\| FORMAT\('%11d', _GLOBAL_ERROR_CODE\) AS `A12180`;\s*"
        r"RETURN;\s*"
        r"END;)"
    )

    comment_pattern = r"(\s*# -- Post Script is applied on:.*)"
    
    full_pattern = re.compile(code_block_pattern + comment_pattern + r"\s*\Z")

    new_content, num_replacements = full_pattern.subn(lambda m: m.group(2), file_content)

    if num_replacements > 0:
        return new_content
    
    return file_content
    
def process_file(input_file, output_file):
    """Process a single shell file to extract BTEQ blocks and create queries variable only if EXPORT DATA OPTIONS is present."""
    # filename = os.path.basename(input_file)

    with open(input_file, 'rb') as f:
        result = chardet.detect(f.read())
        r = result['encoding']
    with open(input_file, 'r', encoding=r) as f:
        lines = f.readlines()

    new_lines = []
    in_block = False
    block_tag = None
    block_lines = []
    block_counter = 1

    for idx, line in enumerate(lines, start=1):
        cleaned_line = add_default_to_error_variables(line, input_file, idx)

        # Remove ${} from lines matching "export ${variable_name}" using regex
        cleaned_line = re.sub(r"\s*export\s+\${(.*?)}", r"export \1", cleaned_line, flags=re.IGNORECASE)

        cleaned_line = get_content_with_Correct_path(cleaned_line)
        cleaned_line = comment_single_line(cleaned_line)
        cleaned_line = process_shell_export_statements(cleaned_line)
        line = cleaned_line    
        if not in_block:
            start_match = HEREDOC_START_RE.match(line)
            if start_match:
                block_tag = start_match.group(1)
                in_block = True
                start_line = idx
                bteq_start_line = line  # Store the BTEQ start line for log path extraction
                block_lines = [line]  # Start collecting lines from start
            else:
                line = find_main_call_and_replace(line)
                new_lines.append(line)
        else:
            block_lines.append(line)
            end_match = HEREDOC_END_RE.match(line)
            if end_match and end_match.group(1) == block_tag:
                # Entire block collected

                block_lines = remove_backticks_from_raven_alias(block_lines)
                block_content = ''.join(block_lines)

                # Check if EXPORT DATA OPTIONS is present
                has_export, export_blocks = check_export_data_options(block_content)
                log_path = extract_log_path_from_bteq_line(bteq_start_line)

                if has_export:
                    block_id = f"BLOCK_{block_counter:03d}"

                    is_mixed_sql_content  = contains_other_sql(block_content)
                    # Check if the block has other DML/DDL besides the export.
                    if is_mixed_sql_content :
                        # SCENARIO 1: MIXED CONTENT BLOCK (e.g., a SELECT and an EXPORT)
                        # Action: Comment out ONLY the export part and append the BQ call.
                        modified_block_content = comment_out_export_data_section(block_content)
                        new_lines.extend(modified_block_content.splitlines(True)) 

                    else:
                        # SCENARIO 2: EXPORT-ONLY BLOCK
                        # Action: Comment out the ENTIRE block. The BQ call will replace it.
                        for block_line in block_lines:
                            new_lines.append(f"#BQ_Block_Comment {block_line}")  
                  
                    
                    # 1. Extract information needed to generate the new BigQuery call (as before).
                    sql_statements = extract_sql_from_bteq_content(block_content)
                    # log_path = extract_log_path_from_bteq_line(bteq_start_line)
                    export_params = extract_export_parameters_from_content(block_content)

                    # 2. Generate and append the new bq_query_execute call to the output.
                    if sql_statements:
                        bq_execute_call = generate_bq_query_execute_call(sql_statements, export_params, log_path, block_counter, is_mixed_sql_content)
                        new_lines.extend(bq_execute_call)
                        new_lines.append("\n")
                    else:
                        print(f"Warning: No SQL statement was detected in the EXPORT block for file: {os.path.basename(input_file)}")    
                    
                    block_counter += 1
                else:
                    new_lines.extend(block_lines)
                    if log_path and log_path.strip():
                        new_lines.extend(add_bteq_block_success_log_logic_in_log_file(log_path))


                # Reset for next block
                in_block = False
                block_lines = []
                block_tag = None

    # This handles the case of a missing closing heredoc tag until the end of the file.
    if in_block and block_lines:
        # Since the block was not properly closed, we should add the collected lines back to the main content to avoid data loss.
        new_lines.extend(block_lines)

    new_lines.append(f'\n\n # -- Post Script is applied on: {timestamp}')
    content = "".join(new_lines)
    reg = r"(END;\s+)?COMMIT TRANSACTION;"
    content = re.sub(reg,"COMMIT TRANSACTION;", content, flags=re.I|re.DOTALL)

    # Comments out passkey assignments and validation blocks in the script.
    content = comment_out_passkey_logic(content)

    #Applying PSO team regex to cooment and replace content
    content = apply_pso_team_regex(content)

    content = remove_code_block_and_keep_comment(content)

    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(content)
        # print(f"Successfully wrote to {output_file} with UTF-8 encoding.")
    except UnicodeEncodeError as e:
        print(f"Error writing to {output_file}: {e}")
        print("Consider checking 'content' for problematic characters or using errors='replace'.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def process_directory(input_dir, output_dir):
    """Process all files in the input directory."""
    os.makedirs(output_dir, exist_ok=True)
    for filename in os.listdir(input_dir):
        input_file = os.path.join(input_dir, filename)
        output_file = os.path.join(output_dir, filename)
        if os.path.isfile(input_file):
            process_file(input_file, output_file)

# def dbc_handler(content):
#     reg = r"(select|sel)[\w\{\}\<\>\$_\"\'\s,]+(vz-it-np-gk1v-dev-edwdo-0.dbc.tables|vz-it-np-gk1v-dev-edwdo-0.dbc.tablesv).*?;"
#     reg_dict = {
#     "vz-it-np-gk1v-dev-edwdo-0.dbc.tablesv" : "vz-it-np-gk1v-dev-edwdo-0.region-us.INFORMATION_SCHEMA.TABLES",
#     "vz-it-np-gk1v-dev-edwdo-0.dbc.tables" : "vz-it-np-gk1v-dev-edwdo-0.region-us.INFORMATION_SCHEMA.TABLES",
#     "WHERE" : "where table_catalog='vz-it-np-gk1v-dev-edwdo-0' and ",
#     "DATABASENAME" : "table_schema",
#     "TABLENAME" : "table_name"
#     }
#     def replacer(match):
#         #print(match.group(0))
#         match = match.group(0)
#         # print(match,end="\r")
#         for key, value in reg_dict.items():
#             #print(key, value)
#             match = re.sub(key, value, match, flags=re.I|re.DOTALL)
#         return match
#     reg = r"(select|sel)[\w\{\}\<\>\$_\"\'\`\*\=\(\)\s,]+(vz-it-np-gk1v-dev-edwdo-0.dbc.tables|vz-it-np-gk1v-dev-edwdo-0.dbc.tablesv).*?;"
    
#     content = re.sub(reg, replacer, content, flags=re.I|re.DOTALL )
#     return content

# Modified below reges as per discussiion with shubham
def dbc_handler(content):
    escaped_project_id = re.escape(QUAL_BQ_PROJECT_ID)

    reg_dict = {
        f"{escaped_project_id}\\.dbc\\.tablesv": f"{QUAL_BQ_PROJECT_ID}.region-us.INFORMATION_SCHEMA.TABLES",
        f"{escaped_project_id}\\.dbc\\.tables": f"{QUAL_BQ_PROJECT_ID}.region-us.INFORMATION_SCHEMA.TABLES",
        "WHERE": f"where table_catalog='{QUAL_BQ_PROJECT_ID}' and ",
        "DATABASENAME": "table_schema",
        "TABLENAME": "table_name"
    }
    def replacer(match):
        """Applies all replacements from the dictionary to the matched string."""
        match_str = match.group(0)
        for key, value in reg_dict.items():
            match_str = re.sub(key, value, match_str, flags=re.I|re.DOTALL)
        return match_str
    reg = rf"(select|sel)[\w{{}}\<\>\$_\"\'\`\*\=\(\)\s,\|\.\;]+({escaped_project_id}\.dbc\.tables|{escaped_project_id}\.dbc\.tablesv).*?;"


    content = re.sub(reg, replacer, content, flags=re.I|re.DOTALL )
    return content

def clean_content(output_dir):
    if not os.path.isdir(output_dir):
        print(f"Error: Directory not found at {output_dir}")
        return

    for file_name in os.listdir(output_dir):
        file_path = os.path.join(output_dir, file_name)

        if not os.path.isfile(file_path):
            continue
        text_content = None

        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f_read:
                text_content = f_read.read()
        except UnicodeDecodeError as e:
            print(f"UnicodeDecodeError reading '{file_name}': {e}. Attempting to read as binary.")
            try:
                with open(file_path, 'rb') as f_read_binary:
                    binary_data = f_read_binary.read()
                    text_content = binary_data.decode('latin-1', errors='replace')
                    print(f"Successfully read '{file_name}' as Latin-1 after UTF-8 decode error.")
            except Exception as binary_e:
                print(f"Error reading '{file_name}' as binary: {binary_e}")
                continue

        except Exception as e:
            print(f"An unexpected error occurred while reading '{file_name}': {e}")
            continue

        if text_content is None:
            continue

        try:
            text_content = re.sub(
                r"(create\s+or\s+replace\s+table.*?)(#.*?/ksh)",
                # lambda match: f"{match.group(2)} \nbq query --use_legacy_sql=false --project_id=\"$BQ_PROJECT_ID\"<<EOF\n{match.group(1)}\nEOF",
                lambda match: f"{match.group(2)} \nbq query --use_legacy_sql=false --project_id=\"$BQ_PROJECT_ID\" --label=run_id:${{run_id:-null}}  --label=instance_name:${{instance_name:-null}}  --label=job_id:${{job_id:-null}}  --label=task_id:${{task_id:-null}}  --label=task_type:${{task_type:-null}} <<EOF\n{match.group(1)}\nEOF",
                text_content,
                flags=re.I | re.DOTALL
            )
            text_content = dbc_handler(text_content)
        except Exception as e:
            print(f"Error during text content processing for '{file_name}': {e}")
            continue

        try:
            with open(file_path, 'w', encoding='utf-8') as f_write:
                f_write.write(text_content)
        except UnicodeEncodeError as e:
            print(f"UnicodeEncodeError writing '{file_name}': {e}. Content might have problematic characters.")
            continue
        except Exception as e:
            print(f"An unexpected error occurred while writing '{file_name}': {e}")
            continue

        try:
            with open(file_path, 'rb') as f_binary_read:
                binary_content = f_binary_read.read()

            if b'\r\n' in binary_content:
                new_binary_content = binary_content.replace(b'\r\n', b'\n')
                with open(file_path, 'wb') as f_binary_write:
                    f_binary_write.write(new_binary_content)
                print(f"CRLF to LF converted in: {file_name}")

        except IOError as e:
            print(f"IOError during CRLF conversion for '{file_name}': {e}")
        except Exception as e:
            print(f"An unexpected error occurred during CRLF conversion for '{file_name}': {e}")

def write_log(log_path):
    """Write the replacement log entries into a CSV file."""
    with open(log_path, mode='w', newline='', encoding = 'utf-8') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=['file_name', 'line_no', 'remark'])
        writer.writeheader()
        writer.writerows(replaced_entries)
    #print(f"Log CSV written to: {log_path}")


def modify_create_logon_file(file_path):
    """
    Finds the 'Create_Logon_File' shell function in a file and ensures it
    ends with 'return 0'.

    - If a 'return' statement exists, it's replaced with 'return 0'.
    - If no 'return' statement exists, 'return 0' is added before the
      closing brace.

    Args:
        file_path (str): The full path to the file to process.

    Returns:
        bool: True if the file was modified, False otherwise.
    """
    try:
        with open(file_path, 'rb') as f:
            result = chardet.detect(f.read())
            r = result['encoding']
        with open(file_path, 'r', encoding=r, errors='ignore') as f:
            content = f.read()
    except IOError as e:
        print(f"Error reading file {file_path}: {e}")
        return False

    # Regex to find the 'Create_Logon_File' function and capture its body.
    # It handles 'function' keyword being optional and varying whitespace.
    # re.DOTALL allows '.' to match newlines, capturing the entire function body.
    function_pattern = re.compile(
        r'((?:function\s+)?Create_Logon_File\s*(?:\(\))?\s*\{)(.*?)(\n\s*\})',
        re.DOTALL | re.IGNORECASE
    )

    match = function_pattern.search(content)

    if not match:
        return False # Function not found in this file

    # The function is split into three parts for easier manipulation:
    # 1. The opening signature: e.g., "function Create_Logon_File {"
    # 2. The body content.
    # 3. The closing brace: e.g., "\n}"
    func_header = match.group(1)
    func_body = match.group(2)
    func_footer = match.group(3)

    modified = False

    # Regex to find an existing return statement (e.g., "return 1", "return $?").
    # The character set [\d$?] matches digits, a dollar sign, or a question mark.
    return_pattern = re.compile(r'\s*return\s+[\d$?]*\s*;?', re.IGNORECASE)


    if return_pattern.search(func_body):
        # If a return statement exists, replace it globally within the function body
        new_body = return_pattern.sub('\n    return 0', func_body)
        if new_body != func_body:
            modified = True
            func_body = new_body
    else:
        # If no return statement exists, add one before the closing brace.
        # We add a newline for proper formatting.
        func_body = func_body.rstrip() + '\n    return 0'
        modified = True

    if modified:
        # Reconstruct the entire function and replace it in the original content
        new_function_code = func_header + func_body + func_footer
        new_content = content[:match.start()] + new_function_code + content[match.end():]

        try:
            with open(file_path, 'rb') as f:
                result = chardet.detect(f.read())
                r = result['encoding']
            with open(file_path, 'w', encoding=r) as f:
                f.write(new_content)
            print(f"MODIFIED: {file_path}")
            return True
        except IOError as e:
            print(f"Error writing to file {file_path}: {e}")
            return False

    return False # No changes were needed


def process_logon_function_for_return0(directory_path):
    """
    Walks through a directory and processes each file.

    Args:
        directory_path (str): The path to the directory to scan.
    """
    if not os.path.isdir(directory_path):
        print(f"Error: Directory not found at '{directory_path}'")
        return

    print(f"Scanning directory: {directory_path}\n")
    modified_count = 0
    total_files = 0

    for root, _, files in os.walk(directory_path):
        for filename in files:
            # You can add more checks here to only process specific file types, e.g., .sh, .ksh
            # if filename.endswith(('.sh', '.ksh')):
            file_path = os.path.join(root, filename)
            total_files += 1
            if modify_create_logon_file(file_path):
                modified_count += 1

    print(f"\n--- Scan Complete ---")
    print(f"Processed {total_files} files.")
    # print(f"Modified {modified_count} files.")

def apply_pso_team_regex(script_content):
    content = script_content

    # Rule 2: Replace 'cat' in STEP assignments. The optional prefix is included in the capture group to preserve it during this inline replacement.
    content = re.sub(
        r"(^\s*(?:--PSOCOMMENT--\s*)?STEP_[a-zA-Z_]+\s*=\s*`)\s*cat\s*",
        r'\1grep "01,"',
        content,
        flags=re.M | re.IGNORECASE
    )

    # Rule 4: Simplify '_verizon_dollar_' variables. This is a pure inline replacement and is not affected by line prefixes.
    content = re.sub(
        r"_verizon_dollar_([a-zA-Z]+)_verizon_\w+",
        r"\1",
        content,
        flags=re.IGNORECASE
    )

    # Rule 1: Comment out '.logmech' command, handling optional prefix. The replacement string standardizes the output to a single '--' comment.
    content = re.sub(
        r"^\s*(?:--PSOCOMMENT--\s*)?(\.logmech\s+\$\{logmech1\}\s*;)\s*$",
        r"-- \1",
        content,
        flags=re.M | re.IGNORECASE
    )

    # Rule 3: Comment out '.Errorlevel 3807' check, handling optional prefix.
    content = re.sub(
        r"^\s*(?:--PSOCOMMENT--\s*)?\.Errorlevel\s+3807\s+Severity\s+0\s*;?\s*$",
        r"-- .Errorlevel 3807 Severity 0;",
        content,
        flags=re.M | re.IGNORECASE
    )

    # Rule for a variation of ".IF errorlevel != 0 THEN .goto ERRORCODE;"
    content = re.sub(
        r"\s*(?:--PSOCOMMENT--\s*)?(\.IF\s+errorlevel\s+!=\s+0\s+THEN\s+\.goto\s+ERRORCODE;)\s*$",
        r"-- \1",
        content,
        flags=re.M | re.IGNORECASE
    )

    # Rule 6: Conditionally comment out 'SELECT ERROR', handling optional prefix.
    select_pattern = r"^SELECT\s+ERROR\s*\(\s*'QUIT with ERROR: '\s*\|\|\s*_ERROR_MESSAGE\s*\)\s+AS\s+A12180\s*;"
    # conditional_pattern = (
    #     r"(?:--PSOCOMMENT--\s*)?(" + select_pattern + r".*$)" +
    #     r"(\r?\n)(?!.*?\bEND\b)"
    # )

    conditional_pattern = (
        r"^(?:--PSOCOMMENT--\s*)?(" + select_pattern + r".*$)" +
        r"((?:\s*\r?\n)+)" +
        r"(?!.*?\bEND\b)"
    )
    # The replacement comments out the captured SELECT line (group 1) and keeps its newline (group 2).
    content = re.sub(
        conditional_pattern,
        r"-- \1\2",
        content,
        flags=re.M | re.IGNORECASE
    )

    content = re.sub(
        r'^\$\{LDAP\}\.LogMech\s+Ldap;(!?.*)',
        r"-- \g<0>",
        content,
        flags=re.M | re.IGNORECASE
    )

    # New rule for multi-line COLLECT STATS
    # This regex finds the entire 'COLLECT STATS' statement, from the keyword
    # to the terminating semicolon, across multiple lines.
    collect_stats_pattern = r'(\bCOLLECT\s+(?:STATISTICS|STATS|SUMMARY)\b.*?;\n)'

    def comment_multiline_block(match):
        """Comments out each line of a matched multi-line block."""
        block = match.group(1)
        # Split by newline, comment each line, and join back.
        commented_lines = ["-- " + line for line in block.splitlines()]
        return "\n".join(commented_lines) + "\n"

    content = re.sub(
        collect_stats_pattern,
        comment_multiline_block,
        content,
        flags=re.IGNORECASE | re.DOTALL
    )

    return content

# Functions from uncomment_ksh_part_after_BQ_new.py
def replace_heredoc_blocks_uncomment(line):
    start_match = HEREDOC_START_RE_UNCOMMENT.match(line)
    if start_match:
        indent = start_match.group(1)
        trailing = line[start_match.end():]  # preserve everything after the marker
        # replacement = f'bq query --use_legacy_sql=false <<{start_match.group(1)}{trailing}'
        replacement = (
            f"bq query --use_legacy_sql=false --project_id=\"$BQ_PROJECT_ID\" \\\n"
            f"    --label=run_id:${{run_id:-null}} \\\n"
            f"    --label=instance_name:${{instance_name:-null}} \\\n"
            f"    --label=job_id:${{job_id:-null}} \\\n"
            f"    --label=task_id:${{task_id:-null}} \\\n"
            f"    --label=task_type:${{task_type:-null}} <<{start_match.group(1)}{trailing}"
        )
        return replacement
    return line

def uncomment_and_clean_files(output_folder_path):
    file_list = glob.glob(os.path.join(output_folder_path, "**/*"), recursive=True)
    count = 1
    for file_name in track(file_list, "[cyan]Applying Uncomment Utility..."):
        if os.path.isfile(file_name):
            print(count, " File : " + os.path.basename(file_name))
            count = count + 1
            try:
                is_sql = 0
                with open(file_name, 'rb') as f:
                    result = chardet.detect(f.read())
                    r = result['encoding']
                with open(file_name, 'r', encoding=r) as f:
                    file_lines = f.readlines()
                with open(file_name, 'w', encoding=r) as file_for_conversion:
                    for file_line in file_lines:
                        text = replace_heredoc_blocks_uncomment(file_line)
                        if len(text.strip()) == 0 and text == "\n":
                            file_for_conversion.write(text)
                            continue
                        if re.search(r"#!/usr/bin/ksh", text, flags=re.I):
                            content = re.sub(r"#!/usr/bin/ksh", r"#!/usr/bin/ksh ", text, flags=re.I)
                        if "bq query --" in text:
                            file_for_conversion.write(text)
                            continue
                        file_line = text.lstrip()
                        if re.search(
                                r"^RENAME[\s]+TABLE\t|^RENAME[\s]+TABLE\n|^RENAME[\s]+TABLE[\s]+|^DROP\t|^DROP\n|^DROP[\s]+|^MERGE\t|^MERGE\n|^MERGE[\s]+|^SELECT\t|^SELECT\n|^SELECT[\s]+|^ALTER\t|^ALTER\n|^ALTER[\s]+|^INSERT\t|^INSERT\n|^INSERT[\s]+|^DELETE[\s]+\n|^DELETE\n|^DELETE[\s]+FROM\t|^DELETE[\s]+FROM\n|^DELETE[\s]+FROM[\s]+|^DELETE[\s]+[\s]+FROM\t|^DELETE[\s]+[\s]+FROM\n|^DELETE[\s]+[\s]+FROM[\s]+|^INS\t|^INS[\s]+|^INS\n|^CREATE\t|^CREATE\n|^CREATE[\s]+|^UPDATE\t|^UPDATE\n|^UPDATE[\s]+|^UPD\t|^UPD\n|^UPD[\s]+|^SEL\t|^SEL\n|^SEL[\s]+|^DEL[\s]+FROM\t|^DEL[\s]+FROM\n|^DEL[\s]+FROM|^DELETE[\s]+|^DEL[\s]+|^TRUNCATE|^CT",
                                file_line.upper(), flags=re.I):
                            file_for_conversion.write(file_line)
                            is_sql = 1
                            find_semi = re.findall(r"\;\"?[\s]*$", file_line)
                            if find_semi:
                                is_sql = 0
                        else:
                            if is_sql == 1:
                                file_for_conversion.write(file_line)
                                find_semi = re.findall(r"\;\"?[\s]*$", file_line)
                                if find_semi:
                                    is_sql = 0
                            else:
                                find_word = re.findall(r'[\S]', file_line)
                                if find_word:
                                    if file_line.startswith('/*') | file_line.startswith('*/'):
                                        file_for_conversion.write(file_line)
                                    else:
                                        fileLine_updated = re.sub(r"--PSOCOMMENT--", "", file_line, flags=re.M)
                                        # content = re.sub(r'^\s*collect\s+(summary|stat)(.*)$',
                                        #                  lambda match: f"-- {match.group(0)}", fileLine_updated,
                                        #                  flags=re.M | re.I)
                                        content = re.sub(r'(?i)^\s*SPG(.*)$', lambda match: f"-- {match.group(0)}",
                                                         fileLine_updated, flags=re.M | re.I)
                                        content = re.sub(r" 0:00:00'", "'", content, flags=re.I)
                                        content = content.replace("\r\n", "\n")
                                        fileLine_updated = re.sub(r"^\s*--", "#--", content)
                                        file_for_conversion.write(fileLine_updated)
                                is_sql = 0
            except Exception as e:
                print("Error in uncomment_and_clean_files")
                print(file_name, e)

def beautify_all_shell_files(folder_path):
    # Processes and beautifies every file in a folder, auto-detecting file encoding.
    if not os.path.isdir(folder_path):
        print(f"Error: Folder not found at '{folder_path}'")
        return

    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        if os.path.isfile(file_path):
            try:
                # Read file in binary to detect its encoding
                with open(file_path, 'rb') as f:
                    raw_data = f.read()
                    result = chardet.detect(raw_data)
                    file_encoding = result['encoding']

                # Decode the content, beautify it, and write it back
                original_code = raw_data.decode(file_encoding)
                beautified_result, error = Beautify().beautify_string(original_code)

                if not error:
                    with open(file_path, 'w', encoding=file_encoding) as f:
                        f.write(str(beautified_result))
                    print(f"Beautified: {filename} (Encoding: {file_encoding})")
                else:
                    print(f"Error beautifying {filename}: {error}")

            except Exception as e:
                print(f"Could not process {filename}: {e}")

def process_shell_export_statements(content):
    # Standardizes the value of shell export statements within a string.
    # It lowercases the value and ensures '${BOX}' is uppercase, iterating backwards for safe replacement.
    export_re = re.compile(r"^(?:--PSOCOMMENT--\s*)?[ \t]*export\s+[^\s]+=(?P<value>\w*\$\{BOX\}\w*|\w+)\s", flags=re.I|re.MULTILINE)
    
    matches = list(re.finditer(export_re, content))
    
    for match in reversed(matches):
        original_match = match.group(0)
        original_value = match.group('value')
        
        value = original_value.lower().replace('${box}', '${BOX}')
        
        modified_match = original_match.replace(original_value, value)
        
        content = content[:match.start()] + modified_match + content[match.end():]
            
    return content

if __name__=="__main__":
    input_folder = r"C:\Users\badipr5\Documents\mahesh R\all_ksh_client_data_\INF_Test_data\Translated"

    # Anand Team CHanges
    intermediate_folder = f"{input_folder}_intermediate_test"
    base_path = os.path.dirname(os.path.abspath(__file__))
    log_file_path = os.path.join(base_path, 'replaced_log_new.csv')

    process_directory(input_folder, intermediate_folder)
    write_log(log_file_path)

    output_dir = f"{input_folder}_final_post_8_july"
    process_sql_files(intermediate_folder, output_dir)
    add_begin_end_transection_in_code(output_dir)
    print("\nProcessing: process_logon_function_for_return0")
    process_logon_function_for_return0(output_dir)
    print("\nProcessing: clean_content")
    clean_content(output_dir)

    print("\nRemoving: intermediate_folder")
    # removing intermidiate folder and its all  data
    shutil.rmtree(intermediate_folder)

    # Run the uncommenting and cleaning utility on the output
    uncomment_and_clean_files(output_dir)
    beautify_all_shell_files(output_dir)
