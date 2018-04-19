import java.util.ArrayList;

public class CSVMatrixCalculator {
	public ArrayList<ArrayList<Float>> calculator(ArrayList<ArrayList<Float>> a, ArrayList<ArrayList<Float>> b) {
		ArrayList<ArrayList <Float>> result = new ArrayList<ArrayList <Float>>();
		float sum=0;
		for(int i=0; i<a.size(); i++) {
			ArrayList <Float> resultRow = new ArrayList<Float>();
			for(int j=0; j<a.get(i).size(); j++) {
				for(int k=0; k<b.size(); k++) {
					sum += a.get(i).get(k) * b.get(k).get(j);
				}
				resultRow.add(sum);
				sum = 0;
			}
			result.add(resultRow);
		}
		return result;
	}
}
