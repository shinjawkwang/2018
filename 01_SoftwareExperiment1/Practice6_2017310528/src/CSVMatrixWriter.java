import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.*;

public class CSVMatrixWriter {
	String path;
	CSVMatrixWriter(String inpt){
		this.path = inpt;
	}
	public void writer(ArrayList<ArrayList<Float>> matrix, String filename) {
		String element;
		try{
			FileOutputStream fos = new FileOutputStream(path + "\\" + filename);
			OutputStreamWriter osw = new OutputStreamWriter(fos);
			BufferedWriter bw = new BufferedWriter(osw);
			for(int i=0; i<matrix.size(); i++) {
				System.out.println(matrix.get(0).size());
				for(int j=0; j<matrix.get(0).size(); j++) {
					element = matrix.get(i).get(j).toString();
					if(j<matrix.get(0).size()-1)
						bw.write(element + " ");
					else
						bw.write(element + "\n");
				}
			}
			bw.close();
		}
		catch(FileNotFoundException e) {
			e.printStackTrace();
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
}
