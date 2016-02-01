#!/bin/bash
# First parameter, input file
# Second parameter, output file
# Third parameter, section to match
# Fourth parameter, beginning of string to match
# Fifth parameter, full line to replace

if [ "$#" -ne 5 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

match_section=0
end_read=0
line_number=1

while IFS='' read -r line || [[ -n "$line" ]] && [[ end_read -eq 0 ]]; do
	#remove both leading and trailing spaces
	line_no_whitespace="$(echo -e "${line}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

	# If you find the section
	if [[ match_section -eq 0 ]]; then
		if [ "$line_no_whitespace" == "$3" ]; then
			match_section=1	
		fi
	fi

	# If you are in the appropiate section already
	if [[ end_read -eq 0 ]]; then
		if [[ match_section -eq 1 ]]; then
			if [[ $line_no_whitespace =~ ^$4 ]]; then
				# Using # instead of / to escape " in the parameters
				sed "$line_number"s#.*#"$5"# $1 > $2				
			fi
		fi
	fi

	# Add 1 to the line number
	((line_number=line_number+1))
		
done < "$1"
