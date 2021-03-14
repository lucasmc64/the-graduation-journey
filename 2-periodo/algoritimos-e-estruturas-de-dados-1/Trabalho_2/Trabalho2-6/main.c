#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("Criando DEQUE!\n");
    Deque *d;
    d = cria_deque();
    insere_inicio(&d, 5);
    imprime(&d);
    insere_inicio(&d, 8);
    imprime(&d);
    insere_inicio(&d, 7);
    imprime(&d);

    insere_fim(&d, 9);
    imprime(&d);
    insere_fim(&d, 4);
    imprime(&d);
    insere_fim(&d, 6);
    imprime(&d);

    int a;
    remove_inicio(&d, &a);
    imprime(&d);
    printf("\n\nO PRIMEIRO elemento da DEQUE e %d\n", a);

    remove_final(&d, &a);
    imprime(&d);
    printf("\n\nO ULTIMO elemento da DEQUE e %d\n", a);

    return 0;
}
