#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    printf("Criando Lista!");

    Lista *p;
    p = cria_lista();

    insere_ord_cabecalho(&p, 2);
    insere_ord_cabecalho(&p, 4);
    insere_ord_cabecalho(&p, 6);

    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    int tamanho;
    tamanho_lista(&p, &tamanho);
    printf("\nO tamanho da Lista 1 e: %d\n", tamanho);

    Lista *a;
    a = cria_lista();

    insere_ord_cabecalho(&a, 8);
    printf("\nImprimindo Lista 2!\n");
    imprime(&a);

    tamanho;
    tamanho_lista(&a, &tamanho);
    printf("\nO tamanho da Lista 2 e: %d\n", tamanho);

    printf("\nRemovendo pares da Lista 1!\n");
    printf("\nImprimindo Lista 1!\n");
    remove_par(&p);
    imprime(&p);

    printf("\nRemovendo pares da Lista 2!\n");
    printf("\nImprimindo Lista 2!\n");
    remove_par(&a);
    imprime(&a);

    insere_ord_cabecalho(&p, 8);
    insere_ord_cabecalho(&p, 3);
    insere_ord_cabecalho(&p, 2);

    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    insere_ord_cabecalho(&a, 4);
    insere_ord_cabecalho(&a, 6);
    insere_ord_cabecalho(&a, 3);

    printf("\nImprimindo Lista 2!\n");
    imprime(&a);

    int menorP;
    menor_elemento(&p, &menorP);
    printf("\nO menor elemento da Lista 1 e: %d\n", menorP);
    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

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

    Lista *panda;
    panda = cria_lista();

    int intercalou = intercala_listas(&p, &a, &panda);
    if(intercalou == 0){
        printf("Algo deu errado no intercala!");
        system("pause");
        exit(1);
    }

    printf("\nImprimindo Lista 3!\n");
    imprime(&panda);

    printf("\nRemovendo pares da Lista 3!\n");
    remove_par(&panda);

    printf("\nImprimindo Lista 3!\n");
    imprime(&panda);
    return 0;
}
