#include <stdio.h>
#include <stdlib.h>
#define maximo 10
#include "tad.h"

struct lista{
    int vet[maximo];
    int fim;
};

Lista *cria_lista(){
    Lista *p;
    p = (Lista *) malloc(sizeof(Lista));

    if(p != NULL){
        p->fim = 0;
    }

    return p;
}

int lista_vazia(Lista *p){
    if(p->fim == 0){
        return 1;
    }else{
        return 0;
    }
}

int lista_cheia(Lista *p){
    if(p->fim != maximo-1){
        return 1;
    }else{
        return 0;
    }
}

int insere_elemento(Lista *p, int num){
    if(p == NULL || lista_cheia(p) == 0){
        return 0;
    }
    p->vet[p->fim] = num;
    //printf("%d", p->vet[p->fim]);
    p->fim++;
    return 1;
}

int remove_elemento(Lista *p, int n){
    if(p == NULL){
        return 0;
    }
    int i = 0, j = 0;
    while(i < p->fim){
        if(p->vet[i] == n){
            j = i;
            while(j <= p->fim-1){
                p->vet[j] = p->vet[j+1];
                j++;
            }
        }
        i++;
    }
    p->fim--;
    return 1;
}

void imprime(Lista *p){
    int i;
    for(i = 0; i < p->fim; i++){
        printf("%d\t", p->vet[i]);
    }
}
