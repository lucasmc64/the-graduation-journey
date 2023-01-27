#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hash.h"

/*

    Trabalho R08 GBD
    Integrantes:
    Lucas Marçal (11911BCC012)
    Lucas Mattos (11911BCC015)

    Instruções de compilação: simplesmente compilar e linkar os 3 arquivos

*/

FILE* create_file(const char* path)
{
    FILE* new_file = fopen(path, "wb+");

    if (new_file == NULL)
    {
        printf("Erro ao criar arquivo!\n");
        return NULL;
    }

    createHash(new_file);

    printf("Arquivo hash alternativa 1 criado!");

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

int main() {
    
    FILE* file1;
    char path1[] = "./hashIndex_1";

    if (file_exists(path1) == 0) {
        printf("\nArquivo para o hash alternativa 1 não existe. Criando...\n");
        file1 = create_file(path1);
    } else {
        file1 = fopen(path1, "rb+");
    }

    Registro reg;
    reg.seq_aluno = 3;
    strcpy(reg.codigo_curso,"abc");
    strcpy(reg.matricula_aluno,"svshbhbs");
    strcpy(reg.nome_aluno,"Fulaninho da Silva");

    insertHash(file1,reg);

    printHash(file1);

    fclose(file1);

    return 0;
}