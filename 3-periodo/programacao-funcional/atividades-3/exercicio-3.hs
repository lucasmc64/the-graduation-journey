{-
    Exercício 3
-}

main :: IO ()
main =

    -- O operador : adiciona um elemento em uma lista e retorna uma nova lista com esse novo elemento incluso.
    print(1:[2,3,4]) >>

    -- O operador : adiciona um elemento em uma lista e retorna uma nova lista com esse novo elemento incluso. Serve para qualquer tipo de dado.
    print('a':['b','c','d']) >>

    -- A função head retorna o primeiro elemento de uma lista qualquer.
    print(head [1,2,3]) >>

    -- A função tail retorna o último elemento de uma lista qualquer.
    print(tail [1,2,3]) >>

    -- O operador !! retorna o elemento na posição informada de uma lista qualquer.
    print([1,5,2,3]!!1) >>

    -- O operador !! retorna o elemento na posição informada de uma lista qualquer.
    print([1,5,2,3]!!3) >>

    -- Verifica de se dado elemento pertence a uma lista
    print(elem 2 [1,5,2,3]) >>

    -- Gera uma lista com os N primeiros elementos da lista original
    print(take 2 [1,5,2,3,7]) >>
    
    -- Retira N elementos do início da lista
    print(drop 2 [1,5,2,3,7]) >>

    -- Concatena duas listas
    print([1,2] ++ [3,4]) >>

    -- Gera uma lista por enumeração
    print([1..10]) >>

    -- Gera uma lista por enumeração, o "passo" padrão da PA é 1, definindo um segundo elemento na lsita o Haskell redefine esse "passo"
    print([7,6..3]) >>

    -- Gera uma lista por enumeração, funciona para strins também
    print(['b'..'g']) >>

    -- Gera uma lista com os N primeiros elementos da lista original, serve para listas infinitas também
    print(take 5 [1,3..]) >>

    -- Retorna a soma de todos os elementos da lista
    print(sum [1..10]) >>

    -- Retorna o maior valor da lista
    print(maximum [1,5,2,3,7]) >>

    -- Retorna o menor valor da lista
    print(minimum [1,5,2,3,7])