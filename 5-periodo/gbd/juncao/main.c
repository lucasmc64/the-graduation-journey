#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "join.h"

// #define M 100
// #define N 10
// #define B 5

char tabela1_path[] = "./tabela1.dat";
char tabela2_path[] = "./tabela2.dat";
char juncao_path[] = "./juncao.dat";

// char *codigos_curso;
// [10][3] = { "SO", "CO", "RR", "ON", "NA", "GU", "EN", "TO", "MA", "IS" };

int main() {
    printf("++++ TRABALHO DE GBD - JUNCAO BASEADA EM BLOCOS\n");

    printf("\n++-- CRIANDO ARQUIVOS\n");

    FILE *tabela1 = fopen(tabela1_path, "rb+");
    FILE *tabela2 = fopen(tabela2_path, "rb+");
    FILE *juncao = fopen(juncao_path, "rb+");

    int M, N, B;

    // valores de teste pré-definidos:
    M = 20; 
    N = 10; 
    B = 5;

    // para usar valores do input:

    // printf("\n++-- DIGITE O VALOR DE M: ");
    // scanf("%d", &M);
    // printf("\n++-- DIGITE O VALOR DE N: ");
    // scanf("%d", &N);
    // printf("\n++-- DIGITE O VALOR DE B: ");
    // scanf("%d", &B);
    // while (N <= B) {
    //     N++;
    // }
    // while (M <= N) {
    //     M++;
    // }

    char codigos_curso[2*N+1];
    gerar_string(codigos_curso, (N * 2 + 1));

    printf("\n++-- CODIGOS: ");
    printf("%s\n",codigos_curso);

    printf("\n++-- CRIANDO DADOS DE TESTE\n");

    popula_tabela1(tabela1, M, N, codigos_curso);
    popula_tabela2(tabela2, N, codigos_curso);

    printf("\n++-- IMPRIMINDO TABELA 1\n\n");

    fseek(tabela1, 0, SEEK_SET);

    Aluno to_print1;

    for(int i = 0; i < M; i++) {
        fread(&to_print1, sizeof(Aluno), 1, tabela1);
        printf("-> %d\t%s\t%s\n", to_print1.seq_aluno, to_print1.codigo_curso, to_print1.nome_aluno);
    }

    printf("\n++-- IMPRIMINDO TABELA 2\n\n");

    fseek(tabela2, 0, SEEK_SET);

    Curso to_print2;

    for(int i = 0; i < N; i++) {
        fread(&to_print2, sizeof(Curso), 1, tabela2);
        printf("-> %d\t%s\t%s\n", to_print2.seq_curso, to_print2.codigo_curso, to_print2.nome_curso);
    }

    join(tabela1,tabela2,juncao,M,N,B);

    printf("\n++-- IMPRIMINDO RESULTADO DA JUNCAO\n\n");

    fseek(juncao, 0, SEEK_SET);

    AlunoCurso to_print3;

    for(int i = 0; i < M; i++) {
        fread(&to_print3, sizeof(AlunoCurso), 1, juncao);
        printf("-> %d\t%s\t%s\t%d\t%s\n", to_print3.seq_curso, to_print3.codigo_curso, to_print3.nome_curso, to_print3.seq_aluno, to_print3.nome_aluno);
    }

    printf("\n\n++-- FINALIZANDO PROGRAMA\n");

    fclose(tabela1);
    fclose(tabela2);
    fclose(juncao);

    return 0;
}
