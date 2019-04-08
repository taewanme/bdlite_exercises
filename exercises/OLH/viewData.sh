#!/bin/sh

sqlplus BDA/welcome1@orcl <<EOF
set linesize 100
select * from BDA.LOADER_NOSQL;
exit;
EOF
