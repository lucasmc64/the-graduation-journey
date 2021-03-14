#include "tad.h"
#include <stdlib.h>
#include <math.h>

struct Ponto{
    int x;
    int y;
};

Ponto *cria_pto(int x, int y){
    Ponto *p;
    p = (Ponto *) malloc(sizeof(Ponto));
    p->x = x;
    p->y = y;

    //a = p;
    return p;
}

void libera_pto(Ponto **p){
    free(*p);
    *p = NULL;
}

int distancia_pto(Ponto *a, Ponto *b, double *resp){
    if(a == NULL || b == NULL || resp == NULL){
        return 1;
    }
    //printf("%d", a->x);
    *resp = sqrt(pow((a->x - b->x), 2) + pow((a->y - b->y), 2));
    return 0;
}

