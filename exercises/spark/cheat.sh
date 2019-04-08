MYTTY=`stty -g`
hadoop fs -rm -r wordcount/sp-out
hadoop fs -rm -r wordcount/pysp-out
spark-shell < spark-wc.scala 
# pyspark spark-wc.py

stty $MYTTY

