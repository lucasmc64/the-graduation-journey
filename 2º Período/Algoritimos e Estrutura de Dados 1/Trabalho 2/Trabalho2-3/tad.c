#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct pilha{
    char vet[max];
    int topo;
};


Pilha *cria_pilha(){
    Pilha *p;
    p = (Pilha *) malloc(sizeof(Pilha));
    if(p != NULL){
        p->topo = -1;
    }
    return p;
}


int pilha_vazia(Pilha *p){
    if(p->topo == -1){
        return 1;
    }else{
        return 0;
    }
}


int pilha_cheia(Pilha *p){
    if(p->topo == max-1){
        return 1;
    }else{
        return 0;
    }
}


int push(Pilha *p, char n){
    if(p == NULL || pilha_cheia(p) == 1){
        return 0;
    }
    p->topo++;
    p->vet[p->topo] = n;
    return 1;
}


int pop(Pilha *p, char *n){
    if(p == NULL || pilha_vazia(p) == 1){
        return 0;
    }
    *n = p->vet[p->topo];
    p->topo--;
    return 1;
}


int le_topo(Pilha *p, char *n){
    if(p == NULL || pilha_vazia(p) == 1){
        return 0;
    }
    *n = p->vet[p->topo]; //Retorna o elemento
    return 1;
}


void imprime(Pilha *p){
    printf("\n\nPrintando Pilha!\n");
    int i;
    for(i = p->topo; 0 <= i; i--){
        printf("%c\n", p->vet[i]);
    }
    printf("\n\n");
}


void imprime_reverso(Pilha *p){
    printf("\n\nPrintando Pilha!\n");
    int i;
    for(i = 0; i <= p->topo; i++){
        printf("%c\n", p->vet[i]);
    }
    printf("\n\n");
}

int eh_palindromo(char *n){
    int i,j;
    Pilha *p;
    p = cria_pilha();
    for(i = 0; n[i] != '\0'; i++){
        p->topo++;
        p->vet[p->topo] = n[i];
    }

    j = 0;
    int tam = (p->topo + 1) / 2;
    //printf("%d", tam);

    for(i = p->topo; tam <= i; i--){
        if(p->vet[i] != n[j]){
            return 0;
        }
        if(p->topo % 2 != 0){
            if(i == tam){
                break;
            }
        }
        j++;
    }

    return 1;
}
