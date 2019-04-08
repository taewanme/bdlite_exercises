import java.io.File;
import java.io.*;
import java.io.IOException;
import java.util.*;
import org.apache.avro.Schema;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericRecord;

import oracle.kv.*;
import oracle.kv.avro.AvroCatalog;
import oracle.kv.avro.GenericAvroBinding;

public class NoSQLTransactions 
{
	public static void main(String[] args) throws Exception 
	{
	//configure Database
	KVStore store;
	KVStoreConfig config = new KVStoreConfig("kvstore", "localhost:5000");
        store = KVStoreFactory.getStore(config);
        //configure AVRO
        AvroCatalog catalog = store.getAvroCatalog();
        File f = new File("trans.avsc");
        Schema.Parser parser = new Schema.Parser();
        parser.parse(f);
        Schema infoSchema = parser.getTypes().get("trans"); 
        GenericAvroBinding binding = catalog.getGenericBinding(infoSchema);
        //load Data
        GenericRecord infoRecord = new GenericData.Record(infoSchema);
	BufferedReader br = new BufferedReader(new FileReader("export_transactions.csv"));
	int i = 0;
	String line = null;
	while ((line = br.readLine()) != null){
		String[] tokens = line.split(",");
		infoRecord.put("teller", Integer.parseInt(tokens[1]));
		infoRecord.put("kiosk", Integer.parseInt(tokens[2]));
		infoRecord.put("atm", Integer.parseInt(tokens[3]));
		infoRecord.put("webbank", Integer.parseInt(tokens[4]));
        	infoRecord.put("sum", Float.parseFloat(tokens[5]));
		//store in database
        	Value value = binding.toValue(infoRecord);
        	List<String> majorComponent = Arrays.asList("Load1",tokens[0]);
        	store.put(Key.createKey(majorComponent,"trans"+(i++)), value );
		}
        //retrieve from database 
	Iterator<KeyValueVersion> MyStoreIterator = store.storeIterator(Direction.UNORDERED, 0, Key.createKey("Load1"), new KeyRange("CU9988"), null);
	while (MyStoreIterator.hasNext())
		{
		KeyValueVersion entry = MyStoreIterator.next();
	    	Key k = entry.getKey();
	    	GenericRecord outputRecord = new GenericData.Record(infoSchema);
	    	outputRecord = binding.toObject(entry.getValue());
		System.out.println(k.toString() + " - " + outputRecord);
		}
        store.close();
	}
}
