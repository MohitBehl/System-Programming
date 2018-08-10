%{
int indentifierCount = 0,keywordCount = 0;
static int i = 1,j = 1;
%}
keyword #include|iostream.h|main|int|double|float|bool|class|return|break|printf|%d|%c|%s|\\n
indentifier [A-Za-z_][A-Za-z_0-9]*
%%
{keyword} {++keywordCount;printf("%s: keyword %d\n",yytext,i);i++;}
{indentifier} {++indentifierCount;printf("%s: indentifier %d\n",yytext,j);j++;};
. {}
%%
int main()
{
  yyin = fopen("ques5Helper.txt","r");
  yylex();
  printf("keywordCount = %d\nindentifierCount = %d\n",keywordCount,indentifierCount);
  return 0;
}
int yywrap()
{
return 1;
}
