typedef struct lista Lista;

Lista *cria_lista();
int lista_vazia(Lista *p);
int insere_final(Lista **p, int n);
int remove_inicio(Lista **p);
void imprime(Lista **p);
int tamanho_lista(Lista **p, int *tamanho);
int insere_inicio(Lista **p, int n);
int insere_na_posicao(Lista **p, int n, int k);
int remove_na_posicao(Lista **p, int k);
