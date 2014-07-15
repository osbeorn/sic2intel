package sic2intel.lexer;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import java_cup.runtime.Symbol;
import sic2intel.parser.SicTokens;

public class Main {

	/*
	public static String[] pascalTermNames;

	static {
		SicTokens pascalTok = new SicTokens();
		Field[] pascalToks = pascalTok.getClass().getDeclaredFields();
		pascalTermNames = new String[pascalToks.length + 5];
		for (int f = 0; f < pascalToks.length; f++) {
			try {
				int tok = pascalToks[f].getInt(pascalTok);
				String lex = pascalToks[f].toString().replaceAll("^.*\\.", "");
				pascalTermNames[tok] = lex;
			}
			catch (IllegalAccessException _) {}
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
		}
		
		PrintWriter pw = null;
		try {
			pw = new PrintWriter("lex_analysis.txt");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

        SicLexer lexer = new SicLexer(srcFile);
        
        Symbol symbol;
        try {
            while ((symbol = lexer.next_token ()).sym != SicTokens.EOF) {
            	pw.write(symbol.value.toString() + " ");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        try { 
        	pw.close();
        	srcFile.close(); 
        } catch (IOException e) {
        	e.printStackTrace(); 
        }
	}

}
