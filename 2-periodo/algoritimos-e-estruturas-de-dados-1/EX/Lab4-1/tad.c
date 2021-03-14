#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct dados{
    char nome[50];
    int n;
};

int aloca_structs(Lista **p, int n){
    Lista *q;
    q = (Lista *) malloc(n*sizeof(Lista));
    if(q == NULL){
        return 0;
    }
    *p = q;
    return 1;
}

int lista_vazia(Lista *p){

}
/*
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
            break;
        }
        i++;
    }
    p->fim--;
    return 1;
}

void imprime(Lista *p){
    int i;
    printf("Lista --> ");
    for(i = 0; i < p->fim; i++){
        printf("%d\t", p->vet[i]);
    }
}
*/
