package google.hashCodeChallenge.readFile;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;


public class DataReaderTestDriver {
	public static void main(String[] args) throws IOException {
		File myFile; 
		BufferedReader myBuffer = null;
		FileReader myFileRead;
		String myString;
		
		try {
			myBuffer = new BufferedReader(new FileReader("b_little_bit_of_everything.txt"));
			while ((myString = myBuffer.readLine()) != null){
		        	System.out.println(myString);
		        	
			}
			System.out.println();
			System.out.println();
			System.out.println("*******Output File Read Successful!**********");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (myBuffer != null)
				myBuffer.close();
		}
	}

}


/*

5 mushrooms onions neapolitan-crust emmental-cheese cheddar
8 mushrooms tomatoes onions pineapple neapolitan-crust emmental-cheese mozzarella cheddar
1 basil
3 tomatoes emmental-cheese mozzarella
1 pineapple
.
.
.
7 onions pineapple basil ham emmental-cheese mozzarella cheddar
1 mushrooms
2 tomatoes basil
6 mushrooms pineapple ham basil mozzarella cheddar
1 onions
3 ham basil emmental-cheese
4 mushrooms emmental-cheese mozzarella cheddar
4 tomatoes pineapple neapolitan-crust basil


*******Output File Read Successful!**********
*/
