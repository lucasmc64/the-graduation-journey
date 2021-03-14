typedef struct no Lista;

Lista *cria_lista();
int lista_vazia(Lista *p);
int insere_elemento(Lista **p, int n);
void imprime(Lista **p);
int remove_elemento(Lista **p, int n);
int tamanho_lista(Lista **p, int *tamanho);
int remove_todos(Lista **p);
int remove_ocorrencias(Lista **p, int n);
