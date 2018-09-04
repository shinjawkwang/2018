import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

class Producer implements Runnable{
	int val = 0;
	BlockingQueue bq;
	Producer(BlockingQueue bq){
		this.bq = bq;
	}
	public void run() {
		while(true) {
			try {
				bq.put(++val);
				System.out.format("Produce %d \n", val);
			}
			catch(InterruptedException e) {
				e.printStackTrace();
			}
			if(val >= 10) {
				return;
			}
		}
	}
	void Produce() {
		
	}
}
class Consumer implements Runnable{
	BlockingQueue bq;
	Consumer(BlockingQueue bq){
		this.bq = bq;
	}
	public void run() {
		
	}
	void Consume() {
		while(true) {
			try {
				System.out.format("Consume %d \n", bq.take());
				Thread.sleep(300);
			}
			catch(InterruptedException e) {
				e.printStackTrace();
			}
			
		}
	}
}

public class lab {
	public static void main(String[] args) {
		BlockingQueue bq = new ArrayBlockingQueue(5);
		
		Runnable r1=new Producer(bq);
	    Runnable r2=new Consumer(bq);
		Thread t1 = new Thread(r1);
		Thread t2 = new Thread(r2);
		t1.start();
		t2.start();
	}
}