#!/bin/bash

if [ -e /opt/bin/services ]
then 
  /home/oracle/scripts/start_oracle.sh

  cd ../
  ./cleanout.sh
  
else 
  /home/oracle/scripts/stop_oracle.sh
  /home/oracle/scripts/start_oracle.sh

  cd ../
  ./cleanout.sh

  cd ~/scripts
  mv start_oracle.old.sh start_oracle.sh

  rm ~/scripts/stop_oracle.sh .
  rm ~/scripts/StopDB.desktop .
  rm /home/oracle/Desktop/HOLStart.desktop
  rm /home/oracle/Desktop/StopDB.desktop
fi

cd /home/oracle/exercises/setup 
/home/oracle/scripts/start_oracle.sh
sqlplus /nolog @deinstall

cd $KVHOME
cd ../

rm kv-ee

cd ~/exercises/solr

rm exampledocs

hadoop fs -rm books.xml

cd

