package externaltables;

import java.io.ByteArrayInputStream;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.IOException;
import java.util.List;

import oracle.kv.Key;
import oracle.kv.KeyValueVersion;
import oracle.kv.KVStore;
import oracle.kv.Value;
import oracle.kv.exttab.Formatter;

public class MyFormatter implements Formatter {
    
    public MyFormatter() {}

    @Override
    public String toOracleLoaderFormat(final KeyValueVersion kvv,
                                       final KVStore kvStore) {
        final Key key = kvv.getKey();
        final Value value = kvv.getValue();

        final List<String> majorPath = key.getMajorPath();
        final List<String> minorPath = key.getMinorPath();
	
        final String userName = majorPath.get(1);
        final String type = (minorPath.size() > 0) ? minorPath.get(0) : null;  
            
        final String text = new String(value.getValue());

        //try {        
            final StringBuilder sb = new StringBuilder();
            sb.append(userName).append('|');
            sb.append(type).append('|');
            sb.append(text);
            return sb.toString();
        //} 
        
        //catch (IOException e) {
        //     throw new RuntimeException(e);
        //}
        
    }

    private String readString(final DataInput in)
        throws IOException {

        if (!in.readBoolean()) {
            return null;
        }

        return in.readUTF();
    }
}
