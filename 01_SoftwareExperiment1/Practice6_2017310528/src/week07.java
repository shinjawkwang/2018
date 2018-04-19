
public class week07 {
	public static void main(String[] args) {
		String nowPath = System.getProperty("user.dir");
		System.out.println("Eclipse File Path: " + nowPath);
		
		String fileName1 = "input1.csv";
		String fileName2 = "input2.csv";
		String fileName3 = "output.csv";
		CSVMatrixReader csvMR1 = new CSVMatrixReader(nowPath);
		CSVMatrixReader csvMR2 = new CSVMatrixReader(nowPath);
		CSVMatrixWriter csvMW = new CSVMatrixWriter(nowPath);
		CSVMatrixCalculator csvCal = new CSVMatrixCalculator();
		
		csvMW.writer(
				csvCal.calculator(csvMR1.reader(fileName1), csvMR2.reader(fileName2)), 
				fileName3);
		
	}
}
