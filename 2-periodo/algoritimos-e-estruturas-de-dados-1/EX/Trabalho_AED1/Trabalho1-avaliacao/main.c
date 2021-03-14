#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct contratos{
    char nome[16];
    int montante;
};

void altera_nome(struct contratos *p){
    int k;
    int i, j, tamanho;
    //printf("\n\n%d\n\n", sizeof(*p));
    tamanho = strlen(p->nome);
    //printf("\n\n%d\n\n", tamanho);

        for(j = 0; j < tamanho;){
            if((p->nome[j] == 'a' || p->nome[j] == 'A') || (p->nome[j] == 'e' || p->nome[j] == 'E') || (p->nome[j] == 'i' || p->nome[j] == 'I') || (p->nome[j] == 'o' || p->nome[j] == 'O') || (p->nome[j] == 'u' || p->nome[j] == 'U')){
                tamanho--;
                for(k = j; k < tamanho; k++){
                    p->nome[k] = p->nome[k+1];
                }
                p->nome[tamanho] = '\0';
            }else{
                j++;
            }
        }

}

void percorre_contratos(struct contratos *p, int n){
    int i, j, tamanho;
    for(i = 0; i < n; i++){
        tamanho = strlen(p[i].nome);
        for(j = 0; j < tamanho; j++){
            if((p[i].nome[j] == 'a' || p[i].nome[j] == 'A') || ((p+i)->nome[j] == 'e' || (p+i)->nome[j] == 'E') || ((p+i)->nome[j] == 'i' || (p+i)->nome[j] == 'I') || ((p+i)->nome[j] == 'o' || (p+i)->nome[j] == 'O') || ((p+i)->nome[j] == 'u' || (p+i)->nome[j] == 'U')){
                altera_nome(&p[i]);
                break;
            }
        }
    }
}

int main()
{
    //printf("Criando Lista!\n");
    int n,i;
    struct contratos *p;
    p = (struct contratos *) malloc(4*sizeof(struct contratos));
    if(p == NULL){
        printf("Erro: Memoria Insuficiente!\n");
        system("pause");
        exit(1);
    }

    printf("\nPrintando o vetor!\n");

    for(i = 0; i < 4; i++){
        printf("O nome no %do contrato: %s\n", i+1, p[i].nome);
        printf("O montante no %do contrato: %d\n", i+1, p[i].montante);
    }

    printf("\nPreenchendo o vetor!\n");

    //p[1].nome = "Ooolaco";
    strcpy(p[0].nome, "Ooolaco");
    p[0].montante = 54;
    //p[2].nome = "AAA";
    strcpy(p[1].nome, "AAA");
    p[1].montante = 0;
    //p[3].nome = "aaa";
    strcpy(p[2].nome, "aaa");
    p[2].montante = 12;
    //p[4].nome = "Taeiou";
    strcpy(p[3].nome, "Taeiou");
    p[3].montante = 34;

    printf("\nPrintando o vetor!\n");

    for(i = 0; i < 4; i++){
        printf("O nome no %do contrato: %s\n", i+1, p[i].nome);
        printf("O montante no %do contrato: %d\n", i+1, p[i].montante);
    }

    /*p é tratado como um vetor, não como ponteiro*/

    printf("\nAlterando primeiro elemento!\n");

    altera_nome(&p[0]);

    printf("\nPrintando o vetor!\n");

    for(i = 0; i < 4; i++){
        printf("O nome no %do contrato: %s\n", i+1, p[i].nome);
        printf("O montante no %do contrato: %d\n", i+1, p[i].montante);
    }

    printf("\nAlterando ultimo elemento!\n");

    altera_nome(&p[3]);

    printf("\nPrintando o vetor!\n");

    for(i = 0; i < 4; i++){
        printf("O nome no %do contrato: %s\n", i+1, p[i].nome);
        printf("O montante no %do contrato: %d\n", i+1, p[i].montante);
    }

    printf("\nPercorrendo contratos!\n");

    percorre_contratos(p, 4);

    printf("\nPrintando o vetor!\n");

    for(i = 0; i < 4; i++){
        printf("O nome no %do contrato: %s\n", i+1, p[i].nome);
        printf("O montante no %do contrato: %d\n", i+1, p[i].montante);
    }

    free(p);

    printf("FIM!");
    return 0;
}
