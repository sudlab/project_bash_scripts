#!/bin/bash
# Create a random sample with sample size specified as first parameter
# Eg. 0.5 = 50% sample size

# First parameter, sample size (maintain this for backwards compatibility)
# Second paramter, input files directory
# Third parameter, output files directory

if [ "$#" -lt 1 ]; then
  echo "Wrong number of parameters, at least one parameter needs to be specified"
  exit 1
fi

if [ "$#" -gt 1 ]; then
	if [ "$#" -ne 3 ]; then
 		echo "Wrong number of parameters, if more than one parameter is specified, 3 should be specified"
  		exit 1
	
	# 3 arguments
	else
		SAMPLE_SIZE=$1
		INPUT_DIR=$2
		OUTPUT_DIR=$3
	fi
# 1 argument, fill up the other with default values
else
	SAMPLE_SIZE=$1
	INPUT_DIR="/fastdata/mbp15ja/capturec-pilot/data"
	OUTPUT_DIR="/fastdata/mbp15ja/capturec-pilot/data_sample"
fi

echo "If no parameter for input files is given, assuming base data files are in /fastdata/mbp15ja/capturec-pilot/data"
echo "If no parameter for output files is given, assuming output files are stored in /fastdata/mbp15ja/capturec-pilot/data_sample"
echo "Pair end reads or reads which come in pairs need to be in the format *read1* *read2*"

# Create an empty directory
mkdir -p "${OUTPUT_DIR}" 2>/dev/null
rm "${OUTPUT_DIR}"/* 2>/dev/null
rm -rf "${OUTPUT_DIR}"/* 2>/dev/null

# Create a random sample with the sample size specified for each file in data directory
FILES="${INPUT_DIR}"/*
for f in $FILES
do

	# For the *read1* file execute the paired sample
	if [[ $f == *"read1"* ]]; then
		f1=$f

		# Replace "read1" for "read2"
		f2="${f1/read1/read2}"

		# Get only the name without path
		outnamebasef1=$(basename "$f1")
		outnamebasef2="${outnamebasef1/read1/read2}"

		# Filename for log (both reads)
		log_filename="${outnamebasef1/read1/reads}"
		
		$(eval "python ~/dev/cgat/scripts/fastq2fastq.py --stdin=$f1 --method=sample --sample-size $1 --seed=1234 --log=${OUTPUT_DIR}/Sample-$log_filename.log --pair-fastq-file $f2 -F --output-filename-pattern ${OUTPUT_DIR}/Sample-$outnamebasef2 -v 7 -S ${OUTPUT_DIR}/Sample-$outnamebasef1")

	fi
done


echo "Data taken from ${INPUT_DIR} placed in ${OUTPUT_DIR}"



