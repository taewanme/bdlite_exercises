#!/bin/bash
rm -rf books1

rm -rf books2

hadoop fs -rm -r books1 books2

hadoop fs -rm -r books3

sqlplus /nolog << SQL
connect BDA/welcome1@orcl

drop table books;
exit;

SQL

hadoop fs -rm -r books4

# hive serde

./hive_oxh.sh -f books-drop.hql

# nosql 

hadoop fs -rm -r nosqlcs-out

hadoop fs -rm crm_data.csv
hadoop fs -rm -r nosql.j-out

hadoop fs -rm -r nosqls-out


