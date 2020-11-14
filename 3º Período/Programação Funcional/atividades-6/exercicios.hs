{-
    Exercício 1
-}

paridade :: [Int] -> [Bool]
paridade l = map (even) l

{-
    Exercício 2
-}

prefixos :: [String] -> [String]
prefixos l = map (take 3) l

{-
    Exercício 3
-}

saudacao :: [String] -> [String]
saudacao l = map ("Oi " ++) l

{-
    Exercício 4
-}

filtrar :: (n -> Bool) -> [n] -> [n]
filtrar verifica l = [x | x <- l, verifica x]

{-
    Exercício 5
-}

pares :: [Int] -> [Int]
pares l = filter even l

{-
    Exercício 6
-}

solucoes :: [Int] -> [Int]
solucoes l = filter (\x -> (5 * x + 6) < (x * x)) l

{-
    Exercício 7
-}

maior :: [Int] -> Int
maior l = foldr1 max l

{-
    Exercício 8
-}

-- No exercício não fica explícito o tipo das variáveis dentro da lista de entrada porém eu entendi que tem que usar inteiros

menor_min10 :: [Int] -> Int
menor_min10 l = foldr min 10 l

{-
    Exercício 9
-}

junta_silabas_plural :: [String] -> String
junta_silabas_plural l = foldr (++) "s" l

{-
    Exercício 10
-}

{- Listas para exemplos -}

lst1 :: [Integer]
lst1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

lst2 :: [Integer]
lst2 = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]

lst3 :: [Integer]
lst3 = [11,12,13,14,15,16,17,18,19,20,1,2,3,4,5,6,7,8,9,10]

lst4 :: [Integer]
lst4 = [10,9,8,7,6,5,4,3,2,1,20,19,18,17,16,15,14,13,12,11]

lst5 :: [Integer]
lst5 = [11,12,13,14,15,5,4,3,2,1,16,17,18,19,20,10,9,8,7,6]

lst6 :: [Integer]
lst6 = [1,12,3,14,5,15,4,13,2,11,6,17,8,19,20,10,9,18,7,16]

lst7 :: [Integer]
lst7 = [1..1000]

lst8 :: [Integer]
lst8 = [1000,999..1]

lst9 :: [Integer]
lst9 = lst1++[0]

lst10 :: [Integer]
lst10 = [0]++lst3

lst11 :: [Integer]
lst11 = lst1++[0]++lst3

lst12 :: [Integer]
lst12 = lst3++[0]++lst1

{- BubbleSort -}

troca :: Ord t => [t] -> [t]
troca [x] = [x]
troca (x : y : r)
    | x > y = y : troca (x : r)
    | otherwise = x : troca (y : r)

bolhaOrd :: Ord t => [t] -> Int -> [t]
bolhaOrd l 0 = l
bolhaOrd l n = bolhaOrd (troca l) (n - 1)

bolha :: Ord t => [t] -> [t]
bolha [] = []
bolha l = bolhaOrd l (length l)

{- SelectionSort -}

remove :: Ord t => t -> [t] -> [t]
remove x [] = []
remove x (y : r)
    | x == y = r
    | otherwise = y : remove x r

minimo :: Ord t => [t] -> t
minimo [] = undefined
minimo [x] = x
minimo (x : r)
    | x < minimo r = x
    | otherwise = minimo r

selecao :: Ord t => [t] -> [t]
selecao [] = []
selecao l = [x] ++ selecao (remove x l)
    where x = minimo l

{- InsertionSort -}

insereOrd :: Ord t => t -> [t] -> [t]
insereOrd x [] = [x]
insereOrd x (y : r)
    | x <= y = x : y : r
    | otherwise = y : insereOrd x r

insercao :: Ord t => [t] -> [t]
insercao [] = []
insercao (x : r) = insereOrd x (insercao r)

{- QuickSort -}

rapido :: Ord t => [t] -> [t]
rapido [] = []
rapido (p : r) = rapido [k | k <- r, k < p] ++ [p] ++ rapido [k | k <- r, k >= p]

{-
    Exercício 11
-}

{- BubbleSort -}

aux_concat :: t -> ([t], Int) -> ([t], Int)
aux_concat j (l, k) = (j : l, k)

troca2 :: Ord t => ([t], Int) -> ([t], Int)
troca2 ([x], k) = ([x], k)
troca2 (x : y : r, k)
    | x > y = aux_concat y (troca2 (x : r, k + 1))
    | otherwise = aux_concat x (troca2 (y : r, k + 1))

bolhaOrd2 :: Ord t => ([t], Int) -> Int -> ([t], Int)
bolhaOrd2 (l, k) 0 = (l, k)
bolhaOrd2 (l, k) n = bolhaOrd2 (troca2 (l, k)) (n - 1)

bolha2 :: Ord t => [t] -> ([t], Int)
bolha2 [] = ([], 0)
bolha2 l = bolhaOrd2 (l, 0) (length l)

{- SelectionSort -}

remove2 :: Ord t => t -> ([t], Int) -> ([t], Int)
remove2 x ([], k) = ([], k)
remove2 x (y : r, k)
    | x == y = (r, k + 1)
    | otherwise = aux_concat y (remove2 x (r, k + 1))

minimo2 :: Ord t => ([t], Int) -> (t, Int)
minimo2 ([], _) = undefined
minimo2 ([x], k) = (x, k)
minimo2 (x : r, k)
    | x < fm = (x, nk + 1)
    | otherwise = minimo2 (r, nk + 1)
    where (fm, nk) = minimo2 (r, k)

selecaoaux :: Ord t => ([t], Int) -> ([t], Int)
selecaoaux ([], k) = ([], k)
selecaoaux (l, k) = aux_concat x (selecaoaux (remove2 x (l, k + y)))
    where (x, y) = minimo2 (l, 0)

selecao2 :: Ord t => [t] -> ([t], Int)
selecao2 [] = ([], 0)
selecao2 l = selecaoaux (l, 0)

{- InsertionSort -}

insereOrd2 :: Ord t => t -> ([t], Int) -> ([t], Int)
insereOrd2 x ([], k) = ([x], k)
insereOrd2 x (y : r, k)
    | x <= y = (x : y : r, k + 1)
    | otherwise = aux_concat y (insereOrd2 x (r, k + 1))

insercaoaux :: Ord t => ([t], Int) -> ([t], Int)
insercaoaux ([], k) = ([], k)
insercaoaux (x : r, k) = insereOrd2 x (insercaoaux (r, k))

insercao2 :: Ord t => [t] -> ([t], Int)
insercao2 [] = ([], 0)
insercao2 l = insercaoaux (l, 0)

{- QuickSort -}

aux_concat2 :: ([t], Int) -> ([t], Int) -> ([t], Int)
aux_concat2 (l1, k1) (l2, k2) = (l1 ++ l2, k1 + k2)

rapidoaux :: Ord t => ([t], Int) -> ([t], Int)
rapidoaux ([], k) = ([], k)
rapidoaux ([x], k) = ([x], k)
rapidoaux (p : r, k) = aux_concat2 (rapidoaux ([i | i <- r, i < p], if even k then length r + (div k 2) else length r + ( div k 2) + 1)) (aux_concat p (rapidoaux ([j | j <- r, j >= p], length r + ( div k 2))))

rapido2 :: Ord t => [t] -> ([t], Int)
rapido2 [] = ([], 0)
rapido2 l = rapidoaux (l, 0)

{-
    Exercício 12
-}

{- BubbleSort -}

troca3 :: Ord t => ([t], Int) -> ([t], Int)
troca3 ([x], k) = ([x], k)
troca3 (x : y : r, k)
    | x <= y = aux_concat y (troca3 (x : r, k + 1))
    | otherwise = aux_concat x (troca3 (y : r, k + 1))

bolhaOrd3 :: Ord t => ([t], Int) -> Int -> ([t], Int)
bolhaOrd3 (l, k) 0 = (l, k)
bolhaOrd3 (l, k) n = bolhaOrd3 (troca3 (l, k)) (n - 1)

bolha3 :: Ord t => [t] -> ([t], Int)
bolha3 [] = ([], 0)
bolha3 l = bolhaOrd3 (l, 0) (length l)

{- SelectionSort -}

maximo :: Ord t => ([t], Int) -> (t, Int)
maximo ([x], k) = (x, k)
maximo (x : r, k)
    | x >= fm = (x, nk + 1)
    | otherwise = maximo (r, nk + 1)
    where (fm, nk) = maximo (r, k)

selecaoaux2 :: Ord t => ([t], Int) -> ([t], Int)
selecaoaux2 ([], k) = ([], k)
selecaoaux2 (l, k) = aux_concat x (selecaoaux2 (remove2 x (l, k + y)))
    where (x, y) = maximo (l, 0)

selecao3 :: Ord t => [t] -> ([t], Int)
selecao3 [] = ([], 0)
selecao3 l = selecaoaux2 (l, 0)

{- InsertionSort -}

insereOrd3 :: Ord t => t -> ([t], Int) -> ([t], Int)
insereOrd3 x ([], k) = ([x], k)
insereOrd3 x (y : r, k)
    | x > y = (x : y : r, k + 1)
    | otherwise = aux_concat y (insereOrd3 x (r, k + 1))

insercaoaux2 :: Ord t => ([t], Int) -> ([t], Int)
insercaoaux2 ([], k) = ([], k)
insercaoaux2 (x : r, k) = insereOrd3 x (insercaoaux2 (r, k))

insercao3 :: Ord t => [t] -> ([t], Int)
insercao3 [] = ([], 0)
insercao3 l = insercaoaux2 (l, 0)

{- QuickSort -}

rapidoaux2 :: Ord t => ([t], Int) -> ([t], Int)
rapidoaux2 ([], k) = ([], k)
rapidoaux2 ([x], k) = ([x], k)
rapidoaux2 (p : r, k) = aux_concat2 (rapidoaux2 ([i | i <- r, i >= p], if even k then length r + (div k 2) else length r + ( div k 2) + 1)) (aux_concat p (rapidoaux2 ([j | j <- r, j < p], length r + ( div k 2))))

rapido3 :: Ord t => [t] -> ([t], Int)
rapido3 [] = ([], 0)
rapido3 l = rapidoaux2 (l, 0)
