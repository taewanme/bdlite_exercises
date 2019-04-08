#!/bin/sh

echo "Starting NoSQL Database"
java -jar $KVHOME/lib/kvstore.jar kvlite &
sleep 10
echo "Database Start"
