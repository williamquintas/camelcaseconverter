#include "string.h"
#include "ccc_lib.h"

void camelcase_to_underline(char *input, char *output) {

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
