%{
int ch = 0,words=0,lines=0,tabs=0,nums=0,kwords=0,s=0,id=0,ctr,i,len=0,total=0,alpha=0;
%}

%%
\n {lines++;words++;}
[\t] {tabs++;}
[\t' '] {words++;}
(int|void|main|printf|return) {kwords++;}
[a-zA-Z] {alpha++;}
[''.] {s++;}
[/*+-^=,&${}().;] {ch++;}
[0-9][0-9]* {nums++;}
%%

int main()
{
	yyin = fopen("abc.c","r");
	yylex();
	total = alpha+ch;
	printf("\nNumber of lines : %d\n",lines);
	printf("Number of tabs : %d\n",tabs);
	printf("Numbers : %d\n",nums);
	printf("Number of Sentences : %d\n",s);
	printf("Number of words : %d\n",words);
	printf("Total number of characters : %d\n",total);
	return 0;
}
int yywrap()
{
	return 1;
}