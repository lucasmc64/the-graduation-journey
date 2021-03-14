#define maximo 10
typedef struct lista Lista;

Lista *cria_lista();
int lista_vazia(Lista *p);
int lista_cheia(Lista *p);
int insere_elemento(Lista *p, int num);
int insere_elemento_no_inicio(Lista *p, int num);
int remove_elemento(Lista *p, int n);
int remove_elemento_impar(Lista *p);
int remove_todos(Lista *p);
void imprime(Lista *p);
int menor_elemento(Lista *p, int *men);
int tamanho_lista(Lista *p, int *tam);
int concatena_listas(Lista *p, Lista *q, Lista **Li3);

