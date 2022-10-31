#     Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012

print("> MÉTODO DA SECANTE")
print("Objetivo: Encontrar o 0 (zero) da função.")

# Lendo X0
x0 <- readline("X0: ")    
# Convertendo X0 de string para double
x0 <- as.numeric(x0)      

# Lendo X1
x1 <- readline("X1: ")  
# Convertendo X1 de string para double
x1 <- as.numeric(x1)      

# Lendo a tolerância ao erro
tolerance <- readline("Tolerância: ")    
# Convertendo tolerância de string para double
tolerance <- as.numeric(tolerance)       

# Lendo o grau do polinômio
degree_of_polynomial <- readline("Grau do polinômio: ")     
# Convertendo grau do polinômio de string para inteiro
degree_of_polynomial <- as.integer(degree_of_polynomial)    

# Criando um array vazio
constants <- c()    

for(i in 0:degree_of_polynomial) {
  # Lendo constante do polinômio
  constant <- readline(paste(c("a", i, ": "), collapse = ""))    
  # Convertendo constante do polinômio de string para double
  constant <- as.numeric(constant)                               
  # Guardando constante em array
  constants[i + 1] <- constant                                   
}

# "Personificando" a função polinomial F
f <- function(x) {    
  # Inicializando o Y
  y <- 0    
  
  for(i in 0:degree_of_polynomial) {
    # De fato, calculando o valor de Y
    y <- y + constants[i + 1] * x^i    
  }
  
  # Retornando o resultado
  return(y)    
}

# Observação:
# O plot do gráfico foi melhor ajustado para a visualozação da função f(x) = x3 - x - 1.
# Sendo assim, possivelmente será necessário o ajuste dos parâmetros "ylim" e "xlim" se testado com outros polinômio.

# Plotando o gráfico de F(X)
curve(
  expr = f, 
  ylim = c(-2, 3),
  xlim = c(0.5, 2),
  col = "black",
  type = "l",
  lty = 1,
  lwd = 2,
  xlab = "x",
  ylab = "f(x)",
  main = "Comportamento do método da secante"
)
# Plotando linha do eixo Y
abline(v = 0, col = "#00000033")
# Plotando linha do eixo X
abline(h = 0, col = "#00000033")

# "Personificando" a função G (secante)
g <- function(xk, xk_minus_1) {
  return((xk_minus_1 * f(xk) - xk * f(xk_minus_1)) / (f(xk) - f(xk_minus_1)))
}

# Inicializando Xk-1
xk_minus_1 <- x0
# Inicializando Xk
xk <- x1

# Guardando todas as cores que o R interpreta
possible_colors <- c(
  "burlywood",
  "lightgreen",
  "royalblue",
  "lightcoral",
  "thistle",
  "lightseagreen",
  "aquamarine",
  "orangered",
  "limegreen",
  "crimson",
  "lightblue",
  "deeppink",
  "deepskyblue",
  "blueviolet",
  "chocolate",
  "cornflowerblue",
  "goldenrod",
  "hotpink",
  "slateblue"
)

while(abs(f(xk)) > tolerance) {
  # Calculando Xk+1
  xk_plus_1 <- g(xk, xk_minus_1)
  
  # Verificando se a estimativa não estagnou
  if(abs((xk_plus_1 - xk) / xk_plus_1) < tolerance) {
    break
  }
  
  # Pegando a cor da vez
  color <- possible_colors[1]
  
  # Plotando a secante 
  abline(lm(c(f(xk_minus_1), f(xk)) ~ c(xk_minus_1, xk)), col = color)
  
  # Removendo a cor usada da lista de possíveis cores
  possible_colors <- c(possible_colors[-1], color)
  
  # print(paste(c("Xk-1: ", xk_minus_1)))
  # print(paste(c("Xk: ", xk)))

  # Preparando para a próxima iteração
  # Obs.: Xk-1 deve ser sempre menor ou igual a Xk
  if(xk_plus_1 <= xk_minus_1) {
    xk <- xk_minus_1
    xk_minus_1 <- xk_plus_1
  } else {
    xk_minus_1 <- xk
    xk <- xk_plus_1
  }
  
  # print(paste(c("Xk+1: ", xk_plus_1)))
  # print("---")
}

# Printando valor aproximado encontrado
print(paste(c("Raiz: ", xk)))
