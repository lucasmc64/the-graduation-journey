{- 
    Teoria dos Grafos - Trabalho 1

    Aluno: Lucas Marçal Coutinho
    Matrícula: 11911BCC012
-}

{-
    Exercício 3
-}

{-
    Observação: 
        A partir do número 4000 a representação romana usa um caractere especial.
        Por esse motivo não houve como implementar a conversão para números iguais ou maiores que 4000.
-}

disponivel :: [Int]
disponivel = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

romano_aux :: Int -> [Int] -> String
romano_aux 1000 l = "M"
romano_aux 900 l = "CM"
romano_aux 500 l = "D"
romano_aux 400 l = "CD"
romano_aux 100 l = "C"
romano_aux 90 l = "XC"
romano_aux 50 l = "L"
romano_aux 40 l = "XL"
romano_aux 10 l = "X"
romano_aux 9 l = "IX"
romano_aux 5 l = "V"
romano_aux 4 l = "IV"
romano_aux 1 l = "I"
romano_aux 0 l = ""
romano_aux numero (h:t)
    | h > numero = romano_aux numero t
    | otherwise = romano_aux h disponivel ++ romano_aux (numero - h) disponivel

romano :: Int -> String
romano numero = romano_aux numero disponivel

