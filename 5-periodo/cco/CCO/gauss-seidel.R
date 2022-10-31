#     Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012

print("> MÉTODO DE GAUSS-SEIDEL")
print("Objetivo: Encontrar a solução iterativa para resolução de um sistema de equações lineares.")

# PASSO 1: Input de dados

# # Lendo a quantidade de equações do sistema
# quantity_of_equations <- readline("Quantidade de equações: ")
# # Convertendo a quantidade de equações do sistema de string para inteiro
# quantity_of_equations <- as.integer(quantity_of_equations)
quantity_of_equations <- 3

# # Lendo o grau do polinômio
# degree_of_polynomial <- readline("Grau polinomial das equações: ")
# # Convertendo grau do polinômio de string para inteiro
# degree_of_polynomial <- as.integer(degree_of_polynomial)
degree_of_polynomial <- 3

# # Lendo a tolerância ao erro
# tolerance <- readline("Tolerância: ")
# # Convertendo tolerância de string para double
# tolerance <- as.numeric(tolerance)
tolerance <- 0.002

# Criando matriz de coeficientes
coefficients <- matrix(nrow = quantity_of_equations, ncol = degree_of_polynomial)
# Criando matriz de termos independentes
independent_terms <- matrix(nrow = quantity_of_equations, ncol = 1)

# # Lendo a matriz de coeficientes e de termos independentes (sistema de equações)
# for(i in 1:quantity_of_equations) {
#   print(paste(c("Equação ", i, ": "), collapse = ""))
# 
#   for(j in 1:(degree_of_polynomial)) {
#     # Lendo constante do polinômio
#     coefficient <- readline(paste(c("a", j, ": "), collapse = ""))
#     # Convertendo constante do polinômio de string para double
#     coefficient <- as.numeric(coefficient)
#     # Guardando constante em array
#     coefficients[i, j] <- coefficient
#   }
# 
#   # Lendo termo independente do polinômio
#   independent_term <- readline(paste(c("b", i, ": "), collapse = ""))
#   # Convertendo constante do polinômio de string para double
#   independent_term <- as.numeric(independent_term)
#   # Guardando constante em array
#   independent_terms[i, 1] <- independent_term
# }

# Teste 1
coefficients[1, ] <- c(5, 1, 1)
coefficients[2, ] <- c(3, 4, 1)
coefficients[3, ] <- c(3, 3, 6)
independent_terms[, 1] <- c(5, 6, 0)

# Teste 2
# coefficients[1, ] <- c(10, 2, 3)
# coefficients[2, ] <- c(1, 5, 1)
# coefficients[3, ] <- c(2, 3, 10)
# independent_terms[, 1] <- c(7, 8, 6)

# PASSO 2: Sassenfeld

betas <- matrix(data = 1, nrow = 1, ncol = degree_of_polynomial)

for(i in 1:quantity_of_equations) {
  sum_coefficients <- 0
  
  for(j in 1:degree_of_polynomial) {
    print(coefficients[i, j])
    sum_coefficients <- sum_coefficients + coefficients[i, j] * betas[1, j]
  }
  
  print("---")
  print(sum_coefficients)
  
  betas[1, i] <- (1 / coefficients[i, i]) * sum_coefficients
  
  print(betas)
}

if(max(betas) >= 1) {
  print("Segundo o critério de convergência de Sassenfeld, a convergência do método implementado para a resolução de sistemas lineares não pode ser garantida.")
  print("Se for de seu desejo, os cálculos ainda serão feitos, mas haverá um limite de 100 iterações.")
  answer <- readline("Deseja continuar mesmo assim? [y/N] ")
  if(answer != "y") {
    stop("Saindo...")
  }
}

# PASSO 2: Gerando as matrizes C e G

# Criando C
c_matrix <- matrix(nrow = quantity_of_equations, ncol = degree_of_polynomial)
# Criando G
g_matrix <- matrix(nrow = quantity_of_equations, ncol = 1)

for(i in 1:quantity_of_equations) {
  for(j in 1:degree_of_polynomial) {
    if(i == j) {
      # Se for da diagonal: Cij = 0
      c_matrix[i, j] <- 0
    } else {
      # Se não for da diagonal: Cij = (-aij / aii)
      c_matrix[i, j] <- - coefficients[i, j] / coefficients[i, i]
    }
  }
  
  # Para cada equação: Gi1 = b / aii
  g_matrix[i, 1] <- independent_terms[i, 1] / coefficients[i, i]
}

# PASSO 3: Calcular a matriz X de resultados de forma iterativa

# Inicializando Xk (chutes anteriores)
xk_matrix <- matrix(data = 0, nrow = degree_of_polynomial, ncol = 1)
# Inicializando X(k+1) (chutes atuais)
xkp1_matrix <- matrix(data = 0, nrow = degree_of_polynomial, ncol = 1)
# Contador de iterações
i <- 0

while(TRUE) {
  # Atualizando chutes passados
  xk_matrix <- xkp1_matrix
  # Ajustando os chutes
  xkp1_matrix <- c_matrix %*% xk_matrix + g_matrix

  # Calculando os Mx(k+1) (valor M para cada X) 
  mxkp1_matrix <- matrix(data = 0, nrow = degree_of_polynomial, ncol = 1)
  
  for(i in 1:quantity_of_equations) {
    # Se X(k+1) != 0
    #   Mx(k+1) = |(X(k+1) - Xk) / X(k+1)|
    # Senão, se X(k+1) == Xk == 0
    #   Mx(k+1) = 0
    # Senão
    #   Mx(k+1) = 1
    
    mxkp1_matrix[i] <- 
      if(xkp1_matrix[i] != 0) 
        abs((xkp1_matrix[i] - xk_matrix[i]) / xkp1_matrix[i])
      else if(xkp1_matrix[i] == xk_matrix[i] )
        0
      else 
        1
    
    i <- i + 1
    
    if(i > 100) {
      print("Limite de iterações atingido!")
      break
    }
  }

  # Pegando valor M da rodada
  mrkp1 <- max(mxkp1_matrix)
  
  # Obs.: Não sei se a condição de parada usada em Gauss-Jacobi também se aplica aqui, mas vou deixa comentado
  # dk <- max(abs(xkp1_matrix - xk_matrix))
  # drk <- dk / max(xkp1_matrix)

  # Condição de parada
  # if(mrkp1 < tolerance || drk < tolerance) {
  if(mrkp1 < tolerance) {
    break
  }
}

# PASSO 4: Printando resultados

print("Resultados estimados: ")

for(i in 1:quantity_of_equations) {
  print(paste(c("x", i,": ", xkp1_matrix[i]),  collapse = ""))
}
