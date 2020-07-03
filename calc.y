%{
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
int yylex();
void yyerror(const char *s);
%}
%token INTEGER
%%
program:
       program line | line
line:
    expr ';' { printf("%d\n",$1); } ; | '\n'
expr:
    expr '+' prec { $$ = $1 + $3; } 
	| expr '-' prec { $$ = $1 - $3; }
	| prec { $$ = $1; }

prec:
	prec '*' most { $$ = $1 * $3; } 
	| prec '/' most { $$ = $1 / $3; } 
	| prec '%' most { $$ = $1 % $3; }
	| most { $$ = $1;}

most:
	most '^' term { $$ = pow($1,$3);}
	|term { $$ = $1;} 
term:
    INTEGER { $$ = $1; }
%%
void yyerror(const char *s) { fprintf(stderr,"%s\n",s); return ; }
int main(void) { /*yydebug=1;*/ yyparse(); return 0; }
