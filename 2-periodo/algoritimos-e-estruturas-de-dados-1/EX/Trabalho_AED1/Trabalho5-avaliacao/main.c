#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    printf("Criando Lista!");

    Lista *p;
    p = cria_lista();

    insere_ord(&p, 2);
    //insere_ord(&p, 7);
    insere_ord(&p, 6);

    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    Lista *a;
    a = cria_lista();

    insere_ord(&a, 8);
    printf("\nImprimindo Lista 2!\n");
    imprime(&a);

    printf("\nRemovendo pares da Lista 1!\n");
    printf("\nImprimindo Lista 1!\n");
    remove_par(&p);
    imprime(&p);

    printf("\nRemovendo pares da Lista 2!\n");
    printf("\nImprimindo Lista 2!\n");
    remove_par(&a);
    imprime(&a);

    insere_ord(&p, 8);
    insere_ord(&p, 3);
    insere_ord(&p, 2);
    insere_ord(&p, 5);

    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    insere_ord(&a, 4);
    insere_ord(&a, 6);
    insere_ord(&a, 3);

    printf("\nImprimindo Lista 2!\n");
    imprime(&a);

    int maiorP;
    maior_elemento(&p, &maiorP);
    printf("\nO maior elemento da Lista 1 e: %d\n", maiorP);
    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    int menorA;
    menor_elemento(&a, &menorA);
    printf("\nO menor elemento da Lista 2 e: %d\n", menorA);
    printf("\nImprimindo Lista 2!\n");
    imprime(&a);

    int igual = verificar_igualdade(&p, &a);
    if(igual == 1){
        printf("\nA Lista 1 e a Lista 2 sao iguais!\n");
    }else{
        printf("\nA Lista 1 e a Lista 2 sao diferentes!\n");
    }

    printf("\nRemovendo pares da Lista 1!\n");
    remove_par(&p);
    printf("\nRemovendo pares da Lista 2!\n");
    remove_par(&a);
    igual = verificar_igualdade(&p, &a);
    if(igual == 1){
        printf("\nA Lista 1 e a Lista 2 sao iguais!\n");
    }else{
        printf("\nA Lista 1 e a Lista 2 sao diferentes!\n");
    }

    int tamanhoP;
    tamanho_lista(&p, &tamanhoP);
    printf("\nO tamanho da Lista 1 e: %d\n", tamanhoP);
    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    insere_ord(&a, 5);
    printf("\nImprimindo Lista 2!\n");
    imprime(&a);

    igual = verificar_igualdade(&p, &a);
    if(igual == 1){
        printf("\nA Lista 1 e a Lista 2 sao iguais!\n");
    }else{
        printf("\nA Lista 1 e a Lista 2 sao diferentes!\n");
    }

    return 0;
}
