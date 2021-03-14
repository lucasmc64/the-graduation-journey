#include <stdio.h>
#include <stdlib.h>

int main()
{
    int ano;
    printf("Digite seu ano de nascimento: ");
    scanf("%d", &ano);
    printf("Voce tera %d anos em 2020!\n", 2020 - ano);
    return 0;
}

