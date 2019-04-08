#!/bin/sh

javac externaltables/MyFormatter.java
jar -cf externaltables.jar externaltables/*.class

java -classpath $KVHOME/lib/*:/home/oracle/exercises/noSQL/externaltables:$ORACLE_HOME/jdbc/lib/ojdbc6.jar oracle.kv.exttab.Publish -config external_noSQL_config.xml -publish
