#define max 20
typedef struct fila Fila;

Fila *cria_fila();
int fila_vazia(Fila *f);
int fila_cheia(Fila *f);
int insere_fim(Fila *f, int n);
int remove_ini(Fila *f, int *n);
void imprime(Fila *f);
