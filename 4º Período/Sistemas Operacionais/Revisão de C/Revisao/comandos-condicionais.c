#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {
    printf("Revisão de Comandos Condicionais\n\n");
    // ListaC02 - Programação Procedimental | Questão 41

    double weight, hieght, bmi;

    printf("Digite seu peso (kg): ");
    scanf("%f", &weight);
    printf("Digite sua altura (cm): ");
    scanf("%f", &hieght);

    bmi = weight / pow(hieght, 2);

    printf("Ola, Mundo!");

    return 0;
}
