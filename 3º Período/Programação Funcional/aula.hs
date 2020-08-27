{-
    Vídeo 2 - Introdução à Linguagem Haskell
-}

-- Soma dois valores
soma x y = x + y

-- Incrementa 1 no valor dado
inc n = n + 1

-- Calcular a media entre 3 valores
media v1 v2 v3 = (v1 + v2 + v3) / 3

-- Calcular a área de um triângulo
area_triangulo b h = (b * h) /2

-- Calcular a área de um retângulo
area_retangulo b h = b * h

-- Calcular a área de um círculo
area_circulo r = pi * r ^ 2

-- Calcular a área de um trapézio
area_trapezio b_maior b_menor h = (b_maior + b_menor) * h / 2

{-
    Vídeo 3
-}

-- Função para converter um valor Fahrenheit em Celsius
converteFC :: Float -> Float
converteFC x = (x - 32) / 1.8

-- Função para calcular a media simples de 2 números
media_2num :: Float -> Float -> Float
media_2num x y = (x + y) / 2

-- Função que retorna o menor entre dois números inteiros
menor :: Int -> Int -> Int

{-
menor x y
    | x < y = x
    | otherwise = y
-}

menor x y = if x <= y then x
    else y

-- Função que retorna o maior entre três números inteiros

maxTres :: Int -> Int -> Int -> Int

{-
maxTres x y z = if x >= y && x >= z then x
    else if y >= x && y >= z then y
        else z

-}

maxTres x y z
    | x >= y && x >= z = x
    | y >= z = y -- x não é o maior dos 3, então só é preciso verificar em relação a z
    | otherwise = z

{-
    Vídeo 4
-}

-- Função de soma recebendo uma tupla como parâmetro
soma_tupla :: (Int, Int) -> Int
soma_tupla (x, y) = x + y

media_tupla :: (Float, Float, Float) -> Float
media_tupla (x, y, z) = (x + y + z) / 3
