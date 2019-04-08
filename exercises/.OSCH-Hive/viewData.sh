#!/bin/sh

. oraenv <<EOF
orcl
EOF

sqlplus BDA/welcome1 <<EOF
set linesize 100
column customer_id format A15
select * from BDA.ODI_HIVE;
exit;
EOF
