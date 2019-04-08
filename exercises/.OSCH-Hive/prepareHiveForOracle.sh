#!/bin/sh

. oraenv <<EOF
orcl
EOF

sqlplus BDA/welcome1 <<EOF
set linesize 100
column customer_id format A15
create table BDA.ODI_HIVE_TEMP as select * from BDA.ODI_HIVE;
update BDA.ODI_HIVE_TEMP set n_mortgages = 0 where mortgage_amount = 0;
delete from BDA.ODI_HIVE_TEMP where mortgage_amount < 0;
commit;
drop table BDA.ODI_HIVE;
rename ODI_HIVE_TEMP to ODI_HIVE;
select * from BDA.ODI_HIVE;
exit;
EOF




