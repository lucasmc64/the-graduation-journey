#define maximo 20

typedef struct dados Pilha;

Pilha *cria_pilha();
int pilha_vazia(Pilha *p);
int pilha_cheia(Pilha *p);
int push(Pilha *p, int n);
int pop(Pilha *p, int *n);
int le_topo(Pilha *p, int *n);
int imprime(Pilha *p);
int converte_dec_para_bin(int n);
