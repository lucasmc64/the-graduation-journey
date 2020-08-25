main =

{-
    Exercício 2
-}


-- fst (2,5) -> Retorna o primeiro valor de uma tupla de 2 elementos. O resultado é 2.

    print(fst (2,5)) >>

-- snd (5, "Bom dia") -> Retorna o segundo valor de uma tupla de 2 elementos. O resultado é "Bom dia".

    print(snd (5, "Bom dia")) >>

-- (1,1) == (1,1) -> Verifica se as tuplas são iguais: compara cada posição das tuplas e seus valores, caso algum valor não seja igual ou uma das tuplas tenha tamanho diferente é retornado False. O resultado é True.

    print((1,1) == (1,1)) >>

-- (1,1) /= (1,1) -> Verifica se as tuplas são diferentes: compara cada posição das tuplas e seus valores, caso algum valor não seja igual ou uma das tuplas tenha tamanho diferente é retornado True. O resultado é False.

    print((1,1) /= (1,1)) >>

-- (1,1) < (1,2) -> Verifica qual tupla é "maior": compara cada posição das tuplas e seus valores, caso as posições tenham o mesmo valor o Haskell compara as próximas posições, caso as posições tenham valores diferentes o Haskell não compara o resto. O resultado é True.

    print((1,1) < (1,2)) >>

-- (2,1) < (1,2) -> Verifica se uma tupla é "menor" que outra: compara cada posição das tuplas e seus valores, caso as posições tenham o mesmo valor o Haskell compara as próximas posições, caso as posições tenham valores diferentes o Haskell não compara o resto. O resultado é False.

    print((2,1) < (1,2)) >>

-- (1,2,3) < (1,2) -> Verifica se uma tupla é "menor" que outra: compara cada posição das tuplas e seus valores, caso as posições tenham o mesmo valor o Haskell compara as próximas posições, caso as posições tenham valores diferentes o Haskell não compara o resto. O resultado é um erro: a segunda tupla não tem o tamanho esperado.

    --print((1,2,3) < (1,2)) -- Error

-- "azul" < "verde" -> Verifica se uma string é "menor" que outra: os caracteres são ordenados internamente pela tabela ASCII, cada caractere das strings são comparados de acordo com sua posição na tabela. O resultado é True.

    print("azul" < "verde") >>

-- "azul" < "amarelo" -> Verifica se uma string é "menor" que outra: os caracteres são ordenados internamente pela tabela ASCII, cada caractere das strings são comparados de acordo com sua posição na tabela. O resultado é False.

    print("azul" < "amarelo") >>

-- (1,2,3) == (,,) 1 2 3 -> Verifica se as tuplas são diferentes: compara cada posição das tuplas e seus valores, porém a segunda tupla é posta como uma operação pré-fixa. O resultado é True.

    print((1,2,3) == (,,) 1 2 3) 

