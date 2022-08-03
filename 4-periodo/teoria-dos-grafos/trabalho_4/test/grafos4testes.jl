@testset "Trabalho 4" begin

  @testset "grafoComplemento" begin
        let n = 3, g = vazio(n), h = completo(n)
          @test (grafoComplemento(g) == h)
        end

        let n = 3, g = completo(n), h = vazio(n)
          @test (grafoComplemento(g) == h)
        end
        let n = 4, g = ciclo(n), h = Grafo([(1,3), (2,4)])
          @test (grafoComplemento(g) == h)
        end

        let n = 5, g = completo(n), h = vazio(n)
            remove_aresta!(g, (1,n))
            nova_aresta!(h, (1,n))
            @test (grafoComplemento(g) == h)
        end

        let n = 6, k = 3, g = regular(n, k), h = regular(n, n-k-1)
           @test seqGraus(grafoComplemento(g)) == seqGraus(h)
        end
  end

  @testset "união" begin
        let n = 3, g = vazio(n), h = completo(n)
          @test ((união(g, h)) == h)
        end

        let n = 3, g = completo(n), h = vazio(n)
          @test ((união(g, h)) == g)
        end

        let n = 4, g = ciclo(n), h = Grafo([(1,3), (2,4)])
          @test ((união(g, h)) == completo(n))
        end

        let n = 4, k = 3, g = caminho(n), h = caminho(n+k)
          @test ((união(g, h)) == h)
        end

        let n = 4, k = 3, g = ciclo(n), h = completo(k)
          @test seqGraus((união(g, h))) ==  [2,2,3,3]
        end
  end

  @testset "interseção" begin
        let n = 3, g = vazio(n), h = completo(n)
          @test ((interseção(g, h)) == g)
        end

        let n = 3, g = completo(n), h = vazio(n)
          @test ((interseção(g, h)) == h)
        end

        let n = 4, g = ciclo(n), h = Grafo([(1,3), (2,4)])
          @test ((interseção(g, h)) == vazio(n))
        end

        let n = 4, k = 3, g = caminho(n), h = caminho(n+k)
          @test ((interseção(g, h)) == g)
        end

        let n = 4, k = 3, g = ciclo(n), h = completo(k), h2 = cópia(h)
          remove_aresta!(h2, (1,3))
          @test (interseção(g, h) == h2)
        end
  end

  @testset "fecho" begin
        let n = 7, g = completo(n)
          @test seqGraus(fecho(g)) == seqGraus(g)
        end
        let n = 8, g = ciclo(n)
            [nova_aresta!(g,(1,v)) for v in 3:n if v % 2 == 1]
            @test fecho(g) == g
        end

        let n = 8, k = 4, g = regular(n, k)
          @test seqGraus(fecho(g)) == seqGraus(completo(n))
        end

        let n = 8, g = caminho(n)
          @test seqGraus(fecho(g)) == seqGraus(g)
        end

        let n = 8, g = estrela(n)
          @test seqGraus(fecho(g)) == seqGraus(g)
        end
  end

  @testset "buscaLargura" begin
        let n = 7, g = completo(n)
          @test sort(buscaLargura(g)) == collect(1:n)
        end

        let n = 8, g = caminho(n)
          @test buscaLargura(g) == collect(1:n)
        end

        let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
          @test buscaLargura(g) == collect(1:n)
        end

        let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3),(4,5), (4,6), (7,8)])
          @test buscaLargura(g) != collect(1:n)
        end
  end


  @testset "buscaProfundidade" begin
        let n = 7, g = completo(n)
          @test sort(buscaProfundidade(g)) == collect(1:n)
        end

        let n = 8, g = caminho(n)
          @test buscaProfundidade(g) == collect(1:n)
        end

        let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
           @test buscaProfundidade(g) == [1,2,4,5,3,6,7]
        end

        let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3),(4,5), (4,6), (7,8)])
           @test buscaProfundidade(g) == collect(1:n)
        end
  end


  @testset "menorCaminho" begin
        let n = 7, g = completo(n), u = 2, v = n
          @test (menorCaminho(g, u, v)) == [u,v]
        end

        let n = 8, g = caminho(n), u = 1, v = 8
          @test (menorCaminho(g, u, v)) == collect(1:n)
        end

        let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]),
            u = 1, v = 4
          @test (menorCaminho(g, u, v)) ==  [1,2,4]
        end

        let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3),(4,5), (4,6), (7,8)]),
            u = 3, v = 8
          @test (menorCaminho(g, u, v)) == [3,2,1,7,8]
       end
  end


  @testset "dijkstra" begin
        let n = 7, g = completo(n), u = 1
          @test (dijkstra(g, u)) ==  (pushfirst!(fill(1,n-1),0), fill(1,n))
        end

        let n = 8, g = caminho(n), u = 1
          @test dijkstra(g, u) == (pushfirst!(collect(1:n-1), 0), 
                                   pushfirst!(collect(1:n-1), 1))
        end

        let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]),
            u = 1
          @test dijkstra(g, u) == ([0,1,1,2,2,2,2],[1,1,1,2,2,3,3])
        end

        let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8)]),
            u = 1
          @test dijkstra(g, u) == ([0,1,2,1,2,2,1,2], [1,1,2,1,4,4,1,7])
       end
  end


  @testset "éConexo" begin
        let n = 7, g = completo(n)
          @test éConexo(g) == true
        end

        let n = 8, g = caminho(n)
          @test éConexo(g) == true
        end

        let n = 5, g = vazio(n)
          @test éConexo(g) == false

        end
        let n = 8, g = petersen()
          @test éConexo(g) == true
        end

        let n = 8, g = ciclo(n)
            for uv in [(2,3), (5,6)]
               remove_aresta!(g,uv)
            end
            @test éConexo(g) == false
        end
  end


  @testset "numCompConexas" begin
        let n = 7, g = completo(n)
          @test numCompConexas(g) == 1
        end

        let n = 8, g = caminho(n)
          @test numCompConexas(g) == 1
        end

        let n = 5, g = vazio(n)
          @test numCompConexas(g) == n

        end
        let n = 8, g = petersen()
          @test numCompConexas(g) == 1
        end

        let n = 8, g = ciclo(n)
            for uv in [(2,3), (5,6)]
               remove_aresta!(g,uv)
            end
            @test numCompConexas(g) == 2
        end
  end

  @testset "ciclo" begin
        let n = 7, g = completo(n), u = 1
          @test (éCiclo(g, ciclo(g, u))) == true
        end

        let n = 8, g = caminho(n), u = 1
          @test (ciclo(g, u)) == []
        end

        let n = 5, g = vazio(n), u = 1
          @test (ciclo(g, u)) == []
        end
        let g = petersen(), u = 1
          @test éCiclo(g, ciclo(g, u)) == true
        end

        let n = 8, g = ciclo(n), u = 1
          @test éCiclo(g, ciclo(g, u)) == true
       end
  end


  @testset "distância" begin
        let n = 7, g = completo(n), u = 2, v = n
          @test (distância(g, u, v)) == 1
        end

        let n = 8, g = caminho(n), u = 1, v = 8
          @test (distância(g, u, v)) == (n-1)
        end

        let n = 7, g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]),
            u = 1, v = 4
          @test (distância(g, u, v)) == 2
        end

        let n = 8, g = Grafo([(1,2), (1,4), (1,7), (2,3), (4,5), (4,6), (7,8)]),
            u = 3, v = 8
          @test (distância(g, u, v)) == 4
       end
  end

  @testset "excentricidade" begin
        let n = 7, g = completo(n), u = 1
          @test (excentricidade(g, u)) == 1
        end

        let n = 8, g = caminho(n), u = 1
          @test (excentricidade(g, u)) == (n-1)
        end

        let n = 5, g = vazio(n), u = 1
          @test (excentricidade(g, u)) == 0
        end
        let g = petersen(), u = 1
          @test (excentricidade(g, u)) == 2
        end

        let n = 9, g = ciclo(n), u = 1
          @test (excentricidade(g, u)) == div(n,2)
       end
  end

  @testset "raio" begin
        let n = 7, g = completo(n)
          @test raio(g) == 1
        end

        let n = 8, g = caminho(n)
          @test raio(g) == div(n, 2)
        end

        let n = 5, g = vazio(n)
          @test raio(g) == 0
        end

        let g = petersen()
          @test raio(g) == 2
        end

        let n = 9, g = ciclo(n)
          @test raio(g) == div(n, 2)
       end
  end

  @testset "diâmetro" begin
        let n = 7, g = completo(n)
          @test diâmetro(g) == 1
        end

        let n = 7, g = caminho(n)
          @test diâmetro(g) == (n-1)
        end

        let n = 5, g = vazio(n)
          @test diâmetro(g) == 0
        end
        let g = petersen()
          @test diâmetro(g) == 2
        end

        let g = Grafo([(1,2), (2,3), (2,4), (2,5), (4,6), (5,7)])
           @test diâmetro(g) == 4
        end
  end

  @testset "centro" begin
        let n = 7, g = completo(n)
          @test centro(g) == collect(1:n)
        end

        let n = 7, g = caminho(n)
          @test centro(g) ==
              (if n % 2 == 1
                  [div(n+1, 2)]
               else
                   let c1 = div(n, 2), c2 = c1 + 1
                       [c1,c2]
                   end
               end)
        end

        let n = 5, g = vazio(n)
          @test centro(g) == collect(1:n)
        end

        let g = petersen()
          @test centro(g) == collect(1:10)
        end

        let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
           @test centro(g) == [1]
       end
  end


  @testset "éArticulação" begin
        let n = 7, g = completo(n), u = 3
          @test (éArticulação(g, u)) == false
        end

        let n = 7, g = caminho(n), u = 4
          @test (éArticulação(g, u)) == true
        end

        let n = 5, g = ciclo(n), u = 3
          @test (éArticulação(g, u)) == false

        end

        let g = petersen(), u = 3
          @test (éArticulação(g, u)) == false
        end

        let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
      u = 3
          @test (éArticulação(g, u)) == true
       end
  end

  @testset "éPonte" begin
        let n = 7, g = completo(n), u = 3, v = 4
          @test (éPonte(g, (u,v))) == false
        end

        let n = 7, g = caminho(n), u = 3, v = 4
          @test (éPonte(g, (u,v))) == true
        end

        let n = 5, g = ciclo(n), u = 3, v = 4
          @test (éPonte(g, (u,v))) == false
        end

        let g = petersen(), u = 3, v = 4
          @test (éPonte(g, (u,v))) == false
        end

        let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]),
            u = 1, v = 3
          @test (éPonte(g, (u,v))) == true
       end
  end


  @testset "conectividade" begin
        let n = 7, g = completo(n)
          @test conectividade(g) == (n-1)
        end

        let n = 7, g = caminho(n)
          @test conectividade(g) == 1
        end

        let n = 5, g = ciclo(n)
          @test conectividade(g) == 2

        end
        let g = petersen()
          @test conectividade(g) == 3
        end

        let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
           @test conectividade(g) == 1
       end
  end

  @testset "éBiconexo" begin
        let n = 7, g = completo(n)
          @test éBiconexo(g) == true
        end

        let n = 7, g = caminho(n)
          @test éBiconexo(g) == false
        end

        let n = 5, g = ciclo(n)
          @test éBiconexo(g) == true

        end

        let g = petersen()
          @test éBiconexo(g) == true
        end

        let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)])
           @test éBiconexo(g) == false
       end
  end

  @testset "sãoCaminhosDisjVértices" begin
        let n = 8, g = completo(n), c1 = [1,2,3,4], c2 = [1,5,6,4]
          @test (sãoCaminhosDisjVértices(g, c1, c2)) == true
        end

        let n = 7, g = caminho(n), c1 = [1,2,3,4,5], c2 = [1,2,3,4]
          @test (sãoCaminhosDisjVértices(g, c1, c2)) == false
        end

        let n = 10, g = ciclo(n), c1 = [1,2,3,4,5,6], c2 = [1,10,9,8,7,6]
          @test (sãoCaminhosDisjVértices(g, c1, c2)) == true

        end

        let g = petersen(), c1 = [1,2,3,4], c2 = [1,3,7,4]
          @test (sãoCaminhosDisjVértices(g, c1, c2)) == false
        end

        let g = Grafo([(1,2), (1,3), (2,4), (2,5), (3,6), (3,7)]), c1 = [], c2 = []
          @test (sãoCaminhosDisjVértices(g, c1, c2)) == false
       end
  end

  @testset "trilhaEulerFleury" begin
        let n = 5, g = estrela(n)
          @test trilhaEulerFleury(g) == []
        end

        let n = 4, g = ciclo(n)
          @test length(trilhaEulerFleury(g)) == (n+1)
        end

        let n = 5, g = completo(n)
          @test length(trilhaEulerFleury(g)) == (narestas(g) + 1)
        end

        let n = 6, g = completo(n)
          @test trilhaEulerFleury(g) == []
        end

        let n = 6, g = roda(n)
          @test trilhaEulerFleury(g) == []
        end

        let n = 6, k = 3, g = regular(n, k)
          @test trilhaEulerFleury(g) == []
        end

        let n = 6, k = 4, g = regular(n, k)
          @test length(trilhaEulerFleury(g)) == (narestas(g) + 1)
       end
  end


  @testset "trilhaEulerHierholzer" begin
        let n = 5, g = estrela(n)
          @test trilhaEulerHierholzer(g) == []
        end

        let n = 4, g = ciclo(n)
          @test length(trilhaEulerHierholzer(g)) == (n+1)
        end

        let n = 5, g = completo(n)
          @test length(trilhaEulerHierholzer(g)) == (narestas(g) + 1)
        end

        let n = 6, g = completo(n)
          @test trilhaEulerHierholzer(g) == []
        end

        let n = 6, g = roda(n)
          @test trilhaEulerHierholzer(g) == []
        end

        let n = 6, k = 3, g = regular(n, k)
          @test trilhaEulerHierholzer(g) == []
        end

        let n = 6, k = 4, g = regular(n, k)
          @test length(trilhaEulerHierholzer(g)) == (narestas(g) + 1)
       end
  end
end
