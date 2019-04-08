import sys
from operator import add
from pyspark import SparkContext

sc = SparkContext("spark://bigdatalite.localdomain:7077", "HOL_PythonWordCount")

files = sc.textFile("hdfs://bigdatalite.localdomain:8020/user/oracle/wordcount/input")
words = files.flatMap(lambda x: x.split())
wordcounts = words.map(lambda x: (x, 1)).reduceByKey(lambda x,y:x+y).map(lambda x:(x[1],x[0])).sortByKey(False)
wordcounts.saveAsTextFile("hdfs://bigdatalite.localdomain:8020/user/oracle/wordcount/pysp-out")
output = wordcounts.collect()
for (count, word) in output:
        print "%s: %i" % (word, count)

exit()

