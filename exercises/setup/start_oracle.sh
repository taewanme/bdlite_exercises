#!/bin/bash

if [ ! -f /home/oracle/Desktop/StopDB.desktop ]; 
then

# first things first .. we need to shut down the nosqldb .. 
/opt/bin/nosqldb stop

# and then switch to our noSQL 
# rm /u01/nosql/kv-ee
# ln -s /home/oracle/exercises/kv-ee /u01/nosql/kv-ee

echo "$(date) : Starting TNSLISTENER"
lsnrctl start

echo "$(date) : Starting Oracle Database 12c"
sqlplus / as sysdba <<ENDOFSQL
startup
exit
ENDOFSQL

sudo service impala-server start
sudo service impala-catalog start
sudo service impala-state-store start
sudo service solr-server start
# sudo service spark-master start
# sudo service spark-worker start


cp /home/oracle/exercises/setup/StopHOL.desktop /home/oracle/Desktop/.

fi
