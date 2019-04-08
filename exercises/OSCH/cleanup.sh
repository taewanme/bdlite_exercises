#!/bin/sh

sqlplus BDA/welcome1@orcl <<EOF
drop table BDA.EXTERNAL_HDFS;
exit;
EOF
