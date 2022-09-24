@testset "Trabalho 5" begin

  @testset "éSubgrafoGerador" begin
      let n = 6, g = completo(n), h = vazio(n)
        @test éSubgrafoGerador(g,h) == true
      end

      let n = 7, g = roda(n), h = caminho(n)
        @test éSubgrafoGerador(g,h) == true
      end

      let n = 7, g = ciclo(n), h = caminho(n)
        @test éSubgrafoGerador(g,h) == true
      end

      let n = 10, g = caminho(n), h = caminho(n-1)
        @test éSubgrafoGerador(g,h) == false
      end

      let n = 10, g = caminho(n), h = roda(n)
        @test éSubgrafoGerador(g,h) == false
      end
  end


  @testset "éÁrvore" begin
      let n = 6, g = estrela(n)
        @test éÁrvore(g) == true
      end

      let n = 7, g = caminho(n)
        @test éÁrvore(g) == true
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test éÁrvore(g) == true
      end

      let n = 10, g = completo(n)
        @test éÁrvore(g) == false
      end

      let n = 10, g = roda(n)
        @test éÁrvore(g) == false
      end
  end


  @testset "éEstrela" begin
      let n = 6, g = estrela(n)
        @test éEstrela(g) == true
      end

      let n = 7, g = caminho(n)
        @test éEstrela(g) == false
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test éEstrela(g) == false
      end

      let n = 10, g = completo(n)
        @test éEstrela(g) == false
      end

      let n = 10, g = roda(n)
        @test éEstrela(g) == false
      end
  end


  @testset "éFloresta" begin
      let n = 6, g = estrela(n)
        @test éFloresta(g) == true
      end

      let n = 7, g = caminho(n)
        @test éFloresta(g) == true
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test éFloresta(g) == true
      end

      let n = 10, g = completo(n)
        @test éFloresta(g) == false
      end

      let n = 10, g = roda(n)
        @test éFloresta(g) == false
      end

      let n = 6, g = vazio(n)
        @test éFloresta(g) == true
      end

      let n = 6, g = vazio(n)
        for uv in [(1,2), (3,4), (5,6)]
            nova_aresta!(g, uv)
        end
        @test éFloresta(g) == true
      end

      let n = 7, g = vazio(n)
        for uv in [(1,2), (1,3), (2,3), (3,4), (5,6)]
            nova_aresta!(g, uv)
        end
        @test éFloresta(g) == false
      end
  end


  @testset "folhas" begin
      let n = 6, g = estrela(n)
        @test sort(folhas(g)) == collect(2:n+1)
      end

      let n = 7, g = caminho(n)
        @test sort(folhas(g)) == [1,n]
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test sort(folhas(g)) == collect(4:7)
      end

      let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8)])
        @test sort(folhas(g)) == [3,5,6,8]
      end

      let n = 9, g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8), (7,9)])
        @test sort(folhas(g)) == [3,5,6,8,9]
      end
  end

  
  @testset "internos" begin
      let n = 6, g = estrela(n)
        @test sort(internos(g)) == [1]
      end

      let n = 7, g = caminho(n)
        @test sort(internos(g)) == collect(2 : n-1)
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test sort(internos(g)) == [1,2,3]
      end

      let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8)])
        @test sort(internos(g)) == [1,2,4,7]
      end

      let n = 9, g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8), (7,9)])
        @test sort(internos(g)) == [1,2,4,7]
      end
  end
  
  @testset "centroÁrvore" begin
      let n = 7, g = estrela(n)
        @test centroÁrvore(g) == [1]
      end

      let n = 7, g = caminho(n)
        @test centroÁrvore(g) ==
              (if n % 2 == 1
                  [div(n+1, 2)]
               else
                   let c1 = div(n, 2), c2 = c1 + 1
                       [c1,c2]
                   end
               end)
      end

      let n = 8, g = caminho(n)
        @test centroÁrvore(g) ==
              (if n % 2 == 1
                  [div(n+1, 2)]
               else
                   let c1 = div(n, 2), c2 = c1 + 1
                       [c1,c2]
                   end
               end)
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test centroÁrvore(g) == [1]
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)])
        @test centroÁrvore(g) == [3,4]
      end
  end
  
  
  @testset "éAncestral" begin
      let n = 7, g = estrela(n), r = 1, v = 1, w = 3
        @test (éAncestral(g, r, v, w)) == true
      end

      let n = 7, g = caminho(n), r = 4, v = 3, w = 1
        @test (éAncestral(g, r, v, w)) == true
      end

      let n = 8, g = caminho(n), r = 4, v = 5, w = 2
        @test (éAncestral(g, r, v, w)) == false
      end
            
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, v = 3, w = 6
        @test (éAncestral(g, r, v, w)) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, v = 4, w = 6
        @test (éAncestral(g, r, v, w)) == true
      end
  end
  
  
  @testset "éDescendente" begin
      let n = 7, g = estrela(n), r = 1, v = 3, w = 1
        @test (éDescendente(g, r, v, w)) == true
      end

      let n = 7, g = caminho(n), r = 4, v = 1, w = 3
        @test (éDescendente(g, r, v, w)) == true
      end

      let n = 8, g = caminho(n), r = 4, v = 5, w = 2
        @test (éDescendente(g, r, v, w)) == false
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, v = 6, w = 3
        @test (éDescendente(g, r, v, w)) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, v = 6, w = 4
        @test (éDescendente(g, r, v, w)) == true
      end
  end
  
  
  @testset "éIrmão" begin
      let n = 7, g = estrela(n), r = 1, v = 3, w = 4
        @test (éIrmão(g, r, v, w)) == true
      end

      let n = 7, g = caminho(n), r = 4, v = 1, w = 3
        @test (éIrmão(g, r, v, w)) == false
      end

      let n = 8, g = caminho(n), r = 4, v = 5, w = 2
        @test (éIrmão(g, r, v, w)) == false
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, v = 6, w = 7
        @test (éIrmão(g, r, v, w)) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, v = 5, w = 6
        @test (éIrmão(g, r, v, w)) == true
      end
  end


  @testset "ancestrais" begin
      let n = 7, g = estrela(n), r = 1, v = 1
        @test (ancestrais(g, r, v)) == []
      end

      let n = 7, g = caminho(n), r = 4, v = 1
        @test sort(ancestrais(g, r, v)) == [2, 3, 4]
      end

      let n = 8, g = caminho(n), r = 4, v = 6
        @test sort(ancestrais(g, r, v)) == [4,5]
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, v = 4
        @test sort(ancestrais(g, r, v)) == [1,2]
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, v = 6
        @test sort(ancestrais(g, r, v)) == [1,3,4]
      end
  end


  @testset "descendentes" begin
      let n = 7, g = estrela(n), r = 1, v = 1
        @test (descendentes(g, r, v)) == collect(2:(n-1))
      end

      let n = 7, g = caminho(n), r = 4, v = 1
        @test sort(descendentes(g, r, v)) == []
      end

      let n = 8, g = caminho(n), r = 4, v = 6
        @test sort(descendentes(g, r, v)) == [7,8]
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, v = 3
        @test sort(descendentes(g, r, v)) == [6,7]
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, v = 3
        @test sort(descendentes(g, r, v)) == [4,5,6]
      end
  end


  @testset "nível" begin
      let n = 7, g = estrela(n), r = 1, v = 1
        @test (nível(g, r, v)) == 0
      end

      let n = 7, g = caminho(n), r = 4, v = 1
        @test (nível(g, r, v)) == 3
      end

      let n = 8, g = caminho(n), r = 4, v = 6
        @test (nível(g, r, v)) == 2
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, v = 3
        @test (nível(g, r, v)) == 1
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, v = 6
        @test (nível(g, r, v)) == 3
      end
  end


  @testset "altura" begin
      let n = 7, g = estrela(n), r = 1
        @test altura(g,r) == 1
      end

      let n = 7, g = caminho(n), r = 4
        @test altura(g,r) == 3
      end

      let n = 8, g = caminho(n), r = 4
        @test altura(g,r) == 4
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1
        @test altura(g,r) == 2
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1
        @test altura(g,r) == 3
      end
  end


  @testset "parcial" begin
      let n = 7, g = estrela(n), r = 1, v = [2,3]
        @test seqGraus(parcial(g, r, v)) == [1,1,1,1,1,5]
      end

      let n = 7, g = caminho(n), r = 4, v = [1]
        @test seqGraus(parcial(g, r, v)) == [1,1,2,2,2,2]
      end

      let n = 8, g = caminho(n), r = 4, v = [6,7,8]
        @test seqGraus(parcial(g, r, v)) == [1,1,2,2,2]
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, v = [4,5,6,7]
        @test seqGraus(parcial(g, r, v)) == [1,1,2]
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, v = [5,6]
        @test seqGraus(parcial(g, r, v)) == [1,1,1,3]
      end
  end


  @testset "éBinária" begin
      let n = 7, g = estrela(n), r = 1
        @test éBinária(g,r) == false
      end

      let n = 7, g = caminho(n), r = 4
        @test éBinária(g,r) == true
      end

      let n = 8, g = caminho(n), r = 4
        @test éBinária(g,r) == true
      end
        
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1
        @test éBinária(g,r) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1
        @test éBinária(g,r) == true
      end
  end


  @testset "éBinEstrita" begin
      let n = 7, g = estrela(n), r = 1
        @test éBinEstrita(g,r) == false
      end

      let n = 7, g = caminho(n), r = 4
        @test éBinEstrita(g,r) == false
      end

      let n = 8, g = caminho(n), r = 4
        @test éBinEstrita(g,r) == false
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1
        @test éBinEstrita(g,r) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1
        @test éBinEstrita(g,r) == false
      end
  end


  @testset "éBinCompleta" begin
      let n = 7, g = estrela(n), r = 1
        @test éBinCompleta(g,r) == true
      end

      let n = 7, g = caminho(n), r = 4
        @test éBinCompleta(g,r) == true
      end

      let n = 8, g = caminho(n), r = 4
        @test éBinCompleta(g,r) == false
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1
        @test éBinCompleta(g,r) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1
        @test éBinCompleta(g,r) == false
      end
  end


  @testset "éÁrvoreM" begin
      let n = 7, g = estrela(n), r = 1, m = n
        @test éÁrvoreM(g,r,m) == true
      end

      let n = 7, g = caminho(n), r = 4, m = 1
        @test éÁrvoreM(g,r,m) == false
      end

      let n = 8, g = caminho(n), r = 4, m = 2
        @test éÁrvoreM(g,r,m) == true
      end
      
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, m = 2
        @test éÁrvoreM(g,r,m) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, m = 1
        @test éÁrvoreM(g,r,m) == false
      end
  end


  @testset "éMcheia" begin
      let n = 7, g = estrela(n), r = 1, m = n
        @test éMcheia(g,r,m) == true
      end

      let n = 7, g = caminho(n), r = 4, m = 1
        @test éMcheia(g,r,m) == false
      end

      let n = 13,
          g = Grafo([(1,2), (1,4), (1,7), (2,3), (2,9), (2,10),
                     (4,11), (4,5), (4,6), (7,8), (7,12), (7,13)]),
          r = 1,
          m = 3
        @test éMcheia(g,r,m) == true
       end
     
      let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), r = 1, m = 2
        @test éMcheia(g,r,m) == true
      end

      let g = Grafo([(1,3), (2,3), (3,4), (4,5), (4,6)]), r = 1, m = 1
        @test éMcheia(g,r,m) == false
      end
  end


  @testset "éGeradora" begin
      let n = 7, g = estrela(n), a = estrela(n)
        @test éGeradora(g,a) == true
      end

      let n = 7, g = caminho(n), a = cópia(g)
        @test éGeradora(g,a) == true
      end

      let n = 7, g = roda(n), a = estrela(n-1)
        @test éGeradora(g,a) == true
      end

      let n = 7, g = completo(n), a = estrela(n-1)
        @test éGeradora(g,a) == true
      end

      let n = 7, g = completo(n), a = caminho(n)
        @test éGeradora(g,a) == true
      end
  end


  @testset "geradora" begin
      let n = 7, g = estrela(n), a = cópia(g)
        @test seqGraus(geradora(g)) == seqGraus(a)
      end

      let n = 7, g = caminho(n), a = cópia(g)
        @test seqGraus(geradora(g)) == seqGraus(a)
      end

      let n = 7, g = roda(n), a = geradora(g)
        @test éÁrvore(a) && vértices(g) == vértices(a)
      end

      let n = 5, g = completo(n), a = geradora(g)
        @test éÁrvore(a) && vértices(g) == vértices(a)
      end

      let n = 7, g = ciclo(n), a = geradora(g)
        @test éÁrvore(a) && vértices(g) == vértices(a)
      end
  end


  @testset "geradoras" begin
      let n = 7, g = estrela(n), a = cópia(g), ags = geradoras(g)
        @test count(i -> éÁrvore(i), ags) == 1 && length(ags) == 1
      end

      let n = 7, g = caminho(n), a = cópia(g), ags = geradoras(g)
        @test count(i -> éÁrvore(i), ags) == 1 && length(ags) == 1
      end

      let n = 4, g = completo(n), a = geradora(g), ags = geradoras(g)
        @test count(i -> éÁrvore(i), ags) == n ^ (n-2) && 
              length(ags) == n ^ (n-2) && éGeradora(g,rand(ags))
      end

      let n = 5, g = completo(n), a = geradora(g), ags = geradoras(g)
        @test count(i -> éÁrvore(i), ags) == n ^ (n-2) && 
              length(ags) == n ^ (n-2) && éGeradora(g, rand(ags))
      end
  end


  @testset "prufer" begin
      let n = 6, g = estrela(n)
        @test prufer(g) == fill(1, n-1)
      end

      let n = 7, g = caminho(n)
        @test prufer(g) == collect(2:n-1)
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test prufer(g) == [2,2,1,3,3]
      end

      let n = 8, g = Grafo([(1,2), (1,3), (1,4), (4,5), (4,7), (6,7), (7,8)])
        @test prufer(g) == [1,1,4,4,7,7]
      end

      let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8)])
        @test prufer(g) == [2,1,4,4,1,7]
      end
  end


  @testset "decodPrufer" begin
      let n = 6, g = estrela(n), c = fill(1, n-1)
        @test seqGraus(decodPrufer(c)) == seqGraus(g)            
      end

      let n = 7, g = caminho(n), c = collect(2:n-1)
        @test seqGraus(decodPrufer(c)) == seqGraus(g)
      end

      let n = 7,
          g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]),
          c = [2,2,1,3,3]
        @test seqGraus(decodPrufer(c)) == seqGraus(g)            
      end

      let n = 8,
          g = Grafo([(1,2), (1,3), (1,4), (4,5),(4,7), (6,7), (7,8)]),
          c = [1,1,4,4,7,7]
        @test seqGraus(decodPrufer(c)) == seqGraus(g)
      end

      let n = 8, 
          g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8)]),
          c = [2,1,4,4,1,7]
        @test seqGraus(decodPrufer(c)) == seqGraus(g)
      end
  end


  @testset "éSeqVálida" begin
      let n = 6, g = estrela(n)
        @test éSeqVálida(seqGraus(g)) == true
      end

      let n = 7, g = caminho(n)
        @test éSeqVálida(seqGraus(g)) == true
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
        @test éSeqVálida(seqGraus(g)) == true
      end

      let n = 8, g = Grafo([(1,2), (1,3), (1,4), (4,5), (4,7), (6,7), (7,8)])
        @test éSeqVálida(seqGraus(g)) == true
      end

      let n = 7, g = Grafo([(1,2), (1,2), (1,4), (2,3), (2,5), (3,6)])
        @test éSeqVálida(seqGraus(g)) == true
      end

      let n = 7, g = Grafo([(1,2), (1,2), (1,4), (2,3), (2,5), (3,6)])
        @test éSeqVálida(pushfirst!(seqGraus(g), 1)) == false
      end
  end


  @testset "numÁrvRotuladas" begin
      let n = 6, g = estrela(n), s = seqGraus(g)
        @test numÁrvRotuladas(s) == 1
      end

      let n = 7, g = caminho(n), s = seqGraus(g)
        @test numÁrvRotuladas(s) == 120
      end

      let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), s = seqGraus(g)
        @test numÁrvRotuladas(s) == 30
      end

      let n = 8, g = Grafo([(1,2), (1,3), (1,4), (4,5), (4,7), (6,7), (7,8)]), s = seqGraus(g)
        @test numÁrvRotuladas(s) == 90
      end
  end


  @testset "árvoresRotuladas" begin
      let n = 6, g = estrela(n), s = seqGraus(g)
        @test length(árvoresRotuladas(s)) == 1
      end

      let n = 7, g = caminho(n), s = seqGraus(g)
        @test length(árvoresRotuladas(s)) == 120
      end

      let n = 7,
          g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]),
          s = seqGraus(g)
        @test length(árvoresRotuladas(s)) == 30
      end

      let n = 8,
          g = Grafo([(1,2), (1,3), (1,4), (4,5), (4,7), (6,7), (7,8)]),
          s = seqGraus(g)
        @test length(árvoresRotuladas(s)) == 90
      end
  end
end  
