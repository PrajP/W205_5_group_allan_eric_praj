#!/bin/bash
LOGFILE=$1
/usr/local/bin/python2.7 sentimentAnalysis.py > $LOGFILE 2>&1;