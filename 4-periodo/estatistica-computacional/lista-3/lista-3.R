
n <- 10000

# Exercício 1

## N primeiros lançamentos
lancamento_1 <- sample(1:6, size = n, replace = TRUE) 
## N segundos lançamentos
lancamento_2 <- sample(1:6, size = n, replace = TRUE) 
## Soma os N primeiros lançamentos com os N segundos lançamentoa um a um
soma_lancamentos <- lancamento_1 + lancamento_2
## Quais dos N experimentos deram 7 ou 11? (TRUE = 1, FALSE = 0... por isso a soma abaixo funciona)
sete_e_onze <- sum(soma_lancamentos == 7 | soma_lancamentos == 11)
## Calcula a proporção de 'acertos'
sete_e_onze / n

# Exercício 2

## Sorteia uma urna N vezes (5 = Urna I, (1, 4, 6) = Urna II, (2, 3) = Urna III)
dado_escolhe_urna <- sample(1:6, size = n, replace = TRUE) 
## Variável para guardar as N retiradas de bola em cada urna escolhida
bolas_escolhidas <- c()

## Em cada urna escolhida, pegamos uma bola
for(num in dado_escolhe_urna) {
  if(num == 5) {
    ## Urna I
    escolhida_da_vez <- sample(c('preta', 'branca', 'vermelha'), size = 1, prob = c(6/13, 3/13, 4/13))
    bolas_escolhidas <- c(bolas_escolhidas, escolhida_da_vez)
  } else if (num == 1 || num == 4 || num == 6) {
    ## Urna II
    escolhida_da_vez <- sample(c('preta', 'branca', 'vermelha'), size = 1, prob = c(3/10, 5/10, 2/10))
    bolas_escolhidas <- c(bolas_escolhidas, escolhida_da_vez)
  } else {
    ## Urna III
    escolhida_da_vez <- sample(c('preta', 'branca', 'vermelha'), size = 1, prob = c(4/8, 2/8, 2/8))
    bolas_escolhidas <- c(bolas_escolhidas, escolhida_da_vez)
  }
}

## Quais dos N experimentos deram 'vermelha'? (TRUE = 1, FALSE = 0... por isso a soma abaixo funciona)
bolas_vermelhas = sum(bolas_escolhidas == 'vermelha')
## Calcula a proporção de 'acertos'
bolas_vermelhas / n

# Exercício 3

## Contador de vitórias no jogo Craps
vitorias <- 0

## Usa-se Monte Carlo: realiza-se o experimento um grande número de vezes e verifica a proporção dos 'acertos'
for(i in 1:n) {
  ## Primeiro e segundo lançamento
  dados <- sample(1:6, size = 2, replace = TRUE)
  ## Calcula a soma dos dois primeiros lançamentos
  soma_inicial <- sum(dados)
  if(soma_inicial == 7 || soma_inicial == 11) {
    ## Se a soma der 7 ou 11, soma-se uma vitória
    vitorias <- vitorias + 1
  } else if(soma_inicial != 2 && soma_inicial != 3 && soma_inicial != 12) {
    ## Se não perdemos o jogo (a soma não pode dar 2, 3 ou 12), temos uma segunda chance
    repeat { 
      ## Os dados devem ser lançados até que a soma dê 7 ou novamente o volor da soma inicial
      dados <- sample(1:6, size = 2, replace = TRUE)
      nova_soma = sum(dados)
      if(nova_soma == 7) {
        ## Se a nova soma der 7, perdemos
        break
      } else if (nova_soma == soma_inicial) {
        ## Se a nova soma der a soma inicial, soma-se uma vitória 
        vitorias <- vitorias + 1
        break
      }
    }
  }  
}

## Calcula-se a proporção de vitórias entre todos os experimentos
vitorias / n

# Exercício 4

bran <- c(0, 1, 0)
arya <- c(0, 0, 1)

bran_vs_aria <- c()
for(i in 1:n) {
  sequencia <- sample(0:1, size = 3, replace = TRUE)
  while (TRUE) {
    if(sum(bran == sequencia[(length(sequencia) - 2) : length(sequencia)]) == 3) {
      break
    } else if(sum(arya == sequencia[(length(sequencia) - 2) : length(sequencia)]) == 3) {
      break
    }
    sequencia <- c(sequencia, sample(0:1, size = 1, replace = TRUE))
  }
  
  sequencia
  
  if(sum(bran == sequencia[(length(sequencia) - 2) : length(sequencia)]) == 3) {
    bran_vs_aria <- c(bran_vs_aria, 'bran')
  } else {
    bran_vs_aria <- c(bran_vs_aria, 'arya')
  }
}

vencedor_stark <- sum(bran_vs_aria == 'arya')
vencedor_stark / n



# Exercício 5



# Exercício 6



# Exercício 7



# Exercício 8



# Exercício 9


