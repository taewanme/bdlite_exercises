#!/bin/sh

hadoop fs -copyFromLocal export_monthly_cash_accounts.csv
pig << EOF
monthly_cash_accounts = load 'export_monthly_cash_accounts.csv' using PigStorage(',') as (customer_id,checking_amount,bank_funds,monthly_checks_written,t_amount_autom_payments);
dump monthly_cash_accounts;
grouped= group monthly_cash_accounts by customer_id;
dump grouped;
average= foreach grouped generate group, AVG(monthly_cash_accounts.checking_amount), AVG(monthly_cash_accounts.bank_funds), AVG(monthly_cash_accounts.monthly_checks_written), AVG(monthly_cash_accounts.t_amount_autom_payments);
dump average;
sorted = order average by \$1 DESC;
dump sorted;
store sorted into 'customer_averages' using PigStorage(',');
quit;

EOF

hadoop fs -cat /user/oracle/customer_averages/part-r-00000 | head
