package sic2intel.gui;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

import sic2intel.logger.Logger;

public class CompilerFrame extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JFileChooser fileChooser;
	private CompilerFileFilter fileFilter;
	private JTextField textFieldSelectedFile;

	/**
	 * Launch the application.
	 */
	public static void execute() {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CompilerFrame frame = new CompilerFrame();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the main frame of the translator.
	 */
	public CompilerFrame() {
		setResizable(false);
		setTitle("Sic2Intel");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 450, 250);
		setLocationRelativeTo(null);
		
		JMenuBar menuBar = new JMenuBar();
		setJMenuBar(menuBar);
		
		JMenu mnFile = new JMenu("File");
		menuBar.add(mnFile);
		
		JMenuItem mntmOpen = new JMenuItem("Open ...");
		mntmOpen.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, InputEvent.CTRL_MASK));
		mntmOpen.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				btnSelectFile_actionPerformed();
			}
		});
		mnFile.add(mntmOpen);
		
		JMenuItem mntmQuit = new JMenuItem("Exit");
		mntmQuit.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Q, InputEvent.CTRL_MASK));
		mntmQuit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				btnQuit_actionPerformed();
			}
		});
		mnFile.add(mntmQuit);
		
		JMenu mnHelp = new JMenu("Help");
		menuBar.add(mnHelp);
		
		JMenuItem mntmHelp = new JMenuItem("Help");
		mntmHelp.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				mntmHelp_actionPerformed();
			}
		});
		mntmHelp.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F1, 0));
		mnHelp.add(mntmHelp);
		
		JMenuItem mntmAbout = new JMenuItem("About");
		mntmAbout.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				mntmAbout_actionPerformed();
			}
		});
		mntmAbout.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F1, InputEvent.SHIFT_MASK));
		mnHelp.add(mntmAbout);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		setupFileChooser();
		
		JButton btnTranslate = new JButton("Translate");
		btnTranslate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				btnTranslate_actionPerformed();
			}
		});
		btnTranslate.setBounds(220, 163, 102, 25);
		contentPane.add(btnTranslate);
		
		JButton btnQuit = new JButton("Quit");
		btnQuit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				btnQuit_actionPerformed();
			}
		});
		btnQuit.setBounds(334, 163, 102, 25);
		contentPane.add(btnQuit);
		
		JButton btnSelectFile = new JButton("Browse ...");
		btnSelectFile.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				btnSelectFile_actionPerformed();
			}
		});
		btnSelectFile.setBounds(334, 12, 102, 25);
		contentPane.add(btnSelectFile);
		
		textFieldSelectedFile = new JTextField();
		textFieldSelectedFile.setBounds(12, 12, 310, 25);
		contentPane.add(textFieldSelectedFile);
		textFieldSelectedFile.setColumns(10);
		
		JCheckBox chckbxDebugOutput = new JCheckBox("Debug output");
		chckbxDebugOutput.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				chckbxDebugOutput_actionPerformed(arg0);
			}
		});
		chckbxDebugOutput.setToolTipText("Prints original instructions as comments in front of each translated instruction.");
		chckbxDebugOutput.setBounds(12, 45, 129, 23);
		chckbxDebugOutput.setHorizontalTextPosition(SwingConstants.LEFT);
		contentPane.add(chckbxDebugOutput);
	}
	
	private void setupFileChooser() {
		fileChooser = new JFileChooser();
		fileFilter = new CompilerFileFilter();
		fileChooser.addChoosableFileFilter(fileFilter);
		fileChooser.setFileFilter(fileFilter);
	}
	
	private void btnQuit_actionPerformed() {
		dispose();
	}
	
	private void btnTranslate_actionPerformed() {
		if (textFieldSelectedFile.getText().equals("")) {
			JOptionPane.showMessageDialog(this, "No file selected.\nPlease select a file and try again.", "No file", JOptionPane.ERROR_MESSAGE);
		} else {
			sic2intel.Main.extractFileInfo(textFieldSelectedFile.getText());
			
			if (sic2intel.Main.srcFile != null) {
				int status = sic2intel.structure.Main.execute();
				if (status != 0) {
					// error
					JOptionPane.showMessageDialog(this, "An error occured during the translation process.\nSee \"" + sic2intel.Main.logFileName + "\" for more information.", "Translation error", JOptionPane.ERROR_MESSAGE);
				} else {
					// success
					JOptionPane.showMessageDialog(this, "The translation process was sucessful.\nSee \"" + sic2intel.Main.dstFileName + "\" for end result.", "Translation successful", JOptionPane.INFORMATION_MESSAGE);
				}
				
				Logger.close();
			} else {
				// no file selected error
				JOptionPane.showMessageDialog(this, "No source file selected.\nAborting the translation process.", "No source file", JOptionPane.WARNING_MESSAGE);
			}
		}
	}
	
	private void btnSelectFile_actionPerformed() {
	    int returnVal = fileChooser.showOpenDialog(this);
	   
	    if(returnVal == JFileChooser.APPROVE_OPTION) {
	    	File file = fileChooser.getSelectedFile();
	    	textFieldSelectedFile.setText(file.getAbsolutePath());
	    	// lblSelectedFileName.setText(file.getName());
	    	
	    	// sic2intel.Main.extractFileInfo(file);
	    }
	}
	
	private void mntmHelp_actionPerformed() {
		new HelpDialog(this);
	}
	
	private void mntmAbout_actionPerformed() {
		new AboutDialog(this);
	}
	
	private void chckbxDebugOutput_actionPerformed(ActionEvent e) {
		if((((JCheckBox)e.getSource()).isSelected())) {
			// System.out.println("selected: true");
			sic2intel.Main.debugOuput = true;
		} else {
			// System.out.println("selected: false");
			sic2intel.Main.debugOuput = false;
		}
	}
}
