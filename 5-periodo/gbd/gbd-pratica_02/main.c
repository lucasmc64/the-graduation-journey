#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bPlusTree.h"

/*
** Trabalho R06 GBD
** Integrantes:
** Lucas Marçal (11911BCC012)
** Lucas Mattos (11911BCC015)
**
** Instruções de Compilação: simplesmente compilar e linkar os 3 arquivos .c
*/

FILE* create_file(const char* path, int alternativa)
{
    FILE* new_file = fopen(path, "wb+");

    if (new_file == NULL)
    {
        printf("Erro ao criar arquivo!\n");
        return NULL;
    }

    criaArvore(new_file, alternativa);

    printf("Arquivo da árvore B+ alternativa %d criado!",alternativa);

    return new_file;
}

int file_exists(const char* path) {
    FILE* file_test;
    if ((file_test = fopen(path, "r")))
    {
        fclose(file_test);
        return 1;
    }
    return 0;
}

int main()
{
    FILE* file1;
    char path1[] = "./arvoreBMais_1";

    if (file_exists(path1) == 0) {
        printf("\nArquivo para a árvore B+ alternativa 1 não existe. Criando...");
        file1 = create_file(path1, 1);
    } else {
        file1 = fopen(path1, "wb+");
    }

    imprimeArvore(file1, 1);

    Registro reg;
    reg.seq_aluno = 1;
    strcpy(reg.matricula_aluno, "sfvsv");
    strcpy(reg.nome_aluno, "Fulaninho");
    insereArvore(file1, reg, 1);

    imprimeArvore(file1, 1);

    return 0;
}
