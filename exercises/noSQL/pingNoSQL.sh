#!/bin/sh

java -jar $KVHOME/lib/kvstore.jar ping -port 5000 -host `hostname`
