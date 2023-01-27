
typedef struct aluno {
    int seq_aluno;
    char codigo_curso[3];
    char nome_aluno[33];
} Aluno;

typedef struct curso {
    int seq_curso;
    char codigo_curso[3];
    char nome_curso[17];
} Curso;

typedef struct aluno_curso {
    int seq_curso;
    char codigo_curso[3];
    char nome_curso[17];
    int seq_aluno;
    char nome_aluno[33];
} AlunoCurso;

void join(FILE *tabela1, FILE *tabela2, FILE *juncao, int M, int N, int B);
void gerar_string(char *string , int length);
void popula_tabela1(FILE *f, int M, int N, char codigos_curso[]);
void popula_tabela2(FILE *f, int N, char codigos_curso[]);