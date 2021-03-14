#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    printf("CRIANDO LISTA!");
    Lista *p;
    p = cria_lista();

    if(p == NULL){
        printf("Erro na alocacao");
        system("pause");
        exit(1);
    }

    insere_elemento(p, 1);
    insere_elemento(p, 3);
    insere_elemento(p, 5);

    printf("\nImprimindo Lista 1!\n");
    imprime(p);

    Lista *a;

    a = cria_lista();

    if(a == NULL){
        printf("Erro na alocacao");
        system("pause");
        exit(1);
    }

    insere_elemento(a, 7);

    printf("\nImprimindo Lista 2!\n");

    imprime(a);

    printf("\nRemovendo impares da Lista 1!\n");
    printf("\nImprimindo Lista 1!\n");
    remove_elemento_impar(p);
    imprime(p);

    printf("\nRemovendo impares da Lista 2!\n");
    printf("\nImprimindo Lista 2!\n");
    remove_elemento_impar(a);
    imprime(a);

    printf("\n\n");

    insere_elemento(p, 2);
    insere_elemento(p, 3);
    insere_elemento(p, 8);

    printf("\nImprimindo Lista 1!\n");
    imprime(p);

    insere_elemento(a, 7);
    insere_elemento(a, 4);
    insere_elemento(a, 5);

    printf("\nImprimindo Lista 2!\n");
    imprime(a);

    int menorA;
    menor_elemento(a, &menorA);
    printf("\nO menor elemento da Lista 2 e: %d\n", menorA);
    printf("\nImprimindo Lista 2!\n");
    imprime(a);

    int tamanhoP;
    tamanho_lista(p, &tamanhoP);
    printf("\nO tamanho da Lista 1 e: %d\n", tamanhoP);
    printf("\nImprimindo Lista 1!\n");
    imprime(p);

    Lista *panda;

    panda = cria_lista();

    if(panda == NULL){
        printf("Erro na alocacao");
        system("pause");
        exit(1);
    }

    concatena_listas(p, a, &panda);

    printf("\nImprimindo Lista 3!\n");
    imprime(panda);

    printf("\nRemovendo impares da Lista 3!\n");
    printf("\nImprimindo Lista 3!\n");
    remove_elemento_impar(panda);
    imprime(panda);
    return 0;
}
