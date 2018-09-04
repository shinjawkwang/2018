import java.awt.*;
 
import javax.swing.*;
 
public class time extends JFrame{
    JLabel timerLabel1 = null;
    JLabel timerLabel3 = null;
    JLabel timerLabel7 = null;
    
    public time()
    {
        this.setTitle("Timer Test");
        Container c = this.getContentPane();
        c.setLayout(new FlowLayout());
        timerLabel1 = new JLabel("0");
        timerLabel1.setFont(new Font("Gothic",Font.ITALIC,80));
        timerLabel3 = new JLabel("0");
        timerLabel3.setFont(new Font("Gothic",Font.ITALIC,80));
        timerLabel7 = new JLabel("0");
        timerLabel7.setFont(new Font("Gothic",Font.ITALIC,80));
    
        
        c.add(timerLabel1);
        c.add(timerLabel3);
        c.add(timerLabel7);
        
        
        this.setSize(500,150);
        this.setVisible(true);
        int k = 0;
        int k1 = 0;
        int k2 = 0;
       
        while(true)
        {
            timerLabel1.setText(""+k);            
            timerLabel3.setText(""+k1);           
            timerLabel7.setText(""+k2);
            
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            k++; 
            k1+=3;
            k2+=7;
        }
    }
    public static void main(String[] args) {
        new time();
    }
}