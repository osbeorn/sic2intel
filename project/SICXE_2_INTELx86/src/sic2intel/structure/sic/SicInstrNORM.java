package sic2intel.structure.sic;


public class SicInstrNORM extends SicInstrF1 {

	@Override
	public void accept(SicInstrVisitor visitor) {
		visitor.visit(this);
	}
	
	public String toString() {
		return super.toString("NORM");
	}
}
