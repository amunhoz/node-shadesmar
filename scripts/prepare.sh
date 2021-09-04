SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

cd $DIR/../src/packages
wget https://github.com/kerukuro/digestpp/archive/master.zip
unzip master.zip
mv digestpp-master digestpp
rm master.zip
