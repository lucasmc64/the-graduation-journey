using Grafos

using Test

const testdir = dirname(@__FILE__)

# Descomente o trecho abaixo se você não quiser ver o StackTrace

#=
Test.eval(quote
              function record(ts::DefaultTestSet, t::Union{Fail, Error})
                  push!(ts.results, t)
              end
          end)
=#

testes = [
    # "utilidades",
    # "listaadjacência",
    # "matrizadjacência",
    # "grafosespeciais",
    # "grafosespeciais2",
    # "grafos3testes",
    "grafos4testes"
]

@testset "Grafos" begin
    for t in testes
        ct = joinpath(testdir, "$(t).jl")
        include(ct)
    end
end

