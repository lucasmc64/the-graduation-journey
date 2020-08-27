{-
    Exercício 1
-}

duplica :: Float -> Float
duplica x = x * 2

quadruplica :: Float -> Float
quadruplica x = duplica (duplica x)

calc_hipotenusa :: Float -> Float -> Float
calc_hipotenusa cat1 cat2 = sqrt(cat1 ^ 2 + cat2 ^ 2)

distancia_entre :: Float -> Float -> Float -> Float -> Float
distancia_entre x1 y1 x2 y2 = sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)


{-
    Exercício 3
-}

conversao :: Float -> (Float, Float, Float)
conversao real = (real, real * 3.96, real * 4.45)


{-
    Exercício 4
-}

bissexto :: Int -> Bool
bissexto x
    | mod x 400 == 0 = True
    | mod x 4 == 0 && mod x 100 /= 0 = True
    | otherwise = False


{-
    Exercício 5
-}

type Data = (Int, Int, Int)
bissexto2 :: Data -> Bool
bissexto2 (d, m, a)
    | d >= 1 && d <= 31 && (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) = True
    | d >= 1 && d <= 30 && (m == 4 || m == 6 || m == 9 || m == 11) = True
    | d >= 1 && d <= 29 && m == 2 && bissexto a = True
    | otherwise = False


{-
    Exercício 6
-}

valida :: Data -> Bool
valida (d, m, a)
    | d >= 1 && d <= 31 && (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) && a > 0 =  True
    | d >= 1 && d <= 30 && (m == 4 || m == 6 || m == 9 || m == 11) && a > 0 = True
    | d >= 1 && d <= 28 && m == 2 && a > 0 = True
    | d == 29 && m == 2 && bissexto a && a > 0 = True
    | otherwise = False


{-
    Exercício 7
-}

precede :: Data -> Data -> Bool
precede (d1, m1, a1) (d2, m2, a2)
    | (valida (d1, m1, a1) && valida (d2, m2, a2)) == False = False
    | a1 < a2 = True
    | m1 < m2 && a1 == a2 = True
    | d1 < d2 && m1 == m2 && a1 == a2 = True
    | otherwise = False


{-
    Exercício 8
-}

type Livro = (String, String, String, String, Int)
type Aluno = (String, String, String, String)
type Emprestimo = (String, String, Data, Data, String)


{-
    Exercício 9
-}

emprestimo_em_dia :: Emprestimo -> Data -> Bool
emprestimo_em_dia (cod_livro, cod_aluno, (d_emp, m_emp, a_emp), (d_dev, m_dev, a_dev), situacao) (d_atual, m_atual, a_atual)
    | (precede (d_atual, m_atual, a_atual) (d_dev, m_dev, a_dev) || situacao == "fechado") = True
    | otherwise = False