#!/bin/sh

hadoop fs -rm -r /user/oracle/output3

sqlplus bda/welcome1@orcl <<EOF

DROP TABLE LOADER_NOSQL;
exit;

EOF
