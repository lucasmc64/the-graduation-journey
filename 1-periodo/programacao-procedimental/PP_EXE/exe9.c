#include <stdio.h>

void main(){
    float n;
    printf("Digite a temperatura em graus Celcius: ");
    scanf("%f", &n);
    printf("A temperatura em graus Kelvin e %.2f!\n", n + 273.15);
    return 0;
}

