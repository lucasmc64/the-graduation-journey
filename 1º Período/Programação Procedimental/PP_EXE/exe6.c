#include <stdio.h>

int main(){
    float cel;
    printf("Digite a temperatura em graus Celcius: ");
    scanf("%f", &cel);
    printf("A temperatura em graus Fahrenheit e %.2f!\n", cel * (9.0/5.0) + 32);
    return 0;
}

