typedef struct no Lista;

Lista *cria_lista();
int lista_vazia(Lista *p);
int insere_elemento(Lista **p, int nelemento);
int insere_elemento_final(Lista **p, int nelemento);
int remove_no(Lista **p, int n);
void imprime(Lista **p);
int remove_todos(Lista **p);
int remove_impar(Lista **p);
int menor_elemento(Lista **p, int *menor);
int tamanho_lista(Lista **p, int *tamanho);
int concatena(Lista *lst, Lista *lst2, Lista **lst3);
