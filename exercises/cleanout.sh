#!/bin/sh

~/exercises/setup/stop_oracle.sh
~/exercises/setup/start_oracle.sh


cd wordCount
sh ./cleanup.sh
cd ../noSQL
sh ./cleanup.sh
cd ../pig
sh ./cleanup.sh
cd ../hive
sh ./cleanup.sh
cd ../impala
sh ./cleanup.sh
cd ../OLH
sh ./cleanup.sh
cd ../OSCH
sh ./cleanup.sh
cd ../BigSQL
sh ./cleanup.sh
cd ../ODI
sh ./cleanup.sh
cd ../OXH
sh ./cleanup.sh
cd ../solr
sh ./cleanup.sh
cd ../spark
sh ./cleanup.sh

cd

~/exercises/setup/stop_oracle.sh


