package sic2intel.lexer;

import sic2intel.logger.*;
import sic2intel.parser.*;
import java_cup.runtime.Symbol;

%%

%class      SicLexer // tells JFlex, to name the generated class 'SicLexer.java'
%public

%char
%line
%column

/*
 *	Here we connect JFlex with the Java Cup tool.
 */
%cupsym     sic2intel.parser.SicTokens
%implements java_cup.runtime.Scanner
%function   next_token
%type       Symbol//SicSymbol
%eofval{
    return new Symbol(SicTokens.EOF);
%eofval}
%eofclose

%{
    private Symbol sym(int type) {
        return new Symbol(type, yyline + 1, yycolumn + 1, yytext());
    }
    
%}

%eof{
%eof}

%init{
    yybegin(NORMAL);
%init}
%state NORMAL COMMENT COMMANDS DQUOTE_STRING

%%

<NORMAL> {
	
	// whitespace
	[ \t]+ { }
	// new lines
	(\n)+ | (\r)+ | (\r\n)+ { return sym(SicTokens.NL); }
	// end of file
	<<EOF>> { return sym(SicTokens.EOF); }  /* end of file */
	
	// ukazi
	"ADD" { return sym(SicTokens.ADD); }
	"ADDF" { return sym(SicTokens.ADDF); }
	"ADDR" { return sym(SicTokens.ADDR); }
	"AND" { return sym(SicTokens.AND); }
	"CLEAR" { return sym(SicTokens.CLEAR); }
	"COMP" { return sym(SicTokens.COMP); }
	"COMPF" { return sym(SicTokens.COMPF); }
	"COMPR" { return sym(SicTokens.COMPR); }
	"DIV" { return sym(SicTokens.DIV); }
	"DIVF" { return sym(SicTokens.DIVF); }
	"DIVR" { return sym(SicTokens.DIVR); }
	"FIX" { return sym(SicTokens.FIX); }
	"FLOAT" { return sym(SicTokens.FLOAT); }
	"HIO" { return sym(SicTokens.HIO); }
	"J" { return sym(SicTokens.J); }
	"JEQ" { return sym(SicTokens.JEQ); }
	"JGT" { return sym(SicTokens.JGT); }
	"JLT" { return sym(SicTokens.JLT); }
	"JSUB" { return sym(SicTokens.JSUB); }
	"LDA" { return sym(SicTokens.LDA); }
	"LDB" { return sym(SicTokens.LDB); }
	"LDCH" { return sym(SicTokens.LDCH); }
	"LDF" { return sym(SicTokens.LDF); }
	"LDL" { return sym(SicTokens.LDL); }
	"LDS" { return sym(SicTokens.LDS); }
	"LDT" { return sym(SicTokens.LDT); }
	"LDX" { return sym(SicTokens.LDX); }
	"LPS" { return sym(SicTokens.LPS); }
	"MUL" { return sym(SicTokens.MUL); }
	"MULF" { return sym(SicTokens.MULF); }
	"MULR" { return sym(SicTokens.MULR); }
	"NORM" { return sym(SicTokens.NORM); }
	"OR" { return sym(SicTokens.OR); }
	"RD" { return sym(SicTokens.RD); }
	"RMO" { return sym(SicTokens.RMO); }
	"RSUB" { return sym(SicTokens.RSUB); }
	"SHIFTL" { return sym(SicTokens.SHIFTL); }
	"SHIFTR" { return sym(SicTokens.SHIFTR); }
	"SIO" { return sym(SicTokens.SIO); }
	"SSK" { return sym(SicTokens.SSK); }
	"STA" { return sym(SicTokens.STA); }
	"STB" { return sym(SicTokens.STB); }
	"STCH" { return sym(SicTokens.STCH); }
	"STF" { return sym(SicTokens.STF); }
	"STI" { return sym(SicTokens.STI); }
	"STL" { return sym(SicTokens.STL); }
	"STS" { return sym(SicTokens.STS); }
	"STSW" { return sym(SicTokens.STSW); }
	"STT" { return sym(SicTokens.STT); }
	"STX" { return sym(SicTokens.STX); }
	"SUB" { return sym(SicTokens.SUB); }
	"SUBF" { return sym(SicTokens.SUBF); }
	"SUBR" { return sym(SicTokens.SUBR); }
	"SVC" { return sym(SicTokens.SVC); }
	"TD" { return sym(SicTokens.TD); }
	"TIO" { return sym(SicTokens.TIO); }
	"TIX" { return sym(SicTokens.TIX); }
	"TIXR" { return sym(SicTokens.TIXR); }
	"WD" { return sym(SicTokens.WD); }
	
	// psevdo ukazi
	"RESW" { return sym(SicTokens.RESW); }
	"RESB" { return sym(SicTokens.RESB); }
	"WORD" { return sym(SicTokens.WORD); }
	"BYTE" { return sym(SicTokens.BYTE); }
	"EQU" { return sym(SicTokens.EQU); }
	"START" { return sym(SicTokens.START); }
	"END" { return sym(SicTokens.END); }
	
	// posebni simboli
	"+" { return sym(SicTokens.PLUS); }
	"-" { return sym(SicTokens.MINUS); }
	"/" { return sym(SicTokens.DIVIDE); }
	"#" { return sym(SicTokens.HASH); }
	"@" { return sym(SicTokens.AT); }
	"," { return sym(SicTokens.COMMA); }
	"*" { return sym(SicTokens.STAR); }
	
	"A" { return sym(SicTokens.REG_A); }
	"B" { return sym(SicTokens.REG_B); }
	"F" { return sym(SicTokens.REG_F); }
	"L" { return sym(SicTokens.REG_L); }
	"S" { return sym(SicTokens.REG_S); }
	"SW" { return sym(SicTokens.REG_SW); }
	"T" { return sym(SicTokens.REG_T); }
	"X" { return sym(SicTokens.REG_X); }
	"PC" { return sym(SicTokens.REG_PC); }
	
	// labele in stevila
	[_a-zA-Z][a-zA-Z0-9_]*   { return sym(SicTokens.IDENTIFIER); }
	[0-9]+ | [1-9][0-9]+ { return sym(SicTokens.NUMBER); }
	"0x"[0-9A-F]+ { return sym(SicTokens.HEXNUMBER); }
	"C\'"[ _a-zA-Z0-9]+"\'" { return sym(SicTokens.CHARCONST); }
	"X\'"[0-9A-F]+"\'" { return sym(SicTokens.HEXCONST); }

	// komentarji
	"." {
		yybegin(COMMENT);
 	}

    . { Logger.warning("Unexpected character: '" + yytext() + "'", yyline + 1, yycolumn + 1); }
}

<COMMENT> {
	"<" {
		yybegin(COMMANDS);
	}
	
	(\n)+ | (\r)+ | (\r\n)+ { 
		yybegin(NORMAL);
		return sym(SicTokens.NL);
	}
	
	. { } // komentar
}

<COMMANDS> {
	// whitespace
	[ \t]+ { }
	"WRITE" { return sym(SicTokens.WRITE); }
	"READ"	{ return sym(SicTokens.READ); }
	"(" { return sym(SicTokens.LPARENTHESIS); }
	","	{ return sym(SicTokens.COMMA); }
	[_a-zA-Z][a-zA-Z0-9_]* { return sym(SicTokens.IDENTIFIER); }
	[0-9]+ | [1-9][0-9]+ { return sym(SicTokens.NUMBER); }
	")" { return sym(SicTokens.RPARENTHESIS); }
	"\"" {
		yybegin(DQUOTE_STRING);
		return sym(SicTokens.DQUOTE);
	}
	">" {
		yybegin(COMMENT);
	}
}

<DQUOTE_STRING> {
	[a-zA-Z0-9_ !+-*/\\.,;'čČšŠžŽ]*   { return sym(SicTokens.IDENTIFIER); }
	"\"" {
		yybegin(COMMANDS);
		return sym(SicTokens.DQUOTE);
	}
}