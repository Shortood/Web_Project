import java.util.*;

public class TypeMap extends HashMap<Variable, Type> {

    // TypeMap is implemented as a Java HashMap.
    // Plus a 'display' method to facilitate experimentation.
    public void display() {
        StringBuffer buffer = new StringBuffer();
        for (Map.Entry<Variable, Type> entry : this.entrySet()) {
            if (entry != null) {
                buffer.append("<" + entry.getKey() + ", " + entry.getValue() + ">, ");
            }
        }
        String output = buffer.toString();
        System.out.println("{ " + output.substring(0, Math.max(output.length() - 2, 1)) + " }\n");
    }

}
