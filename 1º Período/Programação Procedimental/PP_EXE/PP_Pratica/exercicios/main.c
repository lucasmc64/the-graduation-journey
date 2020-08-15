#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//LISTA 1 - VARIÁVEIS E EXPRESSÕES.

int main101(){
    int n;
    printf("Digite um numero: ");
    scanf("%d", &n);
    printf("O numero digitado foi %d!", n);
    return 0;
}
int main102(){
    printf("Digite um numero real: ");
    float n;
    scanf("%f", &n);
    printf("Vocce digitou o numero %.2f!\n", n);
    return 0;
}
int main103(){
    int a, b, c;
    printf("Por favor, digite o PRIMEIRO numero inteiro: ");
    scanf("%d", &a);
    printf("Por favor, digite o SEGUNDO numero inteiro: ");
    scanf("%d", &b);
    printf("Por favor, digite o TERCEIRO numero inteiro: ");
    scanf("%d", &c);
    printf("A soma entre %d, %d e %d equivale a %d!\n", a, b, c, a + b + c);
    return 0;
}
int main104(){
    float n;
    printf("Digite um numero real: ");
    scanf("%f", &n);
    printf("O quadrado de %.2f e igual a %.2f!", n, n * n);
    return 0;
}
int main105(){
    float n;
    printf("Digite um numero real: ");
    scanf("%f", &n);
    printf("A quinta parte do número %.2f e %.4f!\n", n, n/5);
    return 0;
}
int main106(){
    float cel;
    printf("Digite a temperatura em graus Celcius: ");
    scanf("%f", &cel);
    printf("A temperatura em graus Fahrenheit e %.2f!\n", cel * (9.0/5.0) + 32);
    return 0;
}
int main107(){
    float fa;
    printf("Digite a temperatura em graus Fahrenheit: ");
    scanf("%f", &fa);
    printf("A temperatura em graus Celcius e %.2f!\n", 5.0 * (fa - 32.0)/9);
    return 0;
}
int main108(){
   float n;
   printf("Digite a temperatura em graus Kelvin: ");
   scanf("%f", &n);
   printf("A temperatura em graus Celcius e %.2f!\n", n - 273.15);
   return 0;
}
int main109(){
    float n;
    printf("Digite a temperatura em graus Celcius: ");
    scanf("%f", &n);
    printf("A temperatura em graus Kelvin e %.2f!\n", n + 273.15);
    return 0;
}
int main110(){
    float km;
    printf("Digite a velocidade em quilometros por hora (km/h): ");
    scanf("%f", &km);
    printf("Essa velocidade em metros por segundo (m/s) e igual a %.2f!\n", km / 3.6);
    return 0;
}
int main111(){
    float vel;
    printf("Digite a velocidade em metros por segundo (m/s): ");
    scanf("%f", &vel);
    printf("Essa velocidade em quilometros por hora (km/h) e igual a %.2f!\n", vel * 3.6);
    return 0;
}
int main112(){
    float milhas;
    printf("Digite a distancia em milhas: ");
    scanf("%f", &milhas);
    printf("A velocidade em quilometros por hora e %.2f!", 1.61 * milhas);
    return 0;
}
int main113(){
    float n;
    printf("Digite a distancia em quilometros: ");
    scanf("%f", &n);
    printf("A distancia em milhas e igual a %.2f!", n / 1.161);
    return 0;
}
int main114(){
    printf("Digite o angulo em graus: ");
    int a;
    scanf("%d", &a);
    float resp = a * (3.14 / 180);
    printf("O angulo convertido em radianos e igual a %.2f!", resp);
    return 0;
}

int main132()
{
    int num;
    printf("Digite um numero: ");
    scanf("%d", &num);
    printf("O resultado e %d.", (num * 3 + 1) + (num * 2 - 1));
    return 0;
}
int main135()
{
    int a, b, r;
    printf("Digite um A: ");
    scanf("%d", &a);
    printf("Digite um B: ");
    scanf("%d", &b);
    printf("O valor da hipotenusa e %.0lf.", sqrt(pow(a,2) + pow(b,2)));
    return 0;
}
int main139()
{
    int din = 780000, g1, g2, g3;
    g1 = 780000 * 46 / 100;
    g2 = 780000 * 32 / 100;
    g3 = 780000 - g1 - g2;
    printf("1º Lugar: %d\n2º Lugar: %d\n3º Lugar: %d\n", g1, g2, g3);
    return 0;
}
int main144()
{
    int ndeg;
    float altd, altura;
    printf("Digite a altura dos degraus: ");
    scanf("%f", &altd);
    printf("Digite a altura que deseja atingir: ");
    scanf("%f", &altura);
    ndeg = (int) altura / altd;
    printf("O numero de degraus necessarios e %d.", ndeg);
    return 0;
}
int main145()
{
    char l;

    printf("Digite a letra escolhida: ");
    scanf("%c", &l);

    if(l >= 65 && l <= 90){
        printf("%c", l + 32);
    }else if (l >= 97 && l <= 122){
        printf("%c", l - 32);
        }
    return 0;
}
int main146()
{
    int n, n1, n2, n3;
    printf("Digite um numero de 100 a 999: ");
    scanf("%d", &n);
    n1 = n / 100;
    n2 = (n - n1*100) / 10;
    n3 = (n - n2*10 - n1*100) / 1;
    printf("%d%d%d", n3, n2, n1);
    return 0;
}
int main147()
{
    int n, n1, n2, n3, n4;
    printf("digite um numeor de 4digitos:\n");
    scanf("%d", &n);
    n1 = n/1000;
    n2 = (n - n1*1000) / 100;
    n3 = (n - n2*100 - n1*1000) / 10;
    n4 = (n - n3*10 -n2*100 - n1*1000);

    printf("%d%d%d%d", n4, n3, n2 ,n1);
    return 0;
}
int main149()
{
    int h, m, s, d, tot;
    printf("Digite a hora, minutos e segundos do momento e os segundo de duracao da experiencia: ");
    scanf("%d %d %d %d", &h, &m, &s, &d);
    tot = h * 3600 + m * 60 + s + d;
    h = tot / 3600;
    m = (tot % 3600)/60;
    s = (tot % 3600)%60;
    printf("O horario de termino da experiencia sera %d horas %d minutos %d segundos", h, m, s);
    return 0;
}

//FIM LISTA 1.

//LISTA 2 - COMANDOS CONDICIONAIS.

int main211()
{
    int n, n1, n2, n3, s;
    printf("digite um numeor de 3digitos:\n");
    scanf("%d", &n);
     if(n>0){
    n1 = n / 100;
    n2 = (n - n1*100) / 10;
    n3 = (n - n2*10 - n1*100) / 1;
    s = n1+n2+n3;
    printf(" a soma dos algarismos e %d", s);
    }else{
        printf("numero invalido!");
        }
    return 0;
}
int main219()
{
    int n;
    printf("Digite um numero: ");
    scanf("%d", &n);
    if((n % 3 == 0 || n % 5 ==0) && (n % 3 != n % 5)){
        printf("E divisivel por 3 OU por 5");
    }else{
        printf("Nao e divisivel por nenhum ou por todos.");
    }
    return 0;
}
int mainRAND
()
{
    //COMO USAR O RANDOM??? NUNCA SABEREMOS...
    printf("%d", rand()%100);
    return 0;
}

//FIM LISTA 2.

//LISTA 3 - COMANDOS DE REPETIÇÃO.


int main307()
{
    int n=1;

    do{
        printf("Digite um numero: ");
        scanf("%d", &n);
    }while(n<0);
    return 0;
}

//FIM LISTA 3.

//LISTA 4 - VETORES
int main401()
{
    int A[6] = {1, 0, 5, -2, -5, 7};
    int s = A[0] + A[1] + A[5];
    A[4] = 100;
    for(int i = 0; i <6; i++){
        printf("A[%d] = %d\n", i, A[i]);
    }
    return 0;
}
int main402()
{
    int A[6];
    for(int i = 0; i <6; i++){
        printf("Digite o %do valor: \n", i + 1);
        scanf("%d", &A[i]);
    }
    printf("\n\n");
    for(int i = 0; i <6; i++){
        printf("O %do valor lido e: %d.\n", i + 1, A[i]);
    }
    return 0;
}
int main403()
{
    float n[10], r[10];
    for(int i = 0; i < 10; i++){
        printf("Digite o %do valor: ", i + 1);
        scanf("%f", &n[i]);
    }
    printf("\n\n");
    printf("Os valores do primeiro conjunto sao: \n");
    for(int i = 0; i < 10; i++){
        printf("n[%d] = %f.\n", i, n[i]);
    }
    printf("\n\n");
    printf("Os valores do segundo conjunto sao: \n");
    for(int i = 0; i < 10; i++){
        r[i] = n[i] * n[i];
        printf("r[%d] = %f.\n", i, r[i]);
    }
    return 0;
}
int main404()
{
    int vet[8], x, y;
    for(int i = 0; i <8; i++){
        printf("Digite o valor do vetor na posicao %d: ", i);
        scanf("%d", &vet[i]);
    }
    printf("\n\n");
    do{
        printf("Digite a posicao X do vetor: ");
        scanf("%d", &x);
        if(x < 0 || x > 7)
            printf("Posicao invalida!\n\n");
    }while(x < 0 || x > 7);
    printf("\n\n");
    do{
        printf("Digite a posicao Y do vetor: ");
        scanf("%d", &y);
        if(y < 0 || y > 7)
            printf("Posicao invalida!\n\n");
    }while(y < 0 || y > 7);
    printf("\n\n");
    printf("A soma dos vetores vet[%d] e vet[%d] e igual a %d!\n", x, y, vet[x] + vet[y]);
    return 0;
}
int main405()
{
    int v[10], cont = 0;
    for(int i = 0; i < 10; i++){
        printf("Digite o %do valor: ", i + 1);
        scanf("%d", &v[i]);
        if(v[i] % 2 == 0){
            cont++;
        }
    }
    printf("\n\n");
    printf("Existem %d valores pares entre os numeros digitdos!\n", cont);
    return 0;
}
int main406()
{
    int v[10], mai, men;
    for(int i = 0; i < 10; i++){
        printf("Digite %do numero: ", i + 1);
        scanf("%d", &v[i]);
        if(i == 0){
            mai = v[i];
            men = v[i];
        }
        if(mai < v[i]){
            mai = v[i];
        }
        if(men > v[i]){
            men = v[i];
        }
    }
    printf("O maior numero digitado foi %d.\nO menor numero digitado foi %d.", mai, men);
    return 0;
}
int main407()
{
    int v[10], mai, x;
    for(int i = 0; i < 10; i++){
        printf("Digite %do numero: ", i + 1);
        scanf("%d", &v[i]);
        if(i == 0){
            mai = v[i];
            x = i;
        }
        if(mai < v[i]){
            mai = v[i];
            x = i;
        }
    }
    printf("\n\n +++ IMPRIMINDO O VETOR +++ ");
    for(int i = 0; i < 10; i++){
        printf("\nVetor[%d] = %d", i, v[i]);
    }
    printf("\nO maior numero digitado foi %d.\n", mai);
    printf("E sua posicao e Vetor[%d].", x);
    return 0;
}
int main408()
{
    int v[6];
    for(int i = 0; i < 6; i++){
        printf("Digite o %do valor: ", i + 1);
        scanf("%d", &v[i]);
    }
    printf("+=+=+ PRINTANDO AO CONTRARIO +=+=+\n\n");
    for(int n = 5; n >= 0; n--){
        printf("%d  ", v[n]);
    }
    return 0;
}
int main409()
{
    int v[10];
    for(int i = 0; i < 6; ){
        printf("Digite o %do valor par: ", i + 1);
        scanf("%d", &v[i]);
        if(v[i] % 2 == 0){
            i++;
        }else{
            printf("NUMERO INVALIDO! TENTE NOVAMENTE!");
        }
    }
    printf("+=+=+ PRINTANDO AO CONTRARIO +=+=+\n\n");
    for(int n = 9; n >= 0; n--){
        printf("%d  ", v[n]);
    }
    return 0;
}
int main410()
{
    double n[15], s = 0, r;
    for(int i = 0; i < 15; i++){
        scanf("%lf", &n[i]);
        s += n[i];
    }
    r = s / 15;
    printf("A media geral e: %lf\n", r);
    return 0;
}

int main412()
{
    int v[5], mai, men, med = 0;
    for(int i = 0; i < 5; i++){
        scanf("%d", &v[i]);
        if(i == 0){
            mai = v[i];
            men = v[i];
        }
        if(mai < v[i]){
            mai = v[i];
        }
        if(men > v[i]){
            men = v[i];
        }
        med += v[i];
    }
    med = med / 5;
    printf("A media e %d\nO maior valor e %d\nO menor valor e %d\n", med, mai, men);
    return 0;
}

int main415()
{
    int v[20], c = 0;
    for(int i = 0; i <20; i++){
        scanf("%d", &v[i]);
    }
    for(int i = 0; i <20; i++){
        if(i == 0){
            printf("%d", v[i]);
        }else{
            for(int j = i; j <= 0; j--){
                if(v[i] == v[j]){
                    c++;
                }
            }
            if(c != 0){
                printf("%d", v[i]);
            }
        }
    }
    return 0;
}

int main428()
{
    int v[10], par[10], impar[10], p = 0, i = 0, j = 0;
    for(int b = 0; b < 10; b++){
        scanf("%d", &v[b]);
    }
    do{
        if(v[j] % 2 == 0){
            par[p] = v[j];
            p++;
        }else{
            impar[i] = v[j];
            i++;
        }
        j++;
    }while(j < 10);
    for(int c = 0; c < p; c++){
        printf("%d\t", par[c]);
    }
    printf("\n\n");
    for(int c = 0; c < i; c++){
        printf("%d\t", impar[c]);
    }
    return 0;

}

int maindiagonal()
{
    int n[3][3];
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 3; j++){
            scanf("%d", &n[i][j]);
        }
    }

    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 3; j++){
            printf("%d\t", n[i][j]);
        }
        printf("\n");
    }
    printf("\n\n");
    for(int a = 0; a < 3; a++){
        printf("%d\t", n[a][a]);
    }
    return 0;
}

int mainSLA()
{
    int mat[4][4], i, j;
    for(i=0;i<4;i++){
        for(j=0;j<4;){
            printf("entre com um valor: ");
            scanf("%d", &mat[i][j]);
            if(mat[i][j]>20 || mat[i][j]<0){
                printf("Numero invalido crlh!\n\n");
            }
            else{
                j++;

            }
        }
    }
    for(i=0;i<4;i++){
        for(j=0;j<4;j++){
            printf("%d\t",mat[i][j]);
        }
        printf("\n");
    }
    for(i=0;i<4;i++){
        for(j=i-1;0<=j;j--){
            mat[j][i] = 0;
        }
        printf("\n");
    }
    for(i=0;i<4;i++){
        for(j=0;j<4;j++){
            printf("%d\t",mat[i][j]);
        }
        printf("\n");
    }
    return 0;
}

//FIM LISTA 4.

//LISTA 5 - STRING

int main513()
{
    char f[101], c = 0;
    setbuf(stdin, NULL);
    gets(f);
    for(int i = 0; f[i] != '\0'; i++){
        if(f[i] == ' '){
            c++;
        }
    }
    printf("Existem %d espacos em branco.", c);
    return 0;
}
int main514()
{
    char f[51];
    setbuf(stdin, NULL);
    gets(f);
    for(int i = 0; f[i] != '\0'; i++){
        printf("%c ", f[i] + 1);
    }
    return 0;
}
int main517()
{
    char f[101];
    setbuf(stdin, NULL);
    gets(f);
    return 0;
}
int main525()
{
    char p1[16], p2[16];
    setbuf(stdin, NULL);
    gets(p1);
    setbuf(stdin, NULL);
    gets(p2);
    for(int i = 0; i < 16; i++){
        if(strcmp(p1,p2) == 0){
            printf("As palavras sao iguais!");
            break;
        }else if(p1[i] < p2[i]){
            printf("A palavra %s vem primeiro", p1);
            break;
        }else if(p1[i] > p2[i]){
            printf("A palavra %s vem primeiro", p2);
            break;
        }
    }
    return 0;
}


//FIM LISTA 5

//LISTA 6 - STRUCT

struct Dados{
    char mat[12];
    char nome[16];
    double n[3];
};
typedef struct Dados dados;
int main604()
{
    dados aluno[5];
    int maiorn = 0;
    for(int i = 0; i < 5; i++){
        setbuf(stdin, NULL);
        gets(aluno[i].mat);
        setbuf(stdin, NULL);
        gets(aluno[i].nome);
        scanf("%d %d %d", &aluno[i].n[0], &aluno[i].n[1], &aluno[i].n[2]);
        if(i == 0){
            maiorn = aluno[i].n[0];
        }else if(maiorn < aluno[i].n[0]){
            maiorn = aluno[i].n[0];
        }
    }
    return 0;
}
int main2()
{

    return 0;
}

//Elainem

int mainaula601()
{
    int v[5][5];
    for(int i = 0; i < 5; i++){
        for(int j = 0; j < 5; j++){
            printf("Digite um valor para a posicao v[%d][%d]: ", i, j);
            scanf("%d", &v[i][j]);
        }
    }
    printf("\n\n");
    for(int m = 0; m < 5; m++){
        for(int n = 0; n < 5; n++){
            printf("%d |", v[m][n]);
        }
        printf("\n");
    }
    printf("\n\n");
    printf("Os valores digitados correspondentes a diagonal da matriz sao: ");
    for(int b = 0; b < 5; b++){
        printf("%d ", v[b][b]);
    }
    printf("\n\n");
    return 0;
}
int mainaula602()
{
    int v[4][4];
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("Digite um valor para a posicao v[%d][%d]: ", i, j);
            scanf("%d", &v[i][j]);
        }
    }
    printf("\n\n");
    for(int m = 0; m < 4; m++){
        for(int n = 0; n < 4; n++){
            printf("%d \t", v[m][n]);
        }
        printf("\n");
    }
    printf("\n\n");
    for(int q = 0; q < 4; q++){
        for(int r = 0; r < 4; r++){
            if(v[q][r] % 2 == 0){
                printf("Posicao v[%d][%d] = %d \n", q, r, v[q][r]);
            }
        }
    }
    printf("\n\n");
    return 0;
}
int mainaula603()
{
    float v[4][7], s;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 7; j++){
            printf("Digite um valor para a posicao v[%d][%d]:", i, j);
            scanf("%f", &v[i][j]);
            s += v[i][j];
        }
    }
    for(int n = 0; n < 4; n++){
        printf("A soma da %da linha e %f.\n", n + 1, s);
    }
    return 0;
}
int mainaula604()
{
    float v[4][7], s[4] = {0, 0, 0, 0};
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 7; j++){
            printf("Digite um valor para a posicao v[%d][%d]:", i, j);
            scanf("%f", &v[i][j]);
            s[i] += v[i][j];
        }
    }
    for(int n = 0; n < 4; n++){
        printf("A soma da %da linha e %f.\n", n + 1, s[n]);
    }
    return 0;
}
int mainaula605()
{
    int v[3][3], x = 0, y = 0, m = 0;
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 3; j++){
            printf("Digite um valor para a posicao v[%d][%d]:", i, j);
            scanf("%f", &v[i][j]);
            if((i == 0) && (j == 0)){
                m = v[i][j];
            }
            if(m < v[i][j]){
                m = v[i][j];
                x = i;
                y = j;
            }
        }
    }
    printf("\n\n");
    printf("A posicao do maior vetor e v[%d][%d]!\n", x, y);
    return 0;
}
