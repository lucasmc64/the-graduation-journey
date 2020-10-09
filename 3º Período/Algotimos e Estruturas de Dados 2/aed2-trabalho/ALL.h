typedef struct NO *ArvB;

ArvB *cria_ArvB();
void libera_ArvB(ArvB *raiz);
int insere_ArvB(ArvB *raiz, int valor);
int remove_ArvB(ArvB *raiz, int valor);
int busca_ArvB(ArvB *raiz, int valor);
void emOrdem_ArvB(ArvB *raiz);
int totalNO_ArvB(ArvB *raiz);
int ehVazia_ArvB(ArvB *raiz);
