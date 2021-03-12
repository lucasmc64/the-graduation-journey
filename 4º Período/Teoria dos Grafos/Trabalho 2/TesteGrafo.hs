import GrafoListAdj
import Grafo

g1 :: Grafo
g1 = novoGrafo 6 [(1, 4), (2, 3), (2, 4), (3, 4), (4, 5), (4, 6), (5, 6)]

g2 :: Grafo
g2 = novoGrafo 4 [(1, 1), (1, 2), (2, 3), (2, 3)]

g3 :: Grafo 
g3 = novoGrafo 9 [(1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9)]

g4 :: Grafo 
g4 = novoGrafo 1 []

main :: IO ()
main =
    print (eTrivial g1) >>
    print (eTrivial g2) >>
    print (eTrivial g3) >> 
    print (eTrivial g4)