# Exercício 1

# Letra A 
# Vetor de 1 a 20
a <- 1:20

# Letra B
# Vetor de 20 a 1
b <- 20:1

# Letra C
# Vetor de 1 a 20, de 20 a 1
c <- c(1:20, 19:1)
# 
# Letra D
# Vetor de 0.1^3 * 0.2^1, 0.1^6 * 0.2^4 a 0.1^36 * 0.2^34
bases <- c(0.1, 0.2)
e1 <- seq(from = 3, to = 36, by = 3)
e2 <- seq(from = 1, to = 34, by = 3)
d <- bases[1] ^ e1 * bases[2] ^ e2

# Letra E
# O número 4 se repete 10 vezes
rep(c(4, 6, 3), 10)

# Letra F
# O número 4 se repete 11 vezes, os demais 10 vezes
rep(c(4, 6, 3), 10, length.out = 31)

# Exercício 2

# Calcular e^x * cos(x) para x = 3, 3.1, 3.2, 3.3, ...  , 6
x = seq(from = 3, to = 6, by = 0.1)
answers = exp(x) * cos(x)

# Exercício 3

# Letra A
i <- 10:100
sum(i^3 + 4*i^2)

# Letra B
i <- 10:25
sum((2^i)/i + (3^i)/(i^2))

# Exercício 4

xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)

# Letra A
xVecImpares <- xVec[xVec ]
odd(4)

# Letra B

# Letra C

# Letra D

# Letra E