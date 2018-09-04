import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
 
class Server extends Thread {
	ArrayList<CommThread> list = new ArrayList<CommThread>();
	public void run() {
		int cnt = 0;
		ServerSocket ss = null;
		try {
			ss = new ServerSocket(7777);
			System.out.println("Server Start");
			// socket accept 10번 하기
			while(true) {
				Socket soc = null;
				soc = ss.accept();
				CommThread c = new CommThread(soc);
				c.start();
				cnt ++;
				c.join(); 
				list.add(c);
				soc.close();
				if(cnt>=10) {
					break;
				}
			}
			System.out.println("Server Stop");
			ss.close();
			for(int i=0; i<10; i++) {
				list.get(i).printNum();
			}
		} catch(IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}
}
 
class CommThread extends Thread {
	Socket s;
	Student obj;
	CommThread(Socket s) {
		this.s = s;
	}
	public void run() {
		try {
			InputStream os = s.getInputStream();
			ObjectInputStream dos = new ObjectInputStream(os);
			obj = (Student) dos.readObject();
			dos.close();
			os.close();
			s.close();
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException c) {
			c.printStackTrace();
		}
	}
	void printNum() {
		System.out.format("Receive: student%d\n",obj.getNum()); // don't modify
	}
}
 
class Client extends Thread {
	Student obj;
	Client(String name, Student s) {
		obj = s;
	}
	public void run() {
		try {
			Socket soc = new Socket("localhost", 7777);
			System.out.format("Client%d\n", obj.getNum()); // don't modify
			OutputStream is = soc.getOutputStream ();
			ObjectOutputStream ois = new ObjectOutputStream(is);
			ois.writeObject(obj);
			ois.close();
			is.close();
			soc.close();
		} catch(IOException e) {
			e.printStackTrace();
		} 
		
	}
}
 
class Student implements java.io.Serializable { // don't modify
	int num;
	Student(int num) {
		this.num = num;
	}
	int getNum() {
		return num;
	}
}
 
public class socket { // don't modify
	public static void main(String[] args) {
		Server server = new Server();
		server.start();
		for(int i=0; i<10; i++) {
			new Client("Client", new Student(i)).start();
		}
	}
}