#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("Criando Pilha!\n");
    Pilha *p;
    p = cria_pilha();
    push(&p, '1');
    push(&p, '2');
    push(&p, '1');
    //imprime(&p);
    int resp_palindr = eh_palindromo("22521");
    if(resp_palindr == 1){
        printf("Eh Palindromo!");
    }else{
        printf("Nao eh Palindromo...");
    }

    Pilha *numeros;
    numeros = cria_pilha();
    push(&numeros, '1');
    push(&numeros, '5');
    push(&numeros, '4');
    push(&numeros, '9');
    push(&numeros, '2');
    push(&numeros, '6');

    Pilha *par;
    par = cria_pilha();
    Pilha *impar;
    impar = cria_pilha();


    par_e_impar(&numeros, &par, &impar);
    imprime(&numeros);

    printf("\nPilha de PARES!\n");
    imprime(&par);
    printf("\nPilha de IMPARES!\n");
    imprime(&impar);


    return 0;
}
