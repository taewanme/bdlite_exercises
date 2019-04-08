#!/bin/sh
#
# Copyright (c) 2013, Oracle and/or its affiliates. All rights reserved.
#

export ZKHOSTS=bigdatalite.localdomain:2181/solr
export ZKQUORUM=bigdatalite.localdomain:2181
export COLLECTION=collection1
export HDFS_DATA=/user/oracle/insur_cust_ltv_sample
export HDFS_TMP=/user/oracle/oxh_temp

./cleanup.sh


solrctl instancedir --generate solr_configs
solrctl instancedir --create collection1 solr_configs
solrctl collection --create collection1 -s 1

hadoop jar $OXH_HOME/lib/oxh.jar \
  -Dzkhosts=$ZKHOSTS -Dzkquorum=$ZKQUORUM -Dcollection=$COLLECTION \
  -Dhdfs_data=$HDFS_DATA -Dhdfs_tmp=$HDFS_TMP \
  -conf ./oxh_solr.xml oxh_solr.xq -clean -output $HDFS_TMP/oxh_solr


