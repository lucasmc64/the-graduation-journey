#define maximo 10

typedef struct dados Lista;

Lista *inicializar_lista();
int lista_vazia(Lista *p);
int lista_cheia(Lista *p);
int insere_ord(Lista *p, int num);
int remove_ord(Lista *p, int n);
void imprime(Lista *p);
int menor_elemento(Lista *p, int *men);
int tamanho_lista(Lista *p, int *tam);

