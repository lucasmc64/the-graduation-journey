#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

struct dados{
    int vet[maximo];
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
    if(p->topo == maximo - 1){
        return 1;
    }else{
        return 0;
    }
}

int push(Pilha *p, int n){
    if(p == NULL || pilha_cheia(p) == 1){
        return 0;
    }
    p->topo++;
    p->vet[p->topo] = n;
    return 1;
}

int pop(Pilha *p, int *n){
    if(p == NULL || pilha_vazia(p) == 1){
        return 0;
    }
    *n = p->vet[p->topo];
    p->topo--;
    return 0;
}

int le_topo(Pilha *p, int *n){
    if(p == NULL || pilha_vazia(p) == 1){
        return 0;
    }
    *n = p->vet[p->topo];
    return 1;
}

int imprime(Pilha *p){
    if(p == NULL || pilha_vazia(p) == 1){
        return 0;
    }

    printf("\nPrintando PILHA --> ");
    int i;
    for(i = p->topo; 0 <= i; i--){
        printf("\t%d", p->vet[i]);
    }
    return 1;
}

int converte_dec_para_bin(int n){
    Pilha *p;
    p = cria_pilha();

    if(p == NULL){
        return 0;
    }

    int r;
    do{
        //printf("BU YAH");
        r = n % 2;
        n = n / 2;
        push(p, r);
    }while(n != 0 || pilha_cheia(p) == 1);

    if(pilha_cheia(p) == 1){
        printf("Estouro de pilha!");
    }else{
        printf("\nNumero convertido: \n");
        while(pilha_vazia(p) == 0){
            pop(p, &r);
            printf("%d", r);
        }
    }
    return 1;
}
