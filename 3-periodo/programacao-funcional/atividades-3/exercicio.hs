import Prelude hiding((||))

{-
    Exercício 1
-}

(||) :: Bool -> Bool -> Bool
{-
{- Letra A -}

-- Definição 1

True || True = True
True || False = True
False || True = True
False || False = False

-- Definição 2

_ || True = True
True || _ = True
False || False = False

-- Definição 3

False || False = False
_ || _ = True


{- Letra B -}

-- Definição 1

x || y = if x then True else (if y then True else False)

-}

-- Definição 2

x || y = if x == False then y else x
{-
    Exercício 2
-}

distancia_entre :: (Float, Float) -> (Float, Float) -> Float
distancia_entre (x1, y1) (x2, y2) = sqrt((x2 - x1)^2 + (y2 - y1)^2)

{-
    Exercício 3
-}

-- No README.md

{-
    Exercício 4
-}

-- Definição 1

fatorialg :: Int -> Int
fatorialg x
    | x == 0 = 1
    | otherwise = x * fatorialg (x - 1)

-- Definição 2

fatorialp :: Int -> Int
fatorialp 0 = 1
fatorialp x = x * fatorialp (x - 1)

{-
    Exercício 5
-}

fibo :: Int -> Int
fibo n
    | n == 1 = 1
    | n == 2 = 1
    | otherwise = fibo (n - 1) + fibo (n - 2)

{-
    Exercício 6
-}

-- Sei que o exercício dizia que a função recebe um inteiro, mas dá erro quando tento... essa foi a forma que achei de resolver
n_tri :: Float -> Float
n_tri n = (n * (n + 1)) / 2

{-
    Exercício 7
-}

type Par = (Int, Int)

passo :: Par -> Par
passo (x, y) = (y, x + y)

auxiliar_fibo2 :: Int -> Par
auxiliar_fibo2 n
    | n == 1 = (1, 1)
    | otherwise = passo (auxiliar_fibo2(n - 1))

fibo2 :: Int -> Int
fibo2 n = fst(auxiliar_fibo2 n)

{-
    Exercício 8
-}

potencia2 :: Int -> Int
potencia2 n
    | n == 1 = 2
    | otherwise = 2 * potencia2 (n - 1)

{-
    Exercício 9
-}

{- Letra A -}

prodIntervalo :: Int -> Int -> Int
prodIntervalo m n
    | m == n = m
    | otherwise = m * prodIntervalo (m + 1) n 


{- Letra B -}

novo_fatorial :: Int -> Int
novo_fatorial n = prodIntervalo 1 n

{-
    Exercício 10
-}

-- Não existe exercício 10 no roteiro

{-
    Exercício 11
-}

resto_div :: Int -> Int -> Int
resto_div m n
    | m < n = m
    | otherwise = resto_div (m - n) n

div_inteira :: Int -> Int -> Int
div_inteira m n
    | m < n = 0
    | otherwise = 1 + div_inteira (m - n) n

{-
    Exercício 12
-}

mdcg :: Int -> Int -> Int
mdcg m n
    | n == 0 = m
    | otherwise = mdcg n (mod m n)

mdcp :: Int -> Int -> Int
mdcp m 0 = m
mdcp m n = mdcp n (mod m n)

{-
    Exercício 13
-}

binomialg :: (Int, Int) -> Int
binomialg (n, k)
    | k == 0 = 1
    | n == k = 1
    | otherwise = binomialg (n - 1, k) + binomialg (n - 1, k - 1)

binomialp :: (Int, Int) -> Int
binomialp (n, 0) = 1
binomialp (n, k) = if n == k then 1 else binomialp (n - 1, k) + binomialp (n - 1, k - 1)

{-
    Exercício 14
-}

{- Letra A -}

-- [5, 4..1]


{- Letra B -}

-- ['a', 'c'..'e']

{- Letra C -}

-- [1, 4..16]

{- Letra D -}

-- zip [1, (-2)..(-11)] [1, 5..17]

{-
    Exercício 15
-}

{- Letra A -}

lista_intervalo_int :: Int -> Int -> [Int]
lista_intervalo_int a b
    | a == b = [a]
    | a > b = []
    | otherwise = [a..b]

{- Letra B -}

lista_intervalo_int_pares :: Int -> Int -> [Int]
lista_intervalo_int_pares a b
    | a >= b = []
    | otherwise = if even (a + 1) then [a + 1, a + 3..b - 1] else [a + 2, a + 4..b - 1]