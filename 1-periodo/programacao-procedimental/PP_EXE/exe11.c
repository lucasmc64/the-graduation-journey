#include <stdio.h>

void main(){
    float vel;
    printf("Digite a velocidade em metros por segundo (m/s): ");
    scanf("%f", &vel);
    printf("Essa velocidade em quilometros por hora (km/h) e igual a %.2f!\n", vel * 3.6);
    return 0;
}

