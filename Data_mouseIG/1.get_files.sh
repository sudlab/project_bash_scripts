#!/bin/bash
echo "Uses xargs for data download"
echo "Renames file to pair end format"

mkdir -p /mnt/fastdata/mbp15ja/mouse_capturec/Data

echo "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891332/SRR891332_1.fastq.gz
ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891332/SRR891332_2.fastq.gz
ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891333/SRR891333_1.fastq.gz
ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891333/SRR891333_2.fastq.gz
ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891334/SRR891334_1.fastq.gz
ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891334/SRR891334_2.fastq.gz
ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891335/SRR891335_1.fastq.gz
ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR891/SRR891335/SRR891335_2.fastq.gz" > /mnt/fastdata/mbp15ja/mouse_capturec/data_files.txt

cd /mnt/fastdata/mbp15ja/mouse_capturec/Data

# -n 1 will make xargs run command (wget) with only one argument at the time
# -P 10 will create 10 parallel processes
# wget -c option to resume the download
cat /mnt/fastdata/mbp15ja/mouse_capturec/data_files.txt | xargs -n 1 -P 10 wget -c

mkdir -p /mnt/fastdata/mbp15ja/mouse_capturec/Capture_Probes
cd /mnt/fastdata/mbp15ja/mouse_capturec/Capture_Probes

wget -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE47nnn/GSE47758/suppl/GSE47758_Captured_Regions%2B500bp.bed.gz

# Remove the file created with the urls
rm /mnt/fastdata/mbp15ja/mouse_capturec/data_files.txt

# Rename them for pair end
ls /mnt/fastdata/mbp15ja/mouse_capturec/Data/* | sed 's/\(.*\)_\(.\)\(.*\)/mv & \1.fastq.\2.gz/' | sh





