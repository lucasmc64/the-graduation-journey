{- 
    Teoria dos Grafos - Trabalho 1

    Aluno: Lucas Marçal Coutinho
    Matrícula: 11911BCC012
-}

{-
    Exercício 5
-}

import Data.Array

-- Questão 3

fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = foldr1 (*) [1..n]

serieDeTaylor_elem :: Int -> Int -> Array Int Float 
serieDeTaylor_elem x n = array (0, n) [(i, (fromIntegral (x) ^ i) / fromIntegral (fatorial i)) | i <- [0..n]]

serieDeTaylor :: Int -> Int -> Float
serieDeTaylor x n = foldl1 (+) (elems (serieDeTaylor_elem x n))

-- Questão 4

trocaFormato :: ((Int, Int), (Int, Int)) -> ((Int, Int), (Int, Int))
trocaFormato ((lini, cini), (lfim, cfim)) = ((lini, cini), (cfim, lfim))

matrizTransposta :: Array (Int, Int) a -> Array (Int, Int) a
matrizTransposta mat = array (novo_formato) [((l, c), mat ! (c, l)) | (l, c) <- (range novo_formato)]
    where
        novo_formato = trocaFormato (bounds mat)