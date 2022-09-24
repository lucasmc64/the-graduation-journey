@testset "Trabalho 6" begin

  @testset "emProfundidade" begin
  let n = 7,
      g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4), (3,5), (4,5), (5,6), (5,7), (6,7)]),
      v = 5
    @test emProfundidade(g,v) == ([3,1,5,2,5,5,6], [3,4,2,5,1,10,11], [8,7,9,6,14,13,12])
  end
  end


  @testset "encontraCiclo" begin
  let n = 7,
      g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4), (3,5), (4,5), (5,6), (5,7), (6,7)]),
      pai = [3,1,5,2,5,5,6],
      u = 4,
      v = 5
    @test sort(encontraCiclo(pai,u,v)) == [1,2,3,4,4,5]
  end
  end


  @testset "ciclos" begin
  let n = 7,
      g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4), (3,5), (4,5), (5,6), (5,7), (6,7)]),
      pai = [3,1,5,2,5,5,6],
      v = 5
    @test length(ciclos(g,v)) == 4
  end
  end


  @testset "encontraMenor" begin
  let n = 7,
      g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4), (3,5), (4,5), (5,6), (5,7), (6,7)]),
      v = 5
    @test encontraMenor(g,v) == ([3,1,5,2,5,5,6], [3,4,2,5,1,10,11],
                                [8,7,9,6,14,13,12], [2,2,2,2,1,1,1])
  end
  end


  @testset "articulações" begin
  let n = 7,
      g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4), (3,5),(4,5), (5,6), (5,7), (6,7)]),
      v = 5
    @test sort(articulações(g)) == [3,5]
  end
  end


  @testset "blocos" begin
  let n = 7,
      g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4), (3,5), (4,5), (5,6), (5,7), (6,7)]),
      v = 5
    @test map(sort, blocos(g)) == [[(3,5)],
                                  [(1,2), (1,3), (1,4), (2,4), (3,4)],
                                  [(5,6),(5,7), (6,7)]]
  end
  end


  @testset "pontes" begin
  let n = 7,
      g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4), (3,5), (4,5), (5,6), (5,7), (6,7)]),
      v = 5
    @test sort(pontes(g)) ==[(3,5)]
  end
  end


  @testset "éEmparelhamento" begin
  let g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4)])
    @test éEmparelhamento(g,[(2,3)]) == true
    @test éEmparelhamento(g,[(1,2),(3,4)]) == true
    @test éEmparelhamento(g,[(1,3),(2,4)]) == true
    @test éEmparelhamento(g,[(1,3),(2,3)]) == false
    @test éEmparelhamento(g,[(1,4)]) == false
  end
  let g = Grafo([(1,2), (1,5), (2,3), (3,5), (4,5), (4,7),
                 (5,6), (5,7), (5,8), (1,4), (2,5), (3,6), (7,8)])
    @test éEmparelhamento(g, [(1,4),(2,5),(3,6),(7,8)]) == true
  end
  end


  @testset "éMaximal" begin
  let g = Grafo([(1,2), (1,3), (2,3), (2,4), (3,4)])
    @test éMaximal(g,[(2,3)]) == true
    @test éMaximal(g,[(1,2),(3,4)]) == true
    @test éMaximal(g,[(1,3),(2,4)]) == true
    @test éMaximal(g,[(1,3),(2,3)]) == false
    @test éMaximal(g,[(1,4)]) == false
  end
  let g = Grafo([(1,2), (1,5), (2,3), (3,5), (4,5), (4,7),
                 (5,6), (5,7), (5,8), (1,4), (2,5), (3,6), (7,8)])
    @test éMaximal(g, [(1,4),(2,5),(3,6),(7,8)]) == true
    @test éMaximal(g, [(1,4),(2,5),(3,6)]) == false
  end
  end


  @testset "éPerfeito" begin
  let g = Grafo([(1,2), (1,5), (2,3), (3,5), (4,5), (4,7),
                 (5,6), (5,7), (5,8), (1,4), (2,5), (3,6), (7,8)])
    @test éPerfeito(g, [(1,4),(2,5),(3,6),(7,8)]) == true
    @test éPerfeito(g, [(1,4),(2,5),(3,6)]) == false
  end
  end


  @testset "éCaminhoAlternante" begin
  let g = Grafo([(1,2), (1,6), (2,3), (2,6), (3,4), (3,5), (4,5), (5,6)])
    @test éCaminhoAlternante(g, [(1,6),(2,3)], [6,1,2,3,4]) == true
    @test éCaminhoAlternante(g, [(1,6),(2,3)], [6,1,2,3]) == false
  end
  end


  @testset "éCaminhoAumentador" begin
  let g = Grafo([(1,2), (1,6), (2,3), (2,6), (3,4), (3,5), (4,5), (5,6)])
    @test éCaminhoAumentador(g, [(1,6),(2,3)], [5,6,1,2,3,4]) == true
    @test éCaminhoAumentador(g, [(1,6),(2,3)], [5,6,1,2,3]) == false
  end
  end


  @testset "máximo" begin
  let g = Grafo([(1,2), (1,5), (2,3), (3,5), (4,5), (4,7),
                 (5,6), (5,7), (5,8), (1,4), (2,5), (3,6), (7,8)])
    @test sort(máximo(g)) == [(1,4),(2,5),(3,6),(7,8)]
  end
  let g = Grafo([(1,6), (1,7), (1,8), (2,6), (2,9), (2,10),
                 (3,6), (3,7), (4,8), (4,9), (4,10), (5,6)])
    @test sort(máximo(g)) == [(1,8),(2,9),(3,7),(4,10),(5,6)]
  end
  end


  @testset "éDesconectador" begin
  let g = Grafo([(5,9), (7,8), (8,9), (9,10), (2,3), (3,4), (1,3), (5,8),
                 (1,3), (3,6), (1,2), (5,7), (1,4), (1,6), (2,5), (3,5),
                 (6,9), (6,10), (7,11), (8,11), (10,11), (9,11)])
     @test éDesconectador(g, 1, 11, [(2,5), (3,5), (6,9), (6,10)]) == true
     @test éDesconectador(g, 1, 11, [(2,5), (3,5)]) == false
     @test éDesconectador(g, 1, 11, [(7,11), (8,11), (9,11), (10,11)]) == true
     @test éDesconectador(g, 1, 11, [(7,11), (9,11), (10,11)]) == false
  end
  end


  @testset "éSeparador" begin
  let g = Grafo([(5,9), (7,8), (8,9), (9,10), (2,3), (3,4), (1,3), (5,8),
                 (1,3), (3,6), (1,2), (5,7), (1,4), (1,6), (2,5), (3,5),
                 (6,9), (6,10), (7,11), (8,11), (10,11), (9,11)])
     @test éSeparador(g, 1, 11, [5,6]) == true
     @test éSeparador(g, 1, 11, [5,8]) == false
     @test éSeparador(g, 1, 11, [2, 3, 9, 10]) == true
     @test éSeparador(g, 1, 11, [2, 3, 10]) == false
  end
  end

end
