library(dslabs)
data(murders)
murders
str(murders) #structure
murders$taxa <- murders$total*100000/murders$population
sort(murders$taxa)
order(murders$taxa)[1]
murders$state[order(murders$taxa)[1]]


# Lendo pacote de datasets para acessar, em seguida, o conjunto iris
library(datasets)
data("iris")

# Separando o conjunto de dados por espécies
virginica <- iris[iris$Species == "virginica", ]
versicolor <- iris[iris$Species == "versicolor", ]
setosa <- iris[iris$Species == "setosa", ]

# Criar boxplot para cada espécie
par(mfrow = c(1, 3))
boxplot(virginica[ , 1:4], main = "virginica", ylim = c(0, 8), las = 0)
boxplot(versicolor[ , 1:4], main = "versicolor", ylim = c(0, 8), las = 0)
boxplot(setosa[ , 1:4], main = "setosa", ylim = c(0, 8), las = 0)

# Criando um gráfico para tamanho vs. largura da Pétala
par(mfrow = c(1,1))
plot(iris$Petal.Length, iris$Petal.Width, type = "n")
points(virginica$Petal.Length, virginica$Petal.Width, col = "red", pch = 19, cex = 1.5)
points(versicolor$Petal.Length, versicolor$Petal.Width, col = "blue", pch = 19, cex = 1.5)
points(setosa$Petal.Length, setosa$Petal.Width, col = "green", pch = 19, cex = 1.5)

# Criando um modelo de previsão
indices <- sample(1:150, size = 150, replace = FALSE)
nova_iris <- iris[indices, ]
treino <- nova_iris[1:120, ]
teste <- nova_iris[121:150, ]

# Distância do primeiro elemento do teste pro primeiro elemento do treino
distancia1 = sqrt((teste[1, 1] - treino[1, 1])^2 
                  + (teste[1, 2] - treino[1, 2])^2
                  + (teste[1, 3] - treino[1, 3])^2 
                  + (teste[1, 4] - treino[1, 4])^2)

# Distâncias do primeiro elemento do teste pra todos os elementos do treino
distancias1 = c()
for(i in 1:120) {
  distancias1[i] <- sqrt((teste[1, 1] - treino[i, 1])^2 
                         + (teste[1, 2] - treino[i, 2])^2
                         + (teste[1, 3] - treino[i, 3])^2 
                         + (teste[1, 4] - treino[i, 4])^2)
}
order(distancias1)[1]
treino[order(distancias1)[1], 5]
teste[1, 5]

# Distâncias de todos os elementos do teste pra todos os elementos do treino
resultado <- c()
for(j in 1:30) {
  distancias = c()
  for(i in 1:120) {
    distancias[i] <- sqrt((teste[j, 1] - treino[i, 1])^2 
                           + (teste[j, 2] - treino[i, 2])^2
                           + (teste[j, 3] - treino[i, 3])^2 
                           + (teste[j, 4] - treino[i, 4])^2)
  }
  resultado[j] = order(distancias)[1] # ou resultado <- c(resultado, order(distancias)[1])
}
classificacao <- treino[resultado, 5]
acuracia <- sum(classificacao == teste[ , 5]) / 30
acuracia

#Kagle
#Problema do Titanic