export éSubgrafoGerador,
  éÁrvore,
  éEstrela,
  éFloresta,
  folhas,
  internos,
  centroÁrvore,
  éAncestral,
  éDescendente,
  éIrmão,
  ancestrais,
  descendentes,
  nível,
  altura,
  parcial,
  éBinária,
  éBinEstrita,
  éBinCompleta,
  éÁrvoreM,
  éMcheia,
  éGeradora,
  geradora,
  geradoras,
  prufer,
  decodPrufer,
  éSeqVálida,
  numÁrvRotuladas,
  árvoresRotuladas,
  compConexas,
  induzVertices,
  centroÁrvoreAux


"""
   éSubgrafoGerador(g,h)

 devolve |True| se o grafo |h| é um subgrafo gerador do grafo |g|  ou |False| em caso contrário.
"""

# éSubgrafoGerador(g,h) = rand(Bool)

function éSubgrafoGerador(g::Grafo, h::Grafo)::Bool
  return nvértices(h) == nvértices(g)
end

"""
   éÁrvore(g)

, devolve |True| se o grafo |g| é uma árvore ou |False| em caso contrário.
"""

# éÁrvore(g) = rand(Bool)

function éÁrvore(g::Grafo)::Bool
  return éConexo(g) && narestas(g) == nvértices(g) - 1
end

"""
   éEstrela(g)

 devolve |True| se o grafo |g| é estrela ou |False| em caso contrário.
"""

# éEstrela(g) = rand(Bool)

function éEstrela(g::Grafo)::Bool
  n = nvértices(g) - 1
  return [repeat([1], n); n] == seqGraus(g)
end

"""
   éFloresta(g)

 devolve |True| se o grafo |g| é floresta ou |False| em caso contrário.
"""

# éFloresta(g) = rand(Bool)

function induzVertices(g::Grafo, vs::Array{Int})::Grafo
  lvs = length(vs)
  h = vazio(lvs)

  for v in 1:(lvs-1)
    for w in (v+1:lvs)
      if é_aresta(g, (vs[v], vs[w]))
        nova_aresta!(h, (v, w))
      end
    end
  end

  return h
end

function compConexas(g::Grafo)
  if nvértices(g) == 0
    return []
  elseif nvértices(g) == 1
    return [g]
  end

  vg = copy(vértices(g))

  vz1 = copy(vizinhos(g, 1))
  vconectados = [1; vz1]
  vinexplorados = vz1

  cc = []

  function updateCC()
    push!(
      cc,
      filter(
        v -> length(
          findall(
            w -> w == v,
            collect(Iterators.flatten(cc))
          )
        ) == 0,
        vconectados
      )
    )
  end

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
      updateCC()
      push!(vconectados, vg[index])
      push!(vinexplorados, vg[index])
    end
  end

  updateCC()

  return map(vs -> induzVertices(g, vs), cc)
end

function éFloresta(g::Grafo)::Bool
  sub_g = compConexas(g)
  return sum(map(h -> éÁrvore(h), sub_g)) == length(sub_g)
end

"""
   folhas(a)

, devolve uma lista de vértices que são folhas na árvore |a|.
"""

# folhas(a) = [-1]

function folhas(a::Grafo)::Array{Int}
  #=
    Este algoritmo falha quando a árvore é uma estrela e o vértice central não é o último.
    Ou seja, por uma escolha arbitrária de qual vértice será o centro.
  =#

  println("\n# Falha nos testes (leia o comentário no código).\n")

  return filter(v -> length(vizinhos(a, v)) <= 1, vértices(a))
end

"""
   internos(a)

, devolve uma lista com os vértices internos da árvore |a|.
"""

# internos(a) = [-1]

function internos(a::Grafo)::Array{Int}
  #=
    Este algoritmo falha quando a árvore é uma estrela e o vértice central não é o último.
    Ou seja, por uma escolha arbitrária de qual vértice será o centro.
  =#

  println("\n# Este algoritimo pode falhar nos testes do grafo estrela (leia o comentário no código).\n")

  return filter(v -> length(vizinhos(a, v)) != 1, vértices(a))
end

"""
   centroÁrvore(a)

, devolve uma lista contendo os vértices no centro da árvore |a|. Use o algoritmo específico para árvores.
"""

# centroÁrvore(a) = [-1]

function centroÁrvoreAux(a::Grafo, vs::Array{Int})::Array{Int}
  nao_explorados = filter(v -> length(findall(w -> v == w, vs)) == 0, vértices(a))
  fake_a = induzVertices(a, nao_explorados)

  if length(folhas(fake_a)) == nvértices(fake_a)
    return nao_explorados
  end

  novo_vs = copy(vs)

  for v in vs
    pai = filter(w -> length(findall(x -> w == x, novo_vs)) == 0, vizinhos(a, v))

    if length(pai) != 0
      push!(novo_vs, pai[1])
    end
  end

  return centroÁrvoreAux(a, novo_vs)
end

function centroÁrvore(a::Grafo)::Array{Int}
  #=
    Este algoritmo falha quando a árvore é uma estrela e o vértice central não é o último.
    Ou seja, por uma escolha arbitrária de qual vértice será o centro.
  =#

  println("\n# Falha nos teste (leia o comentário no código).\n")

  fa = folhas(a)

  return length(fa) != nvértices(a) ? centroÁrvoreAux(a, fa) : fa
end

"""
   éAncestral(a,r,v,w)

 devolve |True| se o vértice |v| é ancestral do vértice |w| na árvore |a| enraizada no vértice |r|.
"""

# éAncestral(a, r, v, w) = rand(Bool)

function éAncestral(a::Grafo, r::Int, v::Int, w::Int)::Bool
  return length(findall(u -> u == v, menorCaminho(a, w, r))) > 0
end

"""
   éDescendente(a,r,v,w)

 devolve |True| se o vértice |w| é descendente do vértice |v| na árvore |a| enraizada no vértice |r|.
"""

# éDescendente(a, r, v, w) = rand(Bool)

function éDescendente(a::Grafo, r::Int, v::Int, w::Int)::Bool
  #=
    Problemas com os testes:
    - Assumir que o vértice central é o primeiro vértice no grafo estrela;
    - As funções do vértice "v" e "w" foram trocadas nos testes (não seguem a descrição da questão). 
  =#

  println("\n# Falha nos testes (leia o comentário no código).\n")
  return éAncestral(a, r, w, v)
end

"""
   éIrmão(a,r,v,w)

 devolve |True| se o vértice |v| é irmão do vértice |w| na árvore |a| enraizada no vértice |r|.
"""

# éIrmão(a, r, v, w) = rand(Bool)

function éIrmão(a::Grafo, r::Int, v::Int, w::Int)::Bool
  cvr = menorCaminho(a, v, r)
  cwr = menorCaminho(a, w, r)

  return cvr[2] == cwr[2]
end

"""
   ancestrais(a,r,v)
   
devolve uma lista contendo todos os vértices ancestrais próprios do vértice |v| na árvore |a| enraizada no vértice |r|.
"""

# ancestrais(a, r, v) = [-1]

function ancestrais(a::Grafo, r::Int, v::Int)::Array{Int}
  return menorCaminho(a, v, r)[2:end]
end

"""
   descendentes(a,r,v)

devolve uma lista contendo todos os vértices descendentes próprios do vértice |v| na árvore |a| enraizada no vértice |r|.
"""

# descendentes(a, r, v) = [-1]

function descendentes(a::Grafo, r::Int, v::Int)::Array{Int}
  v_ignorados = menorCaminho(a, v, r)
  v_explorados = []
  v_inexplorados = copy(vizinhos(a, v))

  # println(v_ignorados)

  while length(v_inexplorados) != 0
    w = popfirst!(v_inexplorados)

    if w in v_ignorados
      continue
    end

    push!(v_explorados, w)

    for x in vizinhos(a, w)
      if !(x in v_explorados) && !(x in v_inexplorados)
        push!(v_inexplorados, x)
      end
    end
  end

  return v_explorados
end

"""
   nível(a,r,v)

 devolve o nível do vértice |v| na árvore |a| enraizada no vértice |r|.
"""

# nível(a, r, v) = -1

function nível(a::Grafo, r::Int, v::Int)::Int
  return length(menorCaminho(a, v, r)) - 1
end

"""
   altura(a,r)

 devolve a altura da árvore |a| enraizada no vértice |r|.
"""

# altura(a, r) = -1

function altura(a::Grafo, r::Int)::Int
  return excentricidade(a, r)
end

"""
   parcial(a,r,s)

 devolve uma subárvore parcial da árvore |a| enraizada no vértice |r| após a remoção dos vértices na lista |s|.
"""

# parcial(a, r, s) = nulo()

function parcial(a::Grafo, r::Int, s::Array{Int})::Grafo
  return removeVértices(cópia(a), s)
end

"""
   éBinária(a,r)

 devolve |True| se a árvore |a| enraizada no vértice |r| é uma árvore binária ou |False| em caso contrário.
"""

# éBinária(a, r) = rand(Bool)

function éBinária(a::Grafo, r::Int)::Bool
  graus_a = seqGraus(a)
  return graus_a[1] == 1 && graus_a[end] <= 3
end

"""
   éBinEstrita(a,r)

 devolve |True| se a árvore |a| enraizada no vértice |r| é uma árvore estritamente binária ou |False| em caso contrário.
"""

# éBinEstrita(a, r) = rand(Bool)

function éBinEstrita(a::Grafo, r::Int)::Bool
  f = folhas(a)
  i = filter(v -> !(v in f) && v != r, vértices(a))

  return (nvértices(a) == 1 || grau(a, r) == 2) && sum(map(v -> grau(a, v), i)) == 3 * length(i)
end

"""
   éBinCompleta(a,r)

 devolve |True| se a árvore |a| enraizada no vértice |r| é uma árvore binária completa ou |False| em caso contrário.
"""

# éBinCompleta(a, r) = rand(Bool)

function éBinCompleta(a::Grafo, r::Int)::Bool
  #=
    - Um grafo estrela com mais de duas pontas não é uma árvore binária
  =#

  println("\n# Falha nos teste (leia o comentário no código).\n")

  f = folhas(a)
  return éBinária(a, r) && sum(altura(a, r) .== map(v -> nível(a, r, v), f)) == length(f)
end

"""
   éÁrvoreM(a,r,m)

 devolve |True| se a árvore |a| enraizada no vértice |r| é uma árvore |m|-ária ou |False| em caso contrário.
"""

# éÁrvoreM(a, r, m) = rand(Bool)

function éÁrvoreM(a::Grafo, r::Int, m::Int)::Bool
  f = folhas(a)
  i = filter(v -> !(v in f) && v != r, vértices(a))
  gr = grau(a, r)

  return (gr == m && seqGraus(a)[end] == m) || (gr <= m && length(findall(v -> grau(a, v) - 1 == m, i)) > 0)
end

"""
   éMcheia(a,r,m)

 devolve |True| se a árvore |a| enraizada no vértice |r| é uma árvore |m|-ária cheia ou |False| em caso contrário.
"""

# éMcheia(a, r, m) = rand(Bool)

function éMcheia(a::Grafo, r::Int, m::Int)::Bool
  f = folhas(a)
  i = filter(v -> !(v in f) && v != r, vértices(a))

  return éÁrvoreM(a, r, m) && sum(m .== map(v -> grau(a, v) - 1, i)) == length(i)
end

"""
   éGeradora(g,a)

 devolve |True| se a árvore |a| é uma árvore geradora do grafo |g| ou |False| em caso contrário. 
"""

# éGeradora(g, a) = rand(Bool)

function éGeradora(g::Grafo, a::Grafo)::Bool
  return nvértices(g) == nvértices(a) && sum(map(aa -> é_aresta(g, aa), arestas(a))) == narestas(a)
end

"""
   geradora(g)

 devolve uma árvore geradora do grafo |g|.
"""

# geradora(g) = nulo()

geradora(g) = nulo()

"""
   geradoras(g)} devolve uma lista contendo todas as árvores geradoras do grafo |g|.
"""

# geradoras(g) = [nulo()]

geradoras(g) = [nulo()]

"""
   prufer(a)

 devolve uma lista representando o código de Prüfer para a árvore |a|.
"""

# prufer(a) = [-1]

function prufer(a::Grafo)::Array{Int}
  if nvértices(a) < 2
    return [-1]
  end

  f = folhas(a)
  p = []
  codigo = []

  while length(codigo) != nvértices(a) - 2
    v = minimum(f)

    popat!(f, findfirst(w -> w == v, f))
    push!(p, v)

    pai = filter(w -> !(w in p), vizinhos(a, v))[1]

    push!(codigo, pai)

    if grau(a, pai) - length(findall(w -> w == pai, codigo)) == 1
      push!(f, pai)
    end
  end

  return codigo
end

"""
   decodPrufer(c)

 devolve um grafo |a| que é a árvore resultante da decodificação do código de Prüfer |c|.
"""

# decodPrufer(c) = nulo()

function decodPrufer(c)
  g = vazio(length(c) + 2)

  f = filter(v -> !(v in c), vértices(g))
  nc = copy(c)

  while length(nc) > 0
    w = pop!(nc)
    v = minimum(f)
    popat!(f, findfirst(w -> w == v, f))

    nova_aresta!(g, w, v)

    if !(w in nc)
      push!(f, w)
    end
  end

  nova_aresta!(g, f[1], f[2])

  return g
end

"""
   éSeqVálida(s)

, verifica se uma lista |s| representando uma sequência de graus para uma árvore é válida.
"""

# éSeqVálida(s) = rand(Bool)

function éSeqVálida(s::Array{Int})::Bool
  return sum(s) == 2 * length(s) - 2
end

"""
   numÁrvRotuladas(s)

, devolve a quantidade de árvores rotuladas que possuem a sequência |s| de graus válida. Verifique antes de fazer as contas se |s| é, de fato, válida e se não for devolva 0.
"""

# numÁrvRotuladas(s) = -1

function numÁrvRotuladas(s::Array{Int})
  p = 1

  for i in 1:length(s)
    p *= factorial(s[i] - 1)
  end

  return div(factorial(length(s) - 2), p)
end

"""
   árvoresRotuladas(s)
   
devolve uma lista contendo todas as árvores rotuladas que possuam a sequência |s| de graus válida. Antes de começar verifique se |s| é, de fato, válida e se não for devolva uma lista vazia.
"""

# árvoresRotuladas(s) = [nulo()]

árvoresRotuladas(s) = [nulo()]
