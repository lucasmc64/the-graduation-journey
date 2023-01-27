#include "gbd.h"
#include "utils.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <limits.h>

/*
** Trabalho R02-R04 GBD
** Integrantes:
** Mateus Carmo (11911BCC026)
** Lucas Marçal (11911BCC012)
** Lucas Mattos (11911BCC015)
** Eduardo Ribeiro (11911BCC057)
** Guilherme Henrique (11911BCC058)
**
** Instruções de Compilação: simplesmente compilar e linkar os 3 arquivos .c
*/

FILE* create_file(const char* path)
{
    FILE* new_file = fopen(path, "wb+");

    if (new_file == NULL)
    {
        printf("Erro ao criar arquivo!\n");
        return NULL;
    }

    printf("Escolha o número de registros (digite \"mem\" para criar um registro 5x o tamanho da memória): ");
    char* s_reg_num = read_line();
    long int reg_num;

    if (strcmp(s_reg_num, "mem") == 0)
    {
        unsigned long long totalMem = get_total_sys_memory();
        reg_num = totalMem * 5 / sizeof(Aluno);
        printf("O heap file que você está tentando criar terá %lld bytes (%ld registros). Deseja continuar? (yes/no) ", totalMem * 5, reg_num);
        char *opt = read_line();
        if (strcmp(opt, "yes") == 0)
        {
            printf("Criando arquivo heap grand. Isso demorará um tempo...\n");
        }
        else
        {
            printf("Cancelando operação...\n");
            free(s_reg_num);
            free(opt);
            return NULL;
        }
    }
    else
    {
        reg_num = strtol(s_reg_num, NULL, 10);
        if (reg_num > INT_MAX || reg_num < INT_MIN)
            reg_num = INT_MAX;
        if (reg_num < 0)
            reg_num *= -1;
    }

    create_heap_file(new_file, reg_num);

    printf("Arquivo heap criado com sucesso.\n");

    free(s_reg_num);
    return new_file;
}

int main() {

    srand(time(NULL));
    FILE* file;

    printf("==== | Atividade Prática de GBD 1 | ====\n\n");
    printf("Insira o caminho para a heap file: ");
    char* path = read_line();

    if (file_exists(path) == 0)
    {
        printf("Arquivo dado é inexistente. Criando novo arquivo...\n");
        file = create_file(path);
    }
    else
    {
        printf("Arquivo existente. Recuperando informações...\n");
        file = fopen(path, "rb+");
    }

    if (file == NULL)
    {
        free(path);
        return 1;
    }

    int total_registros;

    fseek(file, -sizeof(Aluno), SEEK_END);
    Aluno a;
    fread(&a, sizeof(Aluno), 1, file);

    total_registros = a.seq_aluno + 1;
    printf("Número de registros: %d\n", total_registros);

    fseek(file, 0, SEEK_SET);

    int program_end = 0;
    while (!program_end)
    {
        printf("\n==== Comandos ====\n");
        printf("create    (recriar heap file)\n");
        printf("read      (lê entrada dada)\n");
        printf("insert    (insere novo registro)\n");
        printf("update    (atualiza registro)\n");
        printf("delete    (deleta registro)\n");
        printf("varredura (R03)\n");
        printf("acesso    (R04)\n");
        printf("sair      (sair do programa)\n");
        printf("> Insira um comando: ");
        char* opt = read_line();

        if (strcmp(opt, "create") == 0)
        {
            fclose(file);
            file = create_file(path);
            if (file == NULL)
            {
                free(path);
                free(opt);
                return 1;
            }
            printf("Arquivo recriado com sucesso.\n");
        }
        else if (strcmp(opt, "read") == 0)
        {
            Aluno read;
            printf("Insira número do estudante: ");
            char* opt2 = read_line();
            int seq_num = atoi(opt2);
            if (seq_num < 0 || seq_num > total_registros)
            {
                printf("Número de sequência inválido!\n");
            }
            else
            {
                read_random(file, seq_num, &read);
                printf("\nAluno %d:\nNome: %s\nCódigo do curso: %s\n", seq_num, read.nome_aluno, read.codigo_curso);
            }
            free(opt2);
        }
        else if (strcmp(opt, "insert") == 0)
        {
            isrt_at_end(file);
        }
        else if (strcmp(opt, "update") == 0)
        {
            printf("Insira número do estudante: ");
            char* opt2 = read_line();
            int seq_num = atoi(opt2);
            if (seq_num < 0 || seq_num > total_registros)
            {
                printf("Número de sequência inválido!\n");
            }
            else
            {
                // essa parte tá muuuuuuuito unsafe...
                char *codigo, *nome;
                printf("Insira novo código de curso: ");
                codigo = read_line();
                printf("Insira novo nome: ");
                nome = read_line();

                update_random(file, seq_num, nome, codigo);

                if (codigo != NULL)
                    free(codigo);

                if (nome != NULL)
                    free(nome);
            }
            free(opt2);
        }
        else if (strcmp(opt, "delete") == 0)
        {
            printf("Insira número do estudante: ");
            char* opt2 = read_line();
            int seq_num = atoi(opt2);
            if (seq_num < 0 || seq_num > total_registros)
            {
                printf("Número de sequência inválido!\n");
            }
            else
            {
                delete_random(file, seq_num);
            }
            free(opt2);
        }
        else if (strcmp(opt, "varredura") == 0)
        {
            printf("Insira o tamanho do bloco: ");
            char* opt2 = read_line();
            int bloco = atoi(opt2);
            varredura_sequencial(file, bloco);
            free(opt2);
        }
        else if (strcmp(opt, "acesso") == 0)
        {
            if (total_registros < 100)
            {
                printf("Impossível executar acesso aleatório em menos de 100 elementos! (deve-se ter pelo menos 100 para acessar 1%%)\n");
            }
            else
            {
                varredura_aleatoria(file);
            }
        }
        else if (strcmp(opt, "sair") == 0)
            program_end = 1;
        else
        {
            printf("Comando não reconhecido.\n");
        }

        free(opt);
    }

    free(path);
    fclose(file);
    return 0;
}
