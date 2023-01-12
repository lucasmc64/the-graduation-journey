#     Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012

print("> MÉTODO SIMPLEX")
print("Objetivo: Normalizar um Modelo de Programação Linear.")

# PASSO 1: Input de dados

# Lendo o tipo do problema
print("1) Minimização")
print("2) Maximização")

while(TRUE) {
  problem_type <- readline(paste(c("Tipo do MPL : "), collapse = ""))
  # Convertendo valor de string para double
  problem_type <- as.numeric(problem_type)
  
  if(1 <= problem_type && problem_type <= 2) {
    break
  } else {
    print("Opção inválida")
  }
}

# Convertendo valor para inteiro
problem_type <- as.integer(problem_type)

# Lendo a quantidade de variáveis de decisão
quantity_of_decision_variables <- readline("Quantidade de variáveis de decisão: ")
# Convertendo valor de string para inteiro
quantity_of_decision_variables <- as.integer(quantity_of_decision_variables)

objective_function_coefficients <- matrix(nrow = 1, ncol = quantity_of_decision_variables)

for(i in 1:quantity_of_decision_variables) {
  # Lendo coeficiente da função objetivo
  coefficient <- readline(paste(c("c", i, ": "), collapse = ""))    
  # Convertendo coeficiente de string para double
  coefficient <- as.numeric(coefficient)                               
  # Guardando valor em array
  objective_function_coefficients[i] <- coefficient                                   
}

# Lendo a quantidade restrições do MPL
quantity_of_restrictions <- readline("Quantidade de restrições: ")
# Convertendo valor de string para inteiro
quantity_of_restrictions <- as.integer(quantity_of_restrictions)

# 1) Menor
# 2) Menor ou igual
# 3) Igual
# 4) Maior
# 5) Maior ou igual
restrictions_types <- matrix(nrow = quantity_of_restrictions, ncol = 1) 

restrictions_coefficients <- matrix(nrow = quantity_of_restrictions, ncol = quantity_of_decision_variables)
restrictions_independent_terms <- matrix(nrow = quantity_of_restrictions, ncol = 1)


# Lendo a matriz de coeficientes e de termos independentes (sistema de equações)
for(i in 1:quantity_of_restrictions) {
  print(paste(c("Restrição ", i, ": "), collapse = ""))
  
  # Lendo tipo da restrição
  print("1) Inequação (<)")
  print("2) Inequação (<=)")
  print("3) Equação   (=)")
  print("4) Inequação (>)")
  print("5) Inequação (>=)")
  
  while(TRUE) {
    restriction_type <- readline(paste(c("Tipo da restrição ", i, ": "), collapse = ""))
    # Convertendo valor de string para double
    restriction_type <- as.numeric(restriction_type)
    
    if(1 <= restriction_type && restriction_type <= 5) {
      break
    } else {
      print("Opção inválida")
    }
  }
  
  # Guardando em array
  restrictions_types[i, 1] <- restriction_type

  for(j in 1:quantity_of_decision_variables) {
    # Lendo constante do polinômio
    coefficient <- readline(paste(c("a", j, ": "), collapse = ""))
    # Convertendo constante do polinômio de string para double
    coefficient <- as.numeric(coefficient)
    # Guardando constante em array
    restrictions_coefficients[i, j] <- coefficient
  }

  # Lendo termo independente do polinômio
  independent_term <- readline(paste(c("b", i, ": "), collapse = ""))
  # Convertendo constante do polinômio de string para double
  independent_term <- as.numeric(independent_term)
  # Guardando constante em array
  restrictions_independent_terms[i, 1] <- independent_term
}

# PASSO 2: Normalização

position_of_slack_variables <- c()
position_of_excess_variables <- c()
position_of_artificial_variables <- c()

normalized_objective_function_coefficients <- objective_function_coefficients
# normalized_restrictions_coefficients <- restrictions_coefficients

for(i in 1:quantity_of_restrictions) {
  if(restrictions_types[i] == 1 || restrictions_types[i] == 2) {
    position_of_slack_variables[length(position_of_slack_variables) + 1] <- length(normalized_objective_function_coefficients) + 1
    normalized_objective_function_coefficients <- cbind(normalized_objective_function_coefficients, 0)
    # normalized_restrictions_coefficients <- cbind(normalized_restrictions_coefficients , c(rep(0, i - 1), 1, rep(0, quantity_of_restrictions - i)))
  }
  
  if(restrictions_types[i] == 3 || restrictions_types[i] == 4 || restrictions_types[i] == 5) {
    position_of_artificial_variables[length(position_of_artificial_variables) + 1] <- length(normalized_objective_function_coefficients) + 1
    normalized_objective_function_coefficients <- cbind(normalized_objective_function_coefficients, Inf)
    # normalized_restrictions_coefficients <- cbind(normalized_restrictions_coefficients, c(rep(0, i - 1), 1, rep(0, quantity_of_restrictions - i)))
  }

  if(restrictions_types[i] == 4 || restrictions_types[i] == 5) {
    position_of_excess_variables[length(position_of_excess_variables) + 1] <- length(normalized_objective_function_coefficients) + 1
    normalized_objective_function_coefficients <- cbind(normalized_objective_function_coefficients, -0)
    # normalized_restrictions_coefficients <- cbind(normalized_restrictions_coefficients, c(rep(0, i - 1), -1, rep(0, quantity_of_restrictions - i)))
  }
}

normalized_objective_function_string <- ""

for(i in 1:length(normalized_objective_function_coefficients)) {
  if(i %in% position_of_slack_variables) {
    normalized_objective_function_string <- paste(c(normalized_objective_function_string, " + ", "0", "F", match(i, position_of_slack_variables)), collapse = "")
  } else if(i %in% position_of_excess_variables) {
    normalized_objective_function_string <- paste(c(normalized_objective_function_string, " - ", "0", "E", match(i, position_of_excess_variables)), collapse = "")
  } else if(i %in% position_of_artificial_variables) {
    normalized_objective_function_string <- paste(c(normalized_objective_function_string, if(problem_type == 1) " + " else " - ", "M", "A", match(i, position_of_artificial_variables)), collapse = "")
  } else {
    normalized_objective_function_string <- paste(c(normalized_objective_function_string, if(nchar(normalized_objective_function_string) > 0) " + " else "", normalized_objective_function_coefficients[i], "X", i), collapse = "")
  }
}

normalized_objective_function_string <- paste(c(normalized_objective_function_string, if(problem_type == 1) " = Min Z" else " = Max Z"))

print("Resultado:")
print(normalized_objective_function_string)