#!/bin/sh

sqlplus sys/welcome1@orcl as sysdba<<EOF
set linesize 100
SELECT * FROM BDA.EXTERNAL_NOSQL;
exit;

EOF
