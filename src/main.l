

%{
#include <stdio.h>

#include "ccc_lib.h"

char output[50];
%}


%%

[a-z]+([_][a-z]+)+ {
  underline_to_camelcase(yytext, output);
  printf("%s ", output);
}

[A-Z][a-z]+([A-Z][a-z]+)+ {
  camelcase_to_underline(yytext, output);
  printf("%s ", output);
}

[ \t\r] {
  printf(" ");
}

[A-Za-z][a-z]+ {
  printf("%s ", yytext);
}

. {
  printf("ERRO");
}
%%

int main() {
  yylex();
  return 0;
}
