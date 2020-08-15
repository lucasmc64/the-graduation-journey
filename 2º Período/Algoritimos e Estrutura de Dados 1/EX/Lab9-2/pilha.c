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

int respectivo(char abertura, char fechamento){
    if((abertura == '(' && fechamento == ')') || (abertura == '{' && fechamento == '}') || (abertura == '[' && fechamento == ']')){
        return 1;
    }else{
        return 0;
    }
}

int valida_escopo(char *expressao){
    int i;
    /*
    for(i = 0; expressao[i] != NULL; i++){
        printf("\n\nPrintando 2!\n%c", expressao[i]);
    }
    */
    Pilha *p;
    p = cria_pilha();
    char caractere;

    for(i = 0; expressao[i] != NULL; i++){
        if(expressao[i] == '(' || expressao[i] == '{' || expressao[i] == '['){
            //printf("%c", expressao[i]);
            push(&p, expressao[i]);
        }else if(expressao[i] == ')' || expressao[i] == '}' || expressao[i] == ']'){
            if(pop(&p, &caractere) == 0){
                return 0;
            }else{
                if(respectivo(caractere, expressao[i]) == 0){
                    return 0;
                }
            }
        }
    }

    if(pilha_vazia(p) == 1){
        return 1;
    }else{
        return 0;
    }
}
