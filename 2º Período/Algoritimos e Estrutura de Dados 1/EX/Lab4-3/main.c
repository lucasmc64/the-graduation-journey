#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("CRIANDO LISTA!\n");
    Lista *p;
    p = inicializar_lista();

    imprime(p);

    int i, n;
    for(i = 0; i < maximo; i++){
        printf("Valor a ser inserido: ");
        scanf("%d", &n);
        insere_ord(p, n);
    }

    imprime(p);

    printf("\nDigite o numero que deseja remover: \n");
    scanf("%d", &n);
    remove_ord(p, n);

    imprime(p);

    int tam, menor;
    tamanho_lista(p, &tam);
    menor_elemento(p, &menor);
    printf("TAM: %d\nMENOR: %d\n", tam, menor);
    return 0;
}
