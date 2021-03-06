#!/bin/sh

echo "HOME: $HOME"
cd $HOME 



current_dir=$(pwd)
echo "pwd:"$current_dir

#dir1=$'data/w205_test_1/W205_5_test_1/Project-1'
dir1=$'data/W205_5_group_allan_eric_praj/Project-1'

echo "dir1 :"$dir1

NOW=$(date +"%Y-%m-%d")
echo $NOW
LOGFILE="log-$NOW.log"

#cd /data/W205_5_group_allan_eric_praj/Project-1/data/
cd /$dir1/data/

echo $(pwd)

#chmod 777 /$dir1/data/rawdata/
#chmod 777 /$dir1/src/scripts/
#chmod 777 /$dir1/data/analysis_output/


cd /$dir1/src/scripts/

echo "current directory: "$(pwd)


echo 'Sleeping 10 seconds'
#sleep 10

echo 'Importing files one by one'

string1=twitter_
string2=_db
string3=_collection

for json in $(cat file_list.txt); do
  product=$(echo $json| cut -d"_" -f 1)
  echo "Product Name : "$product
  echo "Start loading file:$json" 


  #mongoimport --db $string1$product$string2 --collection $string1$product$string3 --type json --file /$dir1/data/rawdata/$product/$json
  mongoimport --db $string1$product$string2 --collection $string1$product$string3 --drop --type json --file /data/w205_test_1/W205_5_test_1/Project-1/data/rawdata/$product/$json
  echo $string1$product$string2
  echo $string1$product$string3
  echo 'Sleeping 10 seconds.'
  #sleep 10
  echo "$json loaded."

done


