package sic2intel.gui;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.UIManager;
import javax.swing.border.EmptyBorder;

public class AboutDialog extends JDialog {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final String contentText = 
			"Sic2Intel - a SIC/XE to Intel Pentium x86 assembly code translator\n\n"
			+ "Author: Benjamin Kastelic\n" 
			+ "Version: 1.0\n";

	private final JPanel contentPanel = new JPanel();

	/**
	 * Created a dialog, which belongs to a specified parent component.
	 * 
	 * @param parent
	 */
	public AboutDialog(Component parent) {
		setModal(true);
		setModalExclusionType(ModalExclusionType.NO_EXCLUDE);
		setModalityType(ModalityType.APPLICATION_MODAL);
		setResizable(false);
		setTitle("About");
		setBounds(100, 100, 279, 187);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JTextArea txtrFa = new JTextArea();
		txtrFa.setWrapStyleWord(true);
		txtrFa.setBackground(UIManager.getColor("Panel.background"));
		txtrFa.setEditable(false);
		txtrFa.setLineWrap(true);
		txtrFa.setText(contentText);
		txtrFa.setBounds(12, 12, 253, 97);
		contentPanel.add(txtrFa);

		JButton btnOk = new JButton("OK");
		btnOk.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		btnOk.setBounds(211, 121, 54, 25);
		contentPanel.add(btnOk);

		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setLocationRelativeTo(parent);
		setVisible(true);
	}

}
