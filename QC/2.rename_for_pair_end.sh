ls /fastdata/mbp15ja/capturec-pilot/test/IGF00038* | sed 's/\(.*\)-read\(.\)\(.*\)/mv & \1.fastq.\2.gz/' | sh
