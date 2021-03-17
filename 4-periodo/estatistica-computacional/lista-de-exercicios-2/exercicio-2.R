# Exercício 2

# Calcular e^x * cos(x) para x = 3, 3.1, 3.2, 3.3, ...  , 6
x = seq(from = 3, to = 6, by = 0.1)
answers = exp(x) * cos(x)
