typedef struct no No;
typedef struct posicao Deque;

Deque *cria_deque();
int deque_vazia(Deque *p);
int insere_inicio(Deque **d, int n);
int insere_fim(Deque **d, int n);
int remove_inicio(Deque **d, int *n);
int remove_final(Deque **d, int *n);
void imprime(Deque **d);
