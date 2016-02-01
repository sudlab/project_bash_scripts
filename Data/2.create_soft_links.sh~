#!/bin/bash
# First parameter, specify which data files to link to directory (empty copies /mnt/fastdata/mbp15ja/capturec-pilot/data/*)
# Second parameter, specify which directory to copy to (empty copies to /mnt/fastdata/mbp15ja/capturec-pilot/data_softlinks/*)



if [[ "$#" -ne 2 ]] && [[ "$#" -ne 0 ]]; then
		echo "Wrong number of parameters, specify either 0 parameters o 2 parameters"
		echo "specify which data files to link to directory (empty copies /mnt/fastdata/mbp15ja/capturec-pilot/data/*)"
		echo "Second parameter, specify which directory under /mnt/fastdata/mbp15ja/ to copy to (empty is like specifying \"capturec-pilot\" and copies to /mnt/fastdata/mbp15ja/capturec-pilot/data_softlinks/*)"
		exit 1
	
fi

# If two parameters passed then obtain non-default directories
if [[ "$#" -eq 2 ]]; then
		FILES=$1
		DIRECTORY=$2

	else
		# Assign default values for CaptureC IG experiment
		FILES=/mnt/fastdata/mbp15ja/capturec-pilot/data/*
		DIRECTORY=/mnt/fastdata/mbp15ja/capturec-pilot/data_softlinks
		
fi


# Make sure FILES ends in /* and DIRECTORY without /

# Does not finish in /*
if [[ "${FILES: -2}" != "/*" ]];
	then
		# Doesn't finish in /
		if [[ "${FILES: -1}" != "/" ]]; 
			then
				FILES="${FILES}"/*
		
		# Doesn't finish in /* but finishes in /
		else
			FILES="${FILES}"*
		
		fi


fi


if [[ "${DIRECTORY: -1}" == "/" ]];
	then
		DIR_len=${#DIRECTORY}
		DIRECTORY="${DIRECTORY: 0: ($DIR_len-1)}"		
fi
	

# Create softlinks
rm -f "${DIRECTORY}"/* 2>/dev/null
rm -rf "${DIRECTORY}"/* 2>/dev/null
mkdir -p "${DIRECTORY}" 2>/dev/null


cd $DIRECTORY

for f in $FILES
do
	# If the file is not a log file
	if [[ $f != *".log" ]]; then
		ln -s $f 
	fi
done


if [[ "$#" -eq 0 ]]; then
	# If the default Capture C IG Human is used (empty parameters)
	# Rename softlinks substituting IGF0003828-MERGE-R1_read1.fastq.gz -> IGF0003828-read1.fastq.gz
	# For more friendly names in reports
	cd ${DIRECTORY}
	ls ${DIRECTORY}/IGF00038* | sed 's/\(.*\)MERGE-R1_\(.\)\(.*\)/mv & \1\2\3/' | sh
fi

