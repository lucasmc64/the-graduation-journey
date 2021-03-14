#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

int main()
{
    printf("PILHA!\n");
    int t;
    printf("Qual o tamanho da expressao? ");
    scanf("%d", &t);
    t++;
    char *expressao;
    expressao = (char *) malloc(t*sizeof(char));
    printf("Digite a expressao: ");
    setbuf(stdin, NULL);
    gets(expressao);
    //printf("\n\nPrintando!\n%s", expressao);
    int resp = valida_escopo(expressao);
    if(resp == 1){
        printf("Ai que delicia de escopo, caraa!\n");
    }else{
        printf("Esse escopo fede..."\n);
    }
    return 0;
}
