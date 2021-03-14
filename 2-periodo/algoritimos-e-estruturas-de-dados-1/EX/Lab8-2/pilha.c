#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

struct no{
    int info;
    struct no *prox;
};

Pilha *cria_pilha(){
    return NULL;
}

int pilha_vazia(Pilha *p){
    if(p == NULL){
        return 1;
    }else{
        return 0;
    }
}

int push(Pilha **p, int n){
    Pilha *q;
    q = (Pilha *) malloc(sizeof(Pilha));
    if(q == NULL){
        return 0;
    }
    q->info = n;
    q->prox = *p;
    *p = q;
    return 1;
}

int pop(Pilha **p, int *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }
    Pilha *aux = *p;
    *n = aux->info;
    *p = aux->prox;
    free(aux);
    return 1;
}

int le_topo(Pilha **p, int *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }
    *n = (*p)->info;
    return 1;
}

void imprime(Pilha **p){
    if(pilha_vazia(*p) == 1){
        return 0;
    }
    printf("\nPilha --> ");
    Pilha *aux = *p;
    while(aux != NULL){
        printf("\t%d", aux->info);
        aux = aux->prox;
    }
}
