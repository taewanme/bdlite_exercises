#!/bin/sh

hadoop fs -cat customer_averages/part-r-00000
hadoop jar $OSCH_HOME/jlib/orahdfs.jar oracle.hadoop.exttab.ExternalTable -conf hdfs_config.xml -createTable 
./viewData.sh
