

%{
#include <stdio.h>

#include "ccc_lib.h"

char output[50];
%}


%%

[a-z]+([_][a-z]+)+ {
  printf("entrou com underline\n");
  printf("%s", yytext);
  underline_to_camelcase(yytext, output);
  printf("%s ", output);
}

([A-Z][a-z]+[A-Z][a-z]+)+ {
  //printf("sem underline: %s\n", yytext);
}

[ \n\t\r]+ {
}

[A-Z][a-z]+ {
  printf("%s", yytext);
}

[a-z]+ {
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
