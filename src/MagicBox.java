
/*
 *    Copyright (c) The League of Amazing Programmers 2013-2018
 *    Level 1
 */

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

public class MagicBox extends JPanel implements Runnable, MouseListener {

	 // We are going to hide secrets within the magic box.
	// When the user clicks on a secret place, stuff will happen.
	MediaPalace MP = new MediaPalace();
	// 1. Make the frame respond to mouse clicks.

	// 2. When the mouse is clicked, use the Media Palace (read the code in the
	// default package) to play sounds, show images or speak.

	// 3. backgroundImage.getRGB(keyEvent.getX(), keyEvent.getY()) will give you the
	// color of the current pixel.

	BufferedImage backgroundImage;

	public static void main(String[] args) throws Exception {

		SwingUtilities.invokeLater(new MagicBox());
		
	}

	@Override
	public void run() {
		try {
			loadBackgroundImage();
			createUI();
		} catch (Exception w) {
			System.err.println(w.getMessage());
		}

	}

	private void createUI() {
		
		JFrame frame = new JFrame("The Magic Box contains many secrets...");
		frame.add(this);
		setPreferredSize(new Dimension(backgroundImage.getWidth(), backgroundImage.getHeight()));
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
		frame.addMouseListener(this);
		frame.pack();	
	}

	private void loadBackgroundImage() throws Exception {
		String imageFile = "src/magic-box.jpg";
		try {
			backgroundImage = ImageIO.read(new File(imageFile));
		} catch (IOException e) {
			throw new Exception("Could not load image: " + imageFile);
		}
	}

	@Override
	public void paintComponent(Graphics g) {
		g.drawImage(backgroundImage, 0, 0, null);
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		
		// TODO Auto-generated method stub
		int pointX=e.getX();
		int pointY=e.getY();
		
		//System.out.println(e.getLocationOnScreen());
		System.out.println(pointX+","+pointY);
		try {
			MP.loadImageFromTheInternet("https://goo.gl/images/dZ2sYm");
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	if(pointX<338 && pointX>332 && pointY<170 && pointY>167) {
	MP.speak("Great job! You found me.");
	System.out.println("top of tower");
	}
	if(pointX<544 && pointX>538 && pointY<372 && pointY>360) {
		try {
			JFrame frame1=new JFrame();
			frame1.setVisible(true);
			JLabel label= new JLabel();
			
			label=MP.loadImageFromTheInternet("https://png.pngtree.com/element_origin_min_pic/16/12/01/44db2834d48a7557f599e6671f26776a.jpg");
			frame1.add(label);
			frame1.pack();
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("blue tower");
		}
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub

	}

}
