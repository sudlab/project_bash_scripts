#!/bin/bash
###################################################################################################
# !!!! Consider sections of the ini file which need to be changed for each experiment
###################################################################################################

# Create a unique timestamp for tmp dir
current_time=$(date "+%Y%m%d%H%M%S%N")

if [ "$#" -ne 8 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

# First parameter, base constant data dir (files which don't change from run to run and will be copied to each run)
# Second parameter, min value
# Third parameter, max value
# Forth parameter, Interval, eg.1 (4,5,6...)
# Fifth parameter, Data files directory for sampling
# Sixth parameter, Out directory, subdirectories for each experiment will be created here
# Seventh parameter, Pipeline to run
# Eigth parameter, Number of processors to use with the pipeline


echo "Assuming base data files are in /fastdata/mbp15ja/capturec-pilot/data"
echo "Pair end reads or reads which come in pairs need to be in the format *read1* *read2*"
echo "Minimum, maximum and interval need to be specified as a total of 100. Eg. 0.5 = 50"

# Default directories
DIR_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_SCRIPT=${DIR_SCRIPT}/
TEMP_DIR="$6"/"${current_time}"

# Remove directories for data
rm -rf "${6}"


mkdir -p "${6}"


for i in $(eval "seq $2 $4 $3"); do

	echo "Beginning run ${i} of ${3}"

	# Create the temporal directories
	mkdir -p "${TEMP_DIR}"
	mkdir -p "${TEMP_DIR}"/links
	
	
	# Create child directory, one per parameter variation for data
	mkdir -p "${6}"/"${i}"
	
	# Copy constant files within experiments
	cp -rd --preserve=all "${1}"/* "${6}"/"${i}"


	# Create the sample specified in /fastdata/mbp15ja/capturec-pilot/data_sample, bash can't handle floats
	division_string="scale=4; ${i} / 100"
	fraction=$(echo "${division_string}" | bc)

	# Create symbolic links from the data files to temporal dir links
	bash /home/mbp15ja/project_sh/Data/2.create_soft_links.sh "${5}" "${TEMP_DIR}"/links

	# Copy the data symlinks to temp_dir
	cp -d "${TEMP_DIR}"/links "${TEMP_DIR}"
	
	# Rename the data for pair end
	bash /home/mbp15ja/project_sh/QC/2.rename_for_pair_end.sh "${TEMP_DIR}"

	echo "Check rename for pair end"
	ls -l "${TEMP_DIR}"

	# Sample from the renamed files directory to the directory of the experiment
	bash /home/mbp15ja/project_sh/Data_sample/1.get_base_files.sh "${fraction}" "${TEMP_DIR}" "${6}"/"${i}"
	
	# Copy sample files to the experiment dir
	cp -rd --preserve=all "${DATA_SAMPLE_DIR}"/* "${6}"/"${i}"

	# Change to data directory
	cd "${6}"/"${i}"

	echo "Run ${i} of ${3} done"

	echo "bash /home/mbp15ja/environment/sh/submit_pipeline" "$7" "make full -v7 -p""$8"	

	#bash /home/mbp15ja/environment/sh/submit_pipeline "$7" make full -v7 -p"$8"

done
