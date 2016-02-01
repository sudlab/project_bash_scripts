#!/bin/bash
# First parameter, specify which directory contains the .BAM and .BAI files
# Second parameter, specify to which directory to link the files, if empty, assume /fastdata/mbp15ja/capturec-pilot/test

if [ "$#" -gt 2 ]; then
  echo "Wrong number of parameters:" 
  echo "First parameter, specify which directory contains the .BAM and .BAI files"
  echo "Second parameter, specify to which directory to link the files, if empty, assume /fastdata/mbp15ja/capturec-pilot/test"
  exit 1
fi

# Get the file dir
FILE_DIR=$1

# Change directory to target directory (no second input parameter copies to /fastdata/mbp15ja/capturec-pilot/test)
if [ $# -eq 1 ]
	then
		cd /fastdata/mbp15ja/capturec-pilot/test
	else
		cd $2
fi

# Check if the specified dir ends with / if not add it
if [[ "$FILE_DIR" != */ ]]; then
	FILE_DIR=${FILE_DIR}/	    
fi

# To search we need the FILE_DIR string to not end with /
# Find hidden and non-hidden files in the directory (no sub directories) 
search_res="$(find ${FILE_DIR} -maxdepth 1 -type f -name '*.bam*')"

# if variable is unset or set to empty string -> The directory indicated doesn't have the annotation files
# look into the subdirectory bwa.dir
if [ -z "$search_res" ]; then
	FILE_DIR=${FILE_DIR}bwa.dir/
	search_res="$(find ${FILE_DIR} -maxdepth 1 -type f -name '*.bam*')"

	# If not found there report and exit
	if [ -z "$search_res" ]; then 
		echo "Error: Files not found in specified directory or bwa.dir subdirectory"
  		exit 1
	fi
fi

echo "Linking annotations (Mapping) from $FILE_DIR"

# Obtain all the .BAM or .BAI files
FILES=${FILE_DIR}*
for f in $FILES
do
	# If the file is not a script file, copy it
	if [[ $f == *".bam" || $f == *".bam.bai" ]]; then
		# link file
		ln -s $f
	fi
done

