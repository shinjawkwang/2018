import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
 
class Server extends Thread {
	public void run() {
		try {
			ServerSocket ss = new ServerSocket(5678);
			Socket s = ss.accept();
			
			OutputStream os = s.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
 
			dos.writeUTF("some message");
			
			dos.close();
			s.close();
			ss.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
 
class Client extends Thread {
	public void run() {
		try {
			Socket s = new Socket("127.0.0.1", 5678);
			
			InputStream is = s.getInputStream();
			DataInputStream dis = new DataInputStream(is);
			
			String line = dis.readUTF();
			System.out.println(line);
			
			dis.close();
			s.close();
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
 
public class j {
	public static void main(String[] args) {
		Server server = new Server();
		server.start();
		
		Client client = new Client();
		client.start();		
	}
}