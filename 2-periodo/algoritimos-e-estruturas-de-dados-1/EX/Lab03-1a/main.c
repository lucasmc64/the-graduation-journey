#include<stdio.h>
#include "tad.h"

int main() {
    Racional *N1, *N2, *N3;
    int nu, de; N1 = generate();
    N2 = generate(); // Cria 2 nros racionais
    if (N1 == NULL || N2 == NULL) {
        printf ("Nao foi possivel criar os nros racionais.\n");
        return -1;
    }
    printf("Digite o numerador e denominador do 1o racional:\n");
    scanf("%d", &nu);
    scanf("%d", &de);
    if (set_value(N1, nu, de) == 0) { // Atribui o numerador e o denominador a N1
        printf ("\nFalha ao preencher o 1o racional.\n");
        return -1;
    }
    printf("\nDigite o numerador e denominador do 2o racional:\n");
    scanf("%d", &nu);
    scanf("%d", &de);
    if (set_value(N2, nu, de) == 0) { // Atribui o numerador e o denominador a N2
        printf ("\nFalha ao preencher o 2o racional.\n");
        return -1;
    }
    N3 = sum(N1,N2); // Soma 2 nros racionais
    if (N3 == NULL) {
        printf ("\nFalha ao somar os 2 nros racionais.\n");
        return -1;
    }
    if (get_value(N3, &nu, &de) == 0) { // Obtem o numerador e o denominador de N3
        printf ("\nFalha ao recuperar o numerador e denominador resultante.\n");
        return -1;
    }
    printf("\nO resultado da soma eh: %d / %d.\n", nu, de);
    delete(&N1);
    delete(&N2);
    delete(&N3); // Libera a memoria alocada para os nros return 0;
}
