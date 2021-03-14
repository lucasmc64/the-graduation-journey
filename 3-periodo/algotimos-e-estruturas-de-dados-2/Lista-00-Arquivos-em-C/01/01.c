#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(){
    FILE *p;
    p = fopen("arq.txt", "w");

    if(p == NULL){
        printf("Erro ao abrir o arquivo!");
        system("pause");
        exit(1);
    }

    printf("Digite: \n");
    char letra;
    int resultado;
    do{
        scanf("%c", &letra);
        if(letra == '0'){
            break;
        }
        resultado = fputs(&letra, p);
        if(resultado == EOF || resultado == 0){
            printf("Erro ao gravar no arquivo!");
            system("pause");
            exit(1);
        }
    }while(1);

    fclose(p);
    p = fopen("arq.txt", "r");
    printf("\n");

    while(1){
        fgets(&letra, 1, p);
        if(feof(p)){
            break;
        }
        printf("%c", letra);
    }

    fclose(p);
    return 0;
}
