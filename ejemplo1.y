%{
#include <stdlib.h>
#include <stdio.h>
#define YYSTYPE char*
%}

%token ARTICULO NOMBRE ADJETIVO PREPOSICION VERBO

%%
dialogo : frase
        | dialogo  frase 
;
frase : '\n'
      | sujeto predicado  '\n'  {printf("\n>> Frase correcta\n");}
;
sujeto : frase_nominal
;
frase_nominal : NOMBRE
              | ARTICULO NOMBRE
              | ARTICULO NOMBRE ADJETIVO
              | ARTICULO NOMBRE frase_preposicional
;
frase_preposicional : PREPOSICION frase_nominal
;
predicado : frase_verbal
;
frase_verbal : VERBO 
             | VERBO frase_nominal
             | VERBO frase_preposicional
;          
%%
int main() {
   yyparse();
}

yyerror (char *s)
{
  printf ("%s\n", s);
}

int yywrap()  
{  
   return 1;  
}  
