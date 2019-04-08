drop table cust_transactions;

drop table crm_data;

drop table cust_trans_agg;

drop table cust_chkg;

create table cust_transactions (CUSTOMER_ID string,N_TRANS_TELLER int,N_TRANS_KIOSK int,N_TRANS_ATM int,N_TRANS_WEB_BANK int,MONEY_MONTLY_OVERDRAWN double)
ROW FORMAT delimited 
fields terminated by ',';

create table crm_data (CUSTOMER_ID string, LASTNAME string, FIRSTNAME string, STATE string, REGION string, SEX string, PROFESSION string, BUY_INSURANCE string, AGE int, HAS_CHILDREN int, SALARY bigint, N_OF_DEPENDENTS int, CAR_OWNERSHIP int, HOUSE_OWNERSHIP int, TIME_AS_CUSTOMER int, MARITAL_STATUS string, LTV double, LTV_BIN string)
ROW FORMAT delimited 
fields terminated by ',';


load data inpath '/user/oracle/crm.csv' into table crm_data;

load data inpath '/user/oracle/trans.csv' into table cust_transactions;

create table cust_trans_agg as select customer_id, sum(n_trans_teller) n_trans_teller, sum(n_trans_kiosk) n_trans_kiosk, sum(n_trans_atm) n_trans_atm, sum(n_trans_web_bank) n_trans_web_bank, sum(money_montly_overdrawn) money_monthly_overdrawn
from cust_transactions
group by customer_id;

create external table cust_chkg (CUSTOMER_ID string, CHECKING_AMOUNT double, BANK_FUNDS double, MONTHLY_CHECKS_WRITTEN double, AMOUNT_AUTOM_PAYMENTS double)
ROW FORMAT delimited
fields terminated by ','
STORED AS TEXTFILE
LOCATION '/user/oracle/customer_averages/';

exit;

