import GrafoListAdj
import Grafo

main :: IO ()
main =
    print "eTrivial" >>
    print (eTrivial (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (2, 4)])) >>
    print (eTrivial (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    print (eTrivial (novoGrafo 1 [])) >>
    putStr "\n" >>

    print "eIsolado" >>
    print (eIsolado (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (2, 4)]) 4) >>
    print (eIsolado (novoGrafo 4 [(1, 2), (1, 3), (2, 3)]) 4) >>
    print (eIsolado (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 1) >>
    putStr "\n" >>

    print "eTerminal" >>
    print (eTerminal (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (2, 4)]) 4) >>
    print (eTerminal (novoGrafo 4 [(1, 2), (1, 3), (2, 3)]) 4) >>
    print (eTerminal (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 1) >>
    putStr "\n" >> 

    print "ePar" >>
    print (ePar (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (2, 4)]) 4) >>
    print (ePar (novoGrafo 4 [(1, 2), (1, 3), (2, 3)]) 3) >>
    print (ePar (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 1) >>
    putStr "\n" >>

    print "eImpar" >>
    print (eImpar (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]) 1) >>
    print (eImpar (novoGrafo 4 [(1, 2), (1, 3), (2, 3)]) 3) >>
    print (eImpar (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 1) >>
    putStr "\n" >>

    print "seqGraus" >>
    print (seqGraus (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (seqGraus (novoGrafo 4 [(1, 2), (1, 3), (2, 3)])) >>
    print (seqGraus (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "grauMax" >>
    print (grauMax (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (grauMax (novoGrafo 4 [(1, 2), (1, 3), (2, 3)])) >>
    print (grauMax (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "grauMin" >>
    print (grauMin (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (grauMin (novoGrafo 4 [(1, 2), (1, 3), (2, 3)])) >>
    print (grauMin (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eRegular" >>
    print (eRegular (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (eRegular (novoGrafo 4 [(1, 2), (1, 3), (2, 3)])) >>
    print (eRegular (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eKRegular" >>
    print (eKRegular (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]) 2) >>
    print (eKRegular (novoGrafo 4 [(1, 2), (1, 3), (2, 3)]) 3) >>
    print (eKRegular (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 2) >>
    putStr "\n" >>

    print "eVazio" >>
    print (eVazio (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (eVazio (novoGrafo 4 [])) >>
    print (eVazio (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eNulo" >>
    print (eNulo (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (eNulo (novoGrafo 0 [])) >>
    print (eNulo (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eCompleto" >>
    print (eCompleto (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (eCompleto (novoGrafo 0 [])) >>
    print (eCompleto (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eKn" >>
    print (eKn (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]) 2) >>
    print (eKn (novoGrafo 0 []) 2) >>
    print (eKn (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) 3) >>
    putStr "\n" >>

    print "grafoCompleto" >>
    print (grafoCompleto 2) >>
    print (grafoCompleto 3) >>
    print (grafoCompleto 4) >>
    putStr "\n" >>

    print "grafoComplemento" >>
    print (grafoComplemento (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (grafoComplemento (novoGrafo 4 [(1, 2), (1, 3), (2, 3)])) >>
    print (grafoComplemento (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eSubgrafo" >>
    print (eSubgrafo (novoGrafo 4 [(1, 2), (1, 3), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (eSubgrafo (novoGrafo 4 [(1, 4), (2, 4), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 3), (2, 3)])) >>
    print (eSubgrafo (novoGrafo 3 []) (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eSubgrafoProprio" >>
    print (eSubgrafoProprio (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]) (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)])) >>
    print (eSubgrafoProprio (novoGrafo 4 [(1, 4), (2, 4), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 3), (2, 3)])) >>
    print (eSubgrafoProprio (novoGrafo 3 []) (novoGrafo 3 [(1, 2), (1, 3), (2, 3)])) >>
    putStr "\n" >>

    print "eSubgrafoInduzidoVertices" >>
    print (eSubgrafoInduzidoVertices (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]) (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]) [1, 2, 3]) >>
    print (eSubgrafoInduzidoVertices (novoGrafo 4 [(1, 2), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (4, 3)]) [3, 4]) >>
    print (eSubgrafoInduzidoVertices (novoGrafo 3 []) (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [2, 3]) >>
    putStr "\n" >>

    print "eSubgrafoInduzidoArestas" >>
    print (eSubgrafoInduzidoArestas (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4)]) (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]) [(1, 2), (1, 4), (2, 4)]) >>
    print (eSubgrafoInduzidoArestas (novoGrafo 4 [(1, 2), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (4, 3)]) [(1, 3), (4, 3)]) >>
    print (eSubgrafoInduzidoArestas (novoGrafo 3 []) (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) [(2, 3)]) >>
    putStr "\n" >>

    print "eClique" >>
    print (eClique (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)])) >>
    print (eClique (novoGrafo 4 [(1, 2), (2, 3), (3, 4)]) (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (4, 3)])) >>
    print (eClique (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 4), (2, 3), (2, 4)])) >>
    putStr "\n" >>

    print "eCjIndependenteVertices" >>
    print (eCjIndependenteVertices (novoGrafo 3 []) (novoGrafo 6 [(1, 4), (2, 4), (3, 4), (4, 5), (5, 6), (6, 1)])) >>
    print (eCjIndependenteVertices (novoGrafo 4 [(1, 2), (2, 3), (3, 4)]) (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (4, 3)])) >>
    print (eCjIndependenteVertices (novoGrafo 3 [(1, 2), (1, 3), (2, 3)]) (novoGrafo 4 [(1, 2), (1, 4), (2, 3), (2, 4)])) >>
    putStr "\n" >>

    print "uniao" >>
    print (uniao (novoGrafo 3 [(1, 3), (2, 3)]) (novoGrafo 2 [(1, 2)])) >>
    print (uniao (novoGrafo 4 [(1, 2), (2, 3), (3, 4)]) (novoGrafo 4 [(1, 2), (1, 3), (2, 3), (4, 3)])) >>
    print (uniao (novoGrafo 2 [(1, 2)]) (novoGrafo 4 [(1, 4), (2, 3), (2, 4)])) >>
    putStr "\n" -- >>