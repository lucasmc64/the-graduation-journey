#include <stdio.h>

void main(){
    float milhas;
    printf("Digite a distancia em milhas: ");
    scanf("%f", &milhas);
    printf("A velocidade em quilometros por hora e %.2f!", 1.61 * milhas);
    return 0;
}
