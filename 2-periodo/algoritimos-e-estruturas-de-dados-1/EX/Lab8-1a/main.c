#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

int main(){
    printf("PILHA!\n");
    Pilha *p;
    p = cria_pilha();
    imprime(p);
    push(p,5);
    push(p,4);
    push(p,6);
    push(p,3);
    imprime(p);
    int n;
    pop(p, &n);
    printf("\nRemoveu-se o valor: %d\n", n);
    imprime(p);
    pop(p, &n);
    pop(p, &n);
    pop(p, &n);
    imprime(p);
    return 0;
}
