#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct no{
    int info;
    struct no *prox;
    struct no *ant;
};

struct posicao{
    struct no *ini;
    struct no *fim;
};

Deque *cria_deque(){
    Deque *iniefim;
    iniefim = (Deque *) malloc(sizeof(Deque));
    if(iniefim != NULL){
        iniefim->ini = NULL;
        iniefim->fim = NULL;
    }
    return iniefim;
}

int deque_vazia(Deque *p){
    if(p->ini == NULL){
        return 1;
    }else{
        return 0;
    }
}

int insere_inicio(Deque **d, int n){
    No *N;
    N = (No *) malloc(sizeof(No));
    if(N == NULL){
        return 0;
    }

    N->info = n;

    if(deque_vazia(*d) == 1){
        (*d)->ini = N;
        (*d)->fim = N;
        N->ant = NULL;
        N->prox = NULL;
    }else{
        N->prox = (*d)->ini;
        N->ant = (*d)->ini->ant;
        (*d)->ini = N;
    }
    return 1;
}

int insere_fim(Deque **d, int n){
    No *N;
    N = (No *) malloc(sizeof(No));
    if(N == NULL){
        return 0;
    }

    N->info = n;

    if(deque_vazia(*d) == 1){
        (*d)->ini = N;
        (*d)->fim = N;
        N->ant = NULL;
        N->prox = NULL;
    }else{
        N->ant = (*d)->fim;
        N->prox = (*d)->fim->prox;
        (*d)->fim->prox = N;
        (*d)->fim = N;
    }
    return 1;
}

int remove_inicio(Deque **d, int *n){
    if(deque_vazia(*d) == 1){
        return 0;
    }

    *n = (*d)->ini->info;

    No *aux;
    aux = (*d)->ini;

    if((*d)->ini == (*d)->fim){
        (*d)->ini = NULL;
        (*d)->fim = NULL;
        free(aux);
    }else{
        (*d)->ini = aux->prox;
        (*d)->ini->ant = NULL;
        free(aux);
    }
    return 1;
}

int remove_final(Deque **d, int *n){
    if(deque_vazia(*d) == 1){
        return 0;
    }

    *n = (*d)->fim->info;

    No *aux;
    aux = (*d)->fim;

    if((*d)->ini == (*d)->fim){
        (*d)->ini = NULL;
        (*d)->fim = NULL;
        free(aux);
    }else{
        (*d)->fim = aux->ant;
        (*d)->fim->prox = NULL;
        free(aux);
    }
    return 1;
}

void imprime(Deque **d){
    printf("\n\nPrintando Deque!\n");
    No *aux;
    aux = (*d)->ini;
    while(aux != (*d)->fim){
        printf("%d\n", aux->info);
        aux = aux->prox;
    }
    printf("%d\n", aux->info);
}

