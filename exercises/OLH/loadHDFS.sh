#!/bin/sh

hadoop fs -rm -r /user/oracle/output3

hadoop jar $OLH_HOME/jlib/oraloader.jar oracle.hadoop.loader.OraLoader -conf hdfsConfig.xml
