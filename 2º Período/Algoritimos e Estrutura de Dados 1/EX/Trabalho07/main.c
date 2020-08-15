#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("Criando Lista 1!\n");
    Lista *p;
    p = cria_lista();
    //insere_final(&p, 4);
    //insere_final(&p, 5);
    insere_final(&p, 9);
    insere_inicio(&p, 666);
    insere_inicio(&p, 12);
    imprime(&p);
    int tamanho;
    tamanho_lista(&p, &tamanho);
    printf("tam = %d", tamanho);
    //insere_na_posicao(&p, 5, 1);
    imprime(&p);
    insere_inicio(&p, 12);
    imprime(&p);
    printf("\nInserindo 5\n");
    insere_na_posicao(&p, 5, 4);
    imprime(&p);
    insere_na_posicao(&p, 88, 5);
    imprime(&p);

    insere_na_posicao(&p, 77, 0);
    imprime(&p);
    remove_na_posicao(&p, 6);
    imprime(&p);

    int m;
    maior(&p, &m);
    printf("\n\n O maior N da lista eh %d\n\n", m);
    return 0;
}
