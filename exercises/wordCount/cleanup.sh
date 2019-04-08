#!/bin/sh

hadoop fs -rm -r /user/oracle/wordcount
hadoop fs -mkdir /user/oracle/wordcount/input

rm WordCount.jar
rm -rf wordcount_classes

mkdir wordcount_classes
