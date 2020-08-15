#define maxaaj 10
typedef struct no Pilha;

Pilha *cria_pilha();
int pilha_vazia(Pilha **p);
int push_int(Pilha **p, int n);
int push_char(Pilha **p, char n);
int pop_int(Pilha **p, int *n);
int pop_char(Pilha **p, char *n);
int le_topo_int(Pilha **p, int *n);
int le_topo_char(Pilha **p, char *n);
void imprime_int(Pilha **p);
void imprime_char(Pilha **p);
void pos_fixa(char *expressao, int *aaj);
