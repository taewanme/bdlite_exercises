#!/bin/sh

hadoop fs -ls custlog

sqlplus /nolog <<SQL

connect bda/welcome1@orcl

-- Query the table using new JSON syntax
SELECT m.click.custid, m.click.transid, m.click.typeid, m.click.time
FROM custlog m;

select count(*) from custlog;

SQL

# lets add some data ... 

hadoop fs -put data2.json custlog/.
hadoop fs -ls custlog

sqlplus /nolog <<SQL

connect bda/welcome1@orcl

-- Query the table using new JSON syntax
SELECT m.click.custid, m.click.transid, m.click.typeid, m.click.time
FROM custlog m;

select count(*) from custlog;

SQL
