#include <stdio.h>
#include <stdlib.h>
#include "BPlusTree.h"
#define D 2

struct NO_A1 {
    int total_chaves;
    int chaves[2 * D];
    struct NO_A1 *filha[2 * D + 1];
};

struct NO_A2 {
    int total_chaves;
    char chaves[2 * D][11];
    struct NO_A2 *filha[2 * D + 1];
};

struct NO_A3 {
    int total_chaves;
    int chaves[2 * D][35];
    struct NO_A3 *filha[2 * D + 1];
};
