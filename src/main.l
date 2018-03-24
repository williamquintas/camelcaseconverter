%{
#include <stdio.h>

#include "ccc_lib.h"

char output[50];
char boolean = 0;
%}


%%
([A-Z]*[a-z ]*)*[A-Z][a-z]+([A-Z][a-z]+)+[_].* {
  printf("ERRO");
}

([A-Z]*[a-z ]*)*[a-z]+([_][a-z]+)+[A-Z].* {
  printf("ERRO");
}

[a-z]+([_][a-z]+)+[ ]* {
  underline_to_camelcase(yytext, output);
  printf("%s", output);
}

[A-Z][a-z]+([A-Z][a-z]+)+[ ]* {
  camelcase_to_underline(yytext, output);
  printf("%s", output);
}

[ ][ ]+ {
 printf("%s", yytext);
}

[A-Za-z]*[a-z]+[ ]* {
  printf("%s", yytext);
}
%%

int main() {
  yylex();
  return 0;
}
