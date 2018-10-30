# TestStream.java

# package ...
# import ...

import java.util.List;
import static java.util.Arrays.asList;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import org.junit.Test;


public class TestStream{

    @Test
    public void convertCollectionElementsToUpperCase() {
        MyStream  t = new MyStream();
        
        List<String> collection = asList("My", "name", "is", "Mario", "Rossi");
        List<String> expected = asList("MY", "NAME", "IS", "MARIO", "ROSSI");
        List<String> test = t.upperCase(collection);
        for(int i=0; i<test.size(); i++) assertEquals(test.get(i), expected.get(i));
    }
    
    @Test
    public void filterCollection() {
        MyStream  t = new MyStream();
                
        List<String> collection = asList("My", "name", "is", "Mario", "Rossi");
        List<String> expected = asList("My", "name", "is");
        
        // Considera solo le stringhe che hanno meno di 5 caratteri
        List<String> test = t.atMost4Characters(collection);
        for(int i=0; i<test.size(); i++) assertEquals(test.get(i), expected.get(i));
    }
    
    
    @Test
    public void sumElements() {
        MyStream  t = new MyStream();

        List<Integer> collection = asList(1, 2, 3, 4, 5);
        Integer expected = 1+2+3+4+5;

        assertEquals(t.sum(collection), expected);
    }
}
