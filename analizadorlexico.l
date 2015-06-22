/*
Integrantes: Chasiliquin Andres
             Flores Bryan
             Pinaida Alex
*/ 
%option yylineno
%option noyywrap
%{
#include <stdio.h>
#include <string.h>
#include "analizadorsintactico.tab.h"
%}
%x comentario
%%
"/*" { BEGIN(comentario);}
<comentario>[^*\n]*
<comentario>\n     {yylineno++;}
<comentario>"*/" { BEGIN(INITIAL);}
\"[^"]+\" { 
return STRING;
}

\'[^']+\' { printf ("Char en linea %d, %s\n",yylineno,yytext);}
 /*palabra reservada*/
int |
float |
char |
string |
bool {
return TIPODATO;
}
if |
then |
else |
while |
do  {
//printf("%s Es palabra reservada del lenguaje C\nEsta en la linea %d\n", yytext,yylineno);
return RESERVADA;
}
 /*Caracter especial*/
"+" |
"-" {
return OPERADORP;
}
"*" |
"/" {
return OPERADORS;
}

";" {
return FINSENTENCIA;
}
":" {
return CARACTER;
}
"=" {
return SIGNOIGUAL;
}
"[" {
return INICIOVECTOR;
}
"]" {
return FINVECTOR;
}
"," {
return COMA;
}
"{" {
return INICIOBLOQUE;
}
"}" {
return FINBLOQUE;
}
"(" {
return PARENTESISINICIO;
}
")" {
return PARENTESISFIN;
}
"return" {
return RETURN;
}
"input" {
return INPUT;
}
"output" {
return OUTPUT;
}
"&&" |
"||" |
"!" {
return LOGICOS;
}
 /*Operando compuesto*/
">" |
"!=" |
"==" |
"<=" |
">=" |
"<" {
// printf("%s Es un operando compuesto\nEsta en la linea %d\n", yytext,yylineno);
return COMPARACION;
}
 /*Tipo boolean*/
true |
false  {printf("%s Es un  boolean\nEsta en la linea %d\n", yytext,yylineno);}
 /*Identificador*/
[A-Za-z]+[A-Za-z0-9\_]* {
//printf("%s Es un identificador del lenguaje C\nEsta en la linea %d\n", yytext,yylineno);
return IDENTIFICADOR;
}
 /*NUmero entero*/
[+|-]?[0-9]+ {
//printf("%s Es un numero entero del lenguaje C\nEsta en la linea %d\n", yytext,yylineno);
return INICIALIZADOR;
}
 /*NUmero flotante*/
[+|-]?[0-9]*\.[0-9]+ {
//printf("%s Es un numero flotante del lenguaje C\nEsta en la linea %d\n", yytext,yylineno);
return DECIMAL;
}
[\ \t] {;}
\n {}
 /*error lexico*/
. {
//printf ("%s Error lexico en linea %d, %d\n", yytext,yylineno,yyleng);
}
%%
