%{
int keywordCount = 0,operatorCount = 0,indentifierCount = 0,valueCount = 0,totalChar = 0,commentCount = 0;
static int i=1,j=1,k=1,l=1,m=1;
%}
keyword #include|iostream.h|main|int|double|float|bool|class|return|break|printf|%d|%c|%s|\\n
comments "//"
operator (\+\+)|[(\-\-)]?[\+\-\*\/!%]
indentifier [A-Za-z_][A-Za-z_0-9]*
values [\-\+]?[0-9]+

%%
{comments} {++commentCount;printf("%s :comment %d\n",yytext,m);m++;}
{keyword} {++keywordCount;printf("%s :keyword %d\n",yytext,i);i++;}
{operator}  {++operatorCount;printf("%s :operator %d\n",yytext,j);j++;}
{indentifier} {++indentifierCount;printf("%s :indentifier %d\n",yytext,k);k++;}
{values}  {++valueCount;printf("%s :value %d\n",yytext,l);l++;}

. ++totalChar;
%%
int main()
{
yyin = fopen("ques4Helper.txt","r");
yylex();
printf("keywords: %d\nindentifiers: %d\noperators: %d\nvalues: %d \n",keywordCount,indentifierCount,operatorCount,valueCount);
return 0;
}
int yywrap()
{
return 1;
}
