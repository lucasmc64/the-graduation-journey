#define maximo 10
typedef struct lista Lista;

Lista *cria_lista();
int lista_vazia(Lista *p);
int lista_cheia(Lista *p);
int insere_ord(Lista *p, int num);
int remove_ord(Lista *p, int n);
int remove_elemento_par(Lista *p);
void imprime(Lista *p);
int maior_elemento(Lista *p, int *mai);
int tamanho_lista(Lista *p, int *tam);
int intercala_listas(Lista *p, Lista *q, Lista **Li3);
