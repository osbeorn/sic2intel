package sic2intel.gui;

import java.io.File;

import javax.swing.filechooser.FileFilter;

/**
 * A custom class used to filter out certain types of files for the file 
 * chooser.
 * 
 * @author benjamin
 */
public class CompilerFileFilter extends FileFilter{

	/** 
	 * @param	file	the file that needs checking
	 * @return 			true if the file is a directory or if its extension is 
	 * 					".asm"	 	
	 */
	public boolean accept(File file) {
		if (file.isDirectory()) { 
        	return true; 
        }

        return file.getName().toLowerCase().endsWith(".asm");
    }
	
	/**
	 * @return			description of allowed files
	 */
    public String getDescription() {
        return "SIC and SIC/XE Assembler Files (*.asm)";
    }	
}
