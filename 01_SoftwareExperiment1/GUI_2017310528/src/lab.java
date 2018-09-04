import javax.swing.*;
import java.awt.*;
import java.util.Random;

class Circle extends JFrame {
	public Circle() {
		setTitle("Circle!");
		setSize(1000, 1000);
		Container c = getContentPane();
		DrawCircle t = new DrawCircle();
		c.add(t);
		setVisible(true);
	}
}

class DrawCircle extends JPanel {
	
	public void paintComponent(Graphics g) {
		Random rand = new Random();
		float R = rand.nextFloat();
		float G = rand.nextFloat();
		float B = rand.nextFloat();
		Color c = new Color(R, G, B);
		g.setColor(c);
		g.fillArc(500, 500, 800, 800, 0, 90);
		
		R = rand.nextFloat();
		G = rand.nextFloat();
		B = rand.nextFloat();
		c = new Color(R, G, B);
		g.setColor(c);
		g.fillArc(500, 500, 800, 800, 90, 90);
		
		R = rand.nextFloat();
		G = rand.nextFloat();
		B = rand.nextFloat();
		c = new Color(R, G, B);
		g.setColor(c);
		g.fillArc(500, 500, 800, 800, 1800, 90);
		
		R = rand.nextFloat();
		G = rand.nextFloat();
		B = rand.nextFloat();
		c = new Color(R, G, B);
		g.setColor(c);
		g.fillArc(500, 500, 800, 800, 270, 90);
	}
}

public class lab {
	public static void main(String args[]) {
		Circle circle = new Circle();
		DrawCircle drw = new DrawCircle();
	}
}
