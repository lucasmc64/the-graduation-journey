/*
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("Revisao de Arquivos\n\n");

    FILE *arq;
    arq = fopen("/home/lucasmc64/revisao-c.txt", "w");
    char *result;

    if(arq == NULL) {
        printf("Erro na abertura do arquivo.");
        system("pause");
        exit(1);
    }

    result = fputs("Hello Heleno!", arq);

    fclose(arq);

    arq = fopen("/home/lucasmc64/revisao-c.txt", "r");

    char str[20];

    result = fgets(str, 19, arq);

    if(result == NULL) {
        printf("Erro na leitura do arquivo.");
    } else {
        printf("%s", str);
    }

    fclose(arq);

    return 0;
}
*/
