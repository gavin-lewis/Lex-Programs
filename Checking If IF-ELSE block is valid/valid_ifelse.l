%{
	#include "y.tab.h"
	extern int yylval;
%}

%%

if    {return IF;}
then  {return THEN;}
else   {return ELSE;}
[0-9]+  {yylval = atoi(yytext);return id;}
[A-Za-z]([A-Za-z]|[0-9])* {return id;}
";"     {return SC;}
"<="    {return LE;}
">="    {return GE;}
"=="    {return EQ;}
"!="    {return NE;}
"||"    {return OR;}
"&&"    {return AND;}
"="     {return EQU;}
\n {return 0;}
. {return yytext[0];}

%%



