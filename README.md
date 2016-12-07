#W205 Final Project

#Step-by-step instructions on how to run this application

PREREQUISTES:

1. Set up Twitter application and obtain access token and keys
2. Launch an AWS instance (m3.large tested)
	AMI Name: UCB MIDS W205 EX2-FULL 
	AMI ID: ami-d4dd4ec3

#Mount the EBS volume

	mount -t ext4 /dev/xvdf /data
	
#Clone the github repository

	cd /data
	git init
	git clone https://github.com/PrajP/W205_5_group_allan_eric_praj.git
	chmod -R 755 /data/W205_5_group_allan_eric_praj
	

#Install the required packages and MongoDB as root

	cd /data/W205_5_group_allan_eric_praj/Project-1/src/setup
	bash setup.sh

#Collect tweets for all three brands (Apple, Google, Samsung)

	cd /data/W205_5_group_allan_eric_praj/Project-1/src/scripts
	bash runCollectTweets.sh

	#check /data/rawdata/getTweet.log for tweet collection logging; tweets are downloaded to /data/rawdata/(apple/google/samsung)
	
#Apply filter and merge all tweets in one directory

	cd /data/W205_5_group_allan_eric_praj/Project-1/src/scripts
	bash mergeJson.sh /data/rawdata/apple phone
	bash mergeJson.sh /data/rawdata/google phone
	bash mergeJson.sh /data/rawdata/samsung phone
	
	#produces *merged.json in each folder

#Data Loading in MongoDB

	cd /data/W205_5_group_allan_eric_praj/Project-1/src/scripts
	bash mongodb_load.sh

#Data Retrieval and Sentiment Analysis

	mkdir /data/analysis_output
	chmod -R 777 /data/analysis_output
	cd /data/W205_5_group_allan_eric_praj/Project-1/src/scripts
	python2.7 sentimentAnalysis.py > /data/analysis_output/analysis.log 2>&1;
	
#Data Loading in Hive (as root)

	cp /data/W205_5_group_allan_eric_praj/Project-1/data/analysis_output/*.tsv /data/analysis_output
	su - w205
	cd /data/W205_5_group_allan_eric_praj/Project-1/src/scripts
	bash analytics_dataload.sh