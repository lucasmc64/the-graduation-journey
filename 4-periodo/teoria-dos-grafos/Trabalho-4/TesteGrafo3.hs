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
    putStr "\n" -- >>