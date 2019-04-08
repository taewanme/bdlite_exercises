import org.apache.avro.generic.IndexedRecord;
import org.apache.hadoop.io.*;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

import java.io.IOException;
import java.lang.InterruptedException;

import oracle.kv.hadoop.KVAvroInputFormat;
import oracle.kv.Key;

public class Hadoop {

private static final int numField=5;

public static class FloatArrayWritable extends ArrayWritable { public FloatArrayWritable() { super(FloatWritable.class); } } 

public static class MyMapper extends Mapper<Key, IndexedRecord, Text, FloatArrayWritable> {     

    public void map(Key key, IndexedRecord value, Context context)
        throws IOException, InterruptedException {
    		String customerId = new String(key.getMajorPath().get(1).toString());
    		if ( customerId.matches("(\\D{2})(\\d*)"))
    		{
	    		FloatArrayWritable data;
	    		data = new FloatArrayWritable();
	    		FloatWritable[] buff = new FloatWritable[numField];
	    		for(int i=0;i<numField;i++)
	    		{
	    			buff[i]= new FloatWritable( Float.valueOf( (value.get(i)).toString() ));
	    		}
	    		data.set(buff);
	            context.write(new Text(customerId),data ); 
    		}
        } 
}

public static class MyReducer extends Reducer<Text, FloatArrayWritable, Text, Text> {
    public void reduce(Text key, Iterable<FloatArrayWritable> values, Context context)
        throws IOException, InterruptedException {
    	float sums[] = new float[numField]; 
        for(FloatArrayWritable aValue: values)
        {
        	for(int i=0;i<numField;i++)
        	{
        		sums[i]+= ((FloatWritable) aValue.get()[i]).get();
        	}
        }
        String output="";
        for(int i=0;i<numField;i++)
    	{
        	if (i<numField-1)
        		output+= (int) sums[i]+",";
        	else
        		output+= sums[i];
    	}
        context.write(key, new Text(output));
    }
}


public static int main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    conf.set("mapred.textoutputformat.separator", ",");
    String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
    Job job = new Job(conf, "Customer Sums");
    job.setJarByClass(Hadoop.class);
    job.setMapperClass(MyMapper.class);
    job.setReducerClass(MyReducer.class);
    
    job.setInputFormatClass(KVAvroInputFormat.class);
    KVAvroInputFormat.setKVHelperHosts(new String[] {"localhost:5000"} );
    KVAvroInputFormat.setKVStoreName("kvstore");
    KVAvroInputFormat.setParentKey(Key.createKey("Load1"));
    job.setMapOutputKeyClass(Text.class);
    job.setMapOutputValueClass(FloatArrayWritable.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    
    FileOutputFormat.setOutputPath(job, new Path(otherArgs[0]));
    boolean success = job.waitForCompletion(true);
    return success ? 0 : 1;
}
}  

