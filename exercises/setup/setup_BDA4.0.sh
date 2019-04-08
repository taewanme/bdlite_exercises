#!/bin/bash

if [ $USER = 'oracle' ]
then 
  echo User oracle confirmed
else 
  echo setup user check failed
  exit
fi

if [ `pwd` = '/home/oracle/exercises/setup' ]
then 
  echo setup path confirmed
else 
  echo setup path check failed
  exit
fi

if [ -d $KVHOME ]
then 
  echo KV noSQL path confirmed
else 
  echo KV noSQL path check failed
  exit
fi

if [ -d $OLH_HOME ]
then 
  echo OLH path confirmed
else 
  echo OLH path check failed
  exit
fi

if [ -d $OSCH_HOME ]
then 
  echo OSCH path confirmed
else 
  echo OSCH path check failed
  exit
fi


if [ -d $OXH_HOME ]
then 
  echo OXH path confirmed
else 
  echo OXH path check failed
  exit
fi


if [ -d $ORACLE_HOME ]
then 
  echo ORACLE_HOME path confirmed
else 
  echo ORACLE_HOME path check failed
  exit
fi

if [ -d $R_HOME ]
then 
  echo R path confirmed
else 
  echo R path check failed
  exit
fi


sh ~/exercises/setup/set_perms.sh

if [ -e /opt/bin/services ]
then 
  cd ~/exercises/setup
  cp HOLStart.desktop /home/oracle/Desktop/.
  cp StartHOL.desktop /home/oracle/Desktop/.
  cp ~/exercises/setup/stop_oracle_noicon.sh /home/oracle/scripts/stop_oracle.sh
  cp ~/exercises/setup/start_oracle.sh /home/oracle/scripts/start_oracle.sh
  /home/oracle/scripts/stop_oracle.sh
  /home/oracle/scripts/start_oracle.sh
  sqlplus /nolog @setup
else 

cp ~/exercises/setup/stop_oracle_noicon.sh /home/oracle/scripts/stop_oracle.sh
cp ~/exercises/setup/StartHOL.desktop /home/oracle/Desktop/.

  /home/oracle/scripts/stop_oracle.sh
  /home/oracle/scripts/start_oracle.sh

  cd /home/oracle/exercises/setup 
  cp HOLStart.desktop /home/oracle/Desktop/.
  sqlplus /nolog @setup
fi

cd $KVHOME
cd ../

ln -s $KVHOME kv-ee

cd ~/exercises/solr

rm exampledocs

SOLR_DOC=`ls -d /usr/share/doc/solr*/example/exampledocs`

ln -s $SOLR_DOC

cd ~/exercises/OXH
hadoop fs -put books.xml .

cd

