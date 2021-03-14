#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int main()
{
    char nome1[16], nome2[16], nome3[16];
    setbuf(stdin, NULL);
    scanf("%s %s %s", nome1, nome2, nome3);
    if(nome1 == "vertebrado"){
        if(nome2 == "ave"){
            if(nome3 == "carnivoro"){
                printf("aguia\n");
            }else if(nome3 == "onivoro"){
                printf("pomba\n");
            }
        }else if(nome2 == "mamifero"){
            if(nome3 == "onivoro"){
                printf("homem\n");
            }else if(nome3 == "herbivoro"){
                printf("vaca\n");
            }
        }
    }else if(nome1 == "invertebrado"){
        if(nome2 == "inseto"){
            if(nome3 == "hematofago"){
                printf("pulga\n");
            }else if(nome3 == "herbivaro"){
                printf("lagarta\n");
            }
        }else if(nome2 == "anelideo"){
            if(nome3 == "hematofago"){
                printf("sanguessuga\n");
            }else if(nome3 == "onivoro"){
                printf("minhoca\n");
            }
        }
    }
    return 0;
}
