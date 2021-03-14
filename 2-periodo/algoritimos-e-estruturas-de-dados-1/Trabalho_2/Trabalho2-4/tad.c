#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tad.h"

struct no{
    char info;
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


int push(Pilha **p, char n){
    Pilha *N;
    N = (Pilha *) malloc(sizeof(Pilha));
    if(N == NULL){
        return 0;
    }
    N->info = n;
    N->prox = *p;
    *p = N;
    return 1;
}


int pop(Pilha **p, char *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }
    Pilha *aux;
    aux = *p;
    *n = aux->info;
    *p = aux->prox;
    free(aux);
    return 1;
}


int le_topo(Pilha **p, char *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }
    *n = (*p)->info;
    return 1;
}


void imprime(Pilha **p){
    printf("\n\nPrintando Pilha!\n");
    Pilha *aux;
    aux = *p;
    while(aux != NULL){
        printf("%c\n", aux->info);
        aux = aux->prox;
    }
}


int eh_palindromo(char *n){
    int i,j;
    Pilha *p;
    p = cria_pilha();
    Pilha *N;

    for(i = 0; n[i] != '\0'; i++){
        N = (Pilha *) malloc(sizeof(Pilha));
        if(N == NULL){
            return 0;
        }
        N->info = n[i];
        N->prox = p;
        p = N;
    }

    j = 0;
    int tam = i;
    //printf("%d", tam);
    Pilha *aux;
    aux = p;
    for(i = tam; (tam/2) <= i; i--){
        if(aux->info != n[j]){
            return 0;
        }
        if(tam % 2 != 0){
            if(i == tam/2){
                break;
            }
        }
        aux = aux->prox;
        j++;
    }

    return 1;
}


int par_e_impar(Pilha **p, Pilha **par, Pilha **impar){
    if(pilha_vazia(*p) == 1){
        return 0;
    }
    char n;
    while(pilha_vazia(*p) != 1){
        printf("\nOK\n");

        Pilha *aux;
        aux = *p;
        n = aux->info;
        *p = aux->prox;
        free(aux);

        Pilha *N;
        N = (Pilha *) malloc(sizeof(Pilha));
        if(N == NULL){
            return 0;
        }

        N->info = n;


        int numero = atoi(&n);

        if(numero % 2 == 0){
            N->prox = *par;
            *par = N;
        }else{
            N->prox = *impar;
            *impar = N;
        }
    }
    return 1;
}
