#include <stdio.h>

void main(){
   float n;
   printf("Digite a temperatura em graus Kelvin: ");
   scanf("%f", &n);
   printf("A temperatura em graus Celcius e %.2f!\n", n - 273.15);
   return 0;
}
