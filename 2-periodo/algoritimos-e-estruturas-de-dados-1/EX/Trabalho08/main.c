#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("Criando Lista 1!\n");
    Lista *p;
    p = cria_lista();



    insere_elemento(&p,12);
    imprime(&p);



    insere_elemento(&p,8);
    imprime(&p);
    //insere_elemento(&p,12);
    imprime(&p);
    insere_elemento(&p,99);
    imprime(&p);

    insere_elemento(&p,12);
    imprime(&p);

    //remove_elemento(&p,12);
    //imprime(&p);

    insere_elemento(&p,556);
    imprime(&p);


    insere_elemento(&p,1);
    imprime(&p);
    //insere_elemento(&p,12);
    imprime(&p);
    //insere_elemento(&p,12);
    imprime(&p);
    insere_elemento(&p,12);
    imprime(&p);

    remove_ocorrencias(&p,12);
    imprime(&p);


    int t;
    tamanho_lista(&p,&t);
    printf("\nO tamanho da lista eh %d",t);

    //remove_todos(&p);
    //imprime(&p);



    remove_maior(&p);
    imprime(&p);


    insere_elemento(&p,12);
    imprime(&p);
    insere_elemento(&p,30);
    imprime(&p);

    printf("Criando Lista 2!");
    Lista *a;
    a = multiplos(&p);
    imprime(&a);
    return 0;
}
