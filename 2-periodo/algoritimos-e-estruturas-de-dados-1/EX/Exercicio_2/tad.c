#include "tad.h"
#include <stdlib.h>
#include <math.h>

struct Ponto{
    int x;
    int y;
};

struct circulo{
    Ponto *p1;
    Ponto *p2;
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

Circulo *cria_circ(Ponto *a1, Ponto *a2){
    Circulo *c;
    c = (Circulo *) malloc(sizeof(Circulo));
    //printf("%d \t", c->p1);
    c->p1 = a1;
    c->p2 = a2;
    //printf("%d  ", c->p1);
    //printf("%d  ", a1);
    return c;
}

void libera_circ(Circulo **c){
    free(*c);
    *c = NULL;
}

void area_circ(Circulo *c, double *resp){
    double raio;
    distancia_pto(c->p1, c->p2, &raio);
    //printf("%lf", raio);
    double area = 3.14 * pow(raio, 2);
    *resp = area;
}
