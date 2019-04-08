#!/bin/sh

head export_credit_department.csv
head export_mortgages_department.csv 
hadoop fs -copyFromLocal export_credit_department.csv /user/oracle/export_credit_department
hadoop fs -copyFromLocal export_mortgages_department.csv /user/oracle/export_mortgages_department

hive << EOF

create table credit_department (CUSTOMER_ID string,CREDIT_CARD_LIMITS int, CREDIT_BALANCE int) 
ROW FORMAT delimited 
fields terminated by ',';

create table mortgages_department (CUSTOMER_ID string,MORTGAGE_SUM float) 
ROW FORMAT delimited 
fields terminated by ',';

show tables;

load data inpath '/user/oracle/export_credit_department' into table credit_department;

load data inpath '/user/oracle/export_mortgages_department' into table mortgages_department;

select * from credit_department limit 5; 

select customer_id, count(*), sum(mortgage_sum) from mortgages_department group by customer_id;

create table mortgages_department_agg as select customer_id, count(*) as n_mortgages, sum(mortgage_sum) as mortgage_amount from mortgages_department group by customer_id;

create table consolidated_credit_products as select hcd.customer_id, hcd.credit_card_limits, hcd.credit_balance, hmda.n_mortgages, hmda.mortgage_amount from mortgages_department_agg hmda join credit_department hcd on hcd.customer_id = hmda.customer_id;

desc consolidated_credit_products;

select * from consolidated_credit_products;

create view v_consolidated_credit_products as select hcd.customer_id, hcd.credit_card_limits, hcd.credit_balance, hmda.n_mortgages, hmda.mortgage_amount from mortgages_department_agg hmda join credit_department hcd on hcd.customer_id = hmda.customer_id;

desc v_consolidated_credit_products;

select * from v_consolidated_credit_products;

exit;	
EOF
