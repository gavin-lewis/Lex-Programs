%{
	#include<stdio.h>
	#include<math.h>
	#include<stdlib.h>	
%}

%token num
%left '+' '-'

%%

S : E {printf("Result is %d\n",$1);}
  ;
E : E'+'E {$$ = $1 + $3;}
  | E'-'E {$$ = $1 - $3;}
  | num {$$ = $1;}
  ;
%%

int main()
{
	printf("Enter Arithmetic expression : \n");
	yyparse();
	printf("Arithmetic expression is valid\n");
	return 0;
}

int yyerror()
{
	printf("Expression is invalid\n");
	exit(0);
}

int yywrap()
{
	return 1;
}
