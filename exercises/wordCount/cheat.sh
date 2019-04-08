#!/bin/sh

javac -cp /usr/lib/hadoop/*:/usr/lib/hadoop/client-0.20/* -d wordcount_classes WordCount.java
jar -cvf WordCount.jar -C wordcount_classes/ .
cat file01 file02
hadoop fs -mkdir -p /user/oracle/wordcount/input
hadoop fs -copyFromLocal file01 /user/oracle/wordcount/input/file01
hadoop fs -copyFromLocal file02 /user/oracle/wordcount/input/file02
hadoop jar WordCount.jar WordCount /user/oracle/wordcount/input /user/oracle/wordcount/output
hadoop fs -cat /user/oracle/wordcount/output/part-r-00000
hadoop fs -rm -r /user/oracle/wordcount/output
