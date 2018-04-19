import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class CSVMatrixReader {
	String path;
	CSVMatrixReader(String path){
		this.path = path;
	}
	public ArrayList <ArrayList<Float>> reader(String filename){
		ArrayList<ArrayList<Float>> matrix = new ArrayList<ArrayList<Float>>();
		try (BufferedReader br = new BufferedReader(new FileReader(path + "\\" + filename))) {
		    String line;
		    while ((line = br.readLine()) != null) {
		    		ArrayList<Float> row = new ArrayList<Float>();
		    		String[] lineItems = line.split(",");
		    		for(int c=0; c<lineItems.length; c++){
		    			row.add(Float.parseFloat(lineItems[c]));
		    		}
		        matrix.add(row);
		    }
		    br.close();
		}
		catch(FileNotFoundException e){
		    e.printStackTrace();
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		return matrix;
	}
}
