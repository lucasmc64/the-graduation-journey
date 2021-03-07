#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {
    printf("Revisão de Comandos Condicionais\n\n");
    // ListaC02 - Programação Procedimental | Questão 41

    double weight, hieght, bmi;

    printf("Digite seu peso (kg): ");
    scanf("%lf", &weight);
    printf("Digite sua altura (m): ");
    scanf("%lf", &hieght);

    bmi = weight / pow(hieght, 2);

    printf("Seu IMC é %.2lf\n", bmi);

    return 0;
}
