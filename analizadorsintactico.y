%{
#include <stdlib.h>
#include <stdio.h>
#define YYSTYPE char*
extern FILE *yyin;
extern char *yytext;
%}

%token TIPODATO CARACTER IDENTIFICADOR SIGNOIGUAL INICIALIZADOR FINSENTENCIA INICIOVECTOR FINVECTOR COMA INICIOBLOQUE FINBLOQUE RETURN INPUT OUTPUT PARENTESISINICIO PARENTESISFIN STRING COMPARACION LOGICOS OPERADORS OPERADORP RESERVADA 
%token BOOLEAN DECIMAL
%%
recursiva : texto
      | recursiva texto;
texto : '\n'
      | bloquecodigo {printf("%s >>Frase correcta\n",yytext);}
      | error    { yyerrok;  }
bloquecodigo : variablesglobales
             | funciones
             | bloque
             | Aritm
             | exprlog
	     | repeat
             | condicion
variablesglobales : TIPODATO CARACTER IDENTIFICADOR SIGNOIGUAL INICIALIZADOR FINSENTENCIA
| IDENTIFICADOR INICIOVECTOR INICIALIZADOR FINVECTOR FINSENTENCIA
funciones : TIPODATO CARACTER Declaracionlocal bloque
          | TIPODATO CARACTER Lista Declaracionlocal bloque
Declaracionlocal : Declaracionlocal1
                 | Declaracionlocal Declaracionlocal1
Declaracionlocal1:TIPODATO CARACTER IDENTIFICADOR FINSENTENCIA
Lista : Lista1
      | Lista COMA Lista1
Lista1 : TIPODATO CARACTER IDENTIFICADOR

bloque : INICIOBLOQUE comandos FINBLOQUE
         |INICIOBLOQUE FINBLOQUE
comandos : comandos1
         | comandos FINSENTENCIA comandos1
comandos1 : return FINSENTENCIA
		|input FINSENTENCIA
		|output FINSENTENCIA
		|atribucion FINSENTENCIA
		|controlf FINSENTENCIA

return : RETURN INICIALIZADOR
        |RETURN BOOLEAN
output : OUTPUT PARENTESISINICIO STRING PARENTESISFIN

input : INPUT IDENTIFICADOR 

atribucion : IDENTIFICADOR SIGNOIGUAL

controlf : IDENTIFICADOR INICIOVECTOR INICIALIZADOR FINVECTOR SIGNOIGUAL FINSENTENCIA

Aritm	: IDENTIFICADOR SIGNOIGUAL Exp1 FINSENTENCIA 
Exp1    : Exp1 OPERADORP Trasp|Trasp 
Trasp   : Trasp OPERADORS Frente|Frente |error
Frente  : Ndato| PARENTESISINICIO Exp1 PARENTESISFIN 
Ndato   : INICIALIZADOR|DECIMAL

Cdato	: IDENTIFICADOR|INICIALIZADOR|DECIMAL
exprcomp: Cdato COMPARACION Cdato
exprlog : exprcomp LOGICOS exprlog| exprcomp |IDENTIFICADOR

condicion : RESERVADA PARENTESISINICIO exprlog PARENTESISFIN RESERVADA Aritm
repeat    : RESERVADA Aritm RESERVADA PARENTESISINICIO exprlog PARENTESISFIN
;          
%%
int main() {
FILE *fp= fopen("prueba.c","r");
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

int yywrap()  
{  
   return 1;  
}  
