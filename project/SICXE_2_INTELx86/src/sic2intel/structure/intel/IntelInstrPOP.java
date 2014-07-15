package sic2intel.structure.intel;

import sic2intel.structure.sic.SicInstr;
import sic2intel.structure.sic.SicRegisters;

/**
 * 
 * @author benjamin
 *
 * The INT n instruction generates a call to the interrupt or exception handler specified with the
 * destination operand.
 * 
 */
public class IntelInstrPOP extends IntelInstr {
	
	/** Value to push onto the stack -- immediate or memory location */
	private String src;
	
	/** Register to push onto the stack */
	private Integer srcReg;
	
	private SicInstr srcInstr;
	
	public IntelInstrPOP(String label, String src, SicInstr srcInstr) {
		this.label = label;
		this.src = src;
		this.srcInstr = srcInstr;
	}
	
	public IntelInstrPOP(String label, Integer srcReg, SicInstr srcInstr) {
		this.label = label;
		this.srcReg = srcReg;
		this.srcInstr = srcInstr;
	}

	@Override
	public String toString() {
		
		// label
		String l = (label != null ? label + ":" : "");// + "\t\t";
				
		// instruction
		String i = "pop";// + "\t\t";
			
		// operands
		String op = "";
		
		if (src != null) {
			op = src;
		} else if (srcReg != null) {
			op = IntelRegisters.getActualReg(SicRegisters.toIntel(srcReg), IntelData.LONG);
		}
		
		return super.toString(l, i, op, srcInstr);
		// return l + i + op;
	}

}