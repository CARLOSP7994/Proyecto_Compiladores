%{
  #include <stdil.h>
  #include <stdio.h>
  #define YYSTYPE char*
%}

%token entero flotante tipoD desicion agrupA agrupaC bucle variable sTerminal

%%

Ddato : tipoD variable sTerminal
;

%%

int main() 
{
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
{
  printf("%s\n ", s)
}
int yywrap()
{
 return 1;
}

