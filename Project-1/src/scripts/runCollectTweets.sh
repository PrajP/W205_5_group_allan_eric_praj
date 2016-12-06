#!/bin/bash
outputDIR=/data/rawdata/
/usr/local/bin/python2.7 collectTweets.py -d $outputDIR -q apple iphone -o apple >> $outputDIR/getTweet.log 2>&1;
/usr/local/bin/python2.7 collectTweets.py -d $outputDIR -q google pixelphone pixel android -o google >> $outputDIR/getTweet.log 2>&1;
/usr/local/bin/python2.7 collectTweets.py -d $outputDIR -q samsung galaxy S7 -o samsung >> $outputDIR/getTweet.log 2>&1;