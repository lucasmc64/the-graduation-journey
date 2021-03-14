#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct no{
    int info;
    struct no *prox;
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



int insere_elemento(Lista **p, int nelemento){
    /*
    INSERE NO INÍCIO!
    - Lista sem elementos
    - Lista com 1 ou mais elementos
    */
    Lista *novo_no;
    novo_no = (Lista *) malloc(sizeof(Lista));
    if(novo_no == NULL){
        return 0; //Nó não alocado
    }
    novo_no->info = nelemento;//Insere novo elemento
    novo_no->prox = *p;//Aponta para o 1º nó atual da lista
    *p = novo_no;
    return 1;
}



int insere_elemento_final(Lista **p, int nelemento){
    /*
    - Lista sem elementos
    - Lista com 1 ou mais elementos
    */
    Lista *novo_no;
    Lista *aux = *p;
    novo_no = (Lista *) malloc(sizeof(Lista));
    if(novo_no == NULL){
        return 0; //Nó não alocado
    }
    novo_no->info = nelemento;//Insere novo elemento
    if(*p == NULL){
        novo_no->prox = *p;//Aponta para o 1º nó atual da lista
        *p = novo_no;
    }else{
        while(aux->prox != NULL){
            aux = aux->prox;
        }
        novo_no->prox = NULL;
        aux->prox = novo_no;
    }
    return 1;
}



int remove_no(Lista **p, int n){
    /*
    - Lista vazia;
    - Elemento igual ao 1º nó;
    - Elemento entre o 2º e último nó da lista;
    - Elemento não está na lista.
    */
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }
    Lista *aux = *p; //Ponteiro auxiliar para o 1º nó
    if(n == (*p)->info){
        *p = aux->prox;//Lista aponta para 2º nó
        free(aux);
        return 1;
    }
    while(aux->prox != NULL && aux->prox->info != n){
        aux = aux->prox;
    }
    if(aux->prox == NULL){//Chega ao final da lista
        return 0;
    }
    Lista *aux2 = aux->prox;
    aux->prox = aux2->prox;
    free(aux2);
    return 1;
}



int remove_impar(Lista **p){
    /*
    - Lista vazia;
    - Elemento não está na lista.
    */
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }

    while((*p)->info % 2 != 0){
        Lista *aux;
        aux = *p;
        *p = aux->prox;
        free(aux);
        if((*p) == NULL){
            return 1;
        }
    }
    Lista *aux;
    aux = *p;
    while(aux->prox != NULL){
        if(aux->prox->info % 2 != 0){
            Lista *aux2 = aux->prox;
            aux->prox = aux2->prox;
            free(aux2);
        }else{
            aux = aux->prox;
        }
    }
    return 1;
}



int menor_elemento(Lista **p, int *menor){
    int m;
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }
    Lista *aux = *p;
    m = aux->info;
    while(aux != NULL){
        if(m > aux->info){
            m = aux->info;
        }
        aux = aux->prox;
    }
    *menor = m;
    free(aux);
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



int remove_todos(Lista **p){
    /*
    - Lista vazia;
    - Lista cheia.
    */
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }
    Lista *aux = *p; //Ponteiro auxiliar para o 1º nó
    *p = NULL; //Torna a lista vazia
    free(aux); //Dá free na lista inteira
    return 1;
}



void imprime(Lista **p){
    printf("\n\tPrintando a LISTA!\n");
    Lista *aux = *p;
    while(aux != NULL){
        printf("%d\n", aux->info);
        aux = aux->prox;
    }
}



int concatena(Lista *lst, Lista *lst2, Lista **lst3){
    Lista *aux, *aux2, *M;
    M = (Lista *) malloc(sizeof(Lista));
    if(M == NULL)
        return 0;
    if(lst == NULL){
        aux = lst2;
        M->info = aux->info;
        M->prox = *lst3;
        *lst3 = M;
        aux = aux->prox;
        aux2 = *lst3;
        while(aux != NULL){
            Lista *N = (Lista *) malloc(sizeof(Lista));
            if(N == NULL)
                return 0;
            N->info = aux->info;
            N->prox = aux2->prox;
            aux2->prox = N;
            aux = aux->prox;
            aux2 = aux2->prox;
        }
        return 1;
    }
    aux = lst;
    M->info = aux->info;
    M->prox = *lst3;
    *lst3 = M;
    aux = aux->prox;
    aux2 = *lst3;
    while(aux != NULL){
        Lista *N = (Lista *) malloc(sizeof(Lista));
        if(N == NULL)
            return 0;
        N->info = aux->info;
        N->prox = aux2->prox;
        aux2->prox = N;
        aux = aux->prox;
        aux2 = aux2->prox;
    }
    if(lst2 == NULL)
        return 1;
    aux = lst2;
    while(aux != NULL){
        Lista *N = (Lista *) malloc(sizeof(Lista));
        if(N == NULL)
            return 0;
        N->info = aux->info;
        N->prox = aux2->prox;
        aux2->prox = N;
        aux = aux->prox;
        aux2 = aux2->prox;
    }
    return 1;
}


