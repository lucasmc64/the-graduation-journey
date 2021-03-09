# 'CONTROL + ALT + R' executa tudo

# Operações Básicas
2 + 3
5 - 3
4 / 7
4 * 5
4 ** 3
4 ^ 3
sqrt(64)

# Criando um objeto (variável)

a = 4 ## No console basta dar 'a' ou 'print(a)'
a <- 4 ## O proffessor prefere esse

## 'class(a)' mostra o tipo de variável, 'typeof(a)' tbm

# Vetores

## O R vê tudo como vetor

vetor <- c(1,2,3) # 'c' significa 'concatenate', dentro vão os valores do vetor
w <- c(4,5,6)
# vetor[1] # Acessando os itens do vetor, começa no 1
vetor[c(1,3)]
vec_log <- c(TRUE, FALSE, TRUE)
vetor[vec_log]
q <- 2:76
q1 <- seq(from = 3, to = 54, by = 4)
q2 <- seq(from = 3, to = 54, length.out = 12)

length(vetor)

vetor*vetor2 ## Multiplica vetores, caso algum vetor seja maior ele recicla o vetor menor, serve pra outrs operações básicas tbm

## Todo número aqui é um vetor

# Ajuda

## No console digitar '?sqrt' por exemplo


# Dado virtual

dado<- sample(x = 1:6, size = 1000, replace = TRUE)
dado2 <- sample(x = 1:3, size = 3, replace = TRUE, prob = c(1/2, 0, 0, 0))

sum(dado) # soma
mean(dado) # média

cumsum(dado) #soma acumulada
media = cumsum(dado)/1:1000 #médias ao longo do tempo

plot(1:1000, media, type = "l")
abline(h = 3.5, col = "red")



# Esperança matemática do dado
# E[x] = 1*1/6 + 2*1/6 + ... + 6*1/6 = 3.5 (a média converge pra esse valor)