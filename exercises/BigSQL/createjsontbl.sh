#!/bin/sh

hadoop fs -mkdir custlog
hadoop fs -put data1.json custlog/.


sqlplus /nolog <<SQL
connect bda/welcome1@orcl

CREATE TABLE custlog
  (click VARCHAR2(4000))
  ORGANIZATION EXTERNAL
  (TYPE ORACLE_HDFS
   DEFAULT DIRECTORY DEFAULT_DIR
   LOCATION ('/user/oracle/custlog/*')
  ) 
  REJECT LIMIT UNLIMITED;

select * from custlog;

SQL
