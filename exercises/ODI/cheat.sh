#!/bin/sh

hive << EOF

drop table consolidated_buffer;

create table consolidated_buffer as select distinct customer_id, credit_card_limits, credit_balance, n_mortgages, mortgage_amount from consolidated_credit_products where mortgage_amount >= 0;

exit;	
EOF

