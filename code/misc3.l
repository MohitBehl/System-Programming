%{
int vowelCount = 0,letterCount = 0;
%}
vowels a|e|i|o|u|A|E|I|O|U
letters [A-Za-z]
%%
{vowels} {++vowelCount;++letterCount;}
{letters} {++letterCount;}
. { }
%%
int main()
{
yyin = fopen("misc3Helper.txt","r");
yylex();
printf("total alphabet literals: %d\nvowel count: %d\nconsonant count: %d\n",letterCount,vowelCount,letterCount-vowelCount);
return 0;
}
int yywrap()
{
return 1;
}
