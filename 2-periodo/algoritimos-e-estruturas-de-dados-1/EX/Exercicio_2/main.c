#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main(){
    int x1, y1, x2, y2;
    double resp;
    Ponto *a, *b;
    Circulo *circ;
    printf("Digite o X do PRIMEIRO ponto: ");
    scanf("%d", &x1);
    printf("Digite o Y do PRIMEIRO ponto: ");
    scanf("%d", &y1);
    printf("Digite o X do SEGUNDO ponto: ");
    scanf("%d", &x2);
    printf("Digite o Y do SEGUNDO ponto: ");
    scanf("%d", &y2);
    a = cria_pto(x1, y1);
    b = cria_pto(x2, y2);
    circ = cria_circ(a, b);
    area_circ(circ, &resp);
    printf("\n\nA area do circulo e de %.3lf!\n", resp);
    cria_circ(a,b);
    libera_pto(&a);
    libera_pto(&b);
    libera_circ(&circ);
    return 0;
}
