import os, re, shutil, glob, chardet
from rich.progress import track
from pathlib import Path # <--- IMPORT ADDED HERE

InputFolderPath=Path(r"C:\Users\badipr5\Documents\mahesh R\all_ksh_client_data_\final_post_process_20_June\input")
# source_type="BTEQ"
source_type="KSH"
OutputFolderPath = Path("01_PRE_DONE_INF_KSH")

def uncomment_multiline_comments(text):
    pattern = re.compile(r'/\*([\s\S]*?)\*/', re.DOTALL)
    def replacer(match):
        return match.group(1)
    uncommented_text = re.sub(pattern, replacer, text)
    return uncommented_text
def comment_insert_statements(sql_text,table_n):
    modified_sql_text=sql_text
    for x in table_n:
        pattern = r"(?s)INSERT\s+(INTO)?\s+[\<\$\{]*\w+[\}\>]*\."+re.escape(x)+".*?;"
        modified_sql_text = re.sub(pattern, lambda m: f"/* {uncomment_multiline_comments(m.group(0))} */", modified_sql_text, flags=re.I)
    return modified_sql_text

try:
    if os.path.isdir(OutputFolderPath):
        shutil.rmtree(OutputFolderPath)
    shutil.copytree(InputFolderPath,OutputFolderPath)
except Exception as e:
    print(e)
    pass

FileList = glob.glob(str(OutputFolderPath)+"**/*",recursive=True) # Converted Path to string for glob compatibility if needed
table_n=["table_load_status","zzz_load_audit_history"]
count =1
for fileName in track(FileList, "[cyan]Applying Utility..."):
    if os.path.isfile(fileName):
        print(count," File : "+os.path.basename(fileName))
        count = count+1
        try:
            IS_SQL=0
            with open(fileName, 'rb') as f:
                    result = chardet.detect(f.read())
                    r = result['encoding']
            with open(fileName,'r',encoding=r) as f:
                fileLines = f.readlines()
                with open(fileName,'w',encoding=r) as fileForConversion:
                    for fileLine in fileLines:
                        if len(fileLine.strip())==0:
                            fileForConversion.write(fileLine)
                            continue
                        fileLine=fileLine.lstrip()
                        if re.search(r"^RENAME[\s]+TABLE\t|^RENAME[\s]+TABLE\n|^RENAME[\s]+TABLE[\s]+|^DROP\t|^DROP\n|^DROP[\s]+|^MERGE\t|^MERGE\n|^MERGE[\s]+|^SELECT\t|^SELECT\n|^SELECT[\s]+|^ALTER\t|^ALTER\n|^ALTER[\s]+|^INSERT\t|^INSERT\n|^INSERT[\s]+|^DELETE[\s]+\n|^DELETE\n|^DELETE[\s]+FROM\t|^DELETE[\s]+FROM\n|^DELETE[\s]+FROM[\s]+|^DELETE[\s]+[\s]+FROM\t|^DELETE[\s]+[\s]+FROM\n|^DELETE[\s]+[\s]+FROM[\s]+|^INS\t|^INS[\s]+|^INS\n|^CREATE\t|^CREATE\n|^CREATE[\s]+|^UPDATE\t|^UPDATE\n|^UPDATE[\s]+|^UPD\t|^UPD\n|^UPD[\s]+|^SEL\t|^SEL\n|^SEL[\s]+|^DEL[\s]+FROM\t|^DEL[\s]+FROM\n|^DEL[\s]+FROM|^DELETE[\s]+|^DEL[\s]+|^TRUNCATE|^CT[\s]+",fileLine.upper(),flags=re.I):
                            fileForConversion.write(fileLine)
                            IS_SQL=1
                            find_semi=re.findall(r"\;[\s]*$",fileLine)
                            if find_semi:
                                IS_SQL=0
                        else:
                            if IS_SQL==1:
                                fileForConversion.write(fileLine)
                                find_semi=re.findall(r"\;[\s]*$",fileLine) 
                                if find_semi:
                                    IS_SQL=0
                            else:
                                if fileLine=="\n":
                                    fileForConversion.write(fileLine)
                                    continue
                                find_word=re.findall(r'[\S]',fileLine)
                                if find_word:
                                    if fileLine.startswith('/*') | fileLine.startswith('*/'):
                                        fileForConversion.write(fileLine)
                                    else:
                                        if re.search(r'^\-\-\%',fileLine):
                                            fileForConversion.write(fileLine)
                                        else:
                                            if source_type=="KSH":
                                                #adding code here
                                                # srch=re.search(r"(\s*\.\s*EXPORT)|(\s*\.\s*IF\s*ACTIVITYCOUNT)", fileLine,re.IGNORECASE)
                                                srch=re.search(r"(^\s*\.\s*EXPORT)|(^\s*\.\s*IF\s*ACTIVITYCOUNT)|(^\s*\.\s*SET)|(^\s*\.\s*QUIT)|(^\s*\.\s*FORMAT)|(^\s*\.\s*WIDTH)|(^\s*\.\s*LOGOFF)|(^\s*\.\s*LABEL)|(^\s*\.\s*LOGOFF)|(^\s*\.\s*LOGON)|(^\s*\.\s*REMARK)|(^\s*\.\s*RUN\s*FILE)|(^\s*\.\s*IF\s*ERRORCODE)", fileLine,re.IGNORECASE)
                                                pat=r"(\s*-\s*-)|(\s*/\s*\*)|(\s*\*\s*/)"
                                                if not srch:
                                                    match=re.match(pat,fileLine)
                                                    if not match:
                                                        fileForConversion.write('--PSOCOMMENT--'+fileLine)
                                                    else:
                                                        fileForConversion.write(fileLine)
                                                else:
                                                    fileForConversion.write(fileLine)
                                            else:
                                                srch=re.search(r"\s*\.\s*IF\s*ACTIVITYCOUNT", fileLine,re.IGNORECASE)
                                                pat=r"(\s*-\s*-)|(\s*/\s*\*)|(\s*\*\s*/)"
                                                if not srch:
                                                    match=re.match(pat,fileLine)
                                                    if not match:
                                                        fileForConversion.write('--PSOCOMMENT--'+fileLine)
                                                    else:
                                                        fileForConversion.write(fileLine)
                                                else:
                                                    fileForConversion.write(fileLine)
                                            
                                IS_SQL=0
                    fileForConversion.close()  
            #commenting insert statement
            with open(fileName,'r',encoding=r) as f:
                sql_text=f.read()
            sql_text=comment_insert_statements(sql_text,table_n)
            with open(fileName,'w',encoding=r) as f:
                f.write(sql_text)

            # --- NEW CODE ADDED TO COMMENT OUT .LOGON LINES ---
            # This block runs after all previous processing is complete for the file.
            with open(fileName, 'r', encoding=r) as f:
                lines = f.readlines() # Read all lines from the processed file

            # Re-write the file, adding '--' to lines containing .LOGON
            with open(fileName, 'w', encoding=r) as f:
                for line in lines:
                    # Check if '.LOGON' is in the line (case-insensitive)
                    if '.LOGON' in line.upper():
                        # If found, prepend '--' to the line
                        f.write('--' + line)
                    else:
                        # Otherwise, write the line as is
                        f.write(line)
            # --- END OF ADDED CODE ---
                                                           
        except Exception as e:
            print("Error in comment_ksh_part")
            print(fileName,e)







##################################################################################################


# def copy_sql_nonsql_files(input_path, output_path1, output_path2):
#     with_sql=[]
#     without_sql=[]

#     for file in os.listdir(input_path):
#         status=[0]
#         path=os.path.join(input_path,file)
#         with open(path, "r", encoding="MacRoman") as f:
#             data=f.readlines()
#         for line in data:
#             fnd=re.match(r"\s*-\s*-", line)
#             if not fnd:
#                 if len(line.strip())>0:
#                     status[0]=1
#                     with_sql.append(file)
#         if status[0]==0:
#             without_sql.append(file)
#     for x in with_sql:
#         path=os.path.join(input_path,x)
#         if os.path.exists(path):
#             shutil.copy(path,output_path1)
#     for x1 in without_sql:
#         path=os.path.join(input_path,x1)
#         if os.path.exists(path):
#             shutil.copy(path,output_path2)
