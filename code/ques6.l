
%{
  int characterCount = 0,lineCount = 0,spaceCount = 0,wordCount = 0;
%}
word [A-Za-z][A-Za-z0-9]*
line \n
space [ \t]
allChar .
%%
{word}  {++wordCount;characterCount=characterCount+yyleng;}
{line}  {++lineCount;characterCount++;}
{space} {++spaceCount;++characterCount;}
{allChar} {++characterCount;}
%%

int main()
{
  yyin = fopen("test.txt","r");
  yylex();
  printf("character Count: %d\nword Count: %d\nspace Count: %d\nline Count: %d\n",characterCount,wordCount,spaceCount,lineCount);
  return 0;
}
int yywrap()
{
  return 1;
}
