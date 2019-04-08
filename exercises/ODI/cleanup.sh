#!/bin/sh

rm -f *.log
rm -rf TempStatsStore

hive << EOF

drop table consolidated_buffer;

drop table e_consolidated_buffer;
exit;	
EOF

echo "Dont forget to delete the interfaces created in ODI"














