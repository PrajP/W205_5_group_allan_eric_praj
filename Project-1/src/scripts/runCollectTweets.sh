#!/bin/bash
outputDIR=/data/rawdata
mkdir -p $outputDIR/apple
mkdir -p $outputDIR/google
mkdir -p $outputDIR/samsung
/usr/local/bin/python2.7 collectTweets.py -d $outputDIR/apple -q apple iphone -o apple >> $outputDIR/getTweet.log 2>&1;
/usr/local/bin/python2.7 collectTweets.py -d $outputDIR/google -q google pixelphone pixel android -o google >> $outputDIR/getTweet.log 2>&1;
/usr/local/bin/python2.7 collectTweets.py -d $outputDIR/samsung -q samsung galaxy S7 -o samsung >> $outputDIR/getTweet.log 2>&1;