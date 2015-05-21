%{
#include <stdio.h>
#include <stdlib.h>
int numlin = 1;
void error(char*);
%}

%%
for|switch|case	|
if|break|do	|
else|int|float	|
double|long	|
short|char	|
String|bool	|
printf|cout|cin |
scan|#include	|
while		{
	printf("%s:Palabras Reservadas\n",yytext);
		}

[a-zA-z]+ {
	printf("%s:Palabras no Reservadas\n",yytext);
};
[+|-]?[0-9 ]+ {
         printf("%s : Numero entero", yytext); 
         };
[+|-]?[0-9 ]*[.][0-9]+  {
        printf("%s : Numero decimal", yytext);
        };
[+|-]?[l0-9 ]+[.]?[0-9]+[e][+|-]?[0-9 ]*[.][0-9]+  { 
        printf ("%s : Numero notacion cientifi", yytext);
        };
%%
int main(int argc, char** argv){
	int s;
	if (argc>1) yyin=fopen(argv[1],"r");/*else yyin stdin*/
	do printf("%i ",s=yylex());while(s != 0);
	return 0;
}
void error(char* mens){
	printf("Error lexico en linea %i: ",numlin,mens);
}
