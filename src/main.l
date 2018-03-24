

%{
#include <stdio.h>

#include "ccc_lib.h"

char output[50];
char boolean = 0;
%}


%%

[a-z]+([_][a-z]+)+ {
  primeira_palavra(&boolean);
  underline_to_camelcase(yytext, output);
  printf("%s", output);
}

[A-Z][a-z]+([A-Z][a-z]+)+ {
  camelcase_to_underline(yytext, output);
  printf("%s", output);
}

[ ] {
  printf(" ");
}

[A-Za-z][a-z]+ {
  printf("%s", yytext);
}

. {
  printf("ERRO");
}
%%

int main() {
  yylex();
  return 0;
}
