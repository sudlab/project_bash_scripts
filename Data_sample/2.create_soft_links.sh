# Create softlinks in /mnt/fastdata/mbp15ja/capturec-pilot/data_sample_softlinks

# Default directories
DIR_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_SCRIPT=${DIR_SCRIPT}/

# Execute Mapping one
cd $DIR_SCRIPT
bash ../Data/2.create_soft_links.sh /mnt/fastdata/mbp15ja/capturec-pilot/data_sample /mnt/fastdata/mbp15ja/capturec-pilot/data_sample_softlinks

