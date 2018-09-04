import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class lab {
   public static void main(String[] args) {
      BlockingQueue bq=new ArrayBlockingQueue(5);
      
      Runnable r1=new Producer(bq);
      Runnable r2=new Consumer(bq);
      Thread p = new Thread(r1);
      Thread c = new Thread(r2);
      p.start();
      c.start();
   }
}

class Producer implements Runnable{
   int value=0;
   BlockingQueue bq;
   Producer(BlockingQueue bq){
      this.bq=bq;
   }
   public synchronized void run() {
      while(true) {
         try {
            bq.put(++value);
            System.out.format("Produce: %d\n",value);
            if(value>=10) return;
         }catch(InterruptedException e) {}
      }
   }
}

class Consumer implements Runnable{
   BlockingQueue bq;
   int cnt=0;
   Consumer(BlockingQueue bq){
      this.bq=bq;
   }
   public void run() {
      while(true) {
         try {
            System.out.format("Consume: %d\n",bq.take());
            Thread.sleep(300);
         }catch(InterruptedException e) {}
         cnt ++;
         if(cnt==10) {
       	  	break;
         }
      }
   }
}