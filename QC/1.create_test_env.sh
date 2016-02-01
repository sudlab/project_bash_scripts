#!/bin/bash
# First parameter, specify which soft link files to copy to test directory

if [ "$#" -gt 1 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

# Default directories
DIR_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_SCRIPT=${DIR_SCRIPT}/
DATA_DIR="/fastdata/mbp15ja/capturec-pilot/test"

# Execute create_test_env
cd $DIR_SCRIPT
bash ../Create_test/1.create_test_env.sh $1

# Create config files
cd $DATA_DIR
python ~/dev/CGATPipelines/CGATPipelines/pipeline_readqc.py config > /dev/null

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

echo "change directories for database in pipeline.ini [general] [database] [readqc] Same for all!!"
echo "cd $DATA_DIR"
echo "python /home/mbp15ja/dev/CGATPipelines/CGATPipelines/pipeline_readqc.py make full -v7 -p8"
