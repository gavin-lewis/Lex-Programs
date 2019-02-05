%{
	#include<stdio.h>
	#include<string.h>
	int count=0,a[50],struct_len=0;
	struct e
	{char name[50];};
	struct e entry[50];
	int lookup(char wr[])
	{       
    		for(int i=0;i<struct_len;i++)
    			if(strcmp(entry[i].name,wr)==0)
    				return i;
    		return -1;
	}
	void addiden(char wr[])
	{    
  	      	count=lookup(wr)+1;
        	if(count==0)
        	{	strcpy(entry[struct_len].name,wr);
        		printf("\nADDED NEW IDENTIFIER %s and is %d",wr,struct_len+1);
        		struct_len++;
        	}
        	else
        	  	printf("\nIdentifier no %d and identifier name is %s",count,entry[count-1].name);   
        	printf("\n"); 	
	}
%}

%%
\n {}
[\'\ \'] {}
[\\t] {printf("%s tab\n", yytext );}
#include<[a-zA-Z]*.h> {printf("%s Header file\n", yytext );}
auto|double|main|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|const|float|short|unsigned|continue|for|signed|void|default|goto|sizeof|volatile|do|if|static|while  {printf("%s Keyword\n", yytext );}
[0-9]*.[0-9]*[+|-][0-9]*.[0-9]*i {printf("%s Complex Number\n", yytext );}
[0-9]*.[0-9]*[+|-]i[0-9]*.[0-9]* {printf("%s Complex Number\n", yytext );}
[a-zA-Z_][a-zA-Z0-9_]* {{addiden(yytext);}}
==|!=|>|<|>=|<= {printf("%s Comparison Operator\n", yytext );}
= {printf("%s Assignment Operator\n", yytext );}
,|; {}
\+|\-|\*|\/|\%|\+\+|\-\- {printf("%s Arthmetic Operator\n", yytext );}
&&|\|\||! {printf("%s Logical Operator\n", yytext );}
&|\||^|~|>>|<< {printf("%s Logical Operator\n", yytext );}
\{|\}|\[|\]|\(|\) {printf("%s Brackets\n", yytext );}
\"[a-zA-Z0-9_]*\" {printf("%s String \n", yytext );}

%%
int main()
{
	yyin=fopen("cfile.c","r");
	yylex();
}
int yywrap()
{
	return 1;
}
