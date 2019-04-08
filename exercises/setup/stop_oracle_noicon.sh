#!/bin/bash
echo "$(date) : Stopping TNSLISTENER"
lsnrctl stop

echo "$(date) : Stopping Oracle Database 12c"
sqlplus / as sysdba <<ENDOFSQL
shutdown immediate
exit
ENDOFSQL

