#include <stdio.h>
#include <stdlib.h>

#include "hash.h"

void createHash(FILE *file) {

    fseek(file, 0, SEEK_SET);
    
    Diretorio dir;
    dir.nivel = 0;
    dir.next = 0;
    dir.n = 4;
    fwrite(&dir, sizeof(Diretorio), 1, file);
    printf("Escrevi diretorio no arquivo!\n");


    for (int i = 0; i < dir.n; i++) {
        Bucket1 bucket;

        bucket.n_entradas = 0;
        bucket.overflow = -1;
        
        fwrite(&bucket, sizeof(Bucket1), 1, file);
        printf("Escrevi bucket %d!\n",i);
    }
}

void insertHash(FILE *file, Registro reg){

    int entrada = reg.seq_aluno;

    fseek(file, 0, SEEK_SET);

    Diretorio dir;
    fread(&dir, sizeof(Diretorio), 1, file);

    // hash da entrada
    int hash = entrada % dir.n;

    fseek(file, sizeof(Diretorio) + hash*sizeof(Bucket1), SEEK_SET);

    Bucket1 bucket;
    fread(&bucket, sizeof(Bucket1), 1, file);

    bucket.entradas[bucket.n_entradas] = reg;
    bucket.n_entradas++;

    fseek(file, sizeof(Diretorio) + hash*sizeof(Bucket1), SEEK_SET);
    fwrite(&bucket, sizeof(Bucket1), 1, file);

}

void printHash(FILE *file) {

    fseek(file, 0, SEEK_SET);

    Diretorio dir;
    fread(&dir, sizeof(Diretorio), 1, file);

    printf("\nHash Index:\nNível: %d\nNext: %d\n",dir.nivel,dir.next);

    int i = 0;
    int c = fgetc(file);
    while (c != EOF) {
        Bucket1 bucket;
        fread(&bucket, sizeof(Bucket1), 1, file);

        printf("\nBucket %d: [",i);
        for (int j = 0; j < 4; j++) {
            if (j < bucket.n_entradas) {
                printf("%d,",bucket.entradas[i].seq_aluno);
            } else {
                printf("  ,");
            }
        }
        printf("]");
        i++;
        c = fgetc(file);
    }
    printf("\n");
}