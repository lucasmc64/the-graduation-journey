export emProfundidade, encontraCiclo, ciclos, encontraMenor, articulações,
  blocos, pontes, éEmparelhamento, éMaximal, éPerfeito, éCaminhoAlternante,
  éCaminhoAumentador, máximo, éDesconectador, éSeparador

"""
    emProfundidade(g,v)

recebe um grafo `g` e um vértice `v` desse grafo e realiza uma busca em
profundidade usando o algoritmo da segunda versão. O algoritmo deve devolver
três vetores: `pai` contendo os pais de cada vértice na árvore de busca, `td`
com os tempos de descoberta e `tf` com os tempos de finalização dos vértices na
busca. A busca deve funcionar também para grafos desconexos.
"""

# emProfundidade(g, v) = ([], [], [])

function emProfundidade(g, v)
  return ([], [], [])
end

"""
    encontraCiclo(pai,u,v)

recebe o vetor `pai` do exercício anterior e dois vértices `u` e `v` que são os 
vértices de uma aresta de retorno e devolve um ciclo iniciando em `u`.
"""
encontraCiclo(pai, u, v) = [-1]



"""
    ciclos(g,v)

recebe um grafo `g` e um vértice `v` desse grafo e devolve uma lista com 
todos os ciclos de `g`. Utilize uma versão modificada de `
emProfundidade`.
"""
ciclos(g, v) = [[]]



"""
    encontraMenor(g,v)

recebe um grafo `g` e um vértice `v` desse grafo e realiza uma busca em 
profundidade em `g`. O algoritmo deve devolver quatro vetores: `pai` contendo os 
pais de cada vértice na árvore de busca, `td` com os tempos de descoberta, `tf` 
com os tempos de finalização dos vértices na busca e `menor` contendo os menores 
calculados para cada vértice. O algoritmo deve funcionar também para grafos 
desconexos.
"""
encontraMenor(g, v) = ([], [], [], [])



"""
    articulações(g)

recebe um grafo `g` e devolve uma lista com \emph{todos} os vértices de 
articulação de `g`. Utilize uma versão modificada de `encontraMenor`.
"""
articulações(g) = [-1]



"""
    blocos(g)

recebe um grafo `g` e devolve uma lista com \emph{todos} os blocos de `g`, cada 
bloco será uma lista de arestas. Utilize uma versão modificada de `
encontraMenor`.
"""
blocos(g) = [[]]



"""
    pontes(g)

recebe um grafo `g` e devolve uma lista com \emph{todas} as pontes de `g`, cada 
ponte é uma aresta. Utilize uma versão modificada de `encontraMenor`.
"""
pontes(g) = []



"""
    éEmparelhamento(g,m)

verifica se `m`, uma lista de arestas, é um emparelhamento para o grafo `g`.
"""

# éEmparelhamento(g,m) = rand(Bool)

function éEmparelhamento(g::Grafo, m::Array{Tuple{Int,Int}})::Bool
  if sum(map(a -> é_aresta(g, a), m)) != length(m) || length(m) > nvértices(g) / 2
    return false
  end

  vs = []

  for a in m
    push!(vs, a[1])
    push!(vs, a[2])
  end

  return sum(map(v -> length(findall(w -> w == v, vs)) == 1, vs)) == length(vs)
end

"""
    éMaximal(g,m)

verifica se `m`, uma lista de arestas, é um emparelhamento \emph{maximal} para o 
grafo `g`.
"""

# éMaximal(g, m) = rand(Bool)

function éMaximal(g::Grafo, m::Array{Tuple{Int,Int}})::Bool
  if !éEmparelhamento(g, m)
    return false
  end

  ar = filter(a -> !((a[1], a[2]) in m) && !((a[2], a[1]) in m), arestas(g))

  vs = []

  for a in m
    push!(vs, a[1])
    push!(vs, a[2])
  end

  return sum(map(a -> !(a[1] in vs) && !(a[2] in vs), ar)) == 0
end

"""
    éPerfeito(g,m)

verifica se `m`, uma lista de arestas, é um emparelhamento \emph{perfeito} para 
o grafo `g`.
"""

# éPerfeito(g, m) = rand(Bool)

function éPerfeito(g::Grafo, m::Array{Tuple{Int,Int}})::Bool
  return éMaximal(g, m) && length(m) == nvértices(g) / 2
end

"""
    éCaminhoAlternante(g,m,c)

verifica se o caminho `c` é alternante em relação ao emparelhamento `m` para o 
grafo `g`.
"""

# éCaminhoAlternante(g, m, c) = rand(Bool)

function verificarAresta(v1::Int, v2::Int, m::Array{Tuple{Int,Int}})
  return ((v1, v2) in m || (v2, v1) in m)
end

function éCaminhoAlternante(g::Grafo, m::Array{Tuple{Int,Int}}, c::Array{Int})::Bool
  d = verificarAresta(c[1], c[2], m) ? 0 : 1
  r = verificarAresta(c[1], c[2], m) != verificarAresta(c[end-1], c[end], m)

  if r
    for i in 2:length(c)
      if i % 2 == d
        r = r && verificarAresta(c[i], c[i-1], m)
      else
        r = r && !verificarAresta(c[i], c[i-1], m)
      end

      if !r
        break
      end
    end
  end

  return r
end

"""
    éCaminhoAumentador(g,m,c)

verifica se o caminho `c` é aumentador em relação ao emparelhamento `m` para o 
grafo `g`.
"""

# éCaminhoAumentador(g, m, c) = rand(Bool)

function éCaminhoAumentador(g::Grafo, m::Array{Tuple{Int,Int}}, c::Array{Int})::Bool
  return éCaminhoAlternante(g, m, c[2:end]) && verificarAresta(c[1], c[2], m) == false && verificarAresta(c[end-1], c[end], m) == false
end

"""
    máximo(g)

devolve um emparelhamento perfeito para o grafo `g`, se ele existir, ou um 
emparelhamento máximo para `g`, em caso contrário.
"""

# máximo(g) = []

function máximo(g::Grafo)::Array{Tuple{Int,Int}}
  e::Array{Tuple{Int,Int}} = []
  f = vértices(g)

  graus_g = seqGraus(g)

  for i in (graus_g[1]):(graus_g[end])
    vs_grau_i = filter(v -> grau(g, v) == i, f)

    for v in vs_grau_i
      for w in vizinhos(g, v)
        if length(findall(a -> a[1] == v || a[1] == w || a[2] == v || a[2] == w, e)) == 0
          push!(e, (v, w))
        end
      end
    end
  end

  return e
end

"""
    éDesconectador(g,v,w,as)

verifica se a lista `as` de arestas é um subconjunto vw-desconectador no grafo 
conexo `g`.
"""

# éDesconectador(g, v, w, as) = rand(Bool)

function éDesconectador(g::Grafo, v::Int, w::Int, as::Array{Tuple{Int,Int}})::Bool
  ng = cópia(g)

  for a in as
    if é_aresta(ng, a)
      remove_aresta!(ng, a)
    end
  end

  mc = menorCaminho(ng, v, w)

  return length(mc) == 0
end

"""
    éSeparador(g,v,w,vs)

verifica se a lista `vs` de vértices é um subconjunto vw-separador no grafo 
conexo `g`.
"""

# éSeparador(g, v, w, vs) = rand(Bool)

function éSeparador(g::Grafo, v::Int, w::Int, vs::Array{Int})::Bool
  a::Array{Tuple{Int,Int}} = []

  for x in vs
    for y in vizinhos(g, x)
      if !((x, y) in a) && !((y, x) in a)
        push!(a, (x, y))
      end
    end
  end

  return éDesconectador(g, v, w, a)
end

