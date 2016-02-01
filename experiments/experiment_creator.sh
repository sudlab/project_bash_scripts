#!/bin/bash
###################################################################################################
# !!!! Consider sections of the ini file which need to be changed for each experiment
###################################################################################################


if [ "$#" -ne 7 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

# First parameter, section to match
# Second parameter, beginning of string to match not altered
# Third parameter, end of string to match not altered
# Forth parameter, min value
# Fifth parameter, max value
# Sixth parameter, Interval, eg.1 (4,5,6...)
# Seventh parameter, out parent directory (not full path)

echo "Assuming test environment with all data and conf files in /fastdata/mbp15ja/capturec-pilot/test except pipeline.ini to be replaced"

# Default directories
DIR_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_SCRIPT=${DIR_SCRIPT}/
BASE_DATA_DIR="/fastdata/mbp15ja/capturec-pilot/"
BASE_DATABASE_DIR="/shared/sudlab1/General/projects/capturec/"

# Remove parent and child directories for data and database
rm -rf "${BASE_DATA_DIR}${7}"
rm -rf "${BASE_DATABASE_DIR}${7}"

mkdir -p "${BASE_DATA_DIR}${7}"
mkdir -p "${BASE_DATABASE_DIR}${7}"

# Create the script file to run reports
touch "${BASE_DATA_DIR}${7}/reports_script.sh"

for i in $(eval "seq $4 $6 $5"); do	
	
	# Create the replacing string 
	string_replace=$2$i$3
	
	# Create child directory, one per parameter variation for data
	mkdir -p "${BASE_DATA_DIR}${7}"/"${i}"

	# Copy test environment
	cp -d "${BASE_DATA_DIR}"test/* "$BASE_DATA_DIR${7}"/"${i}"	

	# Modify the parameter
	bash ${DIR_SCRIPT}ini_modifier.sh "$BASE_DATA_DIR${7}"/"${i}"/pipeline.ini "$BASE_DATA_DIR${7}"/"${i}"/temp_file"$i".ini "$1" "$2" "$string_replace"

	# Create child directory, one per parameter variation for database
	mkdir -p "${BASE_DATABASE_DIR}${7}"/"${i}"

	# Database string to replace
	database_string="name=${BASE_DATABASE_DIR}$7"/"$i"/db.csvdb

	# Point the database parameter in the ini file to the new database directory section [database]
	bash ${DIR_SCRIPT}ini_modifier.sh "$BASE_DATA_DIR${7}"/"${i}"/temp_file"$i".ini "$BASE_DATA_DIR${7}"/"${i}"/temp_file_second"${i}".ini "[database]" "name=" $database_string

	# Remove temp_file
	rm -f "$BASE_DATA_DIR${7}"/"${i}"/temp_file"$i".ini

	# Database string to replace for [report] section
	database_string="sql_backend=sqlite:///"${BASE_DATABASE_DIR}$7"/"$i"/db.csvdb"

	# Point the database parameter in the ini file to the new database directory section [report]
	bash ${DIR_SCRIPT}ini_modifier.sh "$BASE_DATA_DIR${7}"/"${i}"/temp_file_second"${i}".ini "$BASE_DATA_DIR${7}"/"${i}"/temp_file"$i".ini "[report]" "sql_backend=" $database_string
	
	# Replace ini file
	mv -f "$BASE_DATA_DIR${7}"/"${i}"/temp_file"$i".ini "$BASE_DATA_DIR${7}"/"${i}"/pipeline.ini
	
	# Remove temp_file
	rm -f "$BASE_DATA_DIR${7}"/"${i}"/temp_file_second"${i}".ini

	cd "${BASE_DATA_DIR}${7}"/"${i}"
	
	bash /home/mbp15ja/environment/sh/submit_pipeline /home/mbp15ja/dev/CGATPipelines/CGATPipelines/pipeline_mapping.py make full -v7 -p8

	# Create file inside data directory to execute reports all temporal files when running the pipelines
	echo "cd ${BASE_DATA_DIR}${7}/${i}
/home/mbp15ja/environment/sh/submit_pipeline ~/dev/CGATPipelines/CGATPipelines/pipeline_mapping.py make build_report -d -v7" >> "${BASE_DATA_DIR}${7}/reports_script.sh"
	
done


echo "Script file created to run reports on ${BASE_DATA_DIR}${7}/reports_script.sh"

