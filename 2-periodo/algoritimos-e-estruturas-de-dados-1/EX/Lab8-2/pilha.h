typedef struct no Pilha;


Pilha *cria_pilha();
int pilha_vazia(Pilha *p);
int push(Pilha **p, int n);
int pop(Pilha **p, int *n);
int le_topo(Pilha **p, int *n);
void imprime(Pilha **p);
