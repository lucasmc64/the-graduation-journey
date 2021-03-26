import GrafoListAdj
import Grafo2

main :: IO ()
main =
    print "fundeVértices" >>
    print (fundeVértices (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) 4 3) >>
    print (fundeVértices (novoGrafo 3 [(1, 2), (1, 3)]) 2 3) >>
    print (fundeVértices (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) 1 3) >>
    putStr "\n" >>

    print "contraiVértices" >>
    print (contraiVértices (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) 2 3) >>
    print (contraiVértices (novoGrafo 3 [(1, 2), (1, 3)]) 2 3) >>
    print (contraiVértices (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) 1 3) >>
    putStr "\n" >>

    print "contraiAresta" >>
    print (contraiAresta (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) (3, 4)) >>
    print (contraiAresta (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) (2, 3)) >>
    print (contraiAresta (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) (4, 5)) >>
    putStr "\n" >>

    print "éPasseio" >>
    print (éPasseio (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) [1, 2, 3, 4]) >>
    print (éPasseio (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [3, 2, 1]) >>
    print (éPasseio (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) [1, 2, 3, 4, 5]) >>
    putStr "\n" >>

    print "éPasseioAberto" >>
    print (éPasseioAberto (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) [1, 3, 4]) >>
    print (éPasseioAberto (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [3, 2, 1, 3]) >>
    print (éPasseioAberto (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) [1, 2, 3, 4, 5]) >>
    putStr "\n" >>

    print "éPasseioFechado" >>
    print (éPasseioFechado (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) [1, 3, 4]) >>
    print (éPasseioFechado (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [3, 2, 1, 3]) >>
    print (éPasseioFechado (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) [1, 2, 3, 4, 5]) >>
    putStr "\n" >>

    print "éTrilha" >>
    print (éTrilha (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) [1, 3, 4]) >>
    print (éTrilha (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [3, 2, 1, 3]) >>
    print (éTrilha (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) [1, 2, 3, 4, 5]) >>
    putStr "\n" >>

    print "éCaminho" >>
    print (éCaminho (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) [1, 3, 4]) >>
    print (éCaminho (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [3, 2, 1, 3]) >>
    print (éCaminho (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) [1, 2, 3, 4, 5]) >>
    putStr "\n" >>

    print "éCiclo" >>
    print (éCiclo (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (3, 4)]) [1, 3, 4]) >>
    print (éCiclo (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [3, 2, 1, 3]) >>
    print (éCiclo (novoGrafo 5 [(1, 2), (1, 4), (3, 4), (4, 5)]) [1, 2, 3, 4, 5]) >>
    putStr "\n" -- >>