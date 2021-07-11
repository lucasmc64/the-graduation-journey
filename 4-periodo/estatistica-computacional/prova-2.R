# Prova 2 - Estatistica Computacional

# Lucas Marçal Coutinho - 11911BCC012

# Instalando as bibliotecas necessárias

install.packages("rpart")
install.packages("rpart.plot")
install.packages("randomForest")

library(rpart)
library(rpart.plot)
library(randomForest)

# Questão 1

## Letra A

### Lendo conjunto de dados
aves <- read.table(file = "/home/lucasmc64/Downloads/aves.txt", sep = ",", header = TRUE)
head(aves)
tail(aves)
str(aves)
summary(aves)

## Letra B

aves <- aves[sample(nrow(aves)), ]

## Letra C

## - As aves da Islandia possuiem o menor desvio padrão em relação ao peso e as aves da Dinamarca possuem o menor desvio padrão em relação ao comprimento da asa.

### Dinamarca

media_dinamarca_comprimento_asa <- mean(aves[aves$local == "dinamarca", ]$comprimento_asa)
media_dinamarca_peso <- mean(aves[aves$local == "dinamarca", ]$peso)

desviop_dinamarca_comprimento_asa <- sd(aves[aves$local == "dinamarca", ]$comprimento_asa)
desviop_dinamarca_peso <- sd(aves[aves$local == "dinamarca", ]$peso)

#### As aves encontradas na Dinamarca são as mais pesadinhas e possuem o maior comprimento médio de asa.

### Islandia

media_islandia_comprimento_asa <- mean(aves[aves$local == "islandia", ]$comprimento_asa)
media_islandia_peso <- mean(aves[aves$local == "islandia", ]$peso)

desviop_islandia_comprimento_asa <- sd(aves[aves$local == "islandia", ]$comprimento_asa)
desviop_islandia_peso <- sd(aves[aves$local == "islandia", ]$peso)

#### As aves encontradas na Islandia são as mais leves e possuem o menor comprimento médio de asa.

### Noruega

media_noruega_comprimento_asa <- mean(aves[aves$local == "noruega", ]$comprimento_asa)
media_noruega_peso <- mean(aves[aves$local == "noruega", ]$peso)

desviop_noruega_comprimento_asa <- sd(aves[aves$local == "noruega", ]$comprimento_asa)
desviop_noruega_peso <- sd(aves[aves$local == "noruega", ]$peso)

#### As aves encontradas na Noruega tem suas médias entre as aves encontradas na Dinamarca e Noruega.

## Letra D

plot(aves$comprimento_asa, aves$peso, type = "n", main = "Peso vs. Cumprimento da Asa")
points(aves[aves$local == "dinamarca", ]$comprimento_asa, aves[aves$local == "islandia", ]$peso, col = "#9977b4", pch = 19, cex = 0.75)
points(aves[aves$local == "islandia", ]$comprimento_asa, aves[aves$local == "islandia", ]$peso, col = "#f9b48a", pch = 19, cex = 0.75)
points(aves[aves$local == "noruega", ]$comprimento_asa, aves[aves$local == "noruega", ]$peso, col = "#71abdd", pch = 19, cex = 0.75)

## Letra E

### Como os dados já foram embaralhados na Letra B dessa mesma questão, vou apenas separar o dados.

n <- round(nrow(aves) * 0.8)
treino <- aves[1:n, ] 
teste <- aves[(n + 1):nrow(aves), ]

## - Quanto as letras F e G: Depois que percebi que era pra fazer na mão, fique a vontade para desconsiderar.

## Letra F

arvore.aves <- rpart(local ~ ., data = treino, parms = list(split = 'gini'))
rpart.plot(arvore.aves, extra = 101)
predicao.aves <- predict(arvore.aves, newdata = teste, type = "class")

## Letra G

acuracia <- sum(teste$local == predicao.aves) / nrow(teste)
table(teste$local, predicao.aves)

# Questão 2

## Letra A

### Separando os dados por localidade

dinamarca <- aves[aves$local == "dinamarca", ]
islandia <- aves[aves$local == "islandia", ]
noruega <- aves[aves$local == "noruega", ]

### Calculando os coeficientes de correlação

cor_dinamarca <- cor(x = dinamarca$comprimento_asa, y = dinamarca$peso) # 0.939
cor_islandia <- cor(x = islandia$comprimento_asa, y = islandia$peso) # 0.977
cor_noruega <- cor(x = noruega$comprimento_asa, y = noruega$peso) # 0.921

## - As variáveis estão mais correlacionadas linearmente na Islandia!

## Letra B

### Construi a função ja supondo que cada vetor conterá N elementos e me apoiando na inteligência do R em fazer operações entre vetores.

coeficientesRegrecao <- function(x_vet, y_vet) {
  n <- length(x_vet)
  
  m <- (n * sum(x_vet * y_vet) - sum(x_vet) * sum(y_vet)) / (n * sum(x_vet ^ 2) - (sum(x_vet)) ^ 2)
  b <- mean(y_vet) - m * mean(x_vet) 
  
  return(c(m, b))
}

## Letra C

### Utilizando o conjunto de dados da Islandia, pois ele possui o maior coeficiente de correlação linear

islandia_coeficientes <- coeficientesRegrecao(islandia$comprimento_asa, islandia$peso)

m <- islandia_coeficientes[1]
b <- islandia_coeficientes[2]

islandiaRetaRegressao <- function(x) {
  return(m * x + b)
}

## Letra D

### Uma variação de 0.5cm no cumprimento da asa provoca um aumento de cerca de 2g no peso da ave.

## Letra E

### De acordo com os comprimentos vistos através da função "summary", 23cm está dentro do intervalo de dados que "treinou" a reta de regressão...
### Ou seja, não tenho argumentos para contrariar o Excelent ́ıssimo Senhor David Attenboroug!
summary(islandia)
### Assim, de acordo com a reta de regressão desenvolvida na questão anterior, o peso dessa ave estaria por volta de 94.14989g
islandiaRetaRegressao(23) 
