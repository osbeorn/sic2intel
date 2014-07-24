package sic2intel.structure;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import sic2intel.lexer.SicLexer;
import sic2intel.logger.Logger;
import sic2intel.parser.SicSyntax;
import sic2intel.structure.intel.IntelInstr;
import sic2intel.structure.intel.IntelInstrPROC;
import sic2intel.structure.sic.SicProgram;

public class Main {

	public static void showConsole() {
		int status = execute();
		
		if (status != 0) {
			// error
			System.out.println("An error occured during the translation process.\nSee \"" + sic2intel.Main.logFileName + "\" for more information.");
		} else {
			// success
			System.out.println("The translation process was sucessful.\nSee \"" + sic2intel.Main.dstFileName + "\" for end result.");
		}
		
		Logger.close();
		System.exit(status);
	}
	
	public static int execute() {
		
		// open input file.
		FileReader reader = null;
		try {
			reader = new FileReader(sic2intel.Main.srcFile);
		} catch (FileNotFoundException e) {
			return Logger.error("Unable to open source file '" + sic2intel.Main.srcFileName + "'.", e);
		}

		// lexical analysis
		SicLexer lexer = new SicLexer(reader);
		// syntax analysis
		SicSyntax parser = new SicSyntax(lexer);
		
		SicProgram program = null;
		try {
			program = (SicProgram) (parser.parse().value);
		} catch (Exception e) {
			return Logger.error("Error while testing the construction of syntax tree.", e);
		}
		
		DataInspector inspector = new DataInspector();
		program.accept(inspector);
		
		CodeGenerator generator = new CodeGenerator();
		program.accept(generator);
		
		// open/create output file
		FileWriter writer = null;
		try {
			writer = new FileWriter(sic2intel.Main.dstFilePath + sic2intel.Main.dstFileName);
		} catch (IOException e) {
			return Logger.error("Unable to open/create output file '" + sic2intel.Main.dstFileName + "'.", e);
		}
		
		try {

			//System.out.println("# How to run:");
			writer.write("# How to run:\n");
			//System.out.println("#\tas -o " + 
			//				 	sic2intel.Main.srcFileName.substring(0, sic2intel.Main.srcFileName.lastIndexOf('.')) + "_out.o " + 
			//				 	sic2intel.Main.dstFileName);
			writer.write("#\tas -o " + 
				 	sic2intel.Main.srcFileName.substring(0, sic2intel.Main.srcFileName.lastIndexOf('.')) + "_out.o " + 
				 	sic2intel.Main.dstFileName + "\n");
			//System.out.println("#\tld -o " + 
			//				 	sic2intel.Main.srcFileName.substring(0, sic2intel.Main.srcFileName.lastIndexOf('.')) + "_out " +
			//				 	sic2intel.Main.srcFileName.substring(0, sic2intel.Main.srcFileName.lastIndexOf('.')) + "_out.o");
			writer.write("#\tld -o " + 
				 	sic2intel.Main.srcFileName.substring(0, sic2intel.Main.srcFileName.lastIndexOf('.')) + "_out " +
				 	sic2intel.Main.srcFileName.substring(0, sic2intel.Main.srcFileName.lastIndexOf('.')) + "_out.o" + "\n");
			//System.out.println("#./" + sic2intel.Main.srcFileName.substring(0, sic2intel.Main.srcFileName.lastIndexOf('.')) + "\n");
			writer.write("#\t./" + sic2intel.Main.dstFileName.substring(0, sic2intel.Main.dstFileName.lastIndexOf('.')) + "\n\n");
			//System.out.println(".intel_syntax");
			writer.write(".intel_syntax\n");
			
			boolean first = true;
			for(IntelInstr instr : CodeGenerator.endDataBlock) {
				if (first) {
					//System.out.println(".data");
					writer.write(".data\n");
					first = false;
				}
				
				//System.out.print(instr.toString());
				writer.write(instr.toString());
			}

			//System.out.println("\n.text");
			writer.write("\n.text\n");
			//System.out.println(String.format("%1$-15s%2$-15s", ".global", "_start"));
			writer.write(String.format("%1$-16s%2$-16s", ".global", "_start") + "\n");
			
			if (CodeGenerator.startLabel == null) {
				//System.out.println("_start:");
				writer.write("_start:\n");
			}
			
			for(IntelInstr instr : CodeGenerator.endMainBlock) {
				
				if (CodeGenerator.startLabel != null && 
						instr.label != null && 
						instr.label.equals(CodeGenerator.startLabel)) {
					
					//System.out.println("_start:");
					writer.write("_start:\n");
				}
				
				//System.out.print(instr.toString());
				writer.write(instr.toString());
			}		
			
			for (IntelInstrPROC proc : CodeGenerator.endProcBlock) {
				//System.out.println("\n" + proc.listToString());
				writer.write("\n" + proc.listToString() + "\n");
			}
			
		} catch (IOException e) {
			return Logger.error("A problem occured while writing to output file '" + sic2intel.Main.dstFileName + "'.", e);
		}
		
		// return status code
		int status = 0;
		
		// close input file		
		try {
			reader.close();
		} catch (IOException e) {
			status = Logger.error("Unable to close source file '" + sic2intel.Main.srcFileName + "'.", e);
		}
		
		// close output file
		try {
			writer.close();
		} catch (IOException e) {
			status = Logger.error("Unable to close output file '" + sic2intel.Main.dstFileName + "'.", e);
		}
		
		return status;
	}
}