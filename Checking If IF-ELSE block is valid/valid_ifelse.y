%{
	#include<stdio.h>
	#include<math.h>
	#include<stdlib.h>	
%}

%token id IF THEN LE GE EQ NE OR AND ELSE EQU SC
%left '+' '-' '*' '/' EQU
%start G

%%

G : S {printf("Valid\n");}
  ;
S : IF'('C')''{'B SC'}'ELSE'{'B SC'}'
  ;
B : S
  | E
E : E'+'E 
  | E'-'E 
  | E'*'E 
  | E'/'E
  | E EQU E
  | id 
  ;
C : E'+'E
  | E'-'E
  | E'*'E 
  | E'/'E 
  | E'<'E
  | E GE E
  | E EQU E
  | E LE E
  | E EQ E
  | E NE E
  | E OR E
  | E AND E
  | id
  ;
%%

int main()
{
	printf("Enter expression : \n");
	yyparse();
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
