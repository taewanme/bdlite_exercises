#!/bin/sh

hadoop fs -put export_* . 
hadoop fs -chmod 777 /user/oracle
hadoop fs -chmod 666  export_*

impala-shell -f impala-cheat.sql

hadoop fs -chmod 755 /user/oracle

