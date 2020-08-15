#include <stdio.h>

int main(){
    float n;
    printf("Digite um numero real: ");
    scanf("%f", &n);
    printf("O quadrado de %.2f e igual a %.2f!", n, n * n);
    return 0;
}
