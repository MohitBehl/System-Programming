
%{
  int characterCount = 0,lineCount = 0,spaceCount = 0,wordCount = 0;
%}
word [A-Za-z][A-Za-z0-9]*
line \n
space [ ]
allChar .
%%
{word}  {int i=0;
  while(i<yyleng)
  {
    for(int j=0;yytext[j+i]!='\0';j++)
    {
      printf("%c",yytext[j]);
    }
      printf("\n");
      i++;
  }
}
%%

int main()
{
  yyin = fopen("ques7Helper.txt","r");
  yylex();
  return 0;
}
int yywrap()
{
  return 1;
}
