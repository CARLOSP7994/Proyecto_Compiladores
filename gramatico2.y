%{
  #include <stdlib.h>
  #include <stdio.h>
  #define YYSTYPE char*
  extern FILE *yyin;
%}

%token entero flotante tipoD desicionI agrupA agrupC bucle variable sTerminal operador desicionE

%%

Ddato :   '\n'
          |  tipoD variable sTerminal '\n' {printf("\n>>Correcto");}
;
Arguento : tipoD variable
;
Dfuncion : '\n'
          | variable agrupA agrupC  '\n' 
	  | vairable agrupA Argumento  agrupC sTerminal '\n' {printf("\n>>Correcto");}
;
condicion : variable operador variable
; 
EstruturaWh :   bucle agrupA condicion agrupC
             | bucle agrupA variable agrupC
;
DesicionS :  desicionI agrupA condicion agrupC
;
Oaritmetica : variable operador variable
            | variable operador entero
            | variable operador flotante
;
DesicionC : DesicionI agrupA condicion agrupC Oaritmetica DesicionE Oaritmetica
;
Asignacion : variable operador flotante 
;
%%
int main(int argc,char **argv)
{
	
	if (argc>1)
		yyin=fopen(argv[1],"rt");
	else
		//yyin=stdin;
		yyin=fopen("ejemplo.txt","rt");
		

	yyparse();
	return 0;
}
yyerror (char *s)
 {
 printf("%s\n ", s);
 }
int yywrap()
 {
   return 1;
 }

