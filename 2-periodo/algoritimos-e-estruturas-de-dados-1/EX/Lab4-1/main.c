#include <stdio.h>
#include <stdlib.h>

typedef struct dados Dados;

struct dados{
    char nome[50];
    int num;
};

int aloca_structs(Dados **p, int n){
    Dados *q;
    q = (Dados *) malloc(n*sizeof(Dados));
    if(q == NULL){
        return 0;
    }
    *p = q;
    return 1;
}

int manipula_um_par(struct dados *k){
    //printf("\nK: %d\n", sizeof(*k));
    (*k).num = (*k).num/2;
    return 1;
}

void verifica_vetor(Dados **p, int n){
    int i;
    for(i = 0; i < n; i++){
        if((*p)[i].num % 2 == 0){
            manipula_um_par(&(*p)[i]);
            //printf("\nNUM: %d\n", sizeof((*p)[i]));
        }
    }
}


int main(){
    int i, n;
    Dados *p;
    printf("Informe o numero de cadastros a serem feitos: ");
    scanf("%d", &n);
    aloca_structs(&p, n);

    //printf("TAMANHO: %d\n", sizeof(*p));
    for(i = 0; i < n; i++){
        printf("Digite o %do nome: ", i+1);
        setbuf(stdin,NULL);
        gets(p[i].nome);
        printf("Digite o %do valor: ", i+1);
        scanf("%d", &p[i].num);
    }

    verifica_vetor(&p, n);

    printf("\n\n");
    for(i = 0; i < n; i++){
        printf("Nome: %s\n", p[i].nome);
        printf("Valor: %d\n", p[i].num);
    }
    return 0;
}

