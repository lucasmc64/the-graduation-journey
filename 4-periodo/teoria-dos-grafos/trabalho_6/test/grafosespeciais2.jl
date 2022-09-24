using Grafos

@testset "Grafos Especiais 2" begin
    @testset "kneser" begin
        @test seqGraus(kneser(5,2)) == [3,3,3,3,3,3,3,3,3,3]
        @test seqGraus(kneser(6,1)) == [5,5,5,5,5,5]
        @test nvértices(kneser(7,3)) == 35
        @test narestas(kneser(7,3)) == 70
        @test narestas(kneser(8,3)) == 280
    end

    @testset "regular" begin
        @test seqGraus(regular(6,0)) == [0,0,0,0,0,0]
        @test seqGraus(regular(6,1)) == [1,1,1,1,1,1]
        @test nvértices(regular(7,2)) == 7
        @test_throws ErrorException("Grafo regular inexistente") regular(7,3)
        @test_throws ErrorException("Grafo regular inexistente") regular(9,5)
        @test_throws ErrorException("Grafo regular inexistente") regular(10,10)
        @test_throws ErrorException("Grafo regular inexistente") regular(15,15)
        @test narestas(regular(7,4)) == 14
        @test narestas(regular(8,3)) == 12
        @test narestas(regular(10,5)) == 25
    end

    @testset "bipartidoCompleto" begin
        @test seqGraus(bipartidoCompleto(1, 3)) == [1,1,1,3]
        @test seqGraus(bipartidoCompleto(3, 3)) == [3,3,3,3,3,3]
        @test adjacente(bipartidoCompleto(4, 6), 2, 4) == false
        @test adjacente(bipartidoCompleto(4, 6), 7, 10) == false
        @test adjacente(bipartidoCompleto(4, 6), 3, 8) == true
        @test nvértices(bipartidoCompleto(5, 8)) == 13
        @test narestas(bipartidoCompleto(5, 9)) == 45
        @test narestas(bipartidoCompleto(9, 8)) == 72
    end

    @testset "grafoAleatório" begin
        @test nvértices(grafoAleatório(5,9))  == 5
        @test narestas(grafoAleatório(5,9))   == 9
        @test nvértices(grafoAleatório(7,10)) == 7
        @test narestas(grafoAleatório(7,10))  == 10
        @test nvértices(grafoAleatório(8,20)) == 8
        @test narestas(grafoAleatório(8,20))  == 20
        @test nvértices(grafoAleatório(10,40)) == 10
        @test narestas(grafoAleatório(10,40))  == 40
        @test nvértices(grafoAleatório(10,90)) == 10
        @test narestas(grafoAleatório(10,90))  == 45
        @test seqGraus(grafoAleatório(30,20)) != seqGraus(grafoAleatório(30,20))
    end

    @testset "bipartidoAleatório" begin
        @test nvértices(bipartidoAleatório(5,9,10))  == 14
        @test narestas(bipartidoAleatório(5,9,10))   == 10
        @test nvértices(bipartidoAleatório(7,10,16)) == 17
        @test narestas(bipartidoAleatório(7,10,16))  == 16
        @test nvértices(bipartidoAleatório(8,20,18)) == 28
        @test narestas(bipartidoAleatório(8,20,18))  == 18
        @test nvértices(bipartidoAleatório(10,40,20)) == 50
        @test narestas(bipartidoAleatório(10,40,20))  == 20
        @test nvértices(bipartidoAleatório(10,50,1000)) == 60
        @test narestas(bipartidoAleatório(10,50,1000))  == 500
        @test seqGraus(bipartidoAleatório(30,20,30)) != seqGraus(bipartidoAleatório(30,20,30))
    end


    @testset "grafoArestas" begin
        @test seqGraus(grafoArestas(Grafo([(1,2), (1,3), (1,4), (2,5), (3,4), (4,5)]))) == [2,3,3,3,3,4]
        @test seqGraus(grafoArestas(Grafo([(1,2), (1,4), (2,3), (2,4), (3,4)]))) == [3,3,3,3,4]
        @test seqGraus(grafoArestas(Grafo([(1,2), (2,3), (2,4), (4,5)]))) == [1,2,2,3]
        @test seqGraus(grafoArestas(Grafo([(1,2), (1,5), (2,3),
                                           (2,4), (2,5), (3,5), (4,5)]))) == [4,4,4,4,4,4,6]
        @test seqGraus(grafoArestas(Grafo([(1,4), (1,5), (1,6),
                                           (2,4), (2,5), (2,6),
                                           (3,4), (3,5), (3,6)]))) == [4,4,4,4,4,4,4,4,4]
    end

end
