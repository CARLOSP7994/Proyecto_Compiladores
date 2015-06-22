%{
  #include <stdlib.h>
  #include <stdio.h>
  #define YYSTYPE char*
  extern FILE *yyin;
  extern char *yytext;
%}

%token entero flotante tipoD agrupA agrupC variable
%token operador sTerminal asg Comparacion Reservada
%%
recursiva :   texto
            | recursiva texto
;
texto :     	 '\n'
		| bloquecodigo '\n' {printf(" >>Frase correcta\n");}
        /* | error    { yyerrok;  }*/
;
bloquecodigo :  Tdato
              | Dfuncion
              | EstructuraWh
              | Asignacion
              | Oaritmetica
              | DesicionC
;
Tdato :  tipoD variable sTerminal 
;
Argumento : tipoD variable
;
Dfuncion :  variable agrupA agrupC  
	   | variable agrupA Argumento  agrupC 
;
condicion : variable Comparacion variable
; 
EstructuraWh :  Reservada agrupA condicion agrupC 
              | Reservada agrupA variable agrupC   

;
Oaritmetica : variable operador variable sTerminal
            | variable operador entero sTerminal
            | variable operador flotante sTerminal
;
DesicionC : Reservada agrupA condicion agrupC Oaritmetica Reservada Oaritmetica
;
Asignacion :  variable asg flotante sTerminal
;
%%
/*int main(int argc,char **argv)
{
	
	if (argc>1)
		yyin=fopen(argv[1],"rt");
	else
		//yyin=stdin;
		yyin=fopen("ejemplo.txt","rt");
		

	yyparse();
	return 0;
}*/
main( argc, argv )
int argc;
char **argv;
   {
   ++argv, --argc; 
   if ( argc > 0 )
            yyin = fopen( argv[0], "r" );
    else
            yyin = stdin;

    yyparse();
    }

yyerror (char *s)
