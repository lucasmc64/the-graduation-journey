#include <stdio.h>

void main(){
    float km;
    printf("Digite a velocidade em quilometros por hora (km/h): ");
    scanf("%f", &km);
    printf("Essa velocidade em metros por segundo (m/s) e igual a %.2f!\n", km / 3.6);
    return 0;
}
