{-
    Exercício 1
-}

{- Letra A -}

bissexto :: Int -> Bool
bissexto a
    | t1 = True
    | t2 && t3 = True
    | otherwise = False 
    where
        t1 = mod a 400 == 0
        t2 = mod a 4 == 0
        t3 = mod a 100 /= 0

valida :: Data -> Bool
valida (d, m, a)
    | tdmaior && tdmenor1 && tm1 && k =  True
    | tdmaior && tdmenor2 && tm2 && k = True
    | tdmaior && tdmenor3 && tm3 && k = True
    | tdigual && tmigual && bissexto a && k = True
    | otherwise = False
    where
        tdmaior = d >= 1
        tdmenor1 = d <= 31
        tdmenor2 = d <= 30
        tdmenor3 = d <= 28
        tdigual = d == 29
        tm1 = m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12
        tm2 = m == 4 || m == 6 || m == 9 || m == 11
        tm3 = m == 2
        tmigual = m == 2
        k = a > 0

{- Letra B -}

bissextos :: [Int] -> [Int]
bissextos l = b_list
    where
        b_list = [a | a <- l, bissexto a]

{- Letra C -}

type Data = (Int, Int, Int)
type Emprestimo = (String, String, Data, Data, String)
type Emprestimos = [Emprestimo]

precede :: Data -> Data -> Bool
precede (d1, m1, a1) (d2, m2, a2)
    | data1 && data2 == False = False
    | amenor = True
    | mmenor && aigual = True
    | dmenor && migual && aigual = True
    | otherwise = False
    where
        data1 = valida (d1, m1, a1)
        data2 = valida (d2, m2, a2)
        amenor = a1 < a2
        aigual = a1 == a2
        mmenor = m1 < m2
        migual = m1 == m2
        dmenor = d1 < d2

emprestimo_em_dia :: Emprestimo -> Data -> Bool
emprestimo_em_dia (cod_livro, cod_aluno, (d_emp, m_emp, a_emp), (d_dev, m_dev, a_dev), situacao) (d_atual, m_atual, a_atual)
    | d_precedem || fechado = True
    | otherwise = False
    where
        d_precedem = precede (d_atual, m_atual, a_atual) (d_dev, m_dev, a_dev)
        fechado = situacao == "fechado"

atrasados :: Emprestimos -> Data -> Emprestimos
atrasados bdEmprestimos (d, m, a) = e_list
    where
        e_list = [e | e <- bdEmprestimos, not (emprestimo_em_dia e (d, m, a))]

{- Letra D -}

type Par = (Int, Int)

passo :: Par -> Par
passo (x, y) = n_passo
    where
        n_passo = (y, x + y)

auxiliar_fibo2 :: Int -> Par
auxiliar_fibo2 n
    | um = (1, 1)
    | otherwise = p_passo
    where
        um = n == 1
        p_passo = passo (auxiliar_fibo2(n - 1))

fibo2 :: Int -> Int
fibo2 n = n_fibo
    where
        n_fibo = fst(auxiliar_fibo2 n)

{- Letra E -}

prodIntervalo :: Int -> Int -> Int
prodIntervalo m n
    | igual = m
    | otherwise = m * p_elem
    where
        igual = m == n
        p_elem = prodIntervalo (m + 1) n 

fatorial :: Int -> Int
fatorial n = n_fat
    where
        n_fat = prodIntervalo 1 n

{-
    Exercício 2
-}

{- Letra A -}

bissexto2 :: Int -> Bool
bissexto2 a = 
    let 
        t1 = mod a 400 == 0
        t2 = mod a 4 == 0
        t3 = mod a 100 /= 0
        auxiliar
            | t1 = True
            | t2 && t3 = True
            | otherwise = False 
    in 
        auxiliar

valida2 :: Data -> Bool
valida2 (d, m, a) = 
    let
        tdmaior = d >= 1
        tdmenor1 = d <= 31
        tdmenor2 = d <= 30
        tdmenor3 = d <= 28
        tdigual = d == 29
        tm1 = m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12
        tm2 = m == 4 || m == 6 || m == 9 || m == 11
        tm3 = m == 2
        tmigual = m == 2
        k = a > 0
        auxiliar
            | tdmaior && tdmenor1 && tm1 && k =  True
            | tdmaior && tdmenor2 && tm2 && k = True
            | tdmaior && tdmenor3 && tm3 && k = True
            | tdigual && tmigual && bissexto a && k = True
            | otherwise = False
    in
        auxiliar
        

{- Letra B -}

bissextos2 :: [Int] -> [Int]
bissextos2 l = 
    let
        b_list = [a | a <- l, bissexto a]
    in
        b_list

{- Letra C -}

precede2 :: Data -> Data -> Bool
precede2 (d1, m1, a1) (d2, m2, a2) =
    let
        data1 = valida (d1, m1, a1)
        data2 = valida (d2, m2, a2)
        amenor = a1 < a2
        aigual = a1 == a2
        mmenor = m1 < m2
        migual = m1 == m2
        dmenor = d1 < d2
        auxiliar
            | data1 && data2 == False = False
            | amenor = True
            | mmenor && aigual = True
            | dmenor && migual && aigual = True
            | otherwise = False
    in
        auxiliar

emprestimo_em_dia2 :: Emprestimo -> Data -> Bool
emprestimo_em_dia2 (cod_livro, cod_aluno, (d_emp, m_emp, a_emp), (d_dev, m_dev, a_dev), situacao) (d_atual, m_atual, a_atual) =
    let
        d_precedem = precede (d_atual, m_atual, a_atual) (d_dev, m_dev, a_dev)
        fechado = situacao == "fechado"
        auxiliar
            | d_precedem || fechado = True
            | otherwise = False
    in
        auxiliar

atrasados2 :: Emprestimos -> Data -> Emprestimos
atrasados2 bdEmprestimos (d, m, a) = 
    let
        e_list = [e | e <- bdEmprestimos, not (emprestimo_em_dia e (d, m, a))]
    in
        e_list

{- Letra D -}

passo2 :: Par -> Par
passo2 (x, y) = 
    let
        n_passo = (y, x + y)
    in
        n_passo

auxiliar_fibo22 :: Int -> Par
auxiliar_fibo22 n =
    let
        um = n == 1
        p_passo = passo (auxiliar_fibo2(n - 1))
        auxiliar
            | um = (1, 1)
            | otherwise = p_passo
    in
        auxiliar

fibo22 :: Int -> Int
fibo22 n = 
    let
        n_fibo = fst(auxiliar_fibo2 n)
    in
        n_fibo

{- Letra E -}

prodIntervalo2 :: Int -> Int -> Int
prodIntervalo2 m n =
    let
        igual = m == n
        p_elem = prodIntervalo (m + 1) n 
        auxiliar
            | igual = m
            | otherwise = m * p_elem
    in
        auxiliar

fatorial2 :: Int -> Int
fatorial2 n = 
    let
        n_fat = prodIntervalo 1 n
    in
        n_fat

{-
    Exercício 3


    Expressão 1 

    (λx. 2 * x + 1) 3
    2 * 3 + 1
    6 + 1
    7

    Expressão 2
    
    (λxy. x - y) 5 7
    (λy. 5 - y) 7
    5 - 7
    -2

    Expressão 3 
    
    (λyx. x - y) 5 7
    (λx. x - 5) 7
    7 - 5
    2

    Expressão 4

    (λxy. x - y) (λz. z / 2)
    (λy. (λz. z / 2) - y )

    Expressão 5

    (λxy. x - y) ((λz. z / 2) 6) 1
    (λxy. x - y) ((6 / 2)) 1
    (λxy. x - y) (6 / 2) 1
    (λxy. x - y) 3 1
    (λy. 3 - y) 1
    3 - 1
    2

    Expressão 6

    (λx. λy. - x y) 9 4
    (λy. - 9 y) 4
    - 9 4
    5

    Expressão 7

    (λx. x x) (λy. y)
    (λy. y) (λy. y)
    (λy. y)
-}

{-
    Exercício 4
-}

-- No README.md

{-
    Exercício 5

    Letra A

    (\x -> (\y -> y)) ((\z -> z)(\z -> z))(\w -> w) 5

    Letra B

    ((\f -> (\x -> f(f x))) (\y -> (y * y))) 3

    Letra C

    ((\f -> (\x -> f(f x))) (\y -> ((+) y y))) 5

    Letra D

    ((\x -> (\y -> (+) x y) 5) ((\y -> (-) y 3) 7))

    Letra E

    (((\f -> (\x -> f(f(f x)))) (\y -> (y * y))) 2)
-}

