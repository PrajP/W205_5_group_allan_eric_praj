#!/bin/bash

# Create directory in HDFS and put files into hdfs

echo 'Removing files temporary files.'

rm -r /data/analysis_output/apple_result_temp.tsv
rm -r /data/analysis_output/google_result_temp.tsv
rm -r /data/analysis_output/samsung_result_temp.tsv

sleep 5

echo 'Temporary files removed..'
echo 'Remove hive table location files.'


hadoop fs -rm /user/w205/product_analytics_files/*.tsv

sleep 5

echo 'Removed hive table location files..'

echo 'Copy clean analysis files after removing headers to as temporary files.'

tail -n +2 /data/analysis_output/apple_result.tsv > /data/analysis_output/apple_result_temp.tsv
tail -n +2 /data/analysis_output/google_result.tsv > /data/analysis_output/google_result_temp.tsv
tail -n +2 /data/analysis_output/samsung_result.tsv > /data/analysis_output/samsung_result_temp.tsv

sleep 5

echo 'Temporary files created.'

echo 'Remove hadoop files before load.'

hdfs dfs -rm /user/w205/analysis_data/apple/apple_result.tsv
hdfs dfs -rm /user/w205/analysis_data/samsung/samsung_result.tsv
hdfs dfs -rm /user/w205/analysis_data/google/google_result.tsv

sleep 5

echo 'Hadoop files removed.'

echo 'Copy clean analysis files to hdfs.'

hdfs dfs -put /data/analysis_output/apple_result_temp.tsv /user/w205/analysis_data/apple/apple_result.tsv
hdfs dfs -put /data/analysis_output/samsung_result_temp.tsv /user/w205/analysis_data/samsung/samsung_result.tsv
hdfs dfs -put /data/analysis_output/google_result_temp.tsv /user/w205/analysis_data/google/google_result.tsv

sleep 5

echo 'Files moved to final destination.'

cd /data/project/

echo $(pwd)

hive -f $(pwd)/analytics_ddl.sql

