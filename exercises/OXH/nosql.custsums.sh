hadoop fs -rm -r nosqlcs-out

unset HADOOP_CLASSPATH

hadoop jar $OXH_HOME/lib/oxh.jar -D oracle.kv.hosts=localhost:5000 -D oracle.kv.kvstore=kvstore ./nosql-custsums.xq -print -output ./nosqlcs-out

