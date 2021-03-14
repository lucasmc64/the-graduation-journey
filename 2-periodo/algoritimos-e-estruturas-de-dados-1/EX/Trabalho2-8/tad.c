#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "tad.h"

struct no{
    union{
        int info_int;
        char info_char;
    }info;
    struct no *prox;
};

Pilha *cria_pilha(){
    return NULL;
}

int pilha_vazia(Pilha **p){
    if(*p == NULL){
        return 1;
    }else{
        return 0;
    }
}

int push_int(Pilha **p, int n) {
    Pilha *N = (Pilha *)malloc(sizeof(struct no));
    if(N == NULL)
        return 0;

    N->info.info_int = n;
    N->prox = *p;
    *p = N;
    return 1;
}

int push_char(Pilha **p, char n){
    Pilha *N;
    N = (Pilha *) malloc(sizeof(Pilha));
    if(N == NULL){
        return 0;
    }

    N->info.info_char = n;
    N->prox = *p;
    *p = N;
    return 1;
}

int pop_int(Pilha **p, int *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }
    Pilha *aux = *p;
    *n = aux->info.info_int;
    *p = aux->prox;
    free(aux);
    return 1;
}

int pop_char(Pilha **p, char *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }

    *n = (*p)->info.info_char;
    Pilha *aux;
    aux = *p;
    *p = aux->prox;
    free(aux);
    return 1;
}

int le_topo_int(Pilha **p, int *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }

    *n = (*p)->info.info_int;
    return 1;
}

int le_topo_char(Pilha **p, char *n){
    if(pilha_vazia(*p) == 1){
        return 0;
    }

    *n = (*p)->info.info_char;
    return 1;
}

void imprime_int(Pilha **p){
    printf("\nPrintando Pilha!\n");
    Pilha *aux;
    aux = *p;

    while(aux != NULL){
        printf("%d\t", aux->info.info_int);
        aux = aux->prox;
    }
}

void imprime_char(Pilha **p){
    printf("\nPrintando Pilha!\n");
    Pilha *aux;
    aux = *p;

    while(aux != NULL){
        printf("%c\t", aux->info.info_char);
        aux = aux->prox;
    }
}


void pos_fixa(char *expressao, int *aaj){
    Pilha *N;
    N = cria_pilha();
    int i, n1, n2, r;
    for(i = 0; expressao[i] != '\0'; i++){
        imprime_int(&N);
        printf("\n");
        if(expressao[i] == 'A'){
            push_int(&N, aaj[0]);
        }else if(expressao[i] == 'B'){
            push_int(&N, aaj[1]);
        }else if(expressao[i] == 'C'){
            push_int(&N, aaj[2]);
        }else if(expressao[i] == 'D'){
            push_int(&N, aaj[3]);
        }else if(expressao[i] == 'E'){
            push_int(&N, aaj[4]);
        }else if(expressao[i] == 'F'){
            push_int(&N, aaj[5]);
        }else if(expressao[i] == 'G'){
            push_int(&N, aaj[6]);
        }else if(expressao[i] == 'H'){
            push_int(&N, aaj[7]);
        }else if(expressao[i] == 'I'){
            push_int(&N, aaj[8]);
        }else if(expressao[i] == 'J'){
            push_int(&N, aaj[9]);
        }else if(expressao[i] == '+'){
            pop_int(&N, &n1);
            printf("\n\nN1 %d: %d\n", i, n1);

            printf("IMPRIME PARCIAL\n");
            imprime_int(&N);

            pop_int(&N, &n2);
            printf("\n\nN2 %d: %d\n", i, n2);

            printf("IMPRIME PARCIAL\n");
            imprime_int(&N);

            if(pilha_vazia(&N) == 1){
                printf("FUDEU\n");
            }
            r = n2 + n1;
            push_int(&N, r);
        }else if(expressao[i] == '-'){
            pop_int(&N, &n1);
            printf("N1 %d: %d\n", i, n1);
            pop_int(&N, &n2);
            printf("N2 %d: %d\n", i, n2);
            if(pilha_vazia(&N) == 1){
                printf("FUDEU\n");
            }
            r = n2 - n1;
            push_int(&N, r);
        }else if(expressao[i] == '*'){
            pop_int(&N, &n1);
            pop_int(&N, &n2);
            r = n2 * n1;
            push_int(&N, r);
        }else if(expressao[i] == '/'){
            pop_int(&N, &n1);
            pop_int(&N, &n2);
            r = n2 / n1;
            push_int(&N, r);
        }else if(expressao[i] == '^'){
            pop_int(&N, &n1);
            pop_int(&N, &n2);
            r = pow(n2, n1);
            push_int(&N, r);
        }
    }

    imprime_int(&N);
    pop_int(&N,&r);
    printf("\nResultado: %d", r);

}
