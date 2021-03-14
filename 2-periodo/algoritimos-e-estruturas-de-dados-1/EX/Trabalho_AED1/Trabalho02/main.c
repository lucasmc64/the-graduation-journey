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
        if(num % 2 == 0){
            int verificar = insere_elemento(p, num);
            if(verificar == 0){
                printf("Houve algum erro na insercao do elemento!\n");
                //system("pause");
                //exit(1);
            }
        }else{
            int verificar = insere_elemento_no_inicio(p, num);
            if(verificar == 0){
                printf("Houve algum erro na insercao do elemento!\n");
                //system("pause");
                //exit(1);
            }
        }
    }
    int menor, tamanho;
    imprime(p);
    menor_elemento(p,&menor);
    printf("\nMenor elemento: %d\n",menor);
    tamanho_lista(p,&tamanho);
    printf("\nO tamanho da lista eh %d\n",tamanho);
    int ovelha_negra;
    printf("\nDigite o elemento a ser retirado: ");
    scanf("%d", &ovelha_negra);
    remove_elemento(p,ovelha_negra);
    imprime(p);
    printf("\nRemovendo impares!\n");
    remove_elemento_impar(p);
    printf("Esse e o P!\n");
    imprime(p);
    //printf("\nFim remove impar\n");
    /*
    printf("\nRemovendo todos!\n");
    remove_todos(p);
    imprime(p);
    */

    Lista *q;
    printf("\n\nCRIANDO LISTA 2!\n");
    q = cria_lista();
    if(q == NULL){
        printf("Erro na criacao da lista!");
        system("pause");
        exit(1);
    }
    imprime(q);
    vazia = lista_vazia(q);
    if(vazia == 0){
        printf("Erro! Lista não vazia!");
        system("pause");
        exit(1);
    }
    cheia = lista_cheia(q);
    if(cheia == 1){
        printf("Erro! Lista cheia!");
    }

    for(i = 0; i < 5; i++){
        printf("Digite o elemento a ser inserido: \n");
        scanf("%d", &num);
        //Números pares serão inseridos no final da lista e ímpares no início
        if(num % 2 == 0){
            int verificar = insere_elemento(q, num);
            if(verificar == 0){
                printf("Houve algum erro na insercao do elemento!\n");
                //system("pause");
                //exit(1);
            }
        }else{
            int verificar = insere_elemento_no_inicio(q, num);
            if(verificar == 0){
                printf("Houve algum erro na insercao do elemento!\n");
                //system("pause");
                //exit(1);
            }
        }
    }
    printf("\nRemovendo impares!\n");
    remove_elemento_impar(q);
    imprime(q);
    //printf("\nFim remove impar\n");
    /*
    printf("\nRemovendo todos!\n");
    remove_todos(p);
    imprime(p);
    */
    printf("\n\n\nP\n");
    imprime(p);
    printf("\n\n\nQ\n");
    imprime(q);
    printf("\n\n\n");
    Lista *L3;
    L3 = cria_lista();
    concatena_listas(p, q, &L3);
    printf("\nLISTA CONCATENADA!\n");
    imprime(L3);
    printf("\nFINALIZADO COM SUCESSO!");
    return 0;
}
