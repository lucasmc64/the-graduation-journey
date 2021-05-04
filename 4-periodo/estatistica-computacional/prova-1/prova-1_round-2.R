# Prova 1
# Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012





# Nota: 
#  Professor, me desculpe a falta de comentários no código, espero que dê para entender o que fiz
#  Essa semana foi muito corrida... Corrija com carinho kkkkkk        





# Variáveis Globais
n <- 100000





# Exercício 4

## Array para guardar todos os Xs gerados
xs <- c()
## Confia em Monte Carlo e realiza muitos experimentos
for (i in 1:n) {
  ## Sorteia-se u1 e u2 sentro do intervalo [0, 1]
  us <- runif(2, 0, 1)
  ## A quantidade mínima de sorteios é 2 (u1 e u2)
  qtd_sorteios <- 2
  repeat {
    ## Se a soma é maior que 1, para
    if(sum(us) > 1) {
      break
    }
    ## Se a soma é menor que 1, sorteia-se mais um valor entre 0 e 1 e o adiciona no array de numeros sorteados
    us <- c(us, runif(1, 0, 1))
    ## Incrementa o contador de sorteios
    qtd_sorteios <- qtd_sorteios + 1
  }
  ## Quando a soma der maior que 1, adiciona a quantidade de sorteios ocorridos aos valores de X
  xs[i] <- qtd_sorteios
}

## Estima-se a Esperança de X (E[X])... basicamente é a média
esperanca_x <- sum(xs) / n

## Verifica quais do todos os valores de X deu 3 e os conta
xs_deu_3 <- sum(xs == 3)
## Estima-se a probabilidade de X dar 3 verificando a proporção de sua ocorrência dentre os muitos experimentos
probabilidade_x_dar_3 = xs_deu_3 / n





# Exercício 5

retiraCartas <- function() {
  return(sample(c(1:13, 1:13, 1:13, 1:13), size = 5, replace = FALSE))
}

## Letra A

um_par_tres_dif <- 0
for (i in 1:n) {
  cartas <- retiraCartas()
  
  posicoes_par <- c()
  for (j in 1:(length(cartas) - 1)) {
    for (k in (j + 1):(length(cartas))) {
      if (cartas[j] == cartas[k]) {
        posicoes_par[1] <- j
        posicoes_par[2] <- k
        break
      }
    }
  }
  
  if (length(posicoes_par)) {
    cartas_sem_par <- cartas[-posicoes_par[1]] # Tipo apenas um dos valores dopar do array para ver se as cartas restantes são diferentes
    
    resta_diferentes <- TRUE
    for (j in 1:(length(cartas_sem_par) - 1)) {
      for (k in (j + 1):(length(cartas_sem_par))) {
        if (cartas_sem_par[j] == cartas_sem_par[k]) {
          resta_diferentes <- FALSE
          break
        }
      }
    }
    
    if (resta_diferentes) {
      um_par_tres_dif <- um_par_tres_dif + 1
    }
  }
}

um_par_tres_dif / n

## Letra B

dois_pares <- 0
for (i in 1:n) {
  cartas <- retiraCartas()
  
  posicoes_par <- c()
  for (j in 1:(length(cartas) - 1)) {
    for (k in (j + 1):(length(cartas))) {
      if (cartas[j] == cartas[k]) {
        posicoes_par[1] <- j
        posicoes_par[2] <- k
        break
      }
    }
  }
  
  if (length(posicoes_par)) {
    cartas_sem_par <- cartas[-posicoes_par[2]][-posicoes_par[1]]
    
    for (j in 1:(length(cartas_sem_par) - 1)) {
      for (k in (j + 1):(length(cartas_sem_par))) {
        if (cartas_sem_par[j] == cartas_sem_par[k]) {
          posicoes_par[3] <- j
          posicoes_par[4] <- k
          break
        }
      }
    }
    
    if(length(posicoes_par[3])) {
      dois_pares <- dois_pares + 1
    }
  }
}

dois_pares / n

## Letra C

trinca_par <- 0
for (i in 1:n) {
  cartas <- retiraCartas()
  
  posicoes_par <- c()
  for (j in 1:(length(cartas) - 1)) {
    for (k in (j + 1):(length(cartas))) {
      if (cartas[j] == cartas[k]) {
        posicoes_par[1] <- j
        posicoes_par[2] <- k
        break
      }
    }
  }
  
  if (length(posicoes_par)) {
    cartas_sem_par <- cartas[-posicoes_par[2]][-posicoes_par[1]] # Tipo apenas um dos valores dopar do array para ver se as cartas restantes são diferentes
    
    if (cartas_sem_par[1] == cartas_sem_par[2] && cartas_sem_par[2] == cartas_sem_par[3]) {
      trinca_par <- trinca_par + 1
    }
  }
}

trinca_par / n

## Letra D


quadra <- 0
for (i in 1:n) {
  cartas <- retiraCartas()
  
  for (j in 1:(length(cartas))) {
    if (sum(cartas[j] == cartas) == 4) {
      quadra <- quadra + 1
      break
    }
  }
  
}

quadra / n

