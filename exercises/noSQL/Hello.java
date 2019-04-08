import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;

public class Hello
{
    public static void main(String[] args)
    {
        KVStoreConfig config = new KVStoreConfig("kvstore", "localhost:5000");
        KVStore store = KVStoreFactory.getStore(config);

	Key myKey = Key.createKey("Hello");
        Value myValue = Value.createValue("Big Data World!".getBytes());

        store.put(myKey,myValue);

        ValueVersion returnValue = store.get(myKey);

        System.out.println("Key: " + myKey.toString());
        System.out.println("Value: " + new String(returnValue.getValue().getValue()));
        store.close();
    }
}
