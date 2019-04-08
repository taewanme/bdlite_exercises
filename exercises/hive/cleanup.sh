#!/bin/sh
hadoop fs -rm /user/oracle/export_credit_department
hadoop fs -rm /user/oracle/export_mortgages_department
hive << EOF
DROP TABLE credit_department;
DROP TABLE mortgages_department;
DROP TABLE mortgages_department_agg;
DROP TABLE consolidated_credit_products;
DROP view v_consolidated_credit_products;
exit;
EOF

rm derby.log
rm -rf TempStatsStore

echo "DONE"
