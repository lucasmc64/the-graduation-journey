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
        eSubgrafoInduzidoArestas,
        eClique,
        eCjIndependenteVertices,
        uniao
    ) where

import GrafoListAdj






{-
    Funções globais
-}

pertenceHaG :: Eq a => [a] -> [a]-> Bool 
pertenceHaG [] g = True
pertenceHaG (hh:th) g
    | elem hh g = pertenceHaG th g
    | otherwise = False






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
grafoComplemento g = novoGrafo n [(v1, v2) | (v1, v2) <- arestas (grafoCompleto n), notElem (v1, v2) ag && notElem (v2, v1) ag]
    where
        n = length (vértices g)
        ag = arestas g

{-
    Verifica se o primeiro grafo é subgrafo do segundo
-}

eSubgrafo :: Grafo -> Grafo -> Bool
eSubgrafo h g
    | pertenceHaG (vértices h) (vértices g) && pertenceHaG (arestas h) (arestas g) = True 
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
criaListaArestas g vh = [(v1, v2) | v1 <- vh, v2 <- vh, v1 < v2, elem (v1, v2) ag || elem (v2, v1) ag]
    where
        ag = arestas g

eSubgrafoInduzidoVertices :: Grafo -> Grafo -> [Int] -> Bool
eSubgrafoInduzidoVertices h g vh
    | eSubgrafo h g && pertenceHaG (criaListaArestas g vh) (arestas h) = True
    | otherwise = False

{-
    Verifica se um subgrafo é induzido por um lista de arestas do grafo original
-}

criaListaVertices :: [(Int, Int)] -> [Int]
criaListaVertices [] = []
criaListaVertices ((v1, v2):t)
    | notElem v1 lv && notElem v2 lv = [v1] ++ [v2] ++ lv
    | notElem v1 lv = v1 : lv
    | notElem v2 lv = v2 : lv
    | otherwise = lv
    where
        lv = criaListaVertices t

eSubgrafoInduzidoArestas :: Grafo -> Grafo -> [(Int, Int)] -> Bool
eSubgrafoInduzidoArestas h g ah
    | eSubgrafo h g && pertenceHaG (criaListaVertices ah) (vértices h) && pertenceHaG ah (arestas h) = True 
    | otherwise = False

{-
    Verifica se um grafo é clique do outro
-}

eClique :: Grafo -> Grafo -> Bool
eClique h g
    | eSubgrafo h g && eCompleto h = True
    | otherwise = False

{-
    Verifica se um subgrafo é um conjunto independente de vértices de outro
-}

eCjIndependenteVertices :: Grafo -> Grafo -> Bool
eCjIndependenteVertices h g
    | eVazio h && eSubgrafoInduzidoVertices h g (vértices h) = True
    | otherwise = False

{-

-}

uniaoVertices :: [Int] -> [Int] -> Int 
uniaoVertices [] vh = length vh
uniaoVertices (hg:tg) vh
    | notElem hg vh = 1 + (uniaoVertices tg vh)
    | otherwise = uniaoVertices tg vh

uniaoArestas :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
uniaoArestas [] ah = ah
uniaoArestas ((v1, v2):tg) ah
    | notElem (v1, v2) ah && notElem (v2, v1) ah = (v2, v1) : uniaoArestas tg ah
    | otherwise = uniaoArestas tg ah

uniao :: Grafo -> Grafo -> Grafo
uniao g h = novoGrafo n [a | a <- (uniaoArestas (arestas g) (arestas h))]
    where
        n = uniaoVertices (vértices g) (vértices h)

{-

-}

{-

-}

{-

-}

{-

-}