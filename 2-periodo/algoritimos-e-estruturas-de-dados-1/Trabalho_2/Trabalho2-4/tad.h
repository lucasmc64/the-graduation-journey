typedef struct no Pilha;

Pilha *cria_pilha();
int pilha_vazia(Pilha *p);
int push(Pilha **p, char n);
int pop(Pilha **p, char *n);
int le_topo(Pilha **p, char *n);
void imprime(Pilha **p);
int par_e_impar(Pilha **p, Pilha **par, Pilha **impar);
