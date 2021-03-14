#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tad.h"

int main(){
    printf("+ + + + + Conversao de Expressoes Matematicas! + + + + +\n");
    int aaj[maxaaj];
    printf("Defina: \n");
    printf("Valor de A: ");
    scanf("%d", &aaj[0]);
    printf("Valor de B: ");
    scanf("%d", &aaj[1]);
    printf("Valor de C: ");
    scanf("%d", &aaj[2]);
    printf("Valor de D: ");
    scanf("%d", &aaj[3]);
    printf("Valor de E: ");
    scanf("%d", &aaj[4]);
    printf("Valor de F: ");
    scanf("%d", &aaj[5]);
    printf("Valor de G: ");
    scanf("%d", &aaj[6]);
    printf("Valor de H: ");
    scanf("%d", &aaj[7]);
    printf("Valor de I: ");
    scanf("%d", &aaj[8]);
    printf("Valor de J: ");
    scanf("%d", &aaj[9]);

    int opcao;
    char expressao[500];
    printf("\nEscolha:\n[1] Entrar com expressoes na forma pos-fixa\n[2] Entrar com espressoes na forma infixa com TODOS os parenteses\n[3] Entrar com espressoes na forma infixa com parenteses OCASIONAIS\n");
    scanf("%d", &opcao);
    printf("\nDigite a expressao: ");
    setbuf(stdin, NULL);
    gets(expressao);

    int resposta;
    if(opcao == 1){
        pos_fixa(expressao, aaj);
    }

    printf("\nResultado: %d\n", resposta);
    return 0;
}
