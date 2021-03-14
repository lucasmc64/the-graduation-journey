#include <stdio.h>
#include <stdlib.h>
#include "tad.h"

int main()
{
    printf("Criando Lista!\n");
    Lista *p;
    p = cria_lista();
    char Resp = 'S';
    int n_elemento, erro;
    while(Resp == 'S' || Resp == 's'){
        printf("Digite o valor a ser adicionado a lista: ");
        scanf("%d", &n_elemento);
        erro = insere_elemento_final(&p, n_elemento);
        if(erro == 0){
            printf("Erro: elemento nao adicionado!");
            system("pause");
            exit(1);
        }
        printf("Quer adicionar em elemento a lista? (S p/ Sim | Qualquer outra tecla p/ sair): ");
        setbuf(stdin,NULL);
        scanf("%c", &Resp);
    }
    imprime(&p);
    int menor, tamanho;
    if(p == NULL){
        printf("\nNULL\n");
    }
    menor_elemento(&p,&menor);
    printf("\nO menor elemento da lista e: %d\n", menor);

    tamanho_lista(&p,&tamanho);
    printf("\nO tamanho da lista e: %d\n", tamanho);
    printf("\nTudo adicionado!\n");
    remove_impar(&p);
    imprime(&p);

    /*
    printf("\n\nCriando Lista 2!\n");
    Lista *q;
    q = cria_lista();
    char Resp1 = 'S';
    int n_elemento1, erro1;
    while(Resp1 == 'S' || Resp1 == 's'){
        printf("Digite o valor a ser adicionado a lista: ");
        scanf("%d", &n_elemento1);
        erro1 = insere_elemento_final(&q, n_elemento1);
        if(erro1 == 0){
            printf("Erro: elemento nao adicionado!");
            system("pause");
            exit(1);
        }
        printf("Quer adicionar em elemento a lista? (S p/ Sim | Qualquer outra tecla p/ sair): ");
        setbuf(stdin,NULL);
        scanf("%c", &Resp1);
    }
    imprime(&q);
    int menor1, tamanho1;
    menor_elemento(&q,&menor1);
    printf("\nO menor elemento da lista e: %d\n", menor1);

    tamanho_lista(&q,&tamanho1);
    printf("\nO tamanho da lista e: %d\n", tamanho1);
    printf("\nTudo adicionado!\n");
    remove_impar(&q);
    imprime(&q);

    Lista *concant;
    concatena(p,q,&concant);
    imprime(&concant);
    */
    /*
    remove_todos(&p);
    imprime(&p);
    */
    return 0;
}
