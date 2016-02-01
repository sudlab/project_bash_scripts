if [ "$#" -ne 1 ]; then
  echo "Wrong number of parameters"
  exit 1
fi

find $1 -type f ! -name "*.gz" ! -name "*.ini" ! -name "*.py" ! -name "*.sh" -delete
find $1 -type d -delete
