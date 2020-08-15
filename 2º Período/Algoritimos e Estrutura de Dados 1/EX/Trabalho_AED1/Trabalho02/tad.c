#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

struct lista{
    int vet[maximo];
    int fim;
};

Lista *cria_lista(){
    Lista *p;
    p = (Lista *) malloc(sizeof(Lista));

    if(p != NULL){
        p->fim = 0; //Se p foi alocado, fim recebe 0
    }

    return p;
}

int lista_vazia(Lista *p){
    if(p->fim == 0){
        return 1; //Lista vazia
    }else{
        return 0; //Lista NÃO vazia
    }
}

int lista_cheia(Lista *p){
    if(p->fim == maximo){
        return 1; //Lista Cheia
    }else{
        return 0; //Lista NÃO cheia
    }
}

int insere_elemento(Lista *p, int num){
    if(p == NULL || lista_cheia(p) == 1){
        return 0;
    }
    p->vet[p->fim] = num; //Insere o elemento
    //printf("%d", p->vet[p->fim]);
    p->fim++; //Incrementa o fim
    return 1;
}

int insere_elemento_no_inicio(Lista *p, int num){
    if(p == NULL || lista_cheia(p) == 1){
        return 0;
    }
    p->fim++; //Incrementa o fim
    int i;
    for(i = p->fim-1; 0 < i; i--){
        p->vet[i] = p->vet[i-1];
    }
    p->vet[0] = num;
    return 1;
}

int remove_elemento(Lista *p, int n){
    /*
    - Lista pode estar vazia;
    - Elemento não está na lista;
    - Elemento é o último nó da lista;
    - Elemento está entre o 1º e o penúltimo nó da lista.
    */
    if(p == NULL || lista_vazia(p) == 1){
        return 0; // Falha: Não exite elemento algum ou p não foi alocado
    }
    // Percorrer a lista até achar o elemento ou acabar a lista
    int i = 0, aux = 0;
    while(aux < p->fim && p->vet[aux] != n){
        aux++;
    }
    if(aux == p->fim){
        return 0; // Não existe o elemento na lista
    }
    // Remoção e deslocamento dos números à frente do removido
    for(i = aux; i < p->fim; i++){
        p->vet[i] = p->vet[i+1];
    }
    p->fim--;
    return 1;
}

int remove_elemento_impar(Lista *p){
    if(p == NULL || lista_vazia(p) == 1){
        return 0; // Falha: Não exite elemento algum ou p não foi alocado
    }
    // Percorrer a lista até achar o elemento ou acabar a lista
    int i = 0, aux = 0, j = 0, aux1 = 0, aux2 = 0;
    while(aux < p->fim && p->vet[aux] % 2 == 0){
        aux++;
    }
    if(aux == p->fim){
        return 0; // Não existe o elemento na lista
    }
    //Se existe pelo menos 1 ímpar na lista:
    // Remoção e deslocamento dos números à frente do removido
    for(i = 0; i < p->fim;){
        printf("\n\t%d\t\n",i);
        if(p->vet[i] % 2 != 0){
            //printf("\n\t%d\t\n",i);
            for(j = i; j < p->fim; j++){
                p->vet[j] = p->vet[j + 1];
            }
            p->fim--;
        }else{
            i++;
        }
    }
    return 1;
}

int remove_todos(Lista *p){
    if(p == NULL || lista_vazia(p) == 1){
        return 0; // Lista já vazia ou p não foi alocado
    }
    p->fim = 0;
    return 1;
}

void imprime(Lista *p){
    int i;
    printf("Lista --> \n");
    for(i = 0; i < p->fim; i++){
        printf("%d\t", p->vet[i]);
    }
}

int menor_elemento(Lista *p, int *men){
    int i, menor;
    if(lista_vazia(p) == 1){
        return 0;
    }
    menor = p->vet[0];
    for(i = 1; i < p->fim; i++){
        if(menor > p->vet[i]){
            menor = p->vet[i];
        }
    }
    *men = menor;
    return 1;
}

int tamanho_lista(Lista *p, int *tam){
    if(p == NULL){
        return 0;
    }
    *tam = p->fim;
    return 1;
}

int concatena_listas(Lista *p, Lista *q, Lista **Li3){
    Lista *L3 = *Li3;
    int tam_p, tam_q, i, j, aux = 0;
    tamanho_lista(p, &tam_p);
    tamanho_lista(q, &tam_q);
    if((tam_p + tam_q) > maximo){
        return 0; //A quantidade de elementos ultrapassa a suportada por uma lista
    }
    for(i = 0; i < p->fim; i++){
        L3->vet[i] = p->vet[i];
        L3->fim++;
        aux++;
    }
    for(j = 0; j < q->fim; j++){
        L3->vet[aux] = q->vet[j];
        L3->fim++;
        aux++;
    }
    return 1;
}
