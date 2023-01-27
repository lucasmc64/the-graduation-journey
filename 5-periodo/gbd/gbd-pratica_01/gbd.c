#include "gbd.h"
#include "utils.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

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

void generate_string(char *string , int length) {
    if(string == NULL || length < 0)
        return;

    for(int i = 0; i < length - 1; i++)
        /* string[i] = (rand() % (127 - 33)) + 33; */
        string[i] = 65 + rand() % 26;

    string[length - 1] = '\0';
}

void create_heap_file(FILE *file, int nro_de_registros) {
    if (nro_de_registros < 0)
    {
        printf("Erro ao criar heap file: nro de registros < 0\n");
        return;
    }

    fseek(file, 0, SEEK_SET);
    for(int i = 0; i < nro_de_registros; i++) {
        Aluno a;

        a.seq_aluno = i;
        generate_string(a.codigo_curso, 4);
        generate_string(a.nome_aluno, 42);

        /* printf("Aluno %d:\nCurso: %s\nNome: %s\n", a.seq_aluno, a.codigo_curso, a.nome_aluno); */
        /* printf("\n"); */

        fwrite(&a, sizeof(Aluno), 1, file);
    }
}

void isrt_at_end(FILE *file) {
    Aluno a;

    Aluno teste;
    fseek(file, -sizeof(Aluno), SEEK_END);
    fread(&teste, sizeof(Aluno), 1, file);

    a.seq_aluno = teste.seq_aluno + 1;
    generate_string(a.codigo_curso, 4);
    generate_string(a.nome_aluno, 42);

    printf("Novo aluno a ser adicionado: \nAluno %d:\nCurso: %s\nNome: %s\n", a.seq_aluno, a.codigo_curso, a.nome_aluno);
    printf("\n");

    fseek(file, 0, SEEK_END);
    fwrite(&a, sizeof(Aluno), 1, file);
}


void read_random(FILE *file, int seq_aluno, Aluno *aluno) {
    fseek(file, seq_aluno * sizeof(Aluno), SEEK_SET);
    fread(aluno, sizeof(Aluno), 1, file);
}

void update_random(FILE *file, int seq_aluno, char *novo_nome, char *novo_codigo) {
    Aluno newAluno;
    newAluno.seq_aluno = seq_aluno;
    if (novo_nome != NULL)
        strcpy(newAluno.nome_aluno, novo_nome);

    if (novo_codigo != NULL)
        strcpy(newAluno.codigo_curso, novo_codigo);

    fseek(file, sizeof(Aluno) * seq_aluno, SEEK_SET);
    fwrite(&newAluno, sizeof(Aluno), 1, file);
}

void delete_random(FILE *file, int seq_aluno) {
    Aluno aluno_a_remover;

    fseek(file, seq_aluno * sizeof(Aluno), SEEK_SET);
    fread(&aluno_a_remover, sizeof(Aluno), 1, file);

    aluno_a_remover.seq_aluno = (aluno_a_remover.seq_aluno >= 0) ? -1*aluno_a_remover.seq_aluno : aluno_a_remover.seq_aluno;

    fseek(file, seq_aluno * sizeof(Aluno), SEEK_SET);
    fwrite(&aluno_a_remover, sizeof(Aluno), 1, file);
}

void varredura_sequencial(FILE *file, int tam_bloco) {

    Aluno a;
    fseek(file, -sizeof(Aluno), SEEK_END);
    fread(&a, sizeof(Aluno), 1, file);

    a.seq_aluno = (a.seq_aluno < 0) ? -a.seq_aluno : a.seq_aluno; // faz o abs do último número de sequência. permite-nos encontrar o total de regs no arquivo.
    int total_registros = a.seq_aluno + 1, i = 0;
    int registros_validos = 0, nro_lidos = 0;

    fseek(file, 0, SEEK_SET);

    struct timespec start, end;

    clock_gettime(CLOCK_REALTIME, &start);

    Aluno* bloco = malloc(tam_bloco * sizeof(Aluno));

    while (i < total_registros) {
        int registros_a_ler = tam_bloco, j = 0;

        if (total_registros - i < tam_bloco)
            registros_a_ler = total_registros - i;

        /* printf("Lendo %d registros... (registros lidos: %d)\n", registros_a_ler, i); */

        if (fread(bloco, sizeof(Aluno), registros_a_ler, file) != registros_a_ler)
        {
            printf("Erro na leitura!");
            free(bloco);
            return;
        }

        for(; j < registros_a_ler; j++)
        {
            if (bloco[j].seq_aluno >= 0)
                registros_validos++;

        }

        nro_lidos++;
        i += registros_a_ler;
    }

    clock_gettime(CLOCK_REALTIME, &end);

    struct timespec result = diff(start, end);

    printf("\nQuantidade de registros válidos: %d\nNro de Blocos Lidos: %d\nTempo de processamento: %ld:%lds\n", registros_validos, nro_lidos, result.tv_sec, result.tv_nsec);

    free(bloco);
}

void varredura_aleatoria(FILE *file) {

    Aluno a;
    fseek(file, -sizeof(Aluno), SEEK_END);
    fread(&a, sizeof(Aluno), 1, file);

    a.seq_aluno = (a.seq_aluno < 0) ? -a.seq_aluno : a.seq_aluno; // faz o abs do último número de sequência. permite-nos encontrar o total de regs no arquivo.
    int total_registros = a.seq_aluno + 1, i = 0;
    int registros_validos = 0, registros_invalidos = 0;

    /* printf("Aqui!\n"); */
    srand(time(NULL));

    struct timespec start, end;

    clock_gettime(CLOCK_REALTIME, &start);

    for(i = 0; i < total_registros / 100; i++)
    {
        int seq = rand() % total_registros;
        fprintf(stderr, "Registro (%d/%d): %do registro\n", i+1, total_registros / 100, seq);
        fseek(file, sizeof(Aluno) * seq, SEEK_SET);
        fread(&a, sizeof(Aluno), 1, file);
        if (a.seq_aluno >= 0)
            registros_validos++;
        else
            registros_invalidos++;
    }

    clock_gettime(CLOCK_REALTIME, &end);

    struct timespec result = diff(start, end);
// 10:23
    printf("\nTempo de acesso aleatório (a 1%% dos registros): %ld:%lds\nRegistros válidos: %d\nRegistros inválidos: %d\n", result.tv_sec, result.tv_nsec, registros_validos, registros_invalidos);
}
