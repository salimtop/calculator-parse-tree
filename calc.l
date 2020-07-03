%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char*);
extern int yylval;
#include "calc.tab.h" 
#include<time.h>
%}
%%
[ \t]+ ;
[0-9]+ {yylval = atoi(yytext); return INTEGER;}
[-+*/%^] {return *yytext;}
[0-9]+ {yylval = atoi(yytext); return INTEGER;}
O+NE+ {yylval = 1; return INTEGER;}
T+WO+ {yylval = 2; return INTEGER;}
T+HREE+ {yylval = 3; return INTEGER;}
F+OUR+ {yylval = 4; return INTEGER;}
F+IVE+ {yylval = 5; return INTEGER;}
T+EN+ {yylval = 10; return INTEGER;}
MAGIC {srand(time(0)); yylval = rand()%100; return INTEGER;}
\n {return *yytext;}
; {return *yytext;}
. {char msg[25]; sprintf(msg,"%s <%s>","invalid character",yytext); yyerror(msg);}
