#!/bin/sh


sqlplus bda/welcome1@orcl <<EOF

CREATE TABLE LOADER_NOSQL 
(customer_id VARCHAR2(30),
 n_trans_teller NUMBER,
 n_trans_kiosk NUMBER,
 n_trans_atm NUMBER,
 n_trans_web_bank number,
 money_montly_overdrawn NUMBER);
exit;

EOF
