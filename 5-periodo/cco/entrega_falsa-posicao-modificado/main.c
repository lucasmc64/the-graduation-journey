#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double x, int degree, int *consts) {
  double result = 0;

  for(int i = 0; i <= degree; i++) {
    result += consts[i] * pow(x, i);
  }

  return result;
}

double calc_x(double a, double b, double f_a, double f_b) {
  return (a * f_b - b * f_a) / (f_b - f_a);
}

void f_zero_aux(int k, double a, double b, double xk, double xkp1, double tolerance, int degree, int *consts) {
  double f_a = f(a, degree, consts);
  double f_b = f(b, degree, consts);
  double f_xkp1 = f(xkp1, degree, consts);
 
  printf("|%-10d|%-10lf|%-10lf|%-10lf|%-10lf|%-10lf|%-10lf|\n", k, a, b, f_a, f_b, xkp1, f_xkp1);

  if(fabs(f_xkp1) <= tolerance || fabs((f(xk, degree, consts) - f_xkp1) / xk) <= tolerance) {
    printf("\nRaiz: %lf\n", xkp1);
    return;
  } else if(f_a * f_xkp1 < 0) {
    f_zero_aux(
      k + 1, 
      a, 
      xkp1, 
      xkp1, 
      f(xk, degree, consts) * f_xkp1 > 0 ? calc_x(a, xkp1, f_a / 2.0, f_xkp1) : calc_x(a, b, f_a, f_b), 
      tolerance, 
      degree, 
      consts
    );
  } else if(f_xkp1 * f_b < 0) {
    f_zero_aux(
      k + 1, 
      xkp1, 
      b, 
      xkp1, 
      f(xk, degree, consts) * f_xkp1 > 0 ? calc_x(xkp1, b, f_xkp1, f_b / 2.0) : calc_x(a, b, f_a, f_b), 
      tolerance, 
      degree, 
      consts
    );
  }
}

void f_zero(double a, double b, double tolerance, int degree, int *consts) {
  if(f(a, degree, consts) * f(b, degree, consts) > 0) {
    printf("Nao existem raizes reais para esta funcao no intervalo dado\n");
    return;
  }

  printf("\n|%-10s|%-10s|%-10s|%-10s|%-10s|%-10s|%-10s|\n", "k", "a", "b", "f(a)", "f(b)", "xkp1", "f(xkp1)");

  f_zero_aux(
    0, 
    a, 
    b, 
    a, 
    calc_x(a, b, f(a, degree, consts), f(b, degree, consts)), 
    tolerance, 
    degree, 
    consts
  );
}

int main() {
  printf("> METODO DA FALSA POSICAO MODIFICADO\n");

  int degree;
  printf("Grau do polinomio = ");
  scanf("%d", &degree);

  int *consts = (int *) malloc((degree + 1) * sizeof(int));

  if(consts == NULL) {
    printf("Erro: memoria insuficiente");
    system("pause");
    exit(1);
  }

  for(int i = 0; i <= degree; i++) {
    printf("a%d = ", i);
    scanf("%d", &consts[i]);
  }

  double a;
  printf("a = ");
  scanf("%lf", &a);
  
  double b;
  printf("b = ");
  scanf("%lf", &b);

  double tolerance;
  printf("tolerance = ");
  scanf("%lf", &tolerance);

  f_zero(a, b, tolerance, degree, consts);

  return 0;
}