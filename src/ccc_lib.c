#include "stdio.h"
#include "string.h"
#include "ccc_lib.h"

void camelcase_to_underline(char *input, char *output) {
  int i = 1, j = 1;
  //passa o primeiro caracter da palavra para minusculo
  output[0] = input[0] + 32;
  //procura por letras em maiusculo
  while (i < strlen(input)) {
    if (input[i] >= 65 && input[i] <= 90) {
      output[j] = '_';
      j++;
      output[j] = input[i] + 32;
      i++;
      j++;
    }
    else {
      output[j] = input[i];
      i++;
      j++;
    }
  }
  output[j] = 0;

  return;
}

void underline_to_camelcase(char *input, char *output) {
  //Declaração de variáveis
  char * pch;
  int writer = 0, reader = 0;
  //Copia input para output
  strcpy(output, input);
  //Camelcase o primeiro caracter da palavra
  output[0] = input[0] - 32;
  //Pega a primeira posição do primeiro caracter em input
  pch=strchr(input,'_');
  //Enquanto não chegar no fim da palavra
  while (pch!=NULL)
  {
    //Converte o caracter após o _
    output[pch-input+1] = input[pch-input+1]-32;
    //Procura o próximo _
    pch=strchr(pch+1,'_');
  }

  /* TIRA _ DA SAÍDA */
  while (output[reader])//Enquanto não chega no fim da palavra
  {
      if (output[reader]!='_')//Se diferente de _, copia o caracter
      {
          output[writer++] = output[reader];
      }
      reader++;
  }

  output[writer]=0;//Fecha string
  return;
}

void primeira_palavra(char *boolean) {
  if (*boolean == 0) {
    *boolean = 1;
  }
  else {
    printf(" ");
  }
}
