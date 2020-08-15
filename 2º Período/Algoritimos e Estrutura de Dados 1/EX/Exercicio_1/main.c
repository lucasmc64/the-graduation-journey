#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    int x1, y1, x2, y2;
    double resp;
    Ponto *a, *b;
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

    distancia_pto(a, b, &resp);
    printf("A distância entre os pontos A(%d, %d) e B(%d, %d) e de %lf!", x1, y1, x2, y2, resp);

    libera_pto(&a);
    libera_pto(&b);
    return 0;
}
