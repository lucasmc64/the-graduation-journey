#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {
    float z;
    int y,x;
    printf("Digite o numero de dias trabalhados:");
    scanf("%d \n",&x);
    y = x*30;
    z =y*8/100;
    printf("O salario em valores liquidos e: %f",z);
     return 0;
}
