#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main(){
    FILE *p;
    p = fopen("notas.txt", "r");

    if(p == NULL){
        printf("Erro ao abrir o arquivo.\n");
        system("pause");
        exit(1);
    }

    char nome[50], lixo[50], melhorA[50];
    float nota, media = 0.0, maiorN = 0;
    int numnotas = 0;

    while(1){
        fscanf(p, "%s", lixo);
        //printf("%s\n", lixo);
        fscanf(p, "%s", nome);
        //printf("%s\n", nome);
        fscanf(p, "%s", lixo);
        //printf("%s\n", lixo);
        fscanf(p, "%f", &nota);
        //printf("%f\n", nota);
        if(feof(p))
            break;

        if(maiorN < nota){
            maiorN = nota;
            strcpy(melhorA, nome);
        }
        media += nota;
        numnotas++;
    }
    media = media/numnotas;
    printf("A media geral das notas e %.2f.\n", media);
    printf("A maior nota e de %s com %f pontos.", melhorA, maiorN);
    fclose(p);
    return 0;
}
