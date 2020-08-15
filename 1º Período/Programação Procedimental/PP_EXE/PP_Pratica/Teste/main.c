#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct cadastro{
    char nome[50];
    int idade;
    int codigo;
};

void muda(struct cadastro *a){
    a->idade = 100;
}

int main()
{
    struct cadastro c;
    setbuf(stdin, NULL);
    gets(c.nome);
    scanf("%d %d", &c.idade, &c.codigo);
    printf("nome: %s\tidade: %d\tcodigo: %d\n", c.nome, c.idade, c.codigo);

    muda(&c);

    printf("nome: %s\tidade: %d\tcodigo: %d\n", c.nome, c.idade, c.codigo);
    return 0;
}
