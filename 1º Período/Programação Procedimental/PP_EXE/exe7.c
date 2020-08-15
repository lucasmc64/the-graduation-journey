#include <stdio.h>

int main(){
    float fa;
    printf("Digite a temperatura em graus Fahrenheit: ");
    scanf("%f", &fa);
    printf("A temperatura em graus Celcius e %.2f!\n", 5.0 * (fa - 32.0)/9);
    return 0;
}
