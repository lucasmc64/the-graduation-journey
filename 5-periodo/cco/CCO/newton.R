#     Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012

print("> MÉTODO DE NEWTON")
print("Objetivo: Encontrar o polinômio que interpola um conjunto de pontos.")

# Lendo a quantidade de pontos que serão fornecidos
quantity_of_coordinates <- readline("Quantidade de pontos que serão fornecidos: ")
# Convertendo a quantidade de pontos de string para inteiro
quantity_of_coordinates <- as.integer(quantity_of_coordinates)

# Criando arrays vazios para guardar as coordenadas
xs <- c()
ys <- c()
# xs <- c(-1, 0, 2)
# ys <- c(4, 1, -1)

# PASSO 0: Ler coordenadas

for(i in 1:quantity_of_coordinates) {
  # Lendo X e Y
  x <- readline(paste(c("x", i, ": "), collapse = ""))
  y <- readline(paste(c("y", i, ": "), collapse = ""))

  # Convertendo X e Y de string para double
  x <- as.numeric(x)
  y <- as.numeric(y)

  # Guardando X e Y em array
  xs[i] <- x
  ys[i] <- y
}

# PASSO 1: Encontrar coeficientes/constantes do polinômio

# Array de coeficientes
coefficients <- c(ys[1])
# Array de diferenças divididas da rodada anterior
divided_differences <- ys

for(order in 1:(quantity_of_coordinates - 1)) {
  # Novo array de diferenças divididas
  new_divided_differences <- c()
  
  # print(divided_differences)
  
  # Cálculo das diferenças divididas da ordem/rodada atual
  for(j in 2:length(divided_differences)) {
    new_divided_differences[j - 1] <- 
      (divided_differences[j] - divided_differences[j - 1]) / (xs[j - 1 + order] - xs[j - 1])
    # print(paste(c("x", j - 2 + order, " - ","x", j - 2, " -> ", xs[j - 1 + order], " - ", xs[j - 1]), collapse = ""))
  }
  
  # Salvando o mais novo coeficiente encontrado
  coefficients[order + 1] <- new_divided_differences[1]
  # Atualizando array de diferenças divididas
  divided_differences <- new_divided_differences
}

# PASSO 2: Mantando o polinômio

# Colocando a0 (termo independente) no início do polinômio
polynomial <- paste(c(coefficients[1]))

for(i in 2:length(coefficients)) {
  # k é o valor que multiplica o coeficiente da vez
  k <- ""
  
  # Montando k
  for(j in 1:(i - 1)) {
    k <- paste(c(k, "(x - (", xs[j], "))"), collapse = "")
    
    if(j != (i - 1)) {
      k <- paste(c(k, " * "), collapse = "")
    }
  }
  
  # Estruturando o polinômio
  polynomial <- paste(c(polynomial, " + ", coefficients[i], " * ", k), collapse = "")
}

print(paste(c("Polinômio encontrado: ", polynomial), collapse = ""))