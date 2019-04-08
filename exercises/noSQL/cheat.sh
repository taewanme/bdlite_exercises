#!/bin/sh

java -jar $KVHOME/lib/kvstore.jar kvlite &
sleep 10
java -jar $KVHOME/lib/kvstore.jar ping -port 5000 -host `hostname`

javac Hello.java
java Hello

javac Keys.java
java Keys

./createTable.sh

javac externaltables/MyFormatter.java
jar -cf externaltables.jar externaltables/*.class

java -classpath $KVHOME/lib/*:/home/oracle/exercises/noSQL/externaltables:$ORACLE_HOME/jdbc/lib/ojdbc6.jar oracle.kv.exttab.Publish -config external_noSQL_config.xml -publish

./viewData.sh

java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host `hostname` << EOF
ddl add-schema -file trans.avsc
exit
EOF

javac NoSQLTransactions.java
java NoSQLTransactions

mkdir kv_classes
javac -d kv_classes Hadoop.java

jar -cvf CustomerCount.jar -C kv_classes/ .

hadoop jar CustomerCount.jar Hadoop -libjars $KVHOME/lib/kvclient.jar loader

hadoop fs -cat loader/part-r-00000
