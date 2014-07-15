package sic2intel.structure.intel;

import sic2intel.structure.CodeGenerator;
import sic2intel.structure.sic.SicAddressing;
import sic2intel.structure.sic.SicData;
import sic2intel.structure.sic.SicInstr;

public class IntelInstr {

	/** label */
	public String label;

	public String toString(String l, String i, String op, SicInstr src) {
		if (sic2intel.Main.debugOuput) {
			if (src != null) {
				return String.format("%4$s%1$-16s%2$-8s%3$s\n", l, i, op, src.toString());
			} else {
				return String.format("%1$-16s%2$-8s%3$s\n", l, i, op);
			}
		} else {
			return String.format("%1$-16s%2$-8s%3$s\n", l, i, op);
		}
	}

	public String setAddressing(Integer addrType, String op) {
		switch (addrType) {
		case SicAddressing.NONE:
			return op;
		case SicAddressing.SIMPLE:
			if (CodeGenerator.equSet.contains(op)) {
				return op;
			} else {
				return "[" + op + "]";
			}
		case SicAddressing.IMMEDIATE:
			try {
				Integer.decode(op);
				return op;
			} catch (Exception _) {
				return "offset " + op;
			}
		// ???
		case SicAddressing.INDIRECT:
			return "not implemented";
		default:
			return "not supported ";
		}
	}

	public String setAddressing(Integer addrType, Integer op) {
		return setAddressing(addrType, op.toString());
	}
	
	public String setPtrSize(Integer type) {
		switch(type) {
		case SicData.BYTE: // BYTE --> BYTE
			return "byte ";
		case SicData.WORD: // WORD --> LONG
			return "dword ";
		case SicData.FLOAT: // FLOAT --> DOUBLE
			return "qword ";
		default:
			return "not supported ";
		}
	}

}
