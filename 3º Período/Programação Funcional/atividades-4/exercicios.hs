{-
    Exercício 1
-}

-- No README.md

{-
    Exercício 2
-}

quadrados :: Int -> Int -> [Int]
quadrados j k = [x ^ 2 | x <- [j..k]]

{-
    Exercício 3
-}

seleciona_impares :: [Int] -> [Int]
seleciona_impares l = [k | k <- l, odd k]

{-
    Exercício 4
-}

tabuada :: Int -> [Int]
tabuada h = [h * m | m <- [1..10]]

{-
    Exercício 5
-}

bissexto :: Int -> Bool
bissexto a
    | mod a 400 == 0 = True
    | mod a 4 == 0 && mod a 100 /= 0 = True
    | otherwise = False 

bissextos :: [Int] -> [Int]
bissextos l = [a | a <- l, bissexto a]

{-
    Exercício 6
-}

sublistas :: [[t]] -> [t]
sublistas l = [f | z <- l, f <- z]

{-
    Exercício 7
-}

type Data = (Int, Int, Int)
type Emprestimo = (String, String, Data, Data, String)
type Emprestimos = [Emprestimo]

valida :: Data -> Bool
valida (d, m, a)
    | d >= 1 && d <= 31 && (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) && a > 0 =  True
    | d >= 1 && d <= 30 && (m == 4 || m == 6 || m == 9 || m == 11) && a > 0 = True
    | d >= 1 && d <= 28 && m == 2 && a > 0 = True
    | d == 29 && m == 2 && bissexto a && a > 0 = True
    | otherwise = False

precede :: Data -> Data -> Bool
precede (d1, m1, a1) (d2, m2, a2)
    | (valida (d1, m1, a1) && valida (d2, m2, a2)) == False = False
    | a1 < a2 = True
    | m1 < m2 && a1 == a2 = True
    | d1 < d2 && m1 == m2 && a1 == a2 = True
    | otherwise = False

emprestimo_em_dia :: Emprestimo -> Data -> Bool
emprestimo_em_dia (cod_livro, cod_aluno, (d_emp, m_emp, a_emp), (d_dev, m_dev, a_dev), situacao) (d_atual, m_atual, a_atual)
    | (precede (d_atual, m_atual, a_atual) (d_dev, m_dev, a_dev) || situacao == "fechado") = True
    | otherwise = False

atrasados :: Emprestimos -> Data -> Emprestimos
atrasados bdEmprestimos (d, m, a) = [e | e <- bdEmprestimos, not (emprestimo_em_dia e (d, m, a))]

{-
    Exercício 8
-}

npares :: [Int] -> Int
npares [] = 0
npares (p:r)
    | even p = 1 + npares r
    | otherwise = npares r

{-
    Exercício 9
-}

produtorio :: [Float] -> Float
produtorio [d] = d
produtorio (d:r) = d * produtorio r

{-
    Exercício 10
-}

comprime :: [[t]] -> [t]
comprime [l] = l
comprime (a:r) = a ++ (comprime r)

{-
    Exercício 11
-}

tamanho :: [t] -> Int
tamanho [k] = 1
tamanho (c:r) = 1 + tamanho r

{-
    Exercício 12
-}

uniaoNRec :: Eq t => [t] -> [t] -> [t]
uniaoNRec l1 l2 = l1 ++ [s | s <- l2, not (elem s l1)]

{-
    Exercício 13
-}

uniaoNRec2  :: Eq t => [t] -> [t] -> [t]
uniaoNRec2 l1 [] = l1
uniaoNRec2 l1 (g:r) = if elem g l1 then uniaoNRec2 l1 r else uniaoNRec2 (l1 ++ [g]) r 
