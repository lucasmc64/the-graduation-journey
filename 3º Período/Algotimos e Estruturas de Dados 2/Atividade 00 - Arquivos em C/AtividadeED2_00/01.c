#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main(){
    FILE *p;
    p = fopen("compra.txt", "r");

    if(p == NULL){
        printf("Erro ao abrir o arquivo.\n");
        system("pause");
        exit(1);
    }

    float total = 0, num;
    int qtd;
    char c[50];

    while(1){
        fscanf(p, "%s", c);
        fscanf(p, "%d", &qtd);
        fscanf(p, "%f", &num);
        if(feof(p)){
            break;
        }
        printf("%s %d %f %f\n", c, qtd, num, total);
        total += qtd * num;
    }

    fclose(p);

    printf("\nO custo total da compra foi de R$%.2f\n", total);
    return 0;
}

