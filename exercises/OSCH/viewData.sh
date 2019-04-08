#!/bin/sh

sqlplus BDA/welcome1@orcl <<EOF
set linesize 100
column customer_id format A15
column checking_amount format A15
column bank_funds format A15
column monthly_checks_written format A15
column amount_autom_payments format A15
select * from BDA.EXTERNAL_HDFS;
exit;
EOF
