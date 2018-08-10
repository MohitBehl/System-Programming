%{
int charCount = 0;
%}

%%
. ++charCount;
%%
int main()
{
yyin = fopen("test.txt","r");
yylex();
printf("number of characters: ");
printf("%d",charCount);
}
int yywrap()
{
	return 1;	
}
