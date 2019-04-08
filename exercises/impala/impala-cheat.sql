create table imp_credit_department (CUSTOMER_ID string,CREDIT_CARD_LIMITS int, CREDIT_BALANCE int) 
ROW FORMAT delimited 
fields terminated by ',';

create table imp_mortgages_department (CUSTOMER_ID string,MORTGAGE_SUM float) 
ROW FORMAT delimited 
fields terminated by ',';

show tables;

load data inpath '/user/oracle/export_credit_department.csv' into table imp_credit_department;

load data inpath '/user/oracle/export_mortgages_department.csv' into table imp_mortgages_department;

select * from imp_credit_department limit 5; 

select customer_id, count(*), sum(mortgage_sum) from imp_mortgages_department group by customer_id;

create table imp_mortgages_department_agg as select customer_id, count(*) as n_mortgages, sum(mortgage_sum) as mortgage_amount from imp_mortgages_department group by customer_id;

create view v_imp_consolidated_credit_products as select hcd.customer_id, hcd.credit_card_limits, hcd.credit_balance, hmda.n_mortgages, hmda.mortgage_amount from imp_mortgages_department_agg hmda join imp_credit_department hcd on hcd.customer_id = hmda.customer_id;

desc v_imp_consolidated_credit_products;

select * from v_imp_consolidated_credit_products;

exit;	

