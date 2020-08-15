#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct no{
    int info;
    struct no *prox;
    struct no *ant;
};



Lista *cria_lista(){
    return NULL;
}



int lista_vazia(Lista *p){
    if(p == NULL){
        return 1; //Lista vazia
    }else{
        return 0; //Lista NÃO vazia
    }
}



int insere_elemento(Lista **p, int n){
    Lista *N;
    N = (Lista *) malloc(sizeof(Lista));
    if(N == NULL){
        return 0;
    }

    N->info = n;
    N->ant = NULL;
    N->prox = *p;

    if(lista_vazia(*p) == 0){
        (*p)->ant = N;
    }

    *p = N;
    return 1;
}



int remove_elemento(Lista **p, int n){
    if(lista_vazia(*p) == 1){
        return 0;
    }

    Lista *aux;
    aux = *p;
    while(aux->prox != NULL && aux->info != n){
        aux = aux->prox;
    }

    if(aux->info != n){
        return 0;
    }
    if(aux->prox != NULL){
        aux->prox->ant = aux->ant;
    }
    if(aux->ant != NULL){
        aux->ant->prox = aux->prox;
    }
    if(aux == *p){
        *p = aux->prox;
    }
    free(aux);
    return 1;
}



int remove_maior(Lista **p){
    if(lista_vazia(*p) == 1){
        return 0;
    }

    Lista *aux;
    Lista *auxM;
    aux = *p;
    auxM = *p;

    while(aux->prox != NULL){

        if(auxM->info < aux->info){
            auxM = aux;
        }

        //printf("\n\nM = %d\n\n", auxM->info);
        //printf("\n\nP = %d\n\n", aux->info);

        aux = aux->prox;
    }

    if(auxM->info < aux->info){
        auxM = aux;
    }

    //printf("\n\nM = %d\n\n", auxM->info);
    //printf("\n\nP = %d\n\n", aux->info);


    aux = auxM;

    if(aux->prox != NULL){
        aux->prox->ant = aux->ant;
    }
    if(aux->ant != NULL){
        aux->ant->prox = aux->prox;
    }
    if(aux == *p){
        *p = aux->prox;
    }
    free(aux);

    return 1;
}



int remove_ocorrencias(Lista **p, int n){
    if(lista_vazia(*p) == 1){
        return 0;
    }

    Lista *aux;
    aux = *p;
    //Do 1º ao penúltimo elem da lista
    while(aux->prox != NULL){
        if(aux->info == n){
            aux->prox->ant = aux->ant;
            if(aux->ant != NULL){
                aux->ant->prox = aux->prox;
            }
            if(aux == *p){
                *p = aux->prox;
            }
        }
        aux = aux->prox;
    }

    //Ultimo elem da lista
    if(aux->info == n){
        if(aux->ant != NULL){
            aux->ant->prox = aux->prox;
        }
        if(aux == *p){
            *p = aux->prox;
        }
    }

    //free(aux);

    return 1;
}



int remove_todos(Lista **p){
    if(lista_vazia(*p) == 1){
        return 0;
    }

    while((*p)->prox != NULL){
        Lista *aux;
        aux = *p;
        (*p) = (*p)->prox;
        free(aux);
    }

    *p = NULL;
    return 1;
}



int tamanho_lista(Lista **p, int *tamanho){
    int t = 0;
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }
    Lista *aux = *p;
    while(aux != NULL){
        t++;
        aux = aux->prox;
    }
    *tamanho = t;
    free(aux);
    return 1;
}



Lista *multiplos(Lista **p){
    if(lista_vazia(*p) == 1){
        return NULL;
    }

    Lista *New;
    New = cria_lista();
    Lista *aux;
    aux = New;
    Lista *auxP;
    auxP = *p;

    while(auxP->prox != NULL){
        //printf("OK");
        if(auxP->info % 3 == 0){
            Lista *N;
            N = (Lista *) malloc(sizeof(Lista));

            N->info = auxP->info;
            N->ant = NULL;
            N->prox = New;

            if(lista_vazia(New) == 0){
                New->ant = N;
            }

            New = N;
        }
        auxP = auxP->prox;
    }
    return New;
}



void imprime(Lista **p){
    printf("\n\tPrintando a LISTA!\n");
    Lista *aux = *p;
    while(aux != NULL){
        printf("%d\n", aux->info);
        aux = aux->prox;
    }
}
