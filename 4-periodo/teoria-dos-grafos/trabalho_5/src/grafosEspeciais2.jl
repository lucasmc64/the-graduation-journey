export kneser, bipartidoCompleto, grafoAleatório,
  bipartidoAleatório, grafoArestas, regular

#=
        Aluno: Lucas Marçal Coutinho
    Matrícula: 11911BCC012
  Bibliotecas: Combinatorics
=#

using Combinatorics

""""
    kneser(n, k)

Devolve o grafo de Kneser K(n,k).
Veja o exercício E 1.16 do livro do Paulo Feofiloff.
"""

# kneser(n::Int, k::Int)::Grafo = nulo()

function kneser(n::Int, k::Int)::Grafo
  c = collect(Combinatorics.combinations(1:n, k))
  g = vazio(length(c))

  for i in 1:length(c)
    for j in 1:length(c)
      if sum(in(c[i]), (c[j])) == 0
        nova_aresta!(g, (i, j))
      end
    end
  end

  return g
end

"""
   regular n k
 
Devolve um grafo `k`-regular com `n` vértices ou o erro `Grafo regular inexistente`,
caso isso não seja possível.
"""

# function regular(n::Int, k::Int)::Grafo
#    if true
#       nulo()
#    else
#       error("Grafo regular inexistente")
#    end
# end

function regular(n::Int, k::Int)::Grafo
  if !(k < n && (n % 2 == 0 || k % 2 == 0))
    error("Grafo regular inexistente")
  end

  g = vazio(n)

  for i in 1:n
    while grau(g, i) < k
      a = (i, rand(1:n))

      if a[1] != a[2] && grau(g, a[2]) == seqGraus(g)[1] && !é_aresta(g, a)
        nova_aresta!(g, a)
      end
    end
  end

  return g
end

""""
    bipartidoCompleto(p, q)

Recebe dois naturais positivos e devolve um grafo bipartido completo K_{p,q}
com `p` vértices, 1, ...,p na primeira partição e  `q` vértices p+1, ..., p + q,
na segunda partição.
"""

# bipartidoCompleto(p::Int, q::Int)::Grafo = nulo()

function bipartidoCompleto(p::Int, q::Int)::Grafo
  g = vazio(p + q)

  for i in 1:p
    for j in (p+1):(p+q)
      nova_aresta!(g, (i, j))
    end
  end

  return g
end

"""
   grafoAleatório(n, m)

Cria um grafo com `n` vértices 1, ..., n e com exatamente `m` arestas. As
extremidades das arestas devem ser escolhidas aleatoriamente e a função deve
evitar criar grafos que não sejam simples, ou seja, não pode haver laços nem
arestas paralelas. Se `m` ultrapassar o limite máximo de arestas para um grafo
simples com `n` vértices, a função deve gerar o grafo completo.
"""

# grafoAleatório(n::Int, m::Int)::Grafo = nulo()

function grafoAleatório(n::Int, m::Int)::Grafo
  g = vazio(n)

  while narestas(g) != m && narestas(g) < (n - 1) * n / 2
    a = (rand(1:n), rand(1:n))

    if !é_aresta(g, a) && a[1] != a[2]
      nova_aresta!(g, a)
    end
  end

  return g
end

"""
   bipartidoAleatório(p, q, m)

Cria um grafo bipartido com `p` vértices 1, ..., p, na primeira partição,
`q` vértices p+1, ..., p+q, na segunda partição e exatamente `m` arestas. As
extremidades das arestas devem ser escolhidas aleatoriamente e a função deve
evitar criar grafos que não sejam simples, ou seja, não pode haver laços nem
arestas paralelas. Se `m` ultrapassar o limite máximo de arestas de um grafo
bipartido simples com p+q vértices, a função deve gerar o grafo bipartido
completo.
"""

# bipartidoAleatório(p::Int, q::Int, m::Int)::Grafo = nulo()

function bipartidoAleatório(p::Int, q::Int, m::Int)::Grafo
  g = vazio(p + q)

  while narestas(g) != m && narestas(g) < p * q
    a = (rand(1:p), rand((p+1):(p+q)))

    if !é_aresta(g, a)
      nova_aresta!(g, a)
    end
  end

  return g
end

"""
   grafoArestas(g)

Recebe um grafo `g` e devolve o grafo de arestas de g.
Veja o exercício E 1.24 do livro do Paulo Feofiloff.
"""

# grafoArestas(g::Grafo)::Grafo = nulo()

function grafoArestas(g::Grafo)::Grafo
  a = arestas(g)
  ng = vazio(length(a))

  for i in 1:length(a)
    for j in (i+1):length(a)
      if a[i][1] == a[j][1] || a[i][2] == a[j][1] || a[i][1] == a[j][2] || a[i][2] == a[j][2]
        nova_aresta!(ng, (i, j))
      end
    end
  end

  return ng
end
