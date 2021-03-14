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
        erro = insere_ord(&p, n_elemento);
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

    int menor;
    menor_elemento(&p,&menor);
    printf("\nO menor elemento e: %d\n", menor);

    int maior;
    maior_elemento(&p,&maior);
    printf("\nO maior elemento e: %d\n", maior);

    int tam;
    tamanho_lista(&p,&tam);
    printf("\nO tamanho da lista e: %d\n", tam);

    remove_par(&p);
    imprime(&p);


    setbuf(stdin,NULL);


    printf("\n\nCriando Lista!\n");
    Lista *q;
    q = cria_lista();
    char Resp2 = 'S';
    int n_elemento2, erro2;

    while(Resp2 == 'S' || Resp2 == 's'){
        printf("Digite o valor a ser adicionado a lista: ");
        scanf("%d", &n_elemento2);
        erro2 = insere_ord(&q, n_elemento2);
        if(erro2 == 0){
            printf("Erro: elemento nao adicionado!");
            system("pause");
            exit(1);
        }
        printf("Quer adicionar em elemento a lista? (S p/ Sim | Qualquer outra tecla p/ sair): ");
        setbuf(stdin,NULL);
        scanf("%c", &Resp2);
    }

    imprime(&q);


    printf("\n\nP e Q sao iguais???\n\n");
    int result = verificar_igualdade(&p,&q);

    if(result == 1){
        printf("SIMM\n");
    }else{
        printf("nop.\n");
    }

    Lista *panda;
    panda = cria_lista();
    printf("\n\n\t\tIntercalando LISTAS!\n");
    intercala_listas(&p, &q, &panda);
    imprime(&panda);

    return 0;
}
