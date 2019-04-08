#!/bin/sh

. oraenv <<EOF
orcl
EOF


sqlplus bda/welcome1 <<EOF

drop table EXTERNAL_NOSQL;

EOF
