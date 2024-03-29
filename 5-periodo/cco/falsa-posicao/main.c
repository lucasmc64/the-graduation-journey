#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double x) {
  return pow(x, 3) - x - 1;
}

double calc_x(double a, double b) {
  return (a * f(b) - b * f(a)) / (f(b) - f(a));
}

void f_zero_aux(int k, double a, double b, double tolerance) {
  double f_a = f(a);
  double f_b = f(b);
  double x = calc_x(a, b);
  double f_x = f(x);

  printf("|%-10d|%-10lf|%-10lf|%-10lf|%-10lf|%-10lf|%-10lf|\n", k, a, b, f_a, f_b, x, f_x);

  if(fabs(f_x) <= tolerance) {
    return;
  } else if(f_a * f_x < 0) {
    f_zero_aux(k + 1, a, x, tolerance);
  } else if(f_x * f_b < 0) {
    f_zero_aux(k + 1, x, b, tolerance);
  }
}

void f_zero(double a, double b, double tolerance) {
  printf("\n|%-10s|%-10s|%-10s|%-10s|%-10s|%-10s|%-10s|\n", "k", "a", "b", "f(a)", "f(b)", "x", "f(x)");
  f_zero_aux(0, a, b, tolerance);
}

int main() {
  printf("> METODO DA FALSA POSICAO\n");

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