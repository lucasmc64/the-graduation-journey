module Grafo3
    (
        éConexo,
        numCompConexas,
        ciclo,
        distância
    ) where

import GrafoListAdj
import Grafo
import Grafo2










{-
    Funções globais
-}










{-
    QUESTÃO 1 
    éConexo g, devolve True se o grafo g é conexo ou False, em caso contrário.
-}

éConexo :: Grafo -> Bool
éConexo g
    | éCaminho g (vértices g) = True 
    | otherwise = False

{-
    QUESTÃO 2
    numCompConexas g devolve um número natural para o número de componentes
    conexas de g.
-}

numCompConexasPertence :: [[Int]] -> Int -> Bool 
numCompConexasPertence [] v = False
numCompConexasPertence (l:t) v
    | elem v l = True
    | otherwise = numCompConexasPertence t v

numCompConexasLista :: [[Int]] -> Int -> Int 
numCompConexasLista (l:t) v -- Não há critério de parada para caso a lista se esvaziar pois essa função só será chamada se houver um vértice em uma das lista, ou seja, a lista não deve se esvaziar
    | elem v l = 0
    | otherwise = 1 + numCompConexasLista t v

numCompConexasAux :: [(Int, Int)] -> [[Int]]
numCompConexasAux [] = []
numCompConexasAux ((v1, v2):t)
    | not (pertenceV1aL) && not (pertenceV2aL) = [v1, v2] : l
    | pertenceV1aL && not (pertenceV2aL) = (v2 : lComV1) : (removeElem l lComV1)
    | not (pertenceV1aL) && pertenceV2aL = (v1 : lComV2) : (removeElem l lComV2)
    | pertenceV1aL && pertenceV2aL && lComV1 /= lComV2 = (concat [lComV1, lComV2]) : (removeElem l lComV2)
    | otherwise = l
    where
        l = numCompConexasAux t
        pertenceV1aL = numCompConexasPertence l v1
        pertenceV2aL = numCompConexasPertence l v2
        lComV1 = l!!(numCompConexasLista l v1)
        lComV2 = l!!(numCompConexasLista l v2)

numCompConexas :: Grafo -> Int
numCompConexas g
    | concat (numCompConexasAux (arestas g)) == vértices g = length (numCompConexasAux (arestas g))
    | otherwise = length (numCompConexasAux (arestas g)) + length (vértices g) - length (concat (numCompConexasAux (arestas g)))

{-
    QUESTÃO 3
    ciclo g u, devolve uma lista de vértices representando um ciclo em g. A função inicia
    a busca a partir do vértice u. Caso não haja nenhum ciclo, devolve a lista vazia. Note
    que o vértice u não necessariamente deve pertencer ao ciclo retornado, ele é apenas o
    ponto de partida da busca.
-}

ciclo :: Grafo -> Int -> [[Int]]
ciclo g u = [l | l <- (numCompConexasAux (arestas g)), éCiclo g l]

{-
    QUESTÃO 4
    distância g u v, devolve a distância entre os vértices u e v em g.
-}

normalizaSubconjuntos :: [[Int]] -> [[Int]]
normalizaSubconjuntos [] = []
normalizaSubconjuntos (h:t)
    | elem h t = normalizaSubconjuntos t
    | otherwise = h : normalizaSubconjuntos t

geraSubconjuntos :: [Int] -> [[Int]]
geraSubconjuntos [] = [[]]
geraSubconjuntos l = normalizaSubconjuntos ([v:t | v <- l, t <- geraSubconjuntos (removeElem l v), if null t then True else v < head t] ++ (geraSubconjuntos (tail l)))

distânciaAux :: Grafo -> [Int] -> Int -> Int -> [[(Int, Int)]]
distânciaAux g l vi vf = [sl | sc <- (geraSubconjuntos l), sl <- (geraTrilhas g ([vi] ++ sc ++ [vf])), sl /= []]

menorLista :: [[(Int, Int)]] -> [(Int, Int)]
menorLista [l] = l
menorLista (h:t)
    | length h < length (menorLista t) = h
    | otherwise = menorLista t

distância :: Grafo -> Int -> Int -> Int
distância g u v = length (if sl /= [] then menorLista sl else [])
    where
        sl = (distânciaAux g (removeElem (removeElem (vértices g) u) v) u v)
{-
    QUESTÃO 5
    dijkstra g v, devolve um par (d,p) de vetores contendo em d as menores distâncias de
    v até qualquer outro vértice de g e em p os predecessores. Use o algoritmo de Dijkstra.
-}

-- dijkstra :: Grafo -> Int -> ([Int], [Int])
-- dijkstra g v

{-
    QUESTÃO 6
    excentricidade g v, devolve a excentricidade de v em g
-}

-- excentricidade :: Grafo -> Int -> Int
-- excentricidade g v

{-
    QUESTÃO 7
    raio g v, devolve o raio de g.
-}

-- raio :: Grafo -> Int -> Int
-- raio g v

{-
    QUESTÃO 8
    diâmetro g v, devolve o diâmetro de g.
-}

-- diâmetro :: Grafo -> Int -> Int
-- diâmetro g v

{-
    QUESTÃO 9
    centro g, devolve uma lista contendo os vértices no centro de g.
-}

-- centro :: Grafo -> [Int]
-- centro g

{-
    QUESTÃO 10
    éArticulação g u, devolve True se o vértice u é um vértice de corte em g ou False,
    em caso contrário.
-}

-- éArticulação :: Grafo -> Int -> Bool
-- éArticulação g u

{-
    QUESTÃO 11
    éPonte g (u,v), devolve True se a aresta (u,v) é uma ponte em g ou False, em caso
    contrário.
-}

-- éPonte :: Grafo -> (Int, Int) -> Bool
-- éPonte g (u,v)

{-
    QUESTÃO 12
    conectividade g devolve um número natural k para a conectividade de g.
-}

-- conectividade :: Grafo -> Int
-- conectividade g

{-
    QUESTÃO 13
    éBiconexo g, devolve True se o grafo g é biconexo ou False, em caso contrário.
-}

-- éBiconexo :: Grafo -> Bool
-- éBiconexo g

{-
    QUESTÃO 14
    sãoCaminhosDisjVértices g c1 c2, devolve True se os caminhos c1 e c2 são inter-
    namente disjuntos em vértices no grafo g ou False, em caso contrário.
-}

-- sãoCaminhosDisjVértices :: Grafo -> [(Int, Int)] -> [(Int, Int)] -> Bool
-- sãoCaminhosDisjVértices g c1 c2

{-
    QUESTÃO 15
    trilhaEulerFleury g devolve uma lista de vértices representando uma trilha euleriana
    no grafo g. Se tal trilha não existir, devolve uma lista vazia. Use o algoritmo de Fleury.
-}

-- trilhaEulerFleury :: Grafo -> [(Int, Int)]
-- trilhaEulerFleury g

{-
    QUESTÃO 16
    trilhaEulerHierholzer g, devolve uma lista de vértices representando uma trilha
    euleriana no grafo g. Se tal trilha não existir, devolve uma lista vazia. Use o algoritmo
    de Hierholzer.
-}

-- trilhaEulerHierholzer :: Grafo -> [(Int, Int)]
-- trilhaEulerHierholzer g
