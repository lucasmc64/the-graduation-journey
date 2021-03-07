{- 
    Teoria dos Grafos - Trabalho 1

    Aluno: Lucas Marçal Coutinho
    Matrícula: 11911BCC012
-}

{-
    Exercício 2
-}

acronimo :: String -> String 
acronimo [] = []
acronimo (h:t)
    | (h >= 'A') && (h <= 'Z') = h : acronimo t
    | otherwise = acronimo t