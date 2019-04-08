import java.io.File;
import java.io.IOException;

import java.util.*;

import org.apache.avro.Schema;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericRecord;

import oracle.kv.*;

public class Keys
{
    public static void main(String[] args)
    {
        KVStoreConfig config = new KVStoreConfig("kvstore", "localhost:5000");
        KVStore store = KVStoreFactory.getStore(config);

        String questionMike = "This is a question from Mike";
	String answerMike = "This is an answer from Mike";
        String questionDave = "This is a question from Dave";
	String answerDave = "This is an answer from Dave";
        List<String> majorComponents1 = Arrays.asList("Participant","Mike");
	List<String> majorComponents2 = Arrays.asList("Participant","Dave");
        List<String> minorComponents1 = Arrays.asList("Question");
	List<String> minorComponents2 = Arrays.asList("Answer");
        Key MikeKey1 = Key.createKey(Arrays.asList("Participant","Mike"),"Question");
	Key MikeKey2 = Key.createKey(majorComponents1,minorComponents2);
        Key DaveKey1 = Key.createKey(majorComponents2,minorComponents1);
	Key DaveKey2 = Key.createKey(majorComponents2,minorComponents2);
        Value MikeQuestion = Value.createValue(questionMike.getBytes());
	Value MikeAnswer = Value.createValue(answerMike.getBytes());
	Value DaveQuestion = Value.createValue(questionDave.getBytes());
        Value DaveAnswer = Value.createValue(answerDave.getBytes());
        store.put(MikeKey1,MikeQuestion);
        store.put(MikeKey2,MikeAnswer);
        store.put(DaveKey1,DaveQuestion);
        store.put(DaveKey2,DaveAnswer);

        Iterator<KeyValueVersion> MyStoreIterator = store.storeIterator(Direction.UNORDERED, 0, Key.createKey("Participant"), new KeyRange("Mike"), null);
	while (MyStoreIterator.hasNext())
		{
		KeyValueVersion entry = MyStoreIterator.next();
	    	Key k = entry.getKey();
	    	Value v = entry.getValue();
		System.out.println(k.toString() + " - " + new String(v.getValue()));
		}
		
        store.close();
    }
}
