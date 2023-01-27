#include <stdbool.h>

#define ORDER 3

typedef struct REG_ALUNO {
    int seq_aluno;
    char matricula_aluno[12];
    char nome_aluno[36];
} Registro;

typedef struct B_PLUS_TREE {
    long int raiz;
} Arvore;

typedef struct NO_TIPO_1 {
    bool eh_folha;
    long int ponteiros[ORDER+1];
    long int anterior;
    long int proximo;
    struct REG_ALUNO registros[ORDER];
    int chaves[ORDER];
    int total_chaves;
} No_1;

typedef struct NO_TIPO_2 {
    bool eh_folha;
    long int ponteiros[ORDER+1];
    long int anterior;
    long int proximo;
    // alternativa 2
    int chaves[ORDER];
    int total_chaves;
} No_2;

typedef struct NO_TIPO_3 {
    bool eh_folha;
    long int ponteiros[ORDER+1];
    long int anterior;
    long int proximo;
    // alternativa 3
    int chaves[ORDER];
    int total_chaves;
} No_3;

void criaArvore(FILE *file, int alternativa);
void insereArvore(FILE *file, Registro novo_reg, int alternativa);
void imprimeArvore(FILE *file, int alternativa);