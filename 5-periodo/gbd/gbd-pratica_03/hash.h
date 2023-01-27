typedef struct REG_ALUNO {
    int seq_aluno;
    char codigo_curso[4];
    char matricula_aluno[12];
    char nome_aluno[44];
} Registro;

typedef struct DIR {
    int nivel;
    int n;
    int next;
} Diretorio;

typedef struct BUCKET_1 {
    Registro entradas[4];
    long int overflow;
    int n_entradas;
} Bucket1;

void createHash(FILE *file);
void insertHash(FILE *file, Registro reg);
void printHash(FILE *file);
