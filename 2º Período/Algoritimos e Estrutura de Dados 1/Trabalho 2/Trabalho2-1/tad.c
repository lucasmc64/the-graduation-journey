#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct lista{
    int info;
    struct lista *prox;
};



Lista *cria_lista(){
    return NULL;
}



int lista_vazia(Lista *p){
    if(p == NULL){
        return 1; //Lista vazia
    }else{
        return 0; //Lista NÃO vazia
    }
}



int tamanho_lista(Lista **p, int *tamanho){
    int t = 0;
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }
    Lista *aux = (*p)->prox;
    //Primeiro elem
    t++;
    aux = aux->prox;
    //Demais elem
    while(aux != (*p)->prox){
        t++;
        aux = aux->prox;
    }
    *tamanho = t;
    //free(aux);
    return 1;
}



int insere_final(Lista **p, int n){
    Lista *N;
    N = (Lista *) malloc(sizeof(Lista));
    if(N == NULL){
        return 0;
    }

    N->info = n;
    if(lista_vazia(*p) == 1){
        N->prox = N;
        *p = N;
    }else{
        N->prox = (*p)->prox;
        (*p)->prox = N;
        *p = N;
    }
    return 1;
}



int insere_inicio(Lista **p, int n){
    Lista *N;
    N = (Lista *) malloc(sizeof(Lista));
    if(N == NULL){
        return 0;
    }

    N->info = n;
    if(lista_vazia(*p) == 1){
        N->prox = N;
        *p = N;
    }else{
        N->prox = (*p)->prox;
        (*p)->prox = N;
    }
    return 1;
}


int insere_na_posicao(Lista **p, int n, int k){
    int tam;
    tamanho_lista(&(*p), &tam);
    //Verifica se a posição é valida
    if(k > tam){
        return 0;
    }

    Lista *N;
    N = (Lista *) malloc(sizeof(Lista));
    if(N == NULL){
        return 0;
    }

    N->info = n;

    Lista *aux;
    aux = *p;
    int i;
    for(i = 0; i < k ; i++){
        aux = aux->prox;
    }
    N->prox = aux->prox;
    aux->prox = N;

    if(i != 0 && aux == *p){
        *p = aux->prox;
    }

    return 1;
}



int remove_na_posicao(Lista **p, int k){
    int tam;
    tamanho_lista(&(*p), &tam);
    printf("\n\nO tam da lista eh %d\n\n", tam);
    //Verifica se a posição é valida
    if(k >= tam){
        return 0;
    }

    Lista *aux;
    aux = *p;
    //ELE TÀ ACEITANDO O SEXTO ELEM: CONCERTAR
    int i;
    for(i = 0; i < k ; i++){
        aux = aux->prox;
    }

    if(i != 0 && aux->prox == *p){
        *p = aux;
    }

    Lista *aux2;
    aux2 = aux->prox;
    aux->prox = aux2->prox;
    free(aux2);

    return 1;
}



int remove_inicio(Lista **p){
    if(lista_vazia(*p) == 1){
        return 0;
    }
    Lista *aux;
    aux = (*p)->prox;

    if(*p == (*p)->prox){
        *p = NULL;
    }else{
        (*p)->prox = aux->prox;
    }
    free(aux);
    return 1;

}


int maior(Lista **p, int *maior){
    if(lista_vazia(*p) == 1){
        return 0;
    }
    int m;
    Lista *aux;
    aux = (*p)->prox;
    //Primeiro elem
    m = aux->info;
    aux = aux->prox;
    //Demais elem
    while(aux != (*p)->prox){
        if(m < aux->info){
            m = aux->info;
        }
        aux = aux->prox;
    }
    *maior = m;
    return 1;
}


void imprime(Lista **p){
    printf("\n\tPrintando a LISTA!\n");
    if(lista_vazia(*p) == 0){
        Lista *aux = (*p)->prox;

        printf("%d\n", aux->info);
        aux = aux->prox;

        while(aux != (*p)->prox){
            printf("%d\n", aux->info);
            aux = aux->prox;
        }
        //free(aux);
    }
}




