%{
  char temp[50];
  int max = -1;
  int count = 1;
%}
word [A-Za-z][A-Za-z0-9]*
%%
{word} {if(max  < yyleng)
        {
          max = yyleng;
          int i=0;
          while(yytext[i] != '\0')
          {
          temp[i] = yytext[i];
          i++;
          }
          temp[i] = '\0';
          count = 1;
        }
        else
        if(max == yyleng)
        count++;
}
. { }
%%
int main()
{
yyin = fopen("ques3Helper.txt","r");
yylex();
if(max != -1)
printf("(one of the)max length word: %s\nlength: %d\ncount: %d\n",temp,max,count);
else
printf("no word found");
return 0;
}
int yywrap()
{
return 1;
}
