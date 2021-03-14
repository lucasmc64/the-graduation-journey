#include<stdio.h>
#include "tad.h"
struct racional {
    int num, den;
};

Racional * generate() {
    Racional * p;
    p = (Racional *) malloc(sizeof(Racional));
    return p;
}

int set_value(Racional *p, int N, int D) {
    if (p == NULL || D == 0)
        return 0; // Falha
    p->num = N;
    p->den = D;
    return 1; // Sucesso
}


int get_value(Racional *p, int *N, int *D) {
    if (p == NULL)
        return 0; // Falha
    *N = p->num;
    *D = p->den;
    return 1; // Sucesso
}

Racional *sum(Racional *R1, Racional *R2) {
    Racional *R3;
    R3 = generate(); // Cria um racional e atribui seu end. a R3
    if (R3 != NULL) {
        R3->num = (R1->num*R2->den) + (R2->num*R1->den);
        R3->den = (R1->den * R2->den);
    }
    return R3; // Sucesso ou Falha
}


void delete(Racional **p) {
    free(*p);
} // Libera a memória *p = NULL; // Limpa o ponteiro para racional

Racional *prod(Racional *r1, Racional *r2){
    Racional *r3;
    r3 = generate();
    if (r3 != NULL){
        r3->num = r1->num * r2->num;
        r3->den = r1->den * r2->den;
    }
    return r3;
}
