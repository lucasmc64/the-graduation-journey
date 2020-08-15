#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    printf("Criando PILHA!\n");
    int num, op;
    printf("\nDeseja fazer conversao para qual base?\n[1] Binario\n[2] Octal\n[3] Hexadecimal\n");
    scanf("%d", &op);
    if(op < 0 || op > 3){
        printf("Operacao Invalida!");
    }else{
        printf("\nQue numero deseja converter?\n");
        scanf("%d", &num);
        converte(num, op);
    }
    return 0;
}
