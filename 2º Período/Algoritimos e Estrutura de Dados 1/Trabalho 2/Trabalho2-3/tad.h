#define max 20

typedef struct pilha Pilha;

Pilha *cria_pilha();
int pilha_vazia(Pilha *p);
int pilha_cheia(Pilha *p);
int push(Pilha *p, char n);
int pop(Pilha *p, char *n);
int le_topo(Pilha *p, char *n);
void imprime(Pilha *p);
void imprime_reverso(Pilha *p);
int eh_palindromo(char *n);
