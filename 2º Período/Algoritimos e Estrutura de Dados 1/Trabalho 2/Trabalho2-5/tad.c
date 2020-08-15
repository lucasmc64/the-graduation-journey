#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct no{
    int info;
    struct no *prox;
};

Fila *cria_fila(){
    return NULL;
}

int fila_vazia(Fila *f){
    if(f == NULL){
        return 1;
    }else{
        return 0;
    }
}

int insere_ord(Fila **f, int n){
    Fila *N;
    N = (Fila *) malloc(sizeof(Fila));
    if(N == NULL){
        return 0;
    }

    N->info = n;

    if(fila_vazia(*f) == 1){
        N->prox = N;
        *f = N;
    }else{

        Fila *aux;
        aux = (*f)->prox;
        if(N->info < (*f)->prox->info){
            N->prox = (*f)->prox;
            (*f)->prox = N;
            return 1;
        }
        if(N->info > (*f)->info){
            N->prox = (*f)->prox;
            (*f)->prox = N;
            *f = N;
            return 1;
        }

        while(aux != (*f) && n < aux->info){
            aux = aux->prox;
            printf("\nOK\n");
        }

        N->prox = aux->prox;
        aux->prox = N;

    }
    return 1;
}

int remove_ini(Fila **f, int *n){
    if(fila_vazia(*f) == 1){
        return 0;
    }
    Fila *aux;
    aux = (*f)->prox;
    *n = aux->info;
    if(*f == (*f)->prox){
        *f == NULL;
    }else{
        (*f)->prox = aux->prox;
    }
    free(aux);
    return 1;
}

void imprime(Fila **f){
    printf("\n\tPrintando a Fila!\n");
    if(fila_vazia(*f) == 0){
        Fila *aux = (*f)->prox;

        printf("%d\n", aux->info);
        aux = aux->prox;

        while(aux != (*f)->prox){
            printf("%d\n", aux->info);
            aux = aux->prox;
        }
        //free(aux);
    }
}
