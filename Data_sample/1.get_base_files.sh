#!/bin/bash
# Create a random sample with sample size specified as first parameter
# Eg. 0.5 = 50% sample size

if [ "$#" -ne 1 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

echo "Assuming base data files are in /fastdata/mbp15ja/capturec-pilot/data"
echo "Pair end reads or reads which come in pairs need to be in the format *read1* *read2*"

# Create an empty directory
mkdir -p /fastdata/mbp15ja/capturec-pilot/data_sample 2>/dev/null
rm /fastdata/mbp15ja/capturec-pilot/data_sample/* 2>/dev/null
rm -rf /fastdata/mbp15ja/capturec-pilot/data_sample/* 2>/dev/null

# Create a random sample with the sample size specified for each file in data directory
FILES=/fastdata/mbp15ja/capturec-pilot/data/*
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
		
		$(eval "python ~/dev/cgat/scripts/fastq2fastq.py --stdin=$f1 --method=sample --sample-size $1 --seed=1234 --log=/fastdata/mbp15ja/capturec-pilot/data_sample/Sample-$log_filename.log --pair-fastq-file $f2 -F --output-filename-pattern /fastdata/mbp15ja/capturec-pilot/data_sample/Sample-$outnamebasef2 -v 7 -S /fastdata/mbp15ja/capturec-pilot/data_sample/Sample-$outnamebasef1")

	fi
done


echo "Data placed in /fastdata/mbp15ja/capturec-pilot/data_sample"



