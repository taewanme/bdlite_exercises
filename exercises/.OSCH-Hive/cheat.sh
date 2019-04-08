#!/bin/sh

hadoop jar $OSCH_HOME/jlib/orahdfs.jar oracle.hadoop.exttab.ExternalTable -conf hive_config.xml  -createTable 
#./viewData.sh
./prepareHiveForOracle.sh
