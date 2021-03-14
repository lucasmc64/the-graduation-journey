#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main(){
    FILE *fp;

    char arquivo[50];
    printf("Digite o caminho para o arquivo: (Exemplo: ../teste/arq.txt) \n");
    scanf("%s", arquivo);

    fopen(arquivo, "r");

    char letra;
    while(1){
        fgets(&letra, 2, fp);
        if(feof(fp)){
            break;
        }
        printf("%c", letra);
    }

    fclose(fp);

    return 0;
}
