#!/bin/sh

hadoop fs -rm -r insur_cust_ltv_sample

sqlplus bda/welcome1@orcl <<EOF
DROP TABLE INSUR_CUST_LTV_SAMPLE;
exit;

EOF

rm *.pdf
