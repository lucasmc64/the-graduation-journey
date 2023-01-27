#ifndef GBD_H_
#define GBD_H_

#include <stdio.h>

typedef struct aluno {
    int seq_aluno;
    char codigo_curso[4]; // 4 caracteres para ser 3 caracteres de curso + \0
    char nome_aluno[42];
} __attribute__((packed)) Aluno;

// R02
void create_heap_file(FILE *file, int nro_de_registros); // pronto
void read_random(FILE *file, int seq_aluno, Aluno *aluno); // Lucas Marçal
void isrt_at_end(FILE *file); // Eduardo
void update_random(FILE *file, int seq_aluno, char *novo_nome, char *novo_codigo); // Guilherme
void delete_random(FILE *file, int seq_aluno); // Lucas Matos

// R03
void varredura_sequencial(FILE *file, int tam_bloco); // Carmo

// R04
void varredura_aleatoria(FILE *file); // Carmo

#endif // GBD_H_
