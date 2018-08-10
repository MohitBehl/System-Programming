%{
char temp[1000];
%}
word [A-Za-z][A-Za-z0-9]*
%%
{word} {
        int i = 0;
        int length = yyleng;
        while(i < length)
        {
          char ch = yytext[i];
          if(ch >= '0' && ch <= '9')
          {
            temp[i] = (char)('0'+(((ch-'0')+3)%10));
          }
          else
          if(ch >= 'a' && ch <= 'z')
          {
            temp[i] = (char)('a'+(((ch-'a')+3)%26));
          }
          else
          if(ch >= 'A' && ch <= 'Z')
          {
            temp[i] = (char)('A'+(((ch-'A')+3)%26));
          }
        i++;
        }
        printf("original :%s\ncyphered :%s\n",yytext,temp);
}
. { }
%%
int main()
{
yyin = fopen("ques2Helper.txt","r");
yylex();
return 0;
}
int yywrap()
{
return 1;
}
