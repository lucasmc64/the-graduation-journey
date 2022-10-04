#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double x) {
  return pow(x, 3) - x - 1;
}

double calc_x(double a, double b, double f_a, double f_b) {
  return (a * f_b - b * f_a) / (f_b - f_a);
}

void f_zero_aux(int k, double a, double b, double xk, double xkp1, double tolerance) {
  double f_a = f(a);
  double f_b = f(b);
  double f_xkp1 = f(xkp1);
  double xkp2 =
    f(xk) * f_xkp1 > 0 
    ?
      f_a * f_xkp1 < 0
      ?
        calc_x(a, b, f_a / 2.0, f_b)
      :
        calc_x(a, b, f_a, f_b / 2.0)
    :
      calc_x(a, b, f_a, f_b);

  printf("|%-10d|%-10lf|%-10lf|%-10lf|%-10lf|%-10lf|%-10lf|\n", k, a, b, f_a, f_b, xkp1, f_xkp1);

  if(fabs(f_xkp1) <= tolerance) {
    return;
  } else if(f_a * f_xkp1 < 0) {
    f_zero_aux(k + 1, a, xkp1, xkp1, xkp2, tolerance);
  } else if(f_xkp1 * f_b < 0) {
    f_zero_aux(k + 1, xkp1, b, xkp1, xkp2, tolerance);
  }
}

void f_zero(double a, double b, double tolerance) {
  printf("\n|%-10s|%-10s|%-10s|%-10s|%-10s|%-10s|%-10s|\n", "k", "a", "b", "f(a)", "f(b)", "xkp1", "f(xkp1)");
  f_zero_aux(0, a, b, a, calc_x(a, b, f(a), f(b)), tolerance);
}

int main() {
  printf("> METODO DA FALSA POSICAO MODIFICADO\n");

  double a;
  printf("a = ");
  scanf("%lf", &a);
  
  double b;
  printf("b = ");
  scanf("%lf", &b);

  double tolerance;
  printf("tolerance = ");
  scanf("%lf", &tolerance);

  f_zero(a, b, tolerance);

  return 0;
}