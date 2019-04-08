hadoop fs -rm crm_data.csv
hadoop fs -rm -r nosql.j-out

hadoop fs -put crm_data.csv

unset HADOOP_CLASSPATH

hadoop jar $OXH_HOME/lib/oxh.jar -files "crm_data.csv" -D oracle.xml.xquery.rewriting.level=FINEST -D oracle.kv.hosts=localhost:5000 -D oracle.kv.kvstore=kvstore ./nosql-join.xq -print -output ./nosql.j-out

