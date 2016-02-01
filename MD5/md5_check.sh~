if [ "$#" -ne 1 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

find $1 -type f ! -name "*.chk" -exec md5sum "{}" + > $1/checklist.chk

md5sum -c $1/checklist.chk

rm $1/checklist.chk


