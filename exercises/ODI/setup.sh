#!/bin/sh


hive << EOF

drop table consolidated_buffer;

create table consolidated_buffer (customer_id string, credit_card_limits int, credit_balance int, n_mortgages bigint, mortgage_amount double);

exit;	
EOF

