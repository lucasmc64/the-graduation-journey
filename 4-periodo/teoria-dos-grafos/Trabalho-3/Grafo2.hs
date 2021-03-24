module Grafo2
    (
        fundeVértices,
        contraiVértices,
        contraiAresta,
        éPasseio,
        éPasseioAberto,
        éPasseioFechado
    ) where

import GrafoListAdj

{-
    QUESTÃO 1 
    fundeVértices g v w, devolve um grafo com a fusão de um par de vértices v e w no
    grafo g. Use o ı́ndice do menor dos vértices v e w como o vértice resultante da fusão.
-}

fundeVérticesAux :: [(Int, Int)] -> Int -> Int -> [(Int, Int)]
fundeVérticesAux [] menv maiv = []
fundeVérticesAux ((v1, v2):t) menv maiv
    | v1 == maiv && menv /= v2 = (menv, v2) : fundeVérticesAux t menv maiv
    | v2 == maiv && v1 /= menv = (v1, menv) : fundeVérticesAux t menv maiv
    | otherwise = (v1, v2) : fundeVérticesAux t menv maiv

fundeVértices :: Grafo -> Int -> Int -> Grafo
fundeVértices g v w =
    if v < w then
        removeVértice (novoGrafo (length (vértices g) - 1) (fundeVérticesAux (arestas g) v w)) w
    else
        removeVértice (novoGrafo (length (vértices g) - 1) (fundeVérticesAux (arestas g) w v)) v

{-
    QUESTÃO 2
    contraiVértices g v w, devolve um grafo com a contração de um par de vértices v
    e w no grafo g. Use o ı́ndice do menor dos vértices v e w como o vértice resultante da
    contração.
-}

contraiVérticesAux :: [(Int, Int)] -> Int -> [(Int, Int)]
contraiVérticesAux [] menv = []
contraiVérticesAux ((v1, v2):t) menv
    | v1 == menv && notElem (v1, v2) ang && notElem (v2, v1) ang = (v1, v2) : ang
    | v2 == menv && notElem (v1, v2) ang && notElem (v2, v1) ang = (v1, v2) : ang
    | otherwise = (v1, v2) : ang
    where
        ang = contraiVérticesAux t menv

contraiVértices :: Grafo -> Int -> Int -> Grafo
contraiVértices g v w = 
    if v < w then
        novoGrafo (length (vértices ng)) (contraiVérticesAux (arestas ng) v)
    else
        novoGrafo (length (vértices ng)) (contraiVérticesAux (arestas ng) w)
    where
        ng = fundeVértices g v w

{-
    QUESTÃO 3
    contraiAresta g (v,w), devolve um grafo com a contração da aresta (v,w).

    OBSERVAÇÃO: 
        Não foi definido se o vértice maior ou menor das pontas da aresta seria o vértice resultante da contração.
        Foi considerado o menor vértice para a conclusão do exercício.
-}

contraiAresta :: Grafo -> (Int, Int) -> Grafo
contraiAresta g (v, w) = 
    if (elem (v, w) (arestas g)) || (elem (w, v) (arestas g)) then
        fundeVértices g v w
    else
        g

{-
    QUESTÃO 4
    éPasseio g vs, verifica se a lista de vértices vs é um passeio no grafo g.
-}

éPasseioAux :: [(Int, Int)] -> [Int] -> Bool
éPasseioAux ag [vf] = True
éPasseioAux ag (v1:v2:t)
    | elem (v1, v2) ag || elem (v2, v1) ag = éPasseioAux ag (v2:t)
    | otherwise = False 

éPasseio :: Grafo -> [Int] -> Bool
éPasseio g vs = éPasseioAux (arestas g) vs

{-
    QUESTÃO 5
    éPasseioAberto g vs, verifica se a lista de vértices vs é um passeio aberto no grafo g.
-}

éPasseioAberto :: Grafo -> [Int] -> Bool
éPasseioAberto g vs
    | éPasseio g vs && head vs /= last vs = True
    | otherwise = False

{-
    QUESTÃO 6
    éPasseioFechado g vs, verifica se a lista de vértices vs é um passeio fechado no grafo g.
-}

éPasseioFechado :: Grafo -> [Int] -> Bool
éPasseioFechado g vs
    | éPasseio g vs && head vs == last vs = True
    | otherwise = False

{-
    QUESTÃO 7
    éTrilha g vs, verifica se a lista de vértices vs é uma trilha no grafo g.
-}

{-
    QUESTÃO 8
-}

{-
    QUESTÃO 9
-}

{-
    QUESTÃO 10
-}

{-
    QUESTÃO 11
-}

{-
    QUESTÃO 12
-}

{-
    QUESTÃO 13
-}

{-
    QUESTÃO 14
-}

{-
    QUESTÃO 15
-}

{-
    QUESTÃO 16
-}

{-
    QUESTÃO 17
-}

{-
    QUESTÃO 18
-}

{-
    QUESTÃO 19
-}

{-
    QUESTÃO 20
-}

{-
    QUESTÃO 21
-}

{-
    QUESTÃO 22
-}

{-
    QUESTÃO 23
-}

{-
    QUESTÃO 24
-}
