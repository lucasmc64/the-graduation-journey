#include <stdio.h>

void main(){
    float n;
    printf("Digite a distancia em quilometros: ");
    scanf("%f", &n);
    printf("A distancia em milhas e igual a %.2f!", n / 1.161);
    return 0;
}
