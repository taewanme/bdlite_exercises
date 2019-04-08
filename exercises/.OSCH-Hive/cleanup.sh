#!/bin/sh

. oraenv << EOF
orcl
EOF

sqlplus BDA/welcome1 <<EOF
drop table BDA.ODI_HIVE;
exit;
EOF
