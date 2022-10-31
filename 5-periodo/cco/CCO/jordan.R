#     Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012

print("> MÉTODO DA SECANTE")
print("Objetivo: Encontrar a solução para um sistema de equações lineares.")

# Lendo a quantidade de equações do sistema
quantity_of_equations <- readline("Quantidade de equações: ")
# Convertendo a quantidade de equações do sistema de string para inteiro
quantity_of_equations <- as.integer(quantity_of_equations)
# quantity_of_equations <- 3

# Lendo o grau do polinômio
degree_of_polynomial <- readline("Grau polinomial das equações: ")
# Convertendo grau do polinômio de string para inteiro
degree_of_polynomial <- as.integer(degree_of_polynomial)
# degree_of_polynomial <- 3

# Criando matrix ampliada
amplied_matrix <- matrix(nrow = quantity_of_equations, ncol = degree_of_polynomial + 1)

# Lendo a matriz ampliada / sistema de equações
for(i in 1:quantity_of_equations) {
  print(paste(c("Equação ", i, ": "), collapse = ""))

  for(j in 1:(degree_of_polynomial + 1)) {
    # Lendo constante do polinômio
    constant <- readline(paste(c("a", i, j, ": "), collapse = ""))
    # Convertendo constante do polinômio de string para double
    constant <- as.numeric(constant)
    # Guardando constante em array
    amplied_matrix[i, j] <- constant
  }
}

# amplied_matrix[1, ] <- c(1, 5, 1, 1)
# amplied_matrix[2, ] <- c(5, 2, 3, 2)
# amplied_matrix[3, ] <- c(2, 3, 2, 4)

# Passo 1: Escolher pivô e trocar linhas de posição

for(i in 1:(quantity_of_equations - 1)) {
  # Encontra o maior valor daquela coluna a partir daquela linha em diante
  maximum_column_value <- max(amplied_matrix[i:quantity_of_equations, ], i)

  # Se o valo máximo "da coluna" encontrado for maior que o valor do pivô atual, ocorre a troca de linhas da matriz
  if(maximum_column_value > amplied_matrix[i, i]) {
    # Posição da linha que precisa ser trocada com a linha atual do loop
    line_index <- match(TRUE, amplied_matrix[, i] == maximum_column_value)

    # Variável auxiliar para guardar a linha que contém o novo pivô
    new_current_line <- amplied_matrix[line_index, ]
    # A linha atual é copiada para sua nova posição
    amplied_matrix[line_index, ] <- amplied_matrix[i, ]
    # Coloca-se a linha que contém o novo pivô no lugar correto
    amplied_matrix[i, ] <- new_current_line
  }
}

# Passo 2: Zerar as colunas abaixo e acima

for(j in 1:degree_of_polynomial) {
  for(i in 1:quantity_of_equations) {
    # Iteração é pulada caso o elemento da matriz já seja 0 ou seja um elemento da diagonal
    if(i == j || amplied_matrix[i, j] == 0) {
      next
    }
    
    # Operação para zerar o elemento da vez
    amplied_matrix[i, ] <- amplied_matrix[i, ] - (amplied_matrix[i, j] / amplied_matrix[j, j]) * amplied_matrix[j, ]
  }
}

print(amplied_matrix)

# Passo 3: Encontrando a solução para o sistema

# Guarda a verificação de cada elemento da diagonal
is_valid_diagonal <- c()

for(i in 1:quantity_of_equations) {
  # Verifica se cada elemento da diagonal é válido (não é zero)
  is_valid_diagonal[i] <- amplied_matrix[i, i] != 0
}

if(quantity_of_equations < degree_of_polynomial) {
  print("Sistema não possui equações o suficiente para ser possível encontrar uma solução.")
} else if(sum(is_valid_diagonal) < quantity_of_equations) {
  quantity_of_zeroed_lines <- quantity_of_equations - sum(is_valid_diagonal)
  print(paste(c(quantity_of_zeroed_lines, "linha", quantity_of_zeroed_lines > 1 ? "s foram zeradas" : " foi zerada", "."), collapse = ""))
  print("Portanto existem infinitas soluções para esse sistema de equações.")
} else {
  print("Sistema de equações possui solução.")
  
  for(i in 1:quantity_of_equations) {
    # Cálculando o Xi da vez com base na matriz ampliada resultante
    result <- amplied_matrix[i, degree_of_polynomial + 1] / amplied_matrix[i, i]
    print(paste(c("x", i,": ", result),  collapse = ""))
  }
}
