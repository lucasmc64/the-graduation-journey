#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("Criando Fila!\n");
    Fila *f;
    f = cria_fila();
    insere_ord(&f, 82);
    insere_ord(&f, 73);
    insere_ord(&f, 12);
    insere_ord(&f, 333);
    imprime(&f);
    int k;
    remove_ini(&f, &k);
    imprime(&f);
    return 0;
}
