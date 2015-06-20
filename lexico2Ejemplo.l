%{
/* Necesita esto para la llamada a atof () abajo */
#include <math.h>
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
int|float|double|
bool|String|char                            {
                                                return tipoD;
                                            }

if|else
                                            {
                                                return desicion
                                            }

"["|"{"|"("                                 {
                                                return agrupA;
                                            }
"]"|"]"|")"                                 {
                                                return agrupC;
                                            }

while|for                                   {
                                                return bucle;
                                            }


{ID}                                            return variable;

"+"|"-"|"*"|"/"                                 return operador;

";"                                             return sTerminal; 

   

[ \t\n]+ / * omite el espacio en blanco * /          

.           printf( "Caracter no especificado: %s\n", yytext );

%%

main( argc, argv )
{
    yylex()
}
