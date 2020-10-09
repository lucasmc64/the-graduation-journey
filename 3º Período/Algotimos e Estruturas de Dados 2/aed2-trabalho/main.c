#include <stdio.h>
#include <stdlib.h>
#include "ALL.h"

/*
    Grupo ALL
    Integrantes:
    Alana Soares Reis - 11911BCC055
    Lucas Marçal Coutinho - 11911BCC012
    Lucas Mattos Vieira - 11911BCC015
*/

int main()
{
    printf("Trabalho GBC034!\n");

    ArvB *raiz;
    raiz = cria_ArvB();

    int vet1[20] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
    int vet2[20] = {20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1};
    int vet3[20] = {11,12,13,14,15,16,17,18,19,20,1,2,3,4,5,6,7,8,9,10};
    int vet4[20] = {10,9,8,7,6,5,4,3,2,1,20,19,18,17,16,15,14,13,12,11};
    int vet5[20] = {11,12,13,14,15,5,4,3,2,1,16,17,18,19,20,10,9,8,7,6};
    int vet6[20] = {1,12,3,14,5,15,4,13,2,11,6,17,8,19,20,10,9,18,7,16};
    int vet7[20] = {20,8,2,11,13,3,7,18,14,4,16,10,15,1,9,17,19,12,5,6};

    int resp, i;

    for(i = 0; i < 20; i++) {
        insere_ArvB(raiz, vet1[i]);
    }

    //emOrdem_ArvB(raiz);

    resp = totalNO_ArvB(raiz);
    //printf("\nTotal de nos ANTES: %d\n", resp);

    resp = remove_ArvB(raiz, 11);
    resp = remove_ArvB(raiz, 6);
    resp = remove_ArvB(raiz, 2);

    printf("\n");

    //emOrdem_ArvB(raiz);

    resp = totalNO_ArvB(raiz);
    printf("\nTotal de nos DEPOIS: %d\n", resp);

    libera_ArvB(raiz);

    return 0;
}
