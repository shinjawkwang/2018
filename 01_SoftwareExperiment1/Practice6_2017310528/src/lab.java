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
				bq.put(val);
				System.out.format("Produce %d \n", val);
				val ++;
				Thread.sleep(500);
			}
			catch(InterruptedException e) {
				e.printStackTrace();
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
		Producer pd = new Producer(bq);
		Consumer cs = new Consumer(bq);
		Thread t1 = new Thread(pd);
		Thread t2 = new Thread(cs);
	}
}