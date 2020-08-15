#include <stdio.h>

int main(){
    int a, b, c;
    printf("Por favor, digite o PRIMEIRO numero inteiro: ");
    scanf("%d", &a);
    printf("Por favor, digite o SEGUNDO numero inteiro: ");
    scanf("%d", &b);
    printf("Por favor, digite o TERCEIRO numero inteiro: ");
    scanf("%d", &c);
    printf("A soma entre %d, %d e %d equivale a %d!\n", a, b, c, a + b + c);
    return 0;
}
