#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Digite N: ");
    int n;
    scanf("%d", &n);
    int i = 1;
    int c = 1;
    int m = 0;
    printf("%d ", i);
    while(c <= n){
        m = i;
        printf("%d ", i);
        i += m;
        c++;
    }
    return 0;
}
