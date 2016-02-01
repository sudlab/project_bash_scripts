# Extract files to /fastdata/mbp15ja/capturec-pilot/data
mkdir -p /fastdata/mbp15ja/capturec-pilot/data 2>/dev/null
rm /fastdata/mbp15ja/capturec-pilot/data/* 2>/dev/null
rm -rf /fastdata/mbp15ja/capturec-pilot/data/* 2>/dev/null
tar -C /fastdata/mbp15ja/capturec-pilot/data -xvf /shared/sudlab1/General/projects/capturec/data/2015-05-21.tar.gz

# Move files and md5
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003828/150521_M03291_0003_000000000-AF4HL_ACAGTG_L001_R1_001.fastq.gz.md5 /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003828-MERGE-R1_read1.fastq.gz.md5
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003828/150521_M03291_0003_000000000-AF4HL_ACAGTG_L001_R2_001.fastq.gz.md5 /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003828-MERGE-R1_read2.fastq.gz.md5
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003829/150521_M03291_0003_000000000-AF4HL_GCCAAT_L001_R1_001.fastq.gz.md5 /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003829-MERGE-R1_read1.fastq.gz.md5
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003829/150521_M03291_0003_000000000-AF4HL_GCCAAT_L001_R2_001.fastq.gz.md5 /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003829-MERGE-R1_read2.fastq.gz.md5
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003830/150521_M03291_0003_000000000-AF4HL_ATGTCA_L001_R1_001.fastq.gz.md5 /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003830-MERGE-R1_read1.fastq.gz.md5
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003830/150521_M03291_0003_000000000-AF4HL_ATGTCA_L001_R2_001.fastq.gz.md5 /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003830-MERGE-R1_read2.fastq.gz.md5

mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003828/150521_M03291_0003_000000000-AF4HL_ACAGTG_L001_R1_001.fastq.gz /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003828-MERGE-R1_read1.fastq.gz
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003828/150521_M03291_0003_000000000-AF4HL_ACAGTG_L001_R2_001.fastq.gz /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003828-MERGE-R1_read2.fastq.gz
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003829/150521_M03291_0003_000000000-AF4HL_GCCAAT_L001_R1_001.fastq.gz /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003829-MERGE-R1_read1.fastq.gz
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003829/150521_M03291_0003_000000000-AF4HL_GCCAAT_L001_R2_001.fastq.gz /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003829-MERGE-R1_read2.fastq.gz
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003830/150521_M03291_0003_000000000-AF4HL_ATGTCA_L001_R1_001.fastq.gz /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003830-MERGE-R1_read1.fastq.gz
mv /mnt/fastdata/mbp15ja/capturec-pilot/data/2015-05-21/IGF0003830/150521_M03291_0003_000000000-AF4HL_ATGTCA_L001_R2_001.fastq.gz /mnt/fastdata/mbp15ja/capturec-pilot/data/IGF0003830-MERGE-R1_read2.fastq.gz

# Check MD5
cd /mnt/fastdata/mbp15ja/capturec-pilot/data/
md5sum -c *.md5

rm -rf /fastdata/mbp15ja/capturec-pilot/data/2015-05-21

# Remove MD5 files
rm /mnt/fastdata/mbp15ja/capturec-pilot/data/*.md5

