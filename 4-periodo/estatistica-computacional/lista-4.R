# Lista 4

# Lucas Marçal Coutinho - 11911BCC012

# Instalando as bibliotecas necessárias

install.packages("tree")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("randomForest")

library(tree)
library(rpart)
library(rpart.plot)
library(randomForest)

# Exercício 1

# Letras A, B, C e D disponíveis no arquivo PDF anexado juntamente com esse código.

# Exercício 2

### Lendo conjunto de dados
heart <- read.table(file = "/home/lucasmc64/Downloads/heart.txt", sep = ",", header = TRUE)
heart
str(heart)
summary(heart)

## Letra B

heartAttack <- function (variables) {
  # chest_pain = variables[1]
  # sex = variables[2]
  # smokes = variables[3]
  # exercises = variables[4]
  
  chest_pain <- variables[1]
  
  if(chest_pain == "yes") {
    return("yes");
  } else {
    exercises <- variables[4]
    
    if(exercises == "no") {
      return("yes")
    } else {
      return("no")
    }
  }
}

## Teste: heartAttack(c("yes", "no", "yes", "yes"))
## Teste: heartAttack(c("no", "yes", "no", "yes"))

# Exercício 3

sbi <- read.csv(file = "/home/lucasmc64/Downloads/SBI.csv", header = TRUE)

## Letra A

has_infection <- c()

for(k in 1:nrow(sbi)) {
  if(sbi[k, 8] != "NotApplicable") {
    has_infection[k] <- "Yes"
  } else {
    has_infection[k] <- "No"
  }
}

sbi$infection <- as.factor(has_infection)

## Letra B

f_sbi <- sbi[-c(1, 2, 8)]

## Letra C

n <- round(nrow(f_sbi) * 0.8)
indexes <- sample(nrow(f_sbi))
f_sbi <- f_sbi[indexes, ]
training <- f_sbi[1:n, ] 
test <- f_sbi[n:nrow(f_sbi), ]

## Letra D

new_tree.sbi <- rpart(infection ~ ., data = training, parms = list(split = 'gini'))
rpart.plot(new_tree.sbi, extra = 101)
prediction.sbi <- predict(new_tree.sbi, newdata = test, type = "class")
accuracy <- sum(test$infection == prediction.sbi) / nrow(test)
table(test$infection, prediction.sbi)

## Letra E

rf.sbi <- randomForest(infection ~., data = training)
prediction.sbi <- predict(rf.sbi, newdata = test)
accuracy <- sum(test$infection == prediction.sbi) / nrow(test)
table(test$infection, prediction.sbi)

# Exercício 4

penguins <- read.csv(file = "/home/lucasmc64/Downloads/penguins_size.csv", header = TRUE)
str(penguins)

## Letra A

average_weight <- mean(penguins$body_mass_g, na.rm = TRUE)
average_wing_length <- mean(penguins$flipper_length_mm, na.rm = TRUE)

sd_average_weigh <- sd(penguins$body_mass_g, na.rm = TRUE)
sd_average_wing_length <- sd(penguins$flipper_length_mm, na.rm = TRUE)

## Letra B

### Adelie

adelie_average_weight <- mean(penguins[penguins$species == "Adelie", ]$body_mass_g, na.rm = TRUE)
adelie_average_wing_length <- mean(penguins[penguins$species == "Adelie", ]$flipper_length_mm, na.rm = TRUE)

adelie_sd_average_weigh <- sd(penguins[penguins$species == "Adelie", ]$body_mass_g, na.rm = TRUE)
adelie_sd_average_wing_length <- sd(penguins[penguins$species == "Adelie", ]$flipper_length_mm, na.rm = TRUE)

#### Os pinguins Adelie são, em relação a média, em torno de 500g mais leves (pra não dizer fitness) e possuem a asa um pouco mais curta, algo em torno de 11mm.

### Chinstrap

chinstrap_average_weight <- mean(penguins[penguins$species == "Chinstrap", ]$body_mass_g, na.rm = TRUE)
chinstrap_average_wing_length <- mean(penguins[penguins$species == "Chinstrap", ]$flipper_length_mm, na.rm = TRUE)

chinstrap_sd_average_weigh <- sd(penguins[penguins$species == "Chinstrap", ]$body_mass_g, na.rm = TRUE)
chinstrap_sd_average_wing_length <- sd(penguins[penguins$species == "Chinstrap", ]$flipper_length_mm, na.rm = TRUE)

#### Os pinguins Chinstrap são, em relação a média, em torno de 460g mais leves e possuem a asa um pouco mais curta, algo em torno de 5mm. Sendo essa espécie, em geral, um pouco mais pesada e com asa mais longa em relação aos Adelie.

### Gentoo

gentoo_average_weight <- mean(penguins[penguins$species == "Gentoo", ]$body_mass_g, na.rm = TRUE)
gentoo_average_wing_length <- mean(penguins[penguins$species == "Gentoo", ]$flipper_length_mm, na.rm = TRUE)

gentoo_sd_average_weigh <- sd(penguins[penguins$species == "Gentoo", ]$body_mass_g, na.rm = TRUE)
gentoo_sd_average_wing_length <- sd(penguins[penguins$species == "Gentoo", ]$flipper_length_mm, na.rm = TRUE)

#### Os pinguins Gentoo são, em relação a média, em torno de 800g mais pesadinhos e possuem a asa um pouco mais longa, algo em torno de 17mm.

## Letra C

### Sexo Feminino

f_average_weight <- mean(penguins[penguins$sex == "FEMALE", ]$body_mass_g, na.rm = TRUE)
f_average_wing_length <- mean(penguins[penguins$sex == "FEMALE", ]$flipper_length_mm, na.rm = TRUE)

f_sd_average_weigh <- sd(penguins[penguins$sex == "FEMALE", ]$body_mass_g, na.rm = TRUE)
f_sd_average_wing_length <- sd(penguins[penguins$sex == "FEMALE", ]$flipper_length_mm, na.rm = TRUE)

#### Os pinguins do sexo feminino são, em relação a média, em torno de 340g mais leves e possuem a asa um pouco mais curta, algo em torno de 3mm.

### Sexo Masculino

m_average_weight <- mean(penguins[penguins$sex == "MALE", ]$body_mass_g, na.rm = TRUE)
m_average_wing_length <- mean(penguins[penguins$sex == "MALE", ]$flipper_length_mm, na.rm = TRUE)

m_sd_average_weigh <- sd(penguins[penguins$sex == "MALE", ]$body_mass_g, na.rm = TRUE)
m_sd_average_wing_length <- sd(penguins[penguins$sex == "MALE", ]$flipper_length_mm, na.rm = TRUE)

#### Os pinguins Chinstrap são, em relação a média, em torno de 345g mais pesadinhos e possuem a asa um pouco mais longa, algo em torno de 3mm.

#### Comentários gerais em relação as letras A e B:
#### Me parece que fazer análises em relação as médias por espećie pode nos levar a resultados mais confiáveis.
#### Isso porque os Gentoo são bem mais pesadinhos e possuem a asa consideravelmente mais longa que a dos seus amigos de outras espécies, levando as médias gerais e categorizadas por sexo para longe de onde os valores reslmente estão concentrados.
#### Talvez fosse melhor ainda separar as médias por sexo dentro de cada espécie... mas isso é só um palpite.

## Letra D

plot(penguins$flipper_length_mm, penguins$body_mass_g, type = "n", main = "Peso vs. Cumprimento da Asa")
points(penguins[penguins$species == "Adelie", ]$flipper_length_mm, penguins[penguins$species == "Adelie", ]$body_mass_g, col = "#9977b4", pch = 19, cex = 0.75)
points(penguins[penguins$species == "Chinstrap", ]$flipper_length_mm, penguins[penguins$species == "Chinstrap", ]$body_mass_g, col = "#f9b48a", pch = 19, cex = 0.75)
points(penguins[penguins$species == "Gentoo", ]$flipper_length_mm, penguins[penguins$species == "Gentoo", ]$body_mass_g, col = "#71abdd", pch = 19, cex = 0.75)

## Letra E

### Observação: 
### Como há dados faltantes é preciso usar o argumento "use" para dizer o que fazer nesses casos.
### O valor "everything" é o padrão (retorna "NA").
### O valor "all.obs" dá erro.
### Já os valores "complete.obs", "na.or.complete" e "pairwise.complete.obs" retornam  o mesmo resultado, usei o primeiro mesmo.

cor(x = penguins$flipper_length_mm, y = penguins$body_mass_g, use = "complete.obs")

## Letra F

### Há sim uma relação positiva entre o peso e o tamanho da asa que pode ser visualizada no gráfico plotado na Letra D dessa mesma questão.
### Segundo o cáculo feito na Letra E dessa mesma questão, essa correlação é de algo em torno de 0.87, uma correlação fortíssima.

## Letra G

fit <- lm(formula = penguins$body_mass_g ~ penguins$flipper_length_mm)

### A partir dos coeficientes de "fit" temos que a reta de regressão é:
### y = 49.69 * x + (-5780.83)
### body_mass_g = 49.69 * flipper_length_mm + (-5780.83)

## Letra H

### Não entendi muito bem o que era pra explicar...

## Letra I

### De acordo com o modelo linear encontrado na Letra G, peso médio de um pinguim com asa de tamanho 204mm seria de 4355.93g.
penguim_1 <- 49.69 * 204 + (-5780.83)

### Poder fazer o mesmo cálculo acima para um pinguim com comprimento de asa de 168mm até podemos.
penguim_2 <- 49.69 * 168 + (-5780.83)
### Mas note que nos dados utilizados para o cáculo da reta de regressão linear, o tamanho mínimo de asa presente é de 172mm.
min(penguins$flipper_length_mm, na.rm = TRUE)
### Então acredito que, no mínimo, a inclinação da reta deveria ser afetada por esse dado, tornando o valor estimado acima impreciso.
