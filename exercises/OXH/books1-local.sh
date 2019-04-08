rm -rf books1
hadoop jar $OXH_HOME/lib/oxh.jar -jt local -fs local ./books1a.xq -print -output ./books1

rm -rf books2
hadoop jar $OXH_HOME/lib/oxh.jar -jt local -fs local ./books1b.xq -print -output ./books2

