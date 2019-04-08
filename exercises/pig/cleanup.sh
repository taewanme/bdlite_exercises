#!/bin/sh

hadoop fs -rm -r -f customer_averages
hadoop fs -rm export_monthly_cash_accounts.csv
rm *.log
