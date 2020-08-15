typedef struct no Lista;

Lista *cria_lista();
int lista_vazia(Lista *p);
int insere_ord(Lista **p, int nelemento);
int remove_ord(Lista **p, int n);
void imprime(Lista **p);
int remove_par(Lista **p);
int menor_elemento(Lista **p, int *menor);
int maior_elemento(Lista **p, int *maior);
int tamanho_lista(Lista **p, int *tamanho);
int intercala_listas(Lista **p, Lista **q, Lista **panda);
int verificar_igualdade(Lista **p, Lista **q);
