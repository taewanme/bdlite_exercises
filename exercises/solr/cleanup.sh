export HDFS_TMP=/user/oracle/oxh_temp

solrctl collection --delete collection1
solrctl collection --list
solrctl instancedir --delete collection1
solrctl instancedir --list
hadoop fs -rm -r $HDFS_TMP

rm -rf solr_configs/

