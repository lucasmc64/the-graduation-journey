typedef struct no Fila;

Fila *cria_fila();
int fila_vazia(Fila *f);
int insere_ord(Fila **f, int n);
int remove_ini(Fila **f, int *n);
