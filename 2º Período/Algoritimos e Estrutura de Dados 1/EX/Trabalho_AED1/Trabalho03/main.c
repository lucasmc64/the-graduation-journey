#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    Lista *p;
    printf("CRIANDO LISTA!\n");
    p = cria_lista();
    if(p == NULL){
        printf("Erro na criacao da lista!");
        system("pause");
        exit(1);
    }
    imprime(p);
    int vazia = lista_vazia(p);
    if(vazia == 0){
        printf("Erro! Lista não vazia!");
        system("pause");
        exit(1);
    }
    int cheia = lista_cheia(p);
    if(cheia == 1){
        printf("Erro! Lista cheia!");
    }
    int num, i;

    for(i = 0; i < maximo; i++){
        printf("Digite o elemento a ser inserido: \n");
        scanf("%d", &num);
        //Números pares serão inseridos no final da lista e ímpares no início
        int verificar = insere_ord(p, num);
        if(verificar == 0){
            printf("Houve algum erro na insercao do elemento!\n");
            //system("pause");
            //exit(1);
        }
    }
    imprime(p);
    printf("\nRemovendo!\n");
    int K;
    printf("Digite o elemento a ser removido: ");
    scanf("%d", &K);
    remove_ord(p,K);
    imprime(p);
    printf("\nRemovendo pares!\n");
    remove_elemento_par(p);
    imprime(p);
    int maior, tamanho;
    maior_elemento(p,&maior);
    printf("\nMaior elemento: %d\n", maior);
    tamanho_lista(p,&tamanho);
    printf("\ntamanho da lista: %d\n", tamanho);




    Lista *q;
    printf("CRIANDO LISTA!\n");
    q = cria_lista();
    if(q == NULL){
        printf("Erro na criacao da lista!");
        system("pause");
        exit(1);
    }
    imprime(q);
    int vazia1 = lista_vazia(q);
    if(vazia1 == 0){
        printf("Erro! Lista não vazia!");
        system("pause");
        exit(1);
    }
    int cheia1 = lista_cheia(q);
    if(cheia1 == 1){
        printf("Erro! Lista cheia!");
    }
    int num1, i1;

    for(i1 = 0; i1 < maximo; i1++){
        printf("Digite o elemento a ser inserido: \n");
        scanf("%d", &num1);
        //Números pares serão inseridos no final da lista e ímpares no início
        int verificar = insere_ord(q, num1);
        if(verificar == 0){
            printf("Houve algum erro na insercao do elemento!\n");
            //system("pause");
            //exit(1);
        }
    }
    imprime(q);
    printf("\nRemovendo!\n");
    int Ke;
    printf("Digite o elemento a ser removido: ");
    scanf("%d", &Ke);
    remove_ord(q,Ke);
    imprime(q);
    printf("\nRemovendo pares!\n");
    remove_elemento_par(q);
    imprime(q);
    printf("\nAs lista P e Q sao iguais???\n");
    int iguais = verifica_igualdade(p,q);
    if(iguais == 0){
        printf("\n\t\tAs listas nao sao iguais ou... Algo de errado nao esta certo...\n");
    }else{
        printf("\n\t\tSIMMMMMM!!!\n");
    }



    Lista *PQ;
    printf("CRIANDO LISTA!\n");
    PQ = cria_lista();
    if(PQ == NULL){
        printf("Erro na criacao da lista!");
        system("pause");
        exit(1);
    }
    imprime(PQ);
    int vazia2 = lista_vazia(PQ);
    if(vazia2 == 0){
        printf("Erro! Lista não vazia!");
        system("pause");
        exit(1);
    }
    int cheia2 = lista_cheia(PQ);
    if(cheia2 == 1){
        printf("Erro! Lista cheia!");
    }
    printf("\nIntercalando P e Q!\n\n");
    intercala_listas(p,q,&PQ);
    imprime(PQ);
    printf("\n");
    return 0;
}
