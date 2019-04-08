#!/bin/sh

sqlplus /nolog <<SQL

connect bda/welcome1@orcl

drop table odi_hive;
drop table custlog;

SQL

hadoop fs -rm -r /user/oracle/custlog
