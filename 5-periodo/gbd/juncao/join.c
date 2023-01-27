#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "join.h"

void join(FILE *tabela1, FILE *tabela2, FILE *juncao, int M, int N, int B) {
    fseek(tabela1, 0, SEEK_SET);
    fseek(tabela2, 0, SEEK_SET);

    printf("\n++-- FAZENDO JUNCAO\n");

    /*
        Como M > N > B, a menor relação não cabe em B-2
        R: Menor relação, com N tuplas
        S: Maior relação, com M tuplas
    */

    AlunoCurso resultado[M];
    int index_match = 0;

    int qtd_blocosR = ceil(N / (B - 2.0)); // O 2 precisa ser float, senão vira uma divisão inteira

    for(int i = 0; i < qtd_blocosR; i++) {
        int qtd_paginas_restantes = N - i * (B - 2);
        int qtd_paginas_lidas = qtd_paginas_restantes >= B - 2 ? B - 2 : qtd_paginas_restantes;

        Curso cursos[qtd_paginas_lidas];
        fread(&cursos, sizeof(Curso), qtd_paginas_lidas, tabela2);

        for(int j = 0; j < qtd_paginas_lidas; j++) {
            fseek(tabela1, 0, SEEK_SET);

            for(int k = 0; k < M; k++) {
                Aluno aluno;
                fread(&aluno, sizeof(Aluno), 1, tabela1);

                if(strcmp(cursos[j].codigo_curso, aluno.codigo_curso) == 0) {
                    AlunoCurso match = {
                        .seq_curso = cursos[j].seq_curso,
                        .seq_aluno = aluno.seq_aluno,
                    };

                    strcpy(match.codigo_curso, cursos[j].codigo_curso);
                    strcpy(match.nome_curso, cursos[j].nome_curso);
                    strcpy(match.nome_aluno, aluno.nome_aluno);

                    resultado[index_match] = match;
                    index_match++;
                }
            }
        }
    }

    printf("\n++-- SALVANDO RESULTADOS\n");

    for(int i = 0; i < M; i++) {
        fwrite(&resultado[i], sizeof(AlunoCurso), 1, juncao);
    }
}

void gerar_string(char *string , int length) {
    if(string == NULL || length < 0) {
        return;
    }

    for(int i = 0; i < length - 1; i++) {
        string[i] = 65 + rand() % 26;
    }

    string[length - 1] = '\0';
}

void popula_tabela1(FILE *f, int M, int N, char codigos_curso[]) {
    printf("---- POPULANDO TABELA 1\n");
    printf("M = %d, N = %d",M,N);

    for(int i = 0; i < M; i++) {
        printf("\nDentro for");
        Aluno a;
        printf("\nAlocado aluno");

        a.seq_aluno = i;
        printf("\n\n-> %d",a.seq_aluno);
        int n_cod = rand() % N;
        char codigo[] = {codigos_curso[2*n_cod], codigos_curso[2*n_cod + 1], '\0'};
        strcpy(a.codigo_curso, codigo);
        printf("\t%s",a.codigo_curso);
        gerar_string(a.nome_aluno, 33);
        printf("\t%s",a.nome_aluno);

        fwrite(&a, sizeof(Aluno), 1, f);
    }
}

void popula_tabela2(FILE *f, int N, char codigos_curso[]) {
    printf("---- POPULANDO TABELA 2\n");

    for(int i = 0; i < N; i++) {
        Curso c;

        c.seq_curso = i;
        char codigo[] = {codigos_curso[2*i], codigos_curso[2*i+1], '\0'};
        strcpy(c.codigo_curso, codigo);
        gerar_string(c.nome_curso, 17);

        fwrite(&c, sizeof(Curso), 1, f);
    }
}