

%{
#include <stdio.h>

#include "ccc_lib.h"

char output[50];
char boolean = 0;
%}


%%

[A-Z][a-z]+([A-Z][a-z]+)+[_].* {
  printf("ERRO");
}

[a-z]+([_][a-z]+)+[A-Z].* {
  printf("ERRO");
}

[a-z]+([_][a-z]+)+ {
  primeira_palavra(&boolean);
  underline_to_camelcase(yytext, output);
  printf("%s", output);
}

[A-Z][a-z]+([A-Z][a-z]+)+ {
  primeira_palavra(&boolean);
  camelcase_to_underline(yytext, output);
  printf("%s", output);
}

[ ][ ]+ {
 printf("%s", yytext);  
}

[A-Za-z]*[a-z]+ {
  primeira_palavra(&boolean);
  printf("%s", yytext);
}

. {
}
%%

int main() {
  yylex();
  return 0;
}
