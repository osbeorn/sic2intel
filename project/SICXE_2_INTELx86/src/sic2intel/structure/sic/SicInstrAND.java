package sic2intel.structure.sic;


public class SicInstrAND extends SicInstrF34 {

	public Integer addressing;
	public String identifier;
	
	public SicInstrAND(boolean extended, Integer addressing, String identifier, boolean indexed) {
		this.extended = extended;
		this.addressing = addressing;
		this.identifier = identifier;
		this.indexed = indexed;
	}
	
	@Override
	public void accept(SicInstrVisitor visitor) {
		visitor.visit(this);
	}
	
	@Override
	public String toString() {
		return super.toString("AND", addressing, identifier);
	}
}
