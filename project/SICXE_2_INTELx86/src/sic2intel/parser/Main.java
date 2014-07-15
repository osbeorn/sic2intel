package sic2intel.parser;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import sic2intel.lexer.SicLexer;

public class Main {

	/*
	public static String[] pascalNontNames;

	static {
		SicTokens sicTokens = new SicTokens();
		Field[] sicToks = sicTokens.getClass().getDeclaredFields();
		pascalNontNames = new String[sicToks.length];
		for (int f = 0; f < sicToks.length; f++) {
			try {
				int tok = sicToks[f].getInt(sicTokens);
				String lex = sicToks[f].toString().replaceAll("^.*\\.", "");
				if (!((tok < sic2intel.lexer.Main.pascalTermNames.length) && (lex
						.equals(sic2intel.lexer.Main.pascalTermNames[tok])))) {
					pascalNontNames[tok] = lex;
				}
			} catch (IllegalAccessException _) {
			}
		}
	}
*/
	public static void execute() {
		FileReader srcFile = null;
		String srcName = sic2intel.Main.srcFileName;
		
		try {
			srcFile = new FileReader(srcName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			//Logger.error("Source file '" + srcName + "' cannot be opened.", 1);
		}
		
		//PrintStream xml = XML.open("synanal");

		SicLexer lexer = new SicLexer(srcFile);
		SicSyntax parser = new SicSyntax(lexer);
		
		try {
			//parser.debug_parse(xml);
		} catch (Exception e) {
			e.printStackTrace();
			//XML.close("synanal", xml);
			//Logger.error("Error while testing syntax analyzer.", 1);
		}

		//XML.close("synanal", xml);
		try {
			srcFile.close();
		} catch (IOException e) {
			e.printStackTrace();
			//Logger.error("Source file '" + srcName + "' cannot be opened.", 1);
		}
	}
}
