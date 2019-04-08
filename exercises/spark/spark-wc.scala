val conf = new SparkConf()
             .setMaster(spark://bigdatalite.localdomain:7077)
             .setAppName("HOL_Scala")
             .set("spark.cores.max", "5")
val sc = new SparkContext(conf)

val files = sc.textFile("hdfs://bigdatalite:8020/user/oracle/wordcount/input")
val counts = files.flatMap(line => line.split(" ")) .map(word => (word, 1)) .reduceByKey(_ + _)
counts.saveAsTextFile("hdfs://bigdatalite:8020/user/oracle/wordcount/sp-out") 
counts.collect().foreach(println)

