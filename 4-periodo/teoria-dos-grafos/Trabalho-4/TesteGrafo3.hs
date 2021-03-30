import GrafoListAdj
import Grafo3

main :: IO ()
main =
    print "éConexo" >>
    print (éConexo (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)])) >>
    print (éConexo (novoGrafo 3 [(1, 2), (1, 3)])) >>
    print (éConexo (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)])) >>
    putStr "\n" >>

    print "numCompConexas" >>
    print (numCompConexas (novoGrafo 4 [(1, 2)])) >>
    print (numCompConexas (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    print (numCompConexas (novoGrafo 5 [(1, 2), (1, 4), (3, 4)])) >>
    putStr "\n" >>

--    print "ciclo" >>
--    print (ciclo (novoGrafo 4 [(1, 2)]) 2) >>
--    print (ciclo (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 1) >>
--    print (ciclo (novoGrafo 5 [(1, 2), (1, 4), (3, 4)]) 3) >>
--    putStr "\n" >>

    print "distância" >>
    print (distância (novoGrafo 4 [(1, 2)]) 1 4) >>
    print (distância (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 1 3) >>
    print (distância (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) 1 5) >>
    putStr "\n" >>

--    print "dijkstra" >>
--    print (dijkstra (novoGrafo 4 [(1, 2)]) 2) >>
--    print (dijkstra (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 1) >>
--    print (dijkstra (novoGrafo 5 [(1, 2), (1, 4), (3, 4)]) 3) >>
--    putStr "\n" >>

    print "excentricidade" >>
    print (excentricidade (novoGrafo 4 [(1, 2)]) 1) >>
    print (excentricidade (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 3) >>
    print (excentricidade (novoGrafo 5 [(1, 2), (2, 3), (3, 4), (4, 5)]) 5) >>
    putStr "\n" >>

    print "raio" >> -- Essa função necessita apenas do Grafo como argumento. O número foi colocado apenas para cumprir com o protótipo dado. 
    print (raio (novoGrafo 4 [(1, 2)]) 1) >>
    print (raio (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 3) >>
    print (raio (novoGrafo 5 [(1, 2), (2, 3), (3, 4), (4, 5)]) 5) >>
    putStr "\n" >>

    print "diâmetro" >> -- Essa função necessita apenas do Grafo como argumento. O número foi colocado apenas para cumprir com o protótipo dado. 
    print (diâmetro (novoGrafo 4 [(1, 2)]) 1) >>
    print (diâmetro (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 3) >>
    print (diâmetro (novoGrafo 5 [(1, 2), (2, 3), (3, 4), (4, 5)]) 5) >>
    putStr "\n" >>

    print "centro" >> 
    print (centro (novoGrafo 4 [(1, 2), (2, 3), (3, 4)])) >>
    print (centro (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    print (centro (novoGrafo 5 [(3, 1), (2, 3), (3, 4), (4, 5)])) >>
    putStr "\n" >>

    print "éArticulação" >> 
    print (éArticulação (novoGrafo 4 [(1, 2), (2, 3), (3, 4), (1, 4)]) 1) >>
    print (éArticulação (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 3) >>
    print (éArticulação (novoGrafo 5 [(3, 1), (2, 3), (3, 4), (3, 5)]) 3) >>
    putStr "\n" >>

    print "éPonte" >> 
    print (éPonte (novoGrafo 4 [(1, 2), (2, 3), (3, 4)]) (2, 3)) >>
    print (éPonte (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) (3, 1)) >>
    print (éPonte (novoGrafo 5 [(3, 1), (2, 3), (3, 4), (4, 5)]) (3, 4)) >>
    putStr "\n" -- >>