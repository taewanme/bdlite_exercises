#!/bin/sh

java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host `hostname` << EOF

ddl add-schema -file trans.avsc

EOF
echo "Done adding transactions schema"
