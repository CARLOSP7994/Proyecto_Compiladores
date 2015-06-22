%option yylineno
%option noyywrap
%{
/* Necesita esto para la llamada a atof () abajo */
#include <math.h>
#include "gramatico.tab.h"
%}

DIGIT    [0-9]
ID       [a-z][a-z0-9]*
String   [a-zA-Z0-9]*

%%

{DIGIT}+                                    {
                                                return entero;
                                            }

{DIGIT}+"."{DIGIT}*                         {
                                                return flotante;
                                            }
int |
char                                    {
                                               return tipoD;
                                            }
if |
then |
else |
while |
do  					    {
					       return  Reservada;
					    }
"["|"{"|"("                                 {
                                                return agrupA;
                                            }
"]"|"]"|")"                                 {
                                                return agrupC;
                                            }

[A-Za-z]+[A-Za-z0-9\_]*{ID}                 {  return variable;}

"+"|"-"|"*"|"/"                             {  return operador;}

";"                                         {  return sTerminal;} 


">" |
"!=" |
"==" |
"<=" |
">=" |
"<" 					    {
						return Comparacion;
                                            }   
"="                                         {
						return asg;
					    }
\n       				    {
                                               return('\n');
         		                    }
	                  
%%
