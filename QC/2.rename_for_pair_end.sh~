if [ "$#" -gt 1 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

# If none parameter is given, execute the renaming on the default directory (/fastdata/mbp15ja/capturec-pilot/test), otherwise use provided directory
if [ $# -eq 0 ]
	then
		ls /fastdata/mbp15ja/capturec-pilot/test/IGF00038* | sed 's/\(.*\)-read\(.\)\(.*\)/mv & \1.fastq.\2.gz/' | sh
	else
		directory=$1
		file_regex=$directory"/IGF00038*" 
		ls $file_regex | sed 's/\(.*\)-read\(.\)\(.*\)/mv & \1.fastq.\2.gz/' | sh

fi
