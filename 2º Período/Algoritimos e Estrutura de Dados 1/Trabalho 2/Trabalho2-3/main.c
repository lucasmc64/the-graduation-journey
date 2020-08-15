#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("Criando pilha!\n");

    Pilha *p;
    p = cria_pilha();
    push(p, 'a');
    push(p, 'e');
    push(p, 'i');
    push(p, 'u');
    imprime(p);
    imprime_reverso(p);
    char pal[max] = "amak";
    int resp_palindr = eh_palindromo(pal);
    if(resp_palindr == 1){
        printf("Eh Palindromo!");
    }else{
        printf("Nao eh Palindromo...");
    }
    return 0;
}
