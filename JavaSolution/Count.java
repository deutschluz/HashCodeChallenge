import java.util.*;

public class Count{
    //implement a 'dict counter' as in python
    public static void main(String[] Args){
	//take list of things
	char[] lst={'b','c','d','a','b','d','b','c','a'};
	//put elements of lst as keys in a Map
	Map<Character,Integer> countOccur = new HashMap<>();
	for(int i=0;i<lst.length;i++){
	    try{
	    countOccur.compute(lst[i],(key,val)
			       -> (val == null)?1:val +1);
		}catch(Exception e){
		countOccur.put(lst[i],1);
	    }
	}
	Iterator<Map.Entry<Character,Integer>> IT = countOccur.entrySet().iterator();
	while(IT.hasNext()){
	    Map.Entry<Character,Integer> entry=IT.next();
	    System.out.println("key " + entry.getKey()+" occurs "+
			       entry.getValue()+" times");
	}
    }
}
