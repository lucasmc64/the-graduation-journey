{-
    Questão 1
-}

mediana :: Float -> Float -> Float -> Float
mediana a b c
    | (a < b) && (b < c) = b
    | (a < b) && (c < b) = c
    | otherwise = a

media_simples :: Float -> Float -> Float -> Float
media_simples a b c = (a + b + c) / 3

analise :: Float -> Float -> Float -> Float -> String
analise a b c d
    | (media_simples a b c < d) && (mediana a b c < d) = "1-ultimo valor acima da media e da mediana dos 3 primeiros"
    | (media_simples a b c > d) && (mediana a b c > d) = "2-ultimo valor abaixo da media e da mediana dos 3 primeiros"
    | otherwise = "3-ultimo valor entre a media e a mediana dos 3 primeiros"

{-
    Questão 2
-}

filtra :: [Int] -> (Bool, Int) -> [Int]
filtra l (b, n)
    | b == False = [x | x <- l, mod x n == 0]
    | b == True = [x | x <- l, mod n x == 0]

{-
    Questão 3
-}

sublista :: Int -> [t] -> [t]
sublista n (h:t) = if (n == 0) || (n > length (h:t)) then (h:t) else if n == 1 then t else h : sublista (n - 1) t

{-
    Questão 4
-}

listar :: [t] -> [t] -> [t] -> [[t]]
listar i j [] = []
listar i [] k = []
listar [] j k = []
listar (h1:t1) (h2:t2) (h3:t3) = [h1, h2, h3] : listar t1 t2 t3

{-
    Questão 5
-}

subseque :: Eq t => [t] -> [t] -> Bool
subseque l1 [] = True
subseque [] l2 = False
subseque (h1:t1) (h2:t2) = if h1 == h2 then subseque t1 t2 else subseque t1 (h2:t2)