{- 
    Teoria dos Grafos - Trabalho 1

    Aluno: Lucas Marçal Coutinho
    Matrícula: 11911BCC012
-}

{-
    Exercício 4
-}

fatores :: Int -> [Int]
fatores n = [f | f <- [1..n], mod n f == 0]

primos :: [Int]
primos = [n | n <- [1..], length (fatores n) == 2]

fatoresPrimos_aux :: Int -> [Int] -> [Int]
fatoresPrimos_aux 1 l = []
fatoresPrimos_aux n (fpnh:fpnt)
    | mod n fpnh == 0 = [fpnh] ++ fatoresPrimos_aux (div n fpnh) (fpnh:fpnt)
    | otherwise = fatoresPrimos_aux n fpnt

fatoresPrimos :: Int -> [Int]
fatoresPrimos n = fatoresPrimos_aux n primos