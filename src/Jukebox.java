/*
 *    Copyright (c) The League of Amazing Programmers 2013-2018
 *    Level 1
 */


import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

import javazoom.jl.player.advanced.AdvancedPlayer;

/* 1. Download the JavaZoom jar from here: http://bit.ly/javazoom
 * 2. Right click your project and add it as an External JAR (Under Java Build Path > Libraries).*/

public class Jukebox implements Runnable, ActionListener {
JFrame frame= new JFrame();
JPanel panel= new JPanel();
JButton buttonGLY= new JButton();
JButton buttonHT= new JButton();
JButton buttonLD= new JButton();
JButton buttonHN= new JButton();
Song song1=new Song("paramore-hard-times-audio.mp3");
Song song2=new Song("maroon-5-girls-like-you-ft-cardi-b.mp3");
Song song3=new Song("juice-wrld-lucid-dreams-clean-lyrics.mp3");
Song song4=new Song("zedd-happy-now-madilyn-bailey-matt-slays-khs-cover.mp3");
Song song;
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Jukebox());
	}

           public void run() {

		// 3. Find an mp3 on your computer or on the Internet.
        	   
		// 4. Create a Song
        	// 5. Play the Song



		/*
		 * 6. Create a user interface for your Jukebox so that the user can to
		 * choose which song to play. You can use can use a different button for
		 * each song, or a picture of the album cover. When the button or album
		 * cover is clicked, stop the currently playing song, and play the one
		 * that was selected.
		 */


buttonGLY.setText("Girls Like You");
buttonHT.setText("Hard Times");
buttonLD.setText("Lucid Dreams");
buttonHN.setText("Happy Now");

buttonGLY.addActionListener(this);
buttonHT.addActionListener(this);
buttonLD.addActionListener(this);
buttonHN.addActionListener(this);

frame.setVisible(true);
panel.add(buttonGLY);
panel.add(buttonHT);
panel.add(buttonLD);
panel.add(buttonHN);
frame.add(panel);
song1.play();
frame.pack();
frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
          }
	/* Use this method to add album covers to your Panel. */
	private JLabel loadImage(String fileName) {
		URL imageURL = getClass().getResource(fileName);
		Icon icon = new ImageIcon(imageURL);
		return new JLabel(icon);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		song1.stop();
		song2.stop();
		song3.stop();
		song4.stop();
		if(e.getSource()==buttonGLY) {
			song2.play();
		}
		else if(e.getSource()==buttonHT) {
			
			song1.play();
		}
		else if(e.getSource()==buttonHN) {
			
			song4.play();
		}
		else if(e.getSource()==buttonLD) {
			
			song3.play();
		}
	}

}

class Song {

	private int duration;
	private String songAddress;
	private AdvancedPlayer mp3Player;
	private InputStream songStream;

	/**
	 * Songs can be constructed from files on your computer or Internet
	 * addresses.
	 * 
	 * Examples: <code> 
	 * 		new Song("everywhere.mp3"); 	//from default package 
	 * 		new Song("/Users/joonspoon/music/Vampire Weekend - Modern Vampires of the City/03 Step.mp3"); 
	 * 		new	Song("http://freedownloads.last.fm/download/569264057/Get%2BGot.mp3"); 
	 * </code>
	 */
	public Song(String songAddress) {
		this.songAddress = songAddress;
	}

	public void play() {
		loadFile();
		if (songStream != null) {
			loadPlayer();
			startSong();
		} else
			System.err.println("Unable to load file: " + songAddress);
	}

	public void setDuration(int seconds) {
		this.duration = seconds * 100;
	}

	public void stop() {
		if (mp3Player != null)
			mp3Player.close();
	}

	private void startSong() {
		Thread t = new Thread() {
			public void run() {
				try {
					if (duration > 0)
						mp3Player.play(duration);
					else
						mp3Player.play();
				} catch (Exception e) {
				}
			}
		};
		t.start();
	}

	private void loadPlayer() {
		try {
			this.mp3Player = new AdvancedPlayer(songStream);
		} catch (Exception e) {
		}
	}

	private void loadFile() {
		if (songAddress.contains("http"))
			this.songStream = loadStreamFromInternet();
		else
			this.songStream = loadStreamFromComputer();
	}

	private InputStream loadStreamFromInternet() {
		try {
			return new URL(songAddress).openStream();
		} catch (Exception e) {
			return null;
		}
	}

	private InputStream loadStreamFromComputer() {
		try {
			return new FileInputStream(songAddress);
		} catch (FileNotFoundException e) {
			return this.getClass().getResourceAsStream(songAddress);
		}
	}
}

