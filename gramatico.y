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
recursiva : texto
      | recursiva texto;
texto : '\n'
      | bloquecodigo {printf("%s >>Frase correcta\n",yytext);}
      | error    { yyerrok;  }
bloquecodigo : Tdato
             | Dfuncion
             | EstructuraWh
             | Asignacion
             | Oaritmetica
             | DesicionC

Tdato :  tipoD variable sTerminal 

Argumento : tipoD variable

Dfuncion : variable agrupA agrupC  
	  | variable agrupA Argumento  agrupC 

condicion : variable Comparacion variable
 
EstructuraWh :   Reservada agrupA condicion agrupC 
              | Reservada agrupA variable agrupC   


Oaritmetica : variable operador variable sTerminal
            | variable operador entero sTerminal
            | variable operador flotante sTerminal

DesicionC : Reservada agrupA condicion agrupC Oaritmetica Reservada Oaritmetica

Asignacion :  variable asg flotante sTerminal
;
%%
int main() {
FILE *fp= fopen("ejemplo.txt","tr");
if (!fp)
{
printf("No se puede abrir el archivo");
return -1;
}
   yyin=fp;
do {
   yyparse();
}while (!feof(yyin));
}

yyerror (char *s)
{
  extern int yylineno;
  printf ("%s\n", s);
  printf ("Linea actual: %d\n",yylineno);
}

