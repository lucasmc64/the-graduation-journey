#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    printf("CRIANDO LISTA!");
    Lista *p;
    p = cria_lista();

    insere_elemento_final(&p, 1);
    insere_elemento_final(&p, 3);
    insere_elemento_final(&p, 5);

    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    printf("\nRemovendo impares da Lista 1!\n");
    printf("\nImprimindo Lista 1!\n");
    remove_impar(&p);
    imprime(&p);

    insere_elemento_final(&p, 1);
    insere_elemento_final(&p, 8);
    insere_elemento_final(&p, 4);
    insere_elemento_final(&p, 3);

    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    printf("\n\n");

    int menorP;
    menor_elemento(&p, &menorP);
    printf("\nO menor elemento da Lista 1 e: %d\n", menorP);
    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    int tamanhoP;
    tamanho_lista(&p, &tamanhoP);
    printf("\nO tamanho da Lista 1 e: %d\n", tamanhoP);
    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    printf("\nRemovendo impares da Lista 1!\n");
    remove_impar(&p);
    tamanho_lista(&p, &tamanhoP);
    printf("\nO tamanho da Lista 1 e: %d\n", tamanhoP);
    printf("\nImprimindo Lista 1!\n");
    imprime(&p);

    Lista *a;
    a = cria_lista();

    insere_elemento_final(&a, 1);
    insere_elemento_final(&a, 1);
    insere_elemento_final(&a, 3);

    printf("\nImprimindo Lista 2!\n");
    imprime(&a);

    Lista *panda;
    panda = cria_lista();

    concatena(p, a, &panda);

    printf("\nImprimindo Lista 3!\n");
    imprime(&panda);

    printf("\nRemovendo impares da Lista 1!\n");
    remove_impar(&panda);
    printf("\nImprimindo Lista 3!\n");
    imprime(&panda);
    return 0;
}
