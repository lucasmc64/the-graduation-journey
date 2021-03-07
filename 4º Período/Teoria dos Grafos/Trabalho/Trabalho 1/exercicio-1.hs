{- 
    Teoria dos Grafos - Trabalho 1

    Aluno: Lucas Marçal Coutinho
    Matrícula: 11911BCC012
-}

{-
    Exercício 1
-}

bissexto :: Int -> Bool 
bissexto ano
    | mod ano 4 /= 0 = False 
    | (mod ano 100 == 0) && (mod ano 400 /= 0) = False
    | otherwise = True