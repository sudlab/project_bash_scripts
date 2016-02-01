#!/bin/bash
# First parameter, which directory contains the .BAM and .BAI files

# Number of parameters has to be at least one 
if [[ "$#" -ne 1 ]]; then
  echo "Wrong number of parameters:"
  echo "First parameter: which directory contains the .BAM and .BAI files"
  exit 1
fi

# Default directories
DIR_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_SCRIPT=${DIR_SCRIPT}/
DATA_DIR="/fastdata/mbp15ja/capturec-pilot/test"

# Execute create test environment taking into account where the files should be copied
cd $DIR_SCRIPT

bash ../Create_test/1.create_test_env.sh
	
# Create config files
cd $DATA_DIR
python ~/dev/Capture_C/Capture_C/pipeline_caputrec.py config > /dev/null

# Overwrite the files with the ones in the directory except for the script files
FILES=${DIR_SCRIPT}*
for f in $FILES
do
	# If the file is not a script file, copy it
	if [[ $f != *".sh" ]]; then
		if [[ $f != *".sh~" ]]; then
			# Overwrite the file
			cp -f $f $DATA_DIR
		fi
	fi
done

# Execute script to link annotation files
bash ${DIR_SCRIPT}2.link_annotations.sh $1

# Delete the data fastq softlinks (not required in CaptureC)
cd $DATA_DIR
rm *fastq.gz

echo "change directories for database in pipeline.ini [database] [report] Same for all!!"
echo "cd $DATA_DIR"
echo "python /home/mbp15ja/dev/Capture_C/Capture_C/pipeline_caputrec.py make full -v7 -p8"
