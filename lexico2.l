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
int|char                                    {
                                               return tipoD;
                                            }

if
                                            {
                                                return desicionI;
                                            }
else                                        {
                                                return desicionE;
                                            }

"["|"{"|"("                                 {
                                                return agrupA;
                                            }
"]"|"]"|")"                                 {
                                                return agrupC;
                                            }

while                                       {
                                                return bucle;
                                            }


{ID}                                            return variable;

"+"|"-"|"*"|"/"                                 return operador;

";"                                             return sTerminal; 

   
"=="                                        {
                                                return Ologico;
					    }
"="                                         {
						return asg;
					    }
\n       				    {
                                               return('\n');
         		                    }	                  
%%
