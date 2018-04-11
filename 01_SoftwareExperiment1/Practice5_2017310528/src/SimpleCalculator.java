class OutOfRangeException extends Exception{
	String message;
	OutOfRangeException(){
		this.message = "#### ERROR ####\nRange of input is 0~9999\n";
	}
	OutOfRangeException(String message){
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
}
class AddZeroException extends Exception {
	String message;
	AddZeroException(){
		 this.message = "#### ERROR ####\nAdd is not allowed to add zero\n";
	}
	AddZeroException(String message){
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
}
class SubtractZeroException extends Exception{
	String message;
	SubtractZeroException(){
		 this.message = "#### ERROR ####\nRange of input is 0~9999\n";
	}
	SubtractZeroException(String message){
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
}


public class SimpleCalculator {
	private int result;
	public void add(int a, int b) throws OutOfRangeException, AddZeroException {
		int ans;
		if(a<0 || 9999<a || b<0 || 9999<b) {
			throw new OutOfRangeException("#### ERROR ####\ninput OutOfRange\n");
		}
		if(a==0 || b==0) {
			throw new AddZeroException();
		}
		ans = a+b;
		if(ans<0 || 9999<ans) {
			throw new AddZeroException("#### ERROR ####\ninput OutOfRange\n");
		}
		result = ans;
	}
	public void sub(int a, int b) throws OutOfRangeException, SubtractZeroException {
		int ans;
		if(a<0 || 9999<a || b<0 || 9999<b) {
			throw new OutOfRangeException("#### ERROR ####\ninput OutOfRange\n");
		}
		if(a==0 || b==0) {
			throw new SubtractZeroException();
		}
		ans = a-b;
		if(ans<0 || 9999<ans) {
			throw new OutOfRangeException("#### ERROR ####\noutput OutOfRange\n");
		}
		result = ans;
	}
	public void print() throws OutOfRangeException {
		if(result<0 || 9999<result) {
			throw new OutOfRangeException();
		}
		System.out.println(result);
	}
	public void reset() {
		this.result = 0;
	}
}
