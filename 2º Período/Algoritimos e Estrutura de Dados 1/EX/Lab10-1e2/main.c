#include <stdio.h>
#include <stdlib.h>
#include "tad.h"
int main(){
    printf("Criando Fila!\n");
    int n;
    Fila *f;
    f = cria_fila();
    imprime(f);
    insere_fim(f, 5);
    insere_fim(f, 4);
    insere_fim(f, 6);
    insere_fim(f, 3);
    imprime(f);
    remove_ini(f, &n);
    printf("\n\nO valor removido foi %d\n", n);
    imprime(f);
    printf("\n\nRemovendo todos.\n");
    remove_ini(f, &n);
    remove_ini(f, &n);
    remove_ini(f, &n);
    imprime(f);
    return 0;
}
