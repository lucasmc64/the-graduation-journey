typedef struct Ponto Ponto;
typedef struct circulo Circulo;

Circulo *cria_circ(Ponto *a1, Ponto *a2);
void libera_circ(Circulo **c);
Ponto *cria_pto(int x, int y);
void libera_pto(Ponto **p);
int distancia_pto(Ponto *a, Ponto *b, double *resp);
