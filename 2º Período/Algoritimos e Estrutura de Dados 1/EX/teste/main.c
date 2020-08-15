#include <stdio.h>
#include <stdlib.h>
#define max 5

int main()
{
    int i,j;
    for(i = 0; i < max; i++){
        for(j = 0; j < i+1; j++){
            printf("!");
        }
        printf("\n");
    }
    return 0;
}
