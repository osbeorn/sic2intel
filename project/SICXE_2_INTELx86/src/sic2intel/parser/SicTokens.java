
//----------------------------------------------------
// The following code was generated by CUP v0.11a beta 20060608
// Fri Nov 13 20:57:11 CET 2015
//----------------------------------------------------

package sic2intel.parser;

/** CUP generated class containing symbol constants. */
public class SicTokens {
  /* terminals */
  public static final int AT = 74;
  public static final int TD = 56;
  public static final int IDENTIFIER = 81;
  public static final int SHIFTL = 38;
  public static final int RESW = 65;
  public static final int TIX = 58;
  public static final int JEQ = 17;
  public static final int HEXCONST = 84;
  public static final int READ = 62;
  public static final int SVC = 55;
  public static final int ADDR = 4;
  public static final int TIO = 57;
  public static final int DIVR = 12;
  public static final int LDX = 28;
  public static final int SIO = 40;
  public static final int WORD = 67;
  public static final int LDT = 27;
  public static final int LDS = 26;
  public static final int DQUOTE = 80;
  public static final int RESB = 66;
  public static final int ADDF = 3;
  public static final int DIVF = 11;
  public static final int LDL = 25;
  public static final int COMMA = 76;
  public static final int JSUB = 20;
  public static final int TIXR = 59;
  public static final int LPS = 29;
  public static final int LDF = 24;
  public static final int CLEAR = 6;
  public static final int LDB = 22;
  public static final int CHARCONST = 85;
  public static final int LDA = 21;
  public static final int REG_X = 93;
  public static final int EQU = 69;
  public static final int SUB = 52;
  public static final int REG_T = 92;
  public static final int LPARENTHESIS = 79;
  public static final int REG_S = 90;
  public static final int STCH = 44;
  public static final int REG_PC = 94;
  public static final int STX = 51;
  public static final int REG_L = 89;
  public static final int STT = 50;
  public static final int FLOAT = 14;
  public static final int STS = 48;
  public static final int REG_F = 88;
  public static final int RD = 35;
  public static final int REG_B = 87;
  public static final int COMP = 7;
  public static final int REG_A = 86;
  public static final int SUBR = 54;
  public static final int STL = 47;
  public static final int STI = 46;
  public static final int MUL = 30;
  public static final int STF = 45;
  public static final int RSUB = 37;
  public static final int STB = 43;
  public static final int STA = 42;
  public static final int SUBF = 53;
  public static final int NUMBER = 82;
  public static final int WRITE = 61;
  public static final int PLUS = 70;
  public static final int HIO = 15;
  public static final int DIVIDE = 72;
  public static final int FIX = 13;
  public static final int RMO = 36;
  public static final int WD = 60;
  public static final int SSK = 41;
  public static final int STAR = 77;
  public static final int ADD = 2;
  public static final int DIV = 10;
  public static final int MULR = 32;
  public static final int LDCH = 23;
  public static final int STSW = 49;
  public static final int COMPR = 9;
  public static final int J = 16;
  public static final int EOF = 0;
  public static final int MULF = 31;
  public static final int COMPF = 8;
  public static final int REG_SW = 91;
  public static final int JGT = 18;
  public static final int MINUS = 71;
  public static final int RPARENTHESIS = 78;
  public static final int OR = 34;
  public static final int error = 1;
  public static final int HEXNUMBER = 83;
  public static final int START = 63;
  public static final int END = 64;
  public static final int NORM = 33;
  public static final int JLT = 19;
  public static final int BYTE = 68;
  public static final int NL = 75;
  public static final int AND = 5;
  public static final int HASH = 73;
  public static final int SHIFTR = 39;

  /* non terminals */
  static final int subf_instr = 66;
  static final int label_opt = 9;
  static final int instr = 3;
  static final int equ_instr = 78;
  static final int expr = 13;
  static final int add_instr = 15;
  static final int sti_instr = 59;
  static final int tixr_instr = 72;
  static final int svc_instr = 68;
  static final int comp_instr = 20;
  static final int operand = 14;
  static final int rsub_instr = 50;
  static final int rd_instr = 48;
  static final int td_instr = 69;
  static final int stt_instr = 63;
  static final int word_instr = 77;
  static final int fix_instr = 26;
  static final int mul_instr = 43;
  static final int jlt_instr = 32;
  static final int lps_instr = 42;
  static final int ssk_instr = 54;
  static final int numbers = 81;
  static final int constants = 85;
  static final int clear_instr = 19;
  static final int or_instr = 47;
  static final int sts_instr = 61;
  static final int addr_instr = 17;
  static final int stb_instr = 56;
  static final int rmo_instr = 49;
  static final int mulr_instr = 45;
  static final int ldt_instr = 40;
  static final int tio_instr = 70;
  static final int stx_instr = 64;
  static final int epsilon = 10;
  static final int write_instr = 79;
  static final int byte_instr = 76;
  static final int stsw_instr = 62;
  static final int ldch_instr = 36;
  static final int addf_instr = 16;
  static final int wd_instr = 73;
  static final int identifier = 83;
  static final int jeq_instr = 30;
  static final int extended = 5;
  static final int start_instr = 1;
  static final int indexed = 6;
  static final int mulf_instr = 44;
  static final int lds_instr = 39;
  static final int stl_instr = 60;
  static final int ldb_instr = 35;
  static final int shiftr_instr = 52;
  static final int sta_instr = 55;
  static final int shiftl_instr = 51;
  static final int div_instr = 23;
  static final int new_line_opt = 11;
  static final int compr_instr = 22;
  static final int stch_instr = 57;
  static final int resb_instr = 74;
  static final int ldx_instr = 41;
  static final int divr_instr = 25;
  static final int stf_instr = 58;
  static final int end_instr = 2;
  static final int identifierOrNumber = 82;
  static final int new_line_non_opt = 12;
  static final int and_instr = 18;
  static final int norm_instr = 46;
  static final int tix_instr = 71;
  static final int compf_instr = 21;
  static final int float_instr = 27;
  static final int hio_instr = 28;
  static final int register = 8;
  static final int ldl_instr = 38;
  static final int divf_instr = 24;
  static final int lda_instr = 34;
  static final int instrs = 4;
  static final int addressing = 7;
  static final int source = 0;
  static final int j_instr = 29;
  static final int resw_instr = 75;
  static final int jsub_instr = 33;
  static final int jgt_instr = 31;
  static final int sub_instr = 65;
  static final int read_instr = 80;
  static final int subr_instr = 67;
  static final int sio_instr = 53;
  static final int numbersOrConstants = 84;
  static final int ldf_instr = 37;
}

