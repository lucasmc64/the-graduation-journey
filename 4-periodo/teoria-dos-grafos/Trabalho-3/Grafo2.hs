module Grafo2
    (
        fundeVértices,
        contraiVértices,
        contraiAresta,
        éPasseio,
        éPasseioAberto,
        éPasseioFechado,
        éTrilha,
        éCaminho,
        éCiclo
    ) where

import GrafoListAdj
import Grafo










{-
    Funções globais
-}

pertenceHaG :: Eq a => [a] -> [a]-> Bool 
pertenceHaG [] g = True
pertenceHaG (hh:th) g
    | elem hh g = pertenceHaG th g
    | otherwise = False

pertenceArestas :: [(Int, Int)] -> [(Int, Int)] -> Bool
pertenceArestas [] ag = True
pertenceArestas ((v1, v2):t) ag
    | elem (v1, v2) ag || elem (v2, v1) ag = pertenceArestas t ag
    | otherwise = False










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

geraArestas :: [Int] -> [(Int, Int)]
geraArestas [v] = []
geraArestas (v1:v2:t) = (v1, v2) : (geraArestas (v2:t))

verificaIgualdadeArestas :: [(Int, Int)] -> Bool -- Retorna verdadeiro se possuir arestas iguais
verificaIgualdadeArestas [] = False
verificaIgualdadeArestas ((v1, v2):t)
    | notElem (v1, v2) t && notElem (v2, v1) t = verificaIgualdadeArestas t
    | otherwise = True

éTrilha :: Grafo -> [Int] -> Bool 
éTrilha g vs
    | not (verificaIgualdadeArestas a) && pertenceArestas a (arestas g) = True
    | otherwise = False
    where
        a = geraArestas vs

{-
    QUESTÃO 8
    éCaminho g vs, verifica se a lista de vértices vs é um caminho no grafo g.
-}

verificaIgualdadeVertices :: [Int] -> Bool -- Retorna verdadeiro se possuir vértices iguais
verificaIgualdadeVertices [] = False
verificaIgualdadeVertices (v:t)
    | notElem v t = verificaIgualdadeVertices t
    | otherwise = True

éCaminho :: Grafo -> [Int] -> Bool
éCaminho g vs
    | éTrilha g vs && not (verificaIgualdadeVertices vs) = True 
    | otherwise = False

{-
    QUESTÃO 9
    éCiclo g vs, verifica se a lista de vértices vs é um ciclo no grafo g.
-}

éCiclo :: Grafo -> [Int] -> Bool
éCiclo g vs
    | éCaminho g (tail (reverse vs)) && head vs == last vs = True
    | otherwise = False

{-
    QUESTÃO 10
    éGrafoCíclico c, verifica se o grafo c é cíclico.
-}

{-
    QUESTÃO 11
    éCn g n, verifica se o grafo g é cíclico com n vértices.
-}

{-
    QUESTÃO 12
    éGrafoCaminho g, verifica se o grafo g é um grafo caminho.
-}

{-
    QUESTÃO 13
    éPn p n, verifica se o grafo p é um grafo caminho com n vértices.
-}

{-
    QUESTÃO 14
    éGrafoBipartido g v1 v2, verifica se um grafo g é bipartido com a partição dos vértices dada pelas listas de vértices v1 e v2.
-}

{-
    QUESTÃO 15
    éTrilhaEuleriana g t, verifica se a trilha t é euleriana no grafo g.
-}

{-
    QUESTÃO 16
    éGrafoEuleriano g, verifica se um dado g é euleriano. Use o Teorema de Euler.
-}

{-
    QUESTÃO 17
    éSemiEuleriano g, verifica se um dado g é semi-euleriano.
-}

{-
    QUESTÃO 18
    éHamiltonianoOre g, verifica se um grafo g é hamiltoniano usando o teorema de Ore.
-}

{-
    QUESTÃO 19
    éHamiltonianoDirac g, verfica se um grafo g é hamiltoniano usando o teorema de Dirac.
-}

{-
    QUESTÃO 20
    fecho g, devolve um grafo que é o fecho do grafo g.
-}

{-
    QUESTÃO 21
    buscaGenérica g, devolve uma lista de vértices na sequência em que são primeiramente visitados (marcados) em uma busca genérica no grafo g.
-}

{-
    QUESTÃO 22
    buscaLargura g, devolve uma lista de vértices na sequência em que são primeiramente visitados (marcados) em uma busca em largura no grafo g.
-}

{-
    QUESTÃO 23
    buscaProfundidade g, devolve uma lista de vértices na sequência em que são primeiramente visitados (marcados) em uma busca em profundidade no grafo g.
-}

{-
    QUESTÃO 24
    menorCaminho g u v, devolve uma lista com os vértices no menor caminho emgentre os vérticesuev. Adapte a busca em largura e a use para resolver este problema.
-}
