/*Analizador lexico*/
%option yylineno
%option noyywrap
%{
#include <stdio.h>
#include<stdlib.h>
#include "gramatico.tab.h"
%}
identificador 		[_a-zA-Z]([_a-zA-Z]|[0-9])*
 /*Tipos de datos */
int                                       "int"
float                                     "float"
double                                    "double"
char                                      "char"
void                                      "void"

 /*Estructuras de control*/
if	"if"
while	"while"
else	"else"
do	"do"
for	"for"
break	"break"
return	"return"
 /*Datos(enteros, reales,string,etc)*/
entero		"("[+-][0-9]+")"|[0-9]+
real		"("[+-][0-9]+"."[0-9]+")"|[0-9]+"."[0-9]+
caracter	"'"[a-zA-Z]"'"

%%

{char}				{/*yylval.tipo = 1;*/ return CHAR; 	}
{int}				{/*yylval.tipo = 4;*/ return INT;   } 
{float}				{/*yylval.tipo = 3;*/ return FLOAT;	}

{double}			{/*yylval.tipo = 2;*/ return DOUBLE;	}

{void}				{/*yylval.tipo = 5;*/ return VOID; }

{if}				{return IF;		}

{while}				{return WHILE;	}

{else}				{return ELSE;		}

{do}				{return DO;		}

{for}				{return FOR;		}

{break}				{return BREAK;	}

{return}			{return RETURN;	}



{identificador}			{
					/*int i = 0;
					for( ;yytext[i] != '\0'; i++) {}
					i++;*/ /*Espaço para o \0 da String*/
					//yylval.string = (char*)malloc(i * sizeof(char));
					//strcpy(yylval.string , yytext);
					return IDENTIFICADOR;	
				}



{entero}			{
					//yylval.entero = atoi(yytext);
					return ENTERO; 	
				}

{real}				{
					//yylval.real = atof(yytext);
					return REAL;
				}

{caracter}			{
					//yylval.caracter = yytext[1];				
					return CARACTER;		
				}


"("				{return PARENTESIS_IZQUIERDO;	}

")"				{return PARENTESIS_DERECHO;	}

"{"				{return LLAVE_IZQUIERDA;	}

"}"				{return LLAVE_DERECHA;	}

"+"				{return MAS;	}

"-"				{return MENOS;	}

"*"				{return MULT;	}

"/"				{return DIVISION;	}

"++"				{return INCREMENTO;	}				

"--"				{return DECREMENTO;	}	

">"				{return MAYOR;	}

"<"				{return MENOR;	}

">="				{return MAYOR_IGUAL;	}

"<="				{return MENOR_IGUAL;	}

"=="				{return IGUAL;	}



"="				{return ATRIBUCION;	}

";"				{return PUNTO_COMA;	}

","				{return COMA;	}

"\n"				{return EOL;}
%%

 		
