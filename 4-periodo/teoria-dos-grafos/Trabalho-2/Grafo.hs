module Grafo 
    (
        eTrivial,
        eIsolado,
        eTerminal,
        ePar,
        eImpar,
        seqGraus,
        grauMax,
        grauMin,
        eRegular,
        eKRegular,
        eVazio,
        eNulo,
        eCompleto,
        eKn,
        grafoCompleto,
        grafoComplemento,
        eSubgrafo,
        eSubgrafoProprio,
        eSubgrafoInduzidoVertices,
        eSubgrafoInduzidoArestas
    ) where

import GrafoListAdj

{-
    Verifica se um grafo é trivial (possui apenas um vértice)
-}

eTrivial :: Grafo -> Bool 
eTrivial g
    | length (vértices g) == 1 = True 
    | otherwise = False

{-
    Verfica se um vértice é isolado (possui nenhuma aresta incidente, ou seja, grau 0)
-}

eIsolado :: Grafo -> Int -> Bool
eIsolado g v
    | grau g v == 0 = True 
    | otherwise = False

{-
    Verifica se um vértice é terminal (possui apenas uma aresta incidente, ou seja, grau 1)
-}

eTerminal :: Grafo -> Int -> Bool
eTerminal g v
    | grau g v == 1 = True 
    | otherwise = False

{-
    Verifica se um vértice é par (possui um número par de arestas incidente, ou seja, grau par)
-}

ePar :: Grafo -> Int -> Bool
ePar g v
    | even (grau g v) = True 
    | otherwise = False

{-
    Verifica se um vértice é ímpar (possui um número ímpar de arestas incidente, ou seja, grau ímpar)
-}

eImpar :: Grafo -> Int -> Bool
eImpar g v
    | odd (grau g v) = True 
    | otherwise = False

{-
    Retorna a quantide se arestas incidentes a cada vértice (graus de cada vértice), do vértice 1 ao vétice N
-}

seqGraus :: Grafo  -> [Int]
seqGraus g = [grau g v | v <- vértices g]

{-
    Retorna a maior quantidade de arestas incidentes a um vértice (maior grau encontrado em todo o grafo)
-}

grauMax :: Grafo -> Int
grauMax g = maximum (seqGraus g)

{-
    Retorna a menor quantidade de arestas incidentes a um vértice (menor grau encontrado em todo o grafo)
-}

grauMin :: Grafo -> Int
grauMin g = minimum (seqGraus g)

{-
    Verifica se todos os vétrices tem mesma quantidade de arestas incidentes (o mesmo grau)
-}

eRegular :: Grafo -> Bool
eRegular g
    | not (null (vértices g)) && grauMin g == grauMax g = True
    | otherwise = False 

{-
    Verifica se todos os vétrices tem um quantidade K de arestas incidentes (grau K)
-}

eKRegular :: Grafo -> Int -> Bool 
eKRegular g k
    | eRegular g && grau g 1 == k = True 
    | otherwise = False

{-
    Verifica se não há nenhuma aresta incidente em todos os vértices (grafo vazio)
-}

eVazio :: Grafo -> Bool 
eVazio g
    | sum (seqGraus g) == 0 = True
    | otherwise = False

{-
    Verifica se não há nenhum vértice (grafo vazio)
-}

eNulo :: Grafo -> Bool 
eNulo g
    | null (vértices g) = True 
    | otherwise = False

{- 
    Verifica se todos os vétrices tem um quantidade N-1 de arestas incidentes (grafo completo)
-}

eCompleto :: Grafo -> Bool
eCompleto g
    | eKRegular g (length (vértices g) - 1) = True 
    | otherwise = False

{-
    Verifica se todos os vétrices tem um quantidade N-1 de arestas incidentes e se possui um determinado número de vértices (grafo completo com N vértices)
-}

eKn :: Grafo -> Int -> Bool
eKn g n
    | eCompleto g && length (vértices g) == n = True
    | otherwise = False

{-
    Retorna um grafo completo com N vértices (Kn)
-}

grafoCompleto :: Int -> Grafo 
grafoCompleto n = novoGrafo n [(v1, v2) | v1 <- [1..n], v2 <- [1..n], v1 < v2]

{-
    Retorna um grafo que é o complemento de um grafo g
-}

grafoComplemento :: Grafo  -> Grafo 
grafoComplemento g = novoGrafo n [(v1, v2) | v1 <- [1..n], v2 <- [1..n], ag <- arestas g, ((v1, v2) /= ag) && ((v2, v1) /= ag), v1 < v2]
    where
        n = length (vértices g)

{-
    Verifica se o primeiro grafo é subgrafo do segundo
-}

eSubgrafoVerifica :: Eq a => [a] -> [a]-> Bool 
eSubgrafoVerifica [] g = True
eSubgrafoVerifica (hh:th) g
    | elem hh g = eSubgrafoVerifica th g
    | otherwise = False

eSubgrafo :: Grafo -> Grafo -> Bool
eSubgrafo h g
    | eSubgrafoVerifica (vértices h) (vértices g) && eSubgrafoVerifica (arestas h) (arestas g) = True 
    | otherwise = False

{-
    Verifica se o primeiro grafo é grafo próprio em relação ao segundo
-}

eSubgrafoProprio :: Grafo -> Grafo -> Bool
eSubgrafoProprio h g
    | eSubgrafo h g && length (arestas h) < length (arestas g) = True 
    | otherwise = False

{-
    Verifica se um subgrafo é induzido por um lista de vértices do grafo original
-}

criaListaArestas :: Grafo -> [Int] -> [(Int, Int)]
criaListaArestas g vh = [(v1, v2) | v1 <- vh, v2 <- vh, elem (v1, v2) (arestas g)]

eSubgrafoInduzidoVertices :: Grafo -> Grafo -> [Int] -> Bool
eSubgrafoInduzidoVertices h g vh
    | eSubgrafo h g && arestas h == criaListaArestas g vh = True
    | otherwise = False

{-
    Verifica se um subgrafo é induzido por um lista de arestas do grafo original
-}

criaListaVertices :: Grafo -> [(Int, Int)] -> [Int] -> [Int]
criaListaVertices g [] lv = lv
criaListaVertices g ((v1, v2):t) lv
    | notElem v1 lv && notElem v2 lv = [v1] ++ [v2] ++ criaListaVertices g t lv
    | notElem v1 lv = v1 : criaListaVertices g t lv
    | notElem v2 lv = v2 : criaListaVertices g t lv
    | otherwise = criaListaVertices g t lv
    where
        vg = vértices g

eSubgrafoInduzidoArestas :: Grafo -> Grafo -> [(Int, Int)] -> Bool
eSubgrafoInduzidoArestas h g ah
    | eSubgrafo h g && vértices h == criaListaVertices g ah [] = True 
    | otherwise = False

{-

-}

-- eClique
-- eClique h g

{-

-}

{-

-}

{-

-}

{-

-}

{-

-}

{-

-}