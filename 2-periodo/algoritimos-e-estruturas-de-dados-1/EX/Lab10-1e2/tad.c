#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct fila {
    int vet[max];
    int ini, fim;
};

Fila *cria_fila(){
    Fila *f;
    f = (Fila *)malloc(sizeof(Fila));
    if(f!=NULL){
        f->ini = 0;
        f->fim = 0;
    }
    return f;
}

int fila_vazia(Fila *f){
    if(f->ini == f->fim){
        return 1;
    }else{
        return 0;
    }
}

int fila_cheia(Fila *f){
    if(f->ini == (f->fim+1)%max){
        return 1;
    }
    else{
        return 0;
    }
}

int insere_fim(Fila *f, int n){
    if(fila_cheia(f) == 1){
        return 0;
    }
    //insere elemento no final
    f->vet[f->fim] = n;
    f->fim = (f->fim + 1)%max; //incrementa circular
    return 1;
}

int remove_ini(Fila *f, int *n){
    if(fila_vazia(f)==1){
        return 0;
    }
    *n = f->vet[f->ini];
    f->ini = (f->ini+1)%max;//incremento circular
    return 1;
}


void imprime(Fila *f){
    printf("\n\nPrintando Fila!\n");
    int i;
    for(i = f->ini; i < f->fim; i++){
        printf("%d\n", f->vet[i]);
        if(i == max){
            i = 0;
        }
    }
}
