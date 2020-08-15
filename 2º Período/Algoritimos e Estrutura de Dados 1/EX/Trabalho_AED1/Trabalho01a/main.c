#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct contratos{
    char nome[16];
    int montante;
};

void altera_nome(struct contratos *p, int tamanho, int j, int i){
    int k;
    for(k = j; k < tamanho; k++){
        p[i].nome[k] = p[i].nome[k+1];
    }
    p[i].nome[tamanho] = '\0';
}

void percorre_contratos(struct contratos *p, int n, int tamanho,int j){
    int i;
    for(i = 0; i < n; i++){
        tamanho = strlen(p[i].nome);
        for(j = 0; j < tamanho; j++){
            if(p[i].nome[j] == 'a' || p[i].nome[j] == 'e' || p[i].nome[j] == 'i' || p[i].nome[j] == 'o' || p[i].nome[j] == 'u'){
                tamanho--;
                altera_nome(p,tamanho,j,i);
            }
        }

    }
}

int main()
{
    int n,i;
    printf("Digite o numero de contratos: \n");
    scanf("%d", &n);
    struct contratos *p;
    p = (struct contratos *) malloc(n*sizeof(struct contratos));
    if(p == NULL){
        printf("Erro: Memoria Insuficiente!\n");
        system("pause");
        exit(1);
    }
    /*Só nomes em minusculo*/
    for(i = 0; i < n; i++){
        printf("Digite o nome para o %do contrato: \n", i+1);
        scanf("%s", &p[i].nome);
        printf("Digite o montante para o %do do contrato: \n", i+1 );
        scanf("%d", &p[i].montante);
    }
    /*p é tratado como um vetor, não como ponteiro*/
    for(i = 0; i < n; i++){
        printf("O nome no %do contrato: %s\n", i+1, p[i].nome);
        printf("O montante no %do contrato: %d\n", i+1, p[i].montante);
    }
    int tamanho, j, k;
    percorre_contratos(p,n,tamanho,j);
    for(i = 0; i < n; i++){
        printf("O nome no %do contrato: %s\n", i+1, p[i].nome);
        printf("O montante no %do contrato: %d\n", i+1, p[i].montante);
    }
    free(p);
    return 0;
}
