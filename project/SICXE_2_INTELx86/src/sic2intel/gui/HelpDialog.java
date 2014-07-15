package sic2intel.gui;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.UIManager;
import javax.swing.border.EmptyBorder;

public class HelpDialog extends JDialog {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final String contentText = 
			"Instructions:\n  "
			+ "Step 1: navigate to a SIC assembler file and load it\n  "
			+ "Step 2: press \"Translate\"\n\nKeep in mind, that the SIC/XE assembly file should always end with a new line. \n"
			+ "Also, do not use names of registers for variable labels. Otherwise the translation process will fail."
			+ "\n\n*********************\nSpecial instructions:\n*********************\n"
			+ "WRITE:\n  Syntax: .<WRITE(\"some text\")>\n Description: Writes the specified text to STDOUT.\n\n"
			+ "  Syntax: .<WRITE(Var, Len)>\n Description: Writes Len characters from Var to\t\tSTDOUT.\n\n"
			+ "READ:\n  Syntax: .<READ(Var, Len)>\n Description: Reads Len character from STDIN\t\tand stores them in Var.";

	private final JPanel contentPanel = new JPanel();

	/**
	 * Created a dialog, which belongs to a specified parent component.
	 * 
	 * @param parent
	 */
	public HelpDialog(Component parent) {
		setResizable(false);
		setTitle("Help");
		setBounds(100, 100, 380, 338);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JButton btnOk = new JButton("OK");
		btnOk.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		btnOk.setBounds(312, 272, 54, 25);
		contentPanel.add(btnOk);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(12, 12, 354, 248);
		contentPanel.add(scrollPane);

		JTextArea txtrFa = new JTextArea();
		scrollPane.setViewportView(txtrFa);
		txtrFa.setBackground(UIManager.getColor("Button.background"));
		txtrFa.setEditable(false);
		txtrFa.setLineWrap(true);
		txtrFa.setWrapStyleWord(true);
		txtrFa.setText(contentText);

		// sets the scrollbar to top position
		txtrFa.setCaretPosition(0);

		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setLocationRelativeTo(parent);
		setVisible(true);
	}
}
