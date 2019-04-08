#!/bin/sh

sqlplus /nolog <<SQL

connect bda/welcome1@orcl

select * from odi_hive;

SQL

