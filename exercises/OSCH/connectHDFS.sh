#!/bin/sh

hadoop jar $OSCH_HOME/jlib/orahdfs.jar oracle.hadoop.exttab.ExternalTable -conf hdfs_config.xml  -createTable 

