hadoop fs -rm -r books1 books2

hadoop jar $OXH_HOME/lib/oxh.jar ./books1a.xq -print -output ./books1

hadoop jar $OXH_HOME/lib/oxh.jar ./books1b.xq -print -output ./books2

