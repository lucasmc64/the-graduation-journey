#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    Lista *p;
    printf("CRIANDO LISTA!\n");
    p = inicializar_lista();
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
    if(cheia == 0){
        printf("Erro! Lista cheia!");
    }
    int num;
    int resp = 1;
    while(resp != -1){

        printf("Digite o elemento a ser inserido: \n");
        scanf("%d", &num);

        int verificar = insere_elemento(p, num);
        if(verificar == 0){
            printf("Houve algum erro na insercao do elemento!\n");
            break;
            //system("pause");
            //exit(1);
        }
        printf("Quer inserir? [1/-1]\n");
        scanf("%d", &resp);
    }
    imprime(p);
    int ovelha_negra;
    printf("\nDigite o elemento a ser retirado: ");
    scanf("%d", &ovelha_negra);
    remove_elemento(p,ovelha_negra);
    imprime(p);
    printf("\nFINALIZADO COM SUCESSO!");
    return 0;
}
