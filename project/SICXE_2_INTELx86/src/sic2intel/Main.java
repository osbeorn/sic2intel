package sic2intel;

import java.io.File;

import sic2intel.logger.Logger;

/**
 * Main class of the SIC/XE to Intel x86 translator.
 * 
 * @author Benjamin Kastelic
 * @version Last updated 19.9.2012
 */
public class Main {

	/** Enables or disables test mode -- for development. */
	private static boolean testing = false;

	/** Tells whether to enable or disable debug output mode. */
	public static boolean debugOuput = false;

	/** Source file. */
	public static File srcFile = null;
	/** Absolute path of the original program. */
	public static String srcFilePath = null;
	/** File name of the original program (with extension). */
	public static String srcFileName = null;

	/** Absolute path of the translated program. */
	public static String dstFilePath = null;

	/** Filename of the translated program. (someName_out.asm) */
	public static String dstFileName = null;
	/** Log file filename. (someName_err.log) */
	public static String logFileName = null;

	/**
	 * Entry point of the SIC XE to Intel x86 (sic2intel) compiler.
	 * 
	 * @param args
	 *            Command line parameters
	 */
	public static void main(String[] args) {

		int i = 0;
		String arg;
		
		while (i < args.length && args[i].startsWith("-")) {
			arg = args[i++];
			
			// show help
			if (arg.equals("-help") || arg.equals("--help")) {
				showHelp();
				System.exit(0);
			} 
			
			// enable debug mode and run
			else if (arg.equals("-d")) {
				if (i < args.length) {
					debugOuput = true;
					extractFileInfo(args[i++]);
				} else {
					System.err.println("Switch \"-d\" requires an input file.");
					System.exit(1);
				}
			}
		}
		
		if (args.length == 0) {
			if (testing) {
				srcFilePath = "test1.asm";
				extractFileInfo(srcFilePath);

				// lexical analysis - if successfull it will output the tokens in a file
				// sic2intel.lexer.Main.execute();

				// parser - CUP -- obsolete
				// sic2intel.parser.Main.execute();

				// parser -- creates the syntax tree -- obsolete
				// sic2intel.structure.Main.execute();

				sic2intel.structure.Main.showConsole();
			} else {
				sic2intel.gui.Main.showGUI();
			}
		} else if(args.length == 1) {
			extractFileInfo(args[0]);
			sic2intel.structure.Main.showConsole();
		} else {
			sic2intel.structure.Main.showConsole();
		}
	}

	public static void extractFileInfo(String path) {
		try {
			extractFileInfo(new File(path));
		} catch (NullPointerException e) {
			Logger.fatalError("The file \"" + path + "\" does not exist.", e, 1);
		}
	}

	public static void extractFileInfo(File file) {
		srcFile = file;
		srcFileName = srcFile.getName();

		if (srcFileName.lastIndexOf('.') != -1) {
			dstFileName = srcFileName.substring(0, srcFileName.lastIndexOf('.')) + "_out.asm";
		} else {
			dstFileName = srcFileName + "_out.asm";
		}

		if (testing) {
			dstFilePath = System.getProperty("user.dir") + java.io.File.separator;
		} else {
			dstFilePath = srcFile.getParent() != null ? srcFile.getParent() + java.io.File.separator : "";
		}

		/*
		 * if (!dstFilePath.substring(dstFilePath.length() - 1).equals("/")) {
		 * dstFilePath += "/"; }
		 */

		if (srcFileName.lastIndexOf('.') != -1) {
			logFileName = srcFileName.substring(0, srcFileName.lastIndexOf('.')) + "_err.log";
		} else {
			logFileName = srcFileName + "_err.log";
		}
	}

	public static void showHelp() {
		System.out.println("Usage: ./Sic2Intel.jar [options] file");
		System.out.println("where options include:");
		System.out.println("\t-d\tshow original instructions as comments");
		System.out.println("\t-h\tshow help");
	}
}