#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    printf("Criando Lista!");

    Lista *p;
    p = cria_lista();

    if(p == NULL){
        printf("Erro de alocacao!");
        system("pause");
        exit(1);
    }

    insere_ord(p, 2);
    insere_ord(p, 4);
    insere_ord(p, 6);

    printf("Imprimindo Lista 1!");
    imprime(p);

    Lista *a;
    a = cria_lista();

    if(a == NULL){
        printf("Erro de alocacao!");
        system("pause");
        exit(1);
    }

    insere_ord(a, 8);
    printf("\nImprimindo Lista 2!\n");
    imprime(a);

    printf("\nRemovendo pares da Lista 1!\n");
    printf("Imprimindo Lista 1!");
    remove_elemento_par(p);
    imprime(p);

    printf("\nRemovendo pares da Lista 2!\n");
    printf("Imprimindo Lista 2!");
    remove_elemento_par(a);
    imprime(a);

    insere_ord(p, 8);
    insere_ord(p, 3);
    insere_ord(p, 2);

    printf("Imprimindo Lista 1!");
    imprime(p);

    insere_ord(a, 4);
    insere_ord(a, 6);
    insere_ord(a, 3);

    printf("Imprimindo Lista 2!");
    imprime(a);

    int maiorP;
    maior_elemento(p, &maiorP);
    printf("\nO maior elemento da Lista 1 e: %d\n", maiorP);
    printf("Imprimindo Lista 1!");
    imprime(p);

    int igual = verifica_igualdade(p, a);
    if(igual == 1){
        printf("A Lista 1 e a Lista 2 sao iguais!");
    }else{
        printf("A Lista 1 e a Lista 2 sao diferentes!");
    }

    printf("\nRemovendo pares da Lista 1!\n");
    remove_elemento_par(p);
    printf("\nRemovendo pares da Lista 2!\n");
    remove_elemento_par(a);
    igual = verifica_igualdade(p, a);
    if(igual == 1){
        printf("A Lista 1 e a Lista 2 sao iguais!");
    }else{
        printf("A Lista 1 e a Lista 2 sao diferentes!");
    }

    int tamanhoP;
    tamanho_lista(p, &tamanhoP);
    printf("\nO tamanho da Lista 1 e: %d\n", tamanhoP);
    printf("Imprimindo Lista 1!");
    imprime(p);

    Lista *panda;
    panda = cria_lista();

    if(panda == NULL){
        printf("Erro de alocacao!");
        system("pause");
        exit(1);
    }

    int intercalou = intercala_listas(p, a, &panda);
    if(intercalou == 0){
        printf("Erro no intercala!");
        system("pause");
        exit(1);
    }
    printf("\nImprimindo Lista 3!\n");
    imprime(panda);

    printf("\nRemovendo pares da Lista 3!\n");
    remove_elemento_par(panda);
    printf("\nImprimindo Lista 3!\n");
    imprime(panda);

    return 0;
}
