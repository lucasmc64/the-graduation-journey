export grafoComplemento,
  união,
  interseção,
  fecho,
  buscaLargura,
  buscaProfundidade,
  menorCaminho,
  dijkstra,
  éConexo,
  numCompConexas,
  ciclo,
  distância,
  excentricidade,
  raio,
  diâmetro,
  centro,
  éArticulação,
  éPonte,
  conectividade,
  éBiconexo,
  sãoCaminhosDisjVértices,
  trilhaEulerFleury,
  trilhaEulerHierholzer


"""
   grafoComplemento(g)

devolve um grafo que é o complemento de um grafo `g`.
"""

# grafoComplemento(g::Grafo)::Grafo = vazio(1)

function grafoComplemento(g::Grafo)::Grafo
  complemento = completo(nvértices(g))

  for aresta in arestas(g)
    remove_aresta!(complemento, aresta)
  end

  return complemento
end

"""
   união(g, h)

devolve um grafo que é a união dos grafos `g` e `h`.
"""

# união(g::Grafo, h::Grafo)::Grafo = vazio(1)

function união(g::Grafo, h::Grafo)::Grafo
  nvg = nvértices(g)
  nvh = nvértices(h)

  maiorGrafo = nvg > nvh ? g : h
  menorGrafo = nvg <= nvh ? g : h

  grafoUnido = cópia(maiorGrafo)

  for aresta in arestas(menorGrafo)
    if !é_aresta(grafoUnido, aresta)
      nova_aresta!(grafoUnido, aresta)
    end
  end

  return grafoUnido
end

"""
   interseção(g, h)

devolve um grafo que é a interseção dos grafos `g` e `h`.
"""

# interseção(g::Grafo, h::Grafo)::Grafo = vazio(1)

function interseção(g::Grafo, h::Grafo)::Grafo
  nvg = nvértices(g)
  nvh = nvértices(h)

  maiorGrafo = nvg > nvh ? g : h
  menorGrafo = nvg <= nvh ? g : h

  grafoComum = vazio(nvértices(menorGrafo))

  for aresta in arestas(menorGrafo)
    if é_aresta(maiorGrafo, aresta)
      nova_aresta!(grafoComum, aresta)
    end
  end

  return grafoComum
end

"""
   fecho(g)

devolve um grafo que é o fecho do grafo `g`.
"""

# fecho(g::Grafo)::Grafo = vazio(1)

function fecho(g::Grafo)::Grafo
  h = cópia(g)

  function condicao(w::Int, v::Int, h::Grafo)
    return w != v && !é_aresta(h, (w, v)) && grau(h, w) + grau(h, v) >= nvértices(h)
  end

  if nvértices(h) > 1
    while length(
      findall(
        v -> length(
          findall(
            w -> condicao(w, v, h),
            vértices(h)
          )
        ) > 0,
        vértices(h)
      )
    ) != 0
      for v in vértices(h)
        for w in vértices(h)
          if condicao(w, v, h)
            nova_aresta!(h, (w, v))
          end
        end
      end
    end
  end

  return h
end

"""
   buscaLargura(g)

devolve uma lista de vértices na sequência em que são primeiramente visitados
(marcados) em uma busca em largura no grafo `g`.
"""

# buscaLargura(g::Grafo)::Vector{Int64} = [-1]

function buscaLargura(g::Grafo)::Vector{Int64}
  if nvértices(g) == 1
    return [1]
  end

  vizinhosv1 = vizinhos(g, 1)
  vconectados = [1; vizinhosv1]
  vinexplorados = vizinhosv1

  while length(vinexplorados) !== 0
    vk = popfirst!(vinexplorados)
    vizinhosvk = vizinhos(g, vk)

    for vizinho in vizinhosvk
      if length(findall(v -> v == vizinho, vconectados)) == 0
        push!(vconectados, vizinho)
        push!(vinexplorados, vizinho)
      end
    end
  end

  return vconectados
end

"""
   buscaProfundidade(g)

devolve uma lista de vértices na sequência em que são primeiramente visitados
 (marcados) em uma busca em profundidade no grafo `g`.
"""

# buscaProfundidade(g::Grafo)::Vector{Int64} = [-1]

function buscaProfundidade(g::Grafo)::Vector{Int64}
  if nvértices(g) == 1
    return [1]
  end

  vconectados = [1]
  vinexplorados = vizinhos(g, 1)

  while length(vinexplorados) != 0
    vk = popfirst!(vinexplorados)
    push!(vconectados, vk)
    vizinhosvk = vizinhos(g, vk)

    vinexplorados = [
      filter(v -> length(findall(w -> w == v, vconectados)) == 0, vizinhosvk)
      filter(v -> length(findall(w -> w == v, vizinhosvk)) == 0, vinexplorados)
    ]
  end

  return vconectados
end

"""
   menorCaminho(g, u, v)

devolve uma lista com os vértices no menor caminho em `g` entre os vértices `u` e
 `v`. Adapte a busca em largura e a use para resolver este problema.
"""

# menorCaminho(g::Grafo, u, v)::Vector{Int64} = [-1]

# function menorCaminho(g::Grafo, u::Int, v::Int)::Vector{Int64}
#   if !é_vértice(g, u) || !é_vértice(g, v)
#     return []
#   elseif u == v
#     return [u]
#   end

#   vizinhos_u = copy(vizinhos(g, u))
#   vertices_conectados = map(w -> (u, w), vizinhos_u)
#   vertices_inexplorados = vizinhos_u

#   while length(vertices_inexplorados) != 0
#     w = popfirst!(vertices_inexplorados)
#     vizinhos_w = vizinhos(g, w)

#     for y in vizinhos_w
#       if length(findall(aresta -> aresta[1] == y || aresta[2] == y, vertices_conectados)) == 0
#         push!(vertices_conectados, (w, y))
#         push!(vertices_inexplorados, y)
#       end
#     end
#   end

#   caminho = [v]

#   if length(vertices_conectados) != 0 && length(findfirst(a -> a[2] == v, vertices_conectados)) != 0
#     while last(caminho) != u
#       for (a, b) in vertices_conectados
#         if b == last(caminho)
#           push!(caminho, a)
#           break
#         end
#       end
#     end
#   end

#   return reverse(caminho)
# end

# Pequena modificação para suportar a não existência de caminhos

function menorCaminho(g::Grafo, u::Int, v::Int)::Vector{Int64}
  if !é_vértice(g, u) || !é_vértice(g, v)
    return []
  elseif u == v
    return [u]
  end

  vizinhos_u = copy(vizinhos(g, u))
  vertices_conectados = map(w -> (u, w), vizinhos_u)
  vertices_inexplorados = vizinhos_u

  while length(vertices_inexplorados) != 0
    w = popfirst!(vertices_inexplorados)
    vizinhos_w = vizinhos(g, w)

    for y in vizinhos_w
      if length(findall(aresta -> aresta[1] == y || aresta[2] == y, vertices_conectados)) == 0
        push!(vertices_conectados, (w, y))
        push!(vertices_inexplorados, y)
      end
    end
  end

  caminho = [v]

  index_v = findfirst(a -> a[2] == v, vertices_conectados)

  if index_v === nothing
    return []
  end

  if length(vertices_conectados) != 0 && length(findfirst(a -> a[2] == v, vertices_conectados)) != 0
    while last(caminho) != u
      for (a, b) in vertices_conectados
        if b == last(caminho)
          push!(caminho, a)
          break
        end
      end
    end
  end

  return reverse(caminho)
end

"""
   dijkstra(g, v)

recebe um grafo `g` e um vértice `v` e devolve um par `(d,p)` de vetores contendo
em `d` as menores distâncias de `v` até qualquer outro vértice de `g` e em `p`
os predecessores. Use o algoritmo de Dijkstra.
"""

# dijkstra(g::Grafo, v) = ([-1], [-1])

function dijkstra(g::Grafo, v::Int)
  if !é_vértice(g, v)
    return ([], [])
  end

  d = [0] # Vetor de menores distâncias
  p = [v] # Vetor de antecessor
  e = [v] # Vetor de vértices explorados
  i = [v] # Vetor de vértices inexplorados

  #=
    Dado que esta implementação de representação de Grafos não suporta arestas ponderadas,
    simplificarei o algoritmo de Dijkstra para uma adaptação do algoritmo de busca em largura.
  =#

  while length(i) != 0
    w = popfirst!(i)
    viz_w = vizinhos(g, w)

    for x in viz_w
      if length(findall(y -> y == x, e)) == 0
        push!(p, w)
        push!(d, d[findfirst(z -> z == w, e)] + 1)
        push!(i, x)
        push!(e, x)
      end
    end
  end

  return (d, p)
end

"""
   éConexo(g)

devolve `true` se o grafo `g` é conexo ou |false|, em caso contrário.
"""

# éConexo(g::Grafo) = rand(Bool)

function éConexo(g::Grafo)::Bool
  if nvértices(g) == 1
    return true
  end

  vizinhosv1 = copy(vizinhos(g, 1))
  vconectados = [1; vizinhosv1]
  vinexplorados = vizinhosv1

  while length(vinexplorados) !== 0
    vk = popfirst!(vinexplorados)
    vizinhosvk = vizinhos(g, vk)

    for vizinho in vizinhosvk
      if length(findall(v -> v == vizinho, vconectados)) == 0
        push!(vconectados, vizinho)
        push!(vinexplorados, vizinho)
      end
    end
  end

  return length(vconectados) == nvértices(g)
end

"""
   numCompConexas(g)

devolve um número natural para o número de componentes conexas do grafo `g`.
"""

# numCompConexas(g::Grafo) = -1

function numCompConexas(g::Grafo)::Int
  if nvértices(g) == 0
    return 0
  elseif nvértices(g) == 1
    return 1
  end

  vg = copy(vértices(g))

  vz1 = copy(vizinhos(g, 1))
  vconectados = [1; vz1]
  vinexplorados = vz1

  ncc = 1

  while length(vconectados) != nvértices(g)
    while length(vinexplorados) != 0
      vk = popfirst!(vinexplorados)
      vizinhosvk = vizinhos(g, vk)

      for vizinho in vizinhosvk
        if length(findall(v -> v == vizinho, vconectados)) == 0
          push!(vconectados, vizinho)
          push!(vinexplorados, vizinho)
        end
      end
    end

    index = findfirst(v -> length(findall(w -> v == w, vconectados)) == 0, vg)

    if index !== nothing
      ncc += 1
      push!(vconectados, vg[index])
      push!(vinexplorados, vg[index])
    end
  end

  return ncc
end

"""
   ciclo(g, u)

devolve uma lista de vértices representando um ciclo no grafo `g`. A função inicia a busca a partir do vértice `u`. Caso não haja nenhum ciclo, devolve a lista vazia. Note que o vértice `u` não necessariamente deve pertencer ao ciclo retornado, ele é apenas o ponto de partida da busca.
"""

# ciclo(g::Grafo, u) = [-1]

function ciclo(g::Grafo, u::Int)::Array{Int}
  return [-1]
end

"""
   distância(g, u, v)

devolve a distância entre os vértices `u` e `v` no grafo `g`.
"""

# distância(g::Grafo, u, v) = -1

function distância(g::Grafo, u::Int, v::Int)::Int
  if !é_vértice(g, u) || !é_vértice(g, v)
    return -1
  end

  return length(menorCaminho(g, u, v)) - 1
end

"""
   excentricidade(g, v)

devolve a excentricidade de `v` no grafo `g`.
"""

# excentricidade(g::Grafo, v) = -1

function excentricidade(g::Grafo, v::Int)::Int
  if !é_vértice(g, v)
    return -1
  end

  d = []

  for w in vértices(g)
    push!(d, distância(g, v, w))
  end

  return maximum(d)
end

"""
   raio(g)

devolve o raio do grafo `g`.
"""

# raio(g::Grafo) = -1

function raio(g::Grafo)::Int
  d = []

  for v in vértices(g)
    push!(d, excentricidade(g, v))
  end

  return minimum(d)
end

"""
   diâmetro(g)

devolve o diâmetro do grafo `g`.
"""

# diâmetro(g) = -1

function diâmetro(g::Grafo)::Int
  d = []

  for v in vértices(g)
    push!(d, excentricidade(g, v))
  end

  return maximum(d)
end

"""
   centro(g)

devolve uma lista contendo os vértices no centro do grafo `g`.
"""

# centro(g::Grafo) = [-1]

function centro(g::Grafo)::Array{Int}
  d = []
  min_e = nothing

  for v in vértices(g)
    e = excentricidade(g, v)
    push!(d, (v, e))

    if min_e === nothing
      min_e = e
    end

    min_e = min_e < e ? min_e : e
  end

  return map(a -> a[1], filter(a -> a[2] == min_e, d))
end

"""
   éArticulação(g, u)

devolve `true` se o vértice `u` é um vértice de corte do grafo `g` ou `false`,
em caso contrário.
"""

# éArticulação(g::Grafo, u) = rand(Bool)

function éArticulação(g::Grafo, u::Int)::Bool
  ng = cópia(g)

  if é_vértice(ng, u)
    println(remove_vértices!(ng, [u]))
  end

  return numCompConexas(g) < numCompConexas(ng)
end

"""
   éPonte(g, (u,v))

devolve `true` se a aresta |(u,v)| é uma ponte do grafo `g` ou `false`, em caso
contrário.
"""

# éPonte(g::Grafo, (u, v)) = rand(Bool)

function éPonte(g::Grafo, (u, v)::Tuple{Int,Int})::Bool
  ng = cópia(g)

  if é_vértice(ng, u) && é_vértice(ng, v) && é_aresta(ng, (u, v))
    remove_aresta!(ng, (u, v))
  end

  return numCompConexas(g) < numCompConexas(ng)
end

"""
   conectividade(g)

devolve um número natural `k` para a conectividade  do grafo `g`.
"""

# conectividade(g::Grafo) = -1

function conectividadeAux(ag)::Int
  ncc = []
  nag = []

  for g in ag
    for v in vértices(g)
      ng = cópia(g)
      remove_vértices!(ng, [v])
      push!(ncc, numCompConexas(ng))
      push!(nag, ng)
    end
  end

  return maximum(ncc) == 1 && length(filter(n -> n == 1, map(g -> nvértices(g), nag))) == 0 ? 1 + conectividadeAux(nag) : 1
end

function conectividade(g::Grafo)::Int
  ncc = []
  nag = []

  for v in vértices(g)
    ng = cópia(g)
    remove_vértices!(ng, [v])
    push!(ncc, numCompConexas(ng))
    push!(nag, ng)
  end

  return maximum(ncc) == 1 ? 1 + conectividadeAux(nag) : 1
end

"""
   éBiconexo(g)

devolve `true` se o grafo `g` é biconexo ou `false`, em caso contrário.
"""

# éBiconexo(g::Grafo) = rand(Bool)

function éBiconexo(g::Grafo)::Bool
  n = []

  for v in vértices(g)
    ng = cópia(g)
    remove_vértices!(ng, [v])
    push!(n, numCompConexas(ng))
  end

  return maximum(n) == 1
end

"""
   sãoCaminhosDisjVértices(g, c1, c2)

devolve `true` se os caminhos `c1` e `c2`, representados como listas de
vértices, são internamente disjuntos em vértices no grafo `g` ou `false`,
em caso contrário.
"""

# sãoCaminhosDisjVértices(g::Grafo, c1, c2) = rand(Bool)

function sãoCaminhosDisjVértices(g::Grafo, c1, c2)
  return rand(Bool)
end

"""
   trilhaEulerFleury(g)

devolve uma lista de vértices representando uma trilha euleriana no grafo `g`.
Se tal trilha não existir, devolve uma lista vazia.  Use o algoritmo de Fleury.
"""

# trilhaEulerFleury(g::Grafo) = [-1]

function trilhaEulerFleury(g::Grafo)
  return [-1]
end

"""
   trilhaEulerHierholzer(g)

devolve uma lista de vértices representando uma trilha euleriana no grafo `g`.
Se tal trilha não existir, devolve uma lista vazia. Use o algoritmo de Hierholzer.
"""

# trilhaEulerHierholzer(g::Grafo) = [-1]

function trilhaEulerHierholzer(g::Grafo)
  return [-1]
end

