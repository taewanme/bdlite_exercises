#!/bin/bash

hadoop jar $OXH_HOME/lib/oxh.jar ./books1a.xq -print -output ./books1

hadoop jar $OXH_HOME/lib/oxh.jar ./books1b.xq -print -output ./books2

hadoop jar $OXH_HOME/lib/oxh.jar ./books2.xq -print -output ./books3

sqlplus /nolog << SQL
@books3olh
connect BDA/welcome1@orcl

select count(*) from books;
truncate table books;
select count(*) from books;
exit;

SQL

hadoop jar $OXH_HOME/lib/oxh.jar ./books3.xq -output ./books4

# hive serde

./hive_oxh.sh -f books-create.hql

./hive_oxh.sh -f books-hive.hql

# no sql parts

hadoop jar $OXH_HOME/lib/oxh.jar -D oracle.kv.hosts=localhost:5000 -D oracle.kv.kvstore=kvstore ./nosql-custsums.xq -print -output ./nosqlcs-out

hadoop fs -put crm_data.csv

hadoop jar $OXH_HOME/lib/oxh.jar -files "crm_data.csv" -D oracle.xml.xquery.rewriting.level=FINEST -D oracle.kv.hosts=localhost:5000 -D oracle.kv.kvstore=kvstore ./nosql-join.xq -print -output ./nosql.j-out

hadoop jar $OXH_HOME/lib/oxh.jar -D oracle.kv.hosts=localhost:5000 -D oracle.kv.kvstore=kvstore ./nosql-sums.xq -print -output ./nosqls-out

