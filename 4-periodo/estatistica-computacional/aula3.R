a <- 1
1 -> b

# operações com vetores

w = seq(from = 5, to = 132, by = 3)
length(w)
w[22]
w[22:27]
w[c(3, 31, 23)]
w[c(TRUE, FALSE, FALSE)]
w[c(T, F, F)]
w < 31
w[w < 31]

# análise de um conjunto de dados

library(datasets)
data("iris")
head(iris)
tail(iris)
str(iris)
summary(iris)
iris[19, 5]
iris[, 4]
mean(iris[, 1])
hist(iris[, 2])
boxplot(iris[, 3])
sd(iris[,1])

petala <- iris$Petal.Length
setosa <- iris[iris$Species == "setosa", ]
versicolor <- iris[iris$Species == "versicolor", ]
virginica <- iris[iris$Species == "virginica", ]
setosa

plot(x = iris$Sepal.Length, y = iris$Petal.Length, pch = 19, main = "Sépala vs. Pétala")

plot(x = iris$Sepal.Length, y = iris$Petal.Length, pch = 19, type = "n")
points(versicolor$Sepal.Length, versicolor$Petal.Length, col = "blue", pch =19, cex = 1.5)
points(virginica$Sepal.Length, virginica$Petal.Length, col = "green", pch =19, cex = 1.5)
points(setosa$Sepal.Length, setosa$Petal.Length, col = "red", pch =19, cex = 1.5)

