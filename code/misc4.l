%{
int positiveFCount = 0;
int negativeFCount = 0;
int slashFound(char *ch,int len)
{
  for(int i=0;i<len;i++)
  {
    if(ch[i] == '/')
    return i;
  }
  return -1;
}
%}
digit [+-]?[0-9]+([/][+-]?[0-9]+)?
%%
{digit} {
          int length = yyleng;
          int resultSlash = slashFound(yytext,length);
          if(resultSlash == -1)
          {
            if(yytext[0] == '-')
            ++negativeFCount;
            else
            ++positiveFCount;
          }
          else
          {
            if(yytext[0] == '-' && yytext[resultSlash+1] == '-')
            ++positiveFCount;
            else
            if(yytext[0] == '-' && yytext[resultSlash+1] != '-')
            ++negativeFCount;
            else
            if(yytext[0] != '-' && yytext[resultSlash+1] == '-')
            ++negativeFCount;
            else
            if(yytext[0] != '-' && yytext[resultSlash+1] != '-')
            ++positiveFCount;
          }
}
. { }
%%
int main()
{
  yyin = fopen("misc4Helper.txt","r");
  yylex();
  printf("positive fraction count: %d\nnegative fraction count: %d\n",positiveFCount,negativeFCount);
  return 0;
}
int yywrap()
{
return 1;
}
