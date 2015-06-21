%{
  #include <stdlib.h>
  #include <stdio.h>
  #define YYSTYPE char*
  extern FILE *yyin;
%}

%token entero flotante tipoD desicionI agrupA agrupC bucle variable
%token operador desicionE sTerminal Ologico asg
%%

Ddato :   '\n'
          |  tipoD variable sTerminal '\n' {printf("\n>>Correcto");}
;
Argumento : tipoD variable
;
Dfuncion : '\n'
          | variable agrupA agrupC  '\n' 
	  | variable agrupA Argumento  agrupC sTerminal '\n' {printf("\n>>Correcto");}
;
condicion : variable Ologico variable
; 
EstruturaWh : '\n' 
	     |  bucle agrupA condicion agrupC '\n'
             | bucle agrupA variable agrupC   '\n'
;
DesicionS :  desicionI agrupA condicion agrupC
;
Oaritmetica : variable operador variable
            | variable operador entero
            | variable operador flotante
;
DesicionC : desicionI agrupA condicion agrupC Oaritmetica desicionE Oaritmetica
;
Asignacion : '\n'
            | variable asg flotante '\n'
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

