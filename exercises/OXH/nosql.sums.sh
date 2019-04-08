unset HADOOP_CLASSPATH

hadoop fs -rm -r nosqls-out

hadoop jar $OXH_HOME/lib/oxh.jar -D oracle.kv.hosts=localhost:5000 -D oracle.kv.kvstore=kvstore ./nosql-sums.xq -print -output ./nosqls-out

