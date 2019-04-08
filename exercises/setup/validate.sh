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
  echo R path confirmed
else 
  echo R path check failed
  exit
fi

if [ -d $R_HOME ]
then 
  echo R path confirmed
else 
  echo R path check failed
  exit
fi
