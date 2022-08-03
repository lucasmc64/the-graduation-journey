using Grafos

@testset "Trabalho 3" begin

     @testset "éVértIsolado" begin
        @test éVértIsolado(vazio(1), 1) ==    true
        @test éVértIsolado(vazio(5), 5) ==    true
        @test éVértIsolado(completo(5), 3) == false
        @test éVértIsolado(caminho(5), 2) ==  false
        @test éVértIsolado(ciclo(10), 9) ==   false
     end


     @testset "éVértTerminal" begin
        @test éVértTerminal(caminho(5), 1) ==  true
        @test éVértTerminal(caminho(5), 5) ==  true
        @test éVértTerminal(caminho(5), 3) ==  false
        @test éVértTerminal(ciclo(10), 5) ==   false
        @test éVértTerminal(estrela(10), 3) == true
     end


     @testset "éVértPar" begin
        @test éVértPar(caminho(5), 2) ==  true
        @test éVértPar(caminho(5), 3) ==  true
        @test éVértPar(caminho(5), 5) ==  false
        @test éVértPar(petersen(), 4) ==  false
        @test éVértPar(estrela(10), 3) == false
     end


     @testset "éVértÍmpar" begin
        @test éVértÍmpar(caminho(5),  2) == false
        @test éVértÍmpar(caminho(5),  3) == false
        @test éVértÍmpar(caminho(5),  5) == true
        @test éVértÍmpar(petersen(),  4) == true
        @test éVértÍmpar(estrela(10), 3) == true
     end

     @testset "sãoArestasAdjs" begin
        @test sãoArestasAdjs(caminho(5), (2,3), (3,4)) == true
        @test sãoArestasAdjs(ciclo(6),   (1,6), (1,2)) == true
        @test sãoArestasAdjs(vazio(5),   (1,2), (2,3)) == false
        @test sãoArestasAdjs(estrela(10), (1,2), (2,3)) == false
        @test sãoArestasAdjs(bipartidoCompleto(3, 5), (1,6), (3,7)) == false
     end


     @testset "éTrivial" begin
        @test éTrivial(caminho(5)) ==  false
        @test éTrivial(ciclo(6)) ==   false
        @test éTrivial(vazio(1)) ==   true
        @test éTrivial(estrela(10)) == false
        @test éTrivial(bipartidoCompleto(3, 5)) == false
     end


     @testset "grauMax" begin
        @test grauMax(vazio(5)) ==   0
        @test grauMax(caminho(8)) == 2
        @test grauMax(grade(3,3)) == 4
        @test grauMax(regular(6,2)) == 2
        @test grauMax(roda(9)) == 8
     end

     @testset "grauMin" begin
        @test grauMin(vazio(5)) ==   0
        @test grauMin(caminho(8)) == 1
        @test grauMin(grade(3,3)) == 2
        @test grauMin(regular(6,2)) == 2
        @test grauMin(roda(9)) == 3
     end

     @testset "éRegular" begin
        @test éRegular(regular(6,0)) == true
        @test éRegular(regular(4,1)) == true
        @test éRegular(regular(8,2)) == true
        @test éRegular(dama(4)) == false
        @test éRegular(roda(5)) == false
     end

     @testset "ékRegular" begin
        @test ékRegular(regular(6,0),0) == true
        @test ékRegular(regular(4,1),1) == true
        @test ékRegular(regular(8,2),2) == true
        @test ékRegular(dama(4),3) == false
        @test ékRegular(roda(5),3) == false
     end

     @testset "éVazio" begin
        @test éVazio(regular(6,0)) == true
        @test éVazio(regular(4,1)) == false
        @test éVazio(regular(8,2)) == false
        @test éVazio(vazio(9)) == true
        @test éVazio(roda(5)) == false
     end

     @testset "éNulo" begin
        @test éNulo(vazio(1)) == false
        @test éNulo(vazio(5)) == false
        @test éNulo(roda(6))  == false
        @test éNulo(nulo())   == true
        @test éNulo(roda(7))  == false
     end

     @testset "éKn" begin
        @test éKn(completo(3), 3) == true
        @test éKn(completo(4), 4) == true
        @test éKn(completo(8), 8) == true
        @test éKn(dama(5), 5)     == false
        @test éKn(regular(7,4), 7) == false
     end

     @testset "éCompleto" begin
        @test éCompleto(completo(3)) == true
        @test éCompleto(completo(4)) == true
        @test éCompleto(completo(8)) == true
        @test éCompleto(dama(5))     == false
        @test éCompleto(regular(7,4)) == false
     end


     @testset "éSubgrafo" begin
        @test éSubgrafo(vazio(3), completo(3)) == true
        @test éSubgrafo(completo(4), completo(4)) == true
        @test éSubgrafo(ciclo(8), completo(8)) == true
        @test éSubgrafo(dama(5), ciclo(6)) ==   false
        @test éSubgrafo(regular(7, 4), regular(7, 2)) == false
     end


     @testset "éSubgrafoPróprio" begin
        @test éSubgrafoPróprio(vazio(3), completo(3)) == true
        @test éSubgrafoPróprio(completo(4), completo(4)) == false
        @test éSubgrafoPróprio(ciclo(8), completo(8)) == true
        @test éSubgrafoPróprio(dama(5), ciclo(6)) ==   false
        @test éSubgrafoPróprio(regular(7, 4), regular(7, 2)) == false
     end


     @testset "éSubgrafoInduzidoVértices" begin
        @test éSubgrafoInduzidoVértices(vazio(3), completo(3), collect(1:3)) == false
        @test éSubgrafoInduzidoVértices(completo(3), completo(3), collect(1:3))  == true
        let n = 8, k = 4
          @test éSubgrafoInduzidoVértices(completo(k), completo(n), collect(1:k)) == true
        end
        let n = 5
          @test éSubgrafoInduzidoVértices(caminho(n), ciclo(n+1), collect(1:n)) == true
        end
        let n = 7
          @test éSubgrafoInduzidoVértices(roda(n), regular(n,4), collect(1:n)) == false
        end
     end


     @testset "éSubgrafoInduzidoArestas" begin
        let n = 3
          @test éSubgrafoInduzidoArestas(caminho(n), completo(n), [(1,2),(2,3)]) == true
        end
        let n = 4
          @test éSubgrafoInduzidoArestas(caminho(n), completo(n), arestas(caminho(n))) == true
        end
        let n = 8,  k = 4
           @test éSubgrafoInduzidoArestas(completo(k), completo(n), arestas(completo(k))) == true
        end
        let n = 5
          @test éSubgrafoInduzidoArestas(caminho(n), ciclo(n+1), arestas(caminho(n))) == true
        end
        let n = 7, g = regular(n,4)
          @test éSubgrafoInduzidoArestas(roda(n), g, arestas(g)[1:3]) == false
        end
     end


     @testset "éClique" begin
        let n = 5, k = 4, h = completo(k), g = completo(n)
          @test éClique(h, g) == true
        end
        let n = 5, k = 3, h = vazio(k), g = completo(n)
          @test éClique(h, g) == false
        end
        let n = 6, k = 5, h = completo(k), g = completo(n)
          @test éClique(h, g) == true
        end
        let n = 6, k = 5, h = roda(k), g = completo(n)
          @test éClique(h, g) == false
        end
        let n = 6, k = 5, h = caminho(k), g = completo(n)
          @test éClique(h, g) == false
        end
     end

     @testset "éCjIndependenteVértices" begin
        let n = 5, k = 3, h = vazio(k), g = completo(n)
          @test éCjIndependenteVértices(h, g) == false
        end
        let n = 6, k = 3, h = vazio(k), g = caminho(n)
          @test éCjIndependenteVértices(h, g) == false
        end
        let p = 6, q = 3, k = 3, h = vazio(k), g = bipartidoCompleto(p, q)
          @test éCjIndependenteVértices(h, g) == true
        end
        let p = 6, q = 3, k = 6, h = vazio(k), g = bipartidoCompleto(p, q)
          @test éCjIndependenteVértices(h, g) == true
        end
        let n = 6, k = 5, h = roda(k), g = completo(n)
          @test éCjIndependenteVértices(h, g) == false
        end
     end


     @testset "insereVértices" begin
        let n = 5, g = completo(n)
          @test insereVértices(g, collect(1:n)) == g
        end
        let n = 6, g = ciclo(n)
          @test seqGraus(insereVértices(g, [7,8])) == [[0,0]; fill(2,n)]
        end
        let n = 7, g = completo(n)
          @test seqGraus(insereVértices(g, [7,8])) == [[0]; fill(n-1,n)]
        end
        let n = 9, g = caminho(n)
          @test nvértices(insereVértices(g, [10])) == 10
        end
     end


     @testset "removeVértices" begin
        let n = 5, g = completo(n)
          @test nvértices(removeVértices(g, collect(1:n-1))) == 1
        end
        let n = 6, g = ciclo(n)
          @test narestas(removeVértices(g, [1,2])) == (narestas(g) - 3)
        end
        let n = 7, g = completo(n)
          @test seqGraus(removeVértices(g, [8,9])) == seqGraus(g)
        end
        let n = 9, g = caminho(n)
          @test nvértices(removeVértices(g, collect(2:n-1))) == 2
        end
     end


     @testset "insereArestas" begin
        let n = 5, g = caminho(n)
          @test insereArestas(g, [(1,n)]) == ciclo(n)
        end
        let n = 4, g = ciclo(n)
          @test insereArestas(g, [(1,3),(2,4)]) == completo(4)
        end
        let n = 7, g = completo(n)
          @test insereArestas(g, [(2,3), (4,5), (6,7)]) == g
        end
        let n = 9, g = caminho(n)
          @test narestas(insereArestas(g, [(1,3),(1,4),(1,5),(1,6)])) ==
                (4 + narestas(g))
        end
     end

     @testset "removeArestas" begin
        let n = 5, g = ciclo(n)
          @test removeArestas(g, [(1,n)]) == caminho(n)
        end
        let n = 4, g = completo(n)
          @test removeArestas(g, [(1,3),(2,4)]) == ciclo(n)
        end
        let n = 5, g = completo(n)
          @test removeArestas(g, [(6,7), (7,1)]) == g
        end
        let n = 9, g = caminho(n)
          @test narestas(removeArestas(g, [(1,2),(2,3),(3,4),(5,6)])) ==
               (narestas(g) - 4)
        end
     end


     @testset "contraiVértices" begin
        let n = 5, g = caminho(n)
          @test contraiVértices(g,1,n) == ciclo(n-1)
        end
        let n = 4, g = vazio(n)
          @test contraiVértices(g,1,n) == vazio(n-1)
        end
        let n = 9, g = caminho(n)
          @test narestas(contraiVértices(g,1,n)) == narestas(g)
        end
        let n = 6, g = completo(n)
           @test contraiVértices(g,1,n) == completo(n-1)
        end
     end


     @testset "contraiAresta" begin
        let n = 5, g = caminho(n)
          @test contraiAresta(g, (n-1,n)) == caminho(n-1)
        end
        let n = 4, g = vazio(n)
          @test contraiAresta(g, (1,n)) == vazio(n)
        end
        let n = 9, g = ciclo(n)
          @test narestas(contraiAresta(g, (n,1))) == (narestas(g) - 1)
        end
        let n = 6, g = completo(n)
           @test contraiAresta(g, (1,n)) == completo(n-1)
        end
     end

     @testset "éPasseio" begin
        let n = 3, g = vazio(n), vs = collect(1:n)
          @test éPasseio(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = collect(1:n)
          @test éPasseio(g,vs)  == true
        end
        let n = 5, g = completo(n), vs = [n; 1:n]
          @test éPasseio(g,vs)  == true
        end
        let n = 5, g = caminho(n), vs = [n; 1:n]
          @test éPasseio(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [n; 1:n]
          @test éPasseio(g,vs)  == true
        end
        let n = 5, g = roda(n), vs = [1,2,3,4,3,2,1,5,2]
          @test éPasseio(g,vs)  == true
        end
     end


     @testset "éPasseioAberto" begin
        let n = 3, g = vazio(n), vs = collect(1:n)
          @test éPasseioAberto(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = collect(1:n)
          @test éPasseioAberto(g,vs)  == true
        end
        let n = 5, g = completo(n), vs = [n; 1:n]
          @test éPasseioAberto(g,vs)  == false
        end
        let n = 5, g = caminho(n), vs = [n; 1:n]
          @test éPasseioAberto(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [n; 1:n]
          @test éPasseioAberto(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [1,2,4,1]
          @test éPasseioAberto(g,vs)  == false
        end
     end


     @testset "éPasseioFechado" begin
        let n = 3, g = vazio(n), vs = collect(1:n)
          @test éPasseioFechado(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = collect(1:n)
          @test éPasseioFechado(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = [n; 1:n]
          @test éPasseioFechado(g,vs)  == true
        end
        let n = 5, g = caminho(n), vs = [n; 1:n]
          @test éPasseioFechado(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [n; 1:n]
          @test éPasseioFechado(g,vs)  == true
        end
        let n = 5, g = roda(n), vs = [1,2,4,1]
          @test éPasseioFechado(g,vs)  == false
        end
     end


     @testset "éTrilha" begin
        let n = 3, g = vazio(n), vs = collect(1:n)
          @test éTrilha(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = collect(1:n)
          @test éTrilha(g,vs)  == true
        end
        let n = 5, g = completo(n), vs = [n; 1:n]
          @test éTrilha(g,vs)  == true
        end
        let n = 5, g = caminho(n), vs = [n; 1:n]
          @test éTrilha(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [[n; 1:n]; [n-1]]
          @test éTrilha(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [1,2,4,1]
          @test éTrilha(g,vs)  == false
        end
     end


     @testset "éCaminho" begin
        let n = 3, g = vazio(n), vs = collect(1:n)
          @test éCaminho(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = collect(1:n)
          @test éCaminho(g,vs)  == true
        end
        let n = 5, g = completo(n), vs = [n; 1:n]
          @test éCaminho(g,vs)  == false
        end
        let n = 5, g = caminho(n), vs = [n; 1:n]
          @test éCaminho(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [[n; 1:n]; [n-1]]
          @test éCaminho(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [1,2,4,1]
          @test éCaminho(g,vs)  == false
        end
     end


     @testset "éCiclo" begin
        let n = 3, g = vazio(n), vs = collect(1:n)
          @test éCiclo(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = collect(1:n)
          @test éCiclo(g,vs)  == false
        end
        let n = 5, g = completo(n), vs = [n; 1:n]
          @test éCiclo(g,vs)  == true
        end
        let n = 5, g = caminho(n), vs = [n; 1:n]
          @test éCiclo(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = collect(2:n)
          @test éCiclo(g,vs)  == false
        end
        let n = 5, g = roda(n), vs = [1,2,4,1]
          @test éCiclo(g,vs)  == false
        end
        let n = 5, g = ciclo(n), vs = [n; 1:n]
          @test éCiclo(g,vs)  == true
        end
     end


     @testset "éGrafoCíclico" begin
        let n = 3, g = vazio(n)
          @test éGrafoCíclico(g)  == false
        end
        let n = 5, g = completo(n)
          @test éGrafoCíclico(g)  == false
        end
        let n = 5, g = estrela(n)
          @test éGrafoCíclico(g)  == false
        end
        let n = 5, g = caminho(n)
          @test éGrafoCíclico(g)  == false
        end
        let n = 5, g = roda(n)
          @test éGrafoCíclico(g)  == false
        end
        let n = 5, g = ciclo(n)
          @test éGrafoCíclico(g)  == true
        end
        let n = 10, g = ciclo(n)
          @test éGrafoCíclico(g)  == true
        end
     end


     @testset "éCn" begin
        let n = 3, g = vazio(n)
          @test éCn(g, n)  == false
        end
        let n = 5, g = completo(n)
          @test éCn(g, n-1)  == false
        end
        let n = 5, g = estrela(n)
          @test éCn(g, n)  == false
        end
        let n = 5, g = caminho(n)
          @test éCn(g, n)  == false
        end
        let n = 5, g = roda(n)
          @test éCn(g, n)  == false
        end
        let n = 5, g = ciclo(n)
          @test éCn(g, 5)  == true
        end
        let n = 10, g = ciclo(n)
          @test éCn(g, n)  == true
        end
        let n = 10, g = ciclo(n)
          @test éCn(g, n-1)  == false
        end
     end


     @testset "éGrafoCaminho" begin
        let n = 3, g = vazio(n)
          @test éGrafoCaminho(g)  == false
        end
        let n = 5, g = completo(n)
          @test éGrafoCaminho(g)  == false
        end
        let n = 5, g = estrela(n)
          @test éGrafoCaminho(g)  == false
        end
        let n = 5, g = caminho(n)
          @test éGrafoCaminho(g)  == true
        end
        let n = 5, g = roda(n)
          @test éGrafoCaminho(g)  == false
        end
        let n = 5, g = ciclo(n)
          @test éGrafoCaminho(g)  == false
        end
        let n = 6, g = caminho(n)
          @test éGrafoCaminho(g)  == true
        end
     end


     @testset "éPn" begin
        let n = 3, g = vazio(n)
          @test éPn(g, n) == false
        end
        let n = 5, g = completo(n)
          @test éPn(g, n) == false
        end
        let n = 5, g = estrela(n)
          @test éPn(g, n) == false
        end
        let n = 5, g = caminho(n)
          @test éPn(g, n) == true
        end
        let n = 5, g = roda(n)
          @test éPn(g, n) == false
        end
        let n = 5, g = ciclo(n)
          @test éPn(g, n) == false
        end
        let n = 6, g = caminho(n)
          @test éPn(g, n-1) == false
        end
     end


     @testset "éGrafoBipartido" begin
        let n = 3, g = vazio(n), v1 = [1], v2 = collect(2:n)
          @test éGrafoBipartido(g,v1,v2) == true
        end
        let p = 3, q = 5, g = bipartidoCompleto(p, q), 
            v1 = collect(1:p), v2 = collect(p+1:p+q)
               @test éGrafoBipartido(g,v1,v2) == true
        end
        let p = 3, q = 5, g = bipartidoCompleto(p, q),
            v1 = collect(1:p), v2 = collect(p:p+q)
               @test éGrafoBipartido(g,v1,v2) == false
        end
        let p = 8, q = 5, m = 10, g = bipartidoAleatório(p,q,m),
            v1 = collect(1:p), v2 = collect(p+1:p+q)
               @test éGrafoBipartido(g,v1,v2) == true
        end
        let n = 5, g = completo(n), v1 = collect(1:3), v2 = collect(4:n)
          @test éGrafoBipartido(g,v1,v2) == false
        end
        let n = 7, g = roda(n), v1 = collect(1:3), v2 = collect(4:n)
          @test éGrafoBipartido(g,v1,v2) == false
        end
     end



     @testset "éTrilhaEuleriana" begin
        let n = 4, g = vazio(n), vs = [n; 1:n]
          @test éTrilhaEuleriana(g,vs) == false
        end
        let n = 5, g = completo(n), vs = collect(1:n)
          @test éTrilhaEuleriana(g,vs) == false
        end
        let n = 5, g = completo(n), vs = [[n; 1:n]; [2,4,1,3,5]]
          @test éTrilhaEuleriana(g,vs) == true
        end
        let n = 5, g = caminho(n), vs = [n; 1:n]
          @test éTrilhaEuleriana(g,vs) == false
        end
        let n = 5, g = roda(n), vs = [[n; 1:n]; [n-1]]
          @test éTrilhaEuleriana(g,vs) == false
        end
        let n = 5, g = roda(n), vs = [1,2,4,1]
          @test éTrilhaEuleriana(g,vs) == false
        end
        let n = 10, g = ciclo(n), vs = [n; 1:n]
          @test éTrilhaEuleriana(g,vs) == true
        end
     end


     @testset "éGrafoEuleriano" begin
        let n = 5, g = estrela(n)
          @test éGrafoEuleriano(g) == false
        end
        let n = 4, g = ciclo(n)
          @test éGrafoEuleriano(g) == true
        end
        let n = 5, g = completo(n)
          @test éGrafoEuleriano(g) == true
        end
        let n = 6, g = completo(n)
          @test éGrafoEuleriano(g) == false
        end
        let n = 6, g = roda(n)
          @test éGrafoEuleriano(g) == false
        end
        let n = 6, k = 3, g = regular(n,k)
          @test éGrafoEuleriano(g) == false
        end
        let n = 6, k = 4, g = regular(n,k)
          @test éGrafoEuleriano(g) == true
        end
     end


     @testset "éSemiEuleriano" begin
        let n = 5, g = estrela(n)
          @test éSemiEuleriano(g) == false
        end
        let n = 4, g = ciclo(n)
          novo_vértice!(g)
          nova_aresta!(g, (5,1))
          nova_aresta!(g, (5,4))
          @test éSemiEuleriano(g) == true
        end
        let n = 5, g = completo(n)
          @test éSemiEuleriano(g) == false
        end
        let n = 6, g = completo(n)
          @test éSemiEuleriano(g) == false
        end
        let n = 6, g = roda(n)
          @test éSemiEuleriano(g) == false
        end
        let n = 6, k = 3, g = regular(n,k)
          @test éSemiEuleriano(g) == false
        end
        let n = 7, g =ciclo(n)
          nova_aresta!(g, (1,4))
          @test éSemiEuleriano(g) == true
        end
     end


     @testset "éHamiltonianoOre" begin
        let n = 5, g = estrela(n)
          @test éHamiltonianoOre(g) == false
        end
        let n = 6, g = completo(n)
          @test éHamiltonianoOre(g) == true
        end
        let n = 4, g = ciclo(n)
          @test éHamiltonianoOre(g) == true
        end
        let n = 8, k = 3, g = regular(n,k)
          @test éHamiltonianoOre(g) == false
        end
        let n = 8, g = ciclo(n)
          @test éHamiltonianoOre(g) == false
        end
     end


     @testset "éHamiltonianoDirac" begin
        let n = 5, g = estrela(n)
          @test éHamiltonianoDirac(g) == false
        end
        let n = 6, g = completo(n)
          @test éHamiltonianoDirac(g) == true
        end
        let n = 4, g = ciclo(n)
          @test éHamiltonianoDirac(g) == true
        end
        let n = 8, k = 3, g = regular(n,k)
          @test éHamiltonianoDirac(g) == false
        end
        let n = 8, k = 5, g = regular(n,k)
          @test éHamiltonianoDirac(g) == true
        end
        let n = 8, g = ciclo(n)
          @test éHamiltonianoDirac(g)  == false
        end
     end

end
