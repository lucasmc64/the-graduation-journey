# Prova 1
# Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012






# Variáveis Globais
n <- 10000





# Exercício 1

# Vamos aproximar o resultado de integrais por meio de Monte Carlo através da média da aplicação da função em valores aleatórios dentro do intervalo de integração

estimativaIntegral <- function(int_inf, int_sup, funcG) {
  ### Sorteia números dentro do intervalo de integração
  nums_sorteados <- runif(n, int_inf, int_sup)
  
  ### Aplicamos G aos números sorteados dentro do intervalo de integração
  resultados_funcao <- funcG(nums_sorteados)
  
  ### Média dos resultados da função
  media_funcao <-(sum(resultados_funcao) / n)
  
  ### Normalizando resultado
  resultado <- abs(int_sup - int_inf) * media_funcao
  
  return(resultado)
}

## Integral de A até B de (e^((2 * x + x^2)))

### Função dentro da integral
g <- function(x) {
  return(exp(1)^(2 * x + x ^ 2))
}

estimativaIntegral(-1, 2, g)





# Exercício 2

## Letra A

k <- 20

contador_figurinhas <- c()
for(i in 1:n) {
  figurinhas <- sample(1:n, size = k, replace = TRUE)
  while(sum(1:k %in% figurinhas) != k) {
    figurinhas <- c(figurinhas, sample(1:k, size = 1, replace = TRUE))
  }
  contador_figurinhas <- c(contador_figurinhas, length((figurinhas)))
}
## Esperança de X
sum(contador_figurinhas) / n 

## Probabilidade de X <= 30
sum(contador_figurinhas <= 30) / n

## Letra B

calculaExperanca <- function(k) {
  contador_figurinhas <- c()
  for(i in 1:n) {
    figurinhas <- sample(1:n, size = k, replace = TRUE)
    while(sum(1:k %in% figurinhas) != k) {
      figurinhas <- c(figurinhas, sample(1:k, size = 1, replace = TRUE))
    }
    contador_figurinhas <- c(contador_figurinhas, length((figurinhas)))
  }
  ## Esperança de X
  return(sum(contador_figurinhas) / n )
}

##calculaExperanca(5)





# Exercício 3

k <- 20

## Letra A

luke_bebado <- function(l, k) {
  ## Contador de quantas vezes Luke conseguiu voltar para a origem
  luke_na_origem_da_forca <- c()
  
  ## Via Monte Carlo, Luke se vê cambaleante no caminho das Forças e quer chegar em casa
  for(i in 1:n) {
    soma_passos_luke <- l
    while (soma_passos_luke != 0 && soma_passos_luke != k) {
      ## Luke dá 1 passo
      passos_luke = sample(c(1,-1), size = 1, replace = TRUE)
      ## Soma os passos da direita, os da esquerda e a posição da qual Luke partiu
      soma_passos_luke = sum(soma_passos_luke, passos_luke)
    }
    luke_na_origem_da_forca <- c(luke_na_origem_da_forca, soma_passos_luke == 0)
  }
  
  return (sum(luke_na_origem_da_forca) / n)
}

luke_bebado(5, k) ## Exemplo

## Letra B

chances_de_luke_morrer <- c()

for(i in 1:(k - 1)) {
  chances_de_luke_morrer[i] <- luke_bebado(i, k)
}

plot(x = 1:19, y = chances_de_luke_morrer, pch = 19)
