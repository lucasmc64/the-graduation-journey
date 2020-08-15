typedef struct Ponto Ponto;

Ponto *cria_pto(int x, int y);
void libera_pto(Ponto **p);
int distancia_pto(Ponto *a, Ponto *b, double *resp);
