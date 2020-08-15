
#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct no{
    int info;
    struct no *prox;
};



Lista *cria_lista(){
    Lista *cab;
    cab = (Lista *) malloc(sizeof(Lista));
    if(cab != NULL){
        cab->info = 0;
        cab->prox = NULL;
    }
    return cab;
}



int lista_vazia(Lista *p){
    if(p->prox == NULL){
        return 1; //Lista vazia
    }else{
        return 0; //Lista NÃO vazia
    }
}



int insere_ord_cabecalho(Lista **p, int nelemento){
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

    //Percorre a lista
    Lista *aux = *p;
    while(aux->prox != NULL && aux->prox->info < nelemento){
        aux = aux->prox;
    }

    //Insere novo nó
    novo_no->prox = aux->prox;
    aux->prox = novo_no;
    (*p)->info++;

    return 1;
}




int remove_ord_cabecalho(Lista **p, int n){
    if(lista_vazia(*p) == 1 || n < (*p)->info){
        return 0; //Falha
    }

    Lista *aux = *p; //Ponteiro auxiliar para o 1º nó

    if(n == (*p)->info){//Remove o 1º nó
        *p = aux->prox;//Lista aponta para 2º nó
        free(aux);
        return 1;
    }

    while(aux->prox != NULL && aux->prox->info < n){
        aux = aux->prox;
    }

    if(aux->prox == NULL || aux->prox->info > n){//Chega ao final da lista
        return 0;
    }

    Lista *aux2 = aux->prox;
    aux->prox = aux2->prox;
    (*p)->info--;
    free(aux2);
    return 1;
}



int remove_par(Lista **p){
    /*
    - Lista vazia;
    - Elemento não está na lista.
    */
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }

    Lista *aux;
    aux = *p;
    while(aux->prox != NULL){
        if(aux->prox->info % 2 == 0){
            Lista *aux2 = aux->prox;
            aux->prox = aux2->prox;
            free(aux2);
            (*p)->info--;
        }else{
            aux = aux->prox;
        }
    }
    return 1;
}



int menor_elemento(Lista **p, int *menor){
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }
    //printf("\nMenor: %d\n", (*p)->info);
    *menor = (*p)->prox->info;
    return 1;
}




int tamanho_lista(Lista **p, int *tamanho){
    if(lista_vazia(*p) == 1){
        return 0; //Falha
    }
    *tamanho = (*p)->info;
    return 1;
}




void imprime(Lista **p){
    printf("\n\tPrintando a LISTA!\n");
    Lista *aux = (*p)->prox;
    while(aux != NULL){
        printf("%d\n", aux->info);
        aux = aux->prox;
    }
}


int verificar_igualdade(Lista **p, Lista **q){
    //Verifica se as duas listas são vaizas
    if(lista_vazia(*p) == 1 && lista_vazia(*q) == 1){
        return 1;
    }

    //printf("\n\nBU-K\n\n");

    int tam_p, tam_q;
    tamanho_lista(&(*p),&tam_p);
    //printf("\nTamanho p: %d\n", tam_p);
    tamanho_lista(&(*q),&tam_q);
    //printf("\nTamanho q: %d\n", tam_q);

    //Verifica se as lista tem o mesmo tamanho
    if(tam_p != tam_q){
        return 0;
    }

    int i, cont = 0;
    Lista *auxp = (*p)->prox;
    Lista *auxq = (*q)->prox;
    while(auxp != NULL){
        //printf("\n\nBU\n\n");
        if(auxp->info != auxq->info){
            cont++;
            break;
        }
        auxp = auxp->prox;
        auxq = auxq->prox;
    }
    if(cont > 0){
        return 0;
    }
    return 1;
}




int intercala_listas(Lista **p, Lista **a, Lista **panda){

    if((*p)->prox == NULL && (*a)->prox == NULL){
        return 0; //Não há nada para a nova lista receber
    }

    Lista *auxp, *auxa, *auxnew;
    auxnew = (Lista *) malloc(sizeof(Lista));
    if(auxnew == NULL){
        return 0;
    }

    auxp = (*p)->prox;
    auxa = (*a)->prox;

    if((*p)->prox == NULL || (*a)->prox == NULL){
        Lista *aux, *aux2;
        if((*p) == NULL){
            aux = auxp;
        }else{
            aux = auxa;
        }
        auxnew->info = aux->info;
        auxnew->prox = NULL; //Num sei
        (*panda)->prox = auxnew; //OK
        aux = aux->prox;
        aux2 = (*panda)->prox; //Talvex
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

    Lista *aux, *aux2;
    if(auxp->info < auxa->info){
        aux = auxp;
        auxp = auxp->prox;
    }else{
        aux = auxa;
        auxa = auxa->prox;
    }
    auxnew->info = aux->info;
    auxnew->prox = (*panda)->prox;
    (*panda)->prox = auxnew;
    aux = aux->prox;
    aux2 = (*panda)->prox;

    while(auxa != NULL && auxp != NULL){
        Lista *N = (Lista *) malloc(sizeof(Lista));
        if(N == NULL){
            return 0;
        }
        if(auxp->info <= auxa->info){
            aux = auxp;
            auxp = auxp->prox;
        }else{
            aux = auxa;
            auxa = auxa->prox;
        }
        N->info = aux->info;
        N->prox = aux2->prox;
        aux2->prox = N;
        aux2 = aux2->prox;
    }

    if(auxa == NULL){
        while(auxp != NULL){
            Lista *N = (Lista *) malloc(sizeof(Lista));
            if(N == NULL){
                return 0;
            }

                aux = auxp;
                auxp = auxp->prox;

            N->info = aux->info;
            N->prox = aux2->prox;
            aux2->prox = N;
            aux2 = aux2->prox;
        }
        return 1;
    }


    if(auxp == NULL){
        while(auxa != NULL){
            Lista *N = (Lista *) malloc(sizeof(Lista));
            if(N == NULL){
                return 0;
            }

                aux = auxa;
                auxa = auxa->prox;

            N->info = aux->info;
            N->prox = aux2->prox;
            aux2->prox = N;
            aux2 = aux2->prox;
        }
        return 1;
    }

    return 1;
}


