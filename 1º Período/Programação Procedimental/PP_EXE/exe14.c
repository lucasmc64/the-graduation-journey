#include <stdio.h>

int main(){
    printf("Digite o angulo em graus: ");
    int a;
    scanf("%d", &a);
    float resp = a * (3.14 / 180);
    printf("O angulo convertido em radianos e igual a %.2f!", resp);
    return 0;
}
