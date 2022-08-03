export éVértIsolado, éVértTerminal, éVértPar, éVértÍmpar, sãoArestasAdjs,
  éTrivial, grauMax, grauMin, éRegular, ékRegular, éVazio, éNulo, éKn,
  éCompleto, éSubgrafo, éSubgrafoPróprio, éSubgrafoInduzidoVértices,
  éSubgrafoInduzidoArestas, éClique, éCjIndependenteVértices, insereVértices,
  removeVértices, insereArestas, removeArestas, contraiVértices,
  contraiAresta, éPasseio, éPasseioAberto, éPasseioFechado, éTrilha, éCaminho,
  éCiclo, éGrafoCíclico, éCn, éGrafoCaminho, éPn, éGrafoBipartido,
  éTrilhaEuleriana, éGrafoEuleriano, éSemiEuleriano, éHamiltonianoOre,
  éHamiltonianoDirac, regular, éConexo

using Combinatorics

"""
  Nota: Aparentemente o Julia tá com algum problema com minha antiga função `regular` 
  ou o rand tá demorando muito pra encontrar a aresta certa, fazendo com que alguns testes sejam rápidos,
  já outros nem tanto.
  Como essa função é necessária para os testes, decidi refazê-la.
"""

function regular(n::Int, k::Int)::Grafo
  if !(k < n && (n % 2 == 0 || k % 2 == 0))
    error("Grafo regular inexistente")
  end

  g = vazio(n)

  for i in 1:n
    while grau(g, i) < k
      for j in (i+1):n
        if grau(g, i) < k
          if i != j && grau(g, j) == first(seqGraus(g)) && !é_aresta(g, (i, j))
            nova_aresta!(g, (i, j))
          end
        else
          break
        end
      end
    end
  end

  return g
end

""" éVértIsolado(g, v)

devolve `true` se o vértice `v` é isolado no grafo `g` ou `false`, em caso contrário.
"""

# éVértIsolado(g::Grafo, v::Int) = rand(Bool)

function éVértIsolado(g::Grafo, v::Int)::Bool
  return é_vértice(g, v) && grau(g, v) == 0
end

"""
    éVértTerminal(g, v)

devolve `true` se o vértice `v` é terminal no grafo `g` ou `false`, em caso contrário.
"""

# éVértTerminal(g::Grafo, v::Int) = rand(Bool)

function éVértTerminal(g::Grafo, v::Int)::Bool
  return é_vértice(g, v) && grau(g, v) == 1
end

"""
    éVértPar(g, v)

devolve `true` se o vértice `v` é um vértice par no grafo `g` ou `false`, em caso contrário.
"""

# éVértPar(g::Grafo, v::Int) = rand(Bool)

function éVértPar(g::Grafo, v::Int)::Bool
  return é_vértice(g, v) && grau(g, v) % 2 == 0
end

"""
    éVértÍmpar(g, v)

devolve `true` se o vértice `v` é um vértice ímpar no grafo `g` ou `false`, em caso contrário.
"""

# éVértÍmpar(g::Grafo, v::Int) = rand(Bool)

function éVértÍmpar(g::Grafo, v::Int)::Bool
  return é_vértice(g, v) && grau(g, v) % 2 != 0
end

"""
    sãoArestasAdjs(g, (t,u), (v,w))

devolve `true` se as duas arestas `(t,u)` e `(v,w)` são adjacentes no grafo
`g`. Note que arestas tais como `(1,2), (3,2)` e `(2,1), (3,2)` também são
 adjacentes.
"""
# sãoArestasAdjs(g::Grafo, (t, u), (v, w)) = rand(Bool)

function sãoArestasAdjs(g::Grafo, (t, u)::Tuple{Int,Int}, (v, w)::Tuple{Int,Int})::Bool
  return é_vértice(g, t) && é_vértice(g, u) && é_vértice(g, v) && é_vértice(g, w) && é_aresta(g, (t, u)) && é_aresta(g, (v, w)) && (t == v || t == w || u == v || u == w)
end

"""
    éTrivial(g)

devolve `true` se o grafo `g` é trivial ou `false`, se `g` não é trivial.
"""

# éTrivial(g::Grafo) = rand(Bool)

function éTrivial(g::Grafo)::Bool
  return narestas(g) == 0 && nvértices(g) == 1
end

"""
    grauMax(g)

devolve o grau máximo de `g` .
"""

# grauMax(g::Grafo) = -1

function grauMax(g::Grafo)::Int
  return maximum(seqGraus(g))
end

"""
    grauMin(g)

devolve o grau mínimo de `g` .
"""

# grauMin(g::Grafo) = -1

function grauMin(g::Grafo)::Int
  return minimum(seqGraus(g))
end

"""
    éRegular(g)

devolve `true` se o grafo `g` é regular ou `false`, em caso contrário.
"""

# éRegular(g::Grafo) = rand(Bool)

function éRegular(g::Grafo)::Bool
  graus = seqGraus(g)
  return first(graus) == last(graus)
end

"""
    ékRegular(g,k)

devolve `true` se o grafo `g` é `k`-regular ou `false`, em caso contrário.
"""

# ékRegular(g::Grafo, k::Int) = rand(Bool)

function ékRegular(g::Grafo, k::Int)::Bool
  graus = seqGraus(g)
  return first(graus) == last(graus) == k
end

"""
    éVazio(g)

devolve `true` se o grafo `g` é vazio ou `false`, em caso contrário.
"""

# éVazio(g::Grafo) = rand(Bool)

function éVazio(g::Grafo)::Bool
  return narestas(g) == 0
end

"""
    éNulo(g)

devolve `true` se o grafo `g` é nulo ou `false`, em caso contrário.
"""

# éNulo(g::Grafo) = rand(Bool)

function éNulo(g::Grafo)::Bool
  return narestas(g) == 0 && nvértices(g) == 0
end

"""
    éKn(g, n)

devolve `true` se o grafo `g` é completo com n vértices ou `false`, em caso contrário.
"""

# éKn(g::Grafo, n::Int) = rand(Bool)

function éKn(g::Grafo, n::Int)::Bool
  return ékRegular(g, n - 1) && nvértices(g) == n
end

"""
    éCompleto(g)

devolve `true` se o grafo `g` é completo ou `false`, em caso contrário.
"""

# éCompleto(g::Grafo) = rand(Bool)

function éCompleto(g::Grafo)::Bool
  return éKn(g, nvértices(g))
end

"""
    éSubgrafo(h, g)

devolve `true` se o grafo `h` é um subgrafo do grafo `g` ou `false`, em caso contrário.
"""

# éSubgrafo(h::Grafo, g::Grafo) = rand(Bool)

function éSubgrafo(h::Grafo, g::Grafo)::Bool
  if nvértices(h) > nvértices(g)
    return false
  end

  resposta = true

  for a in arestas(h)
    resposta = resposta && é_aresta(g, a)
    if !resposta
      break
    end
  end

  return resposta
end

"""
    éSubgrafoPróprio(h, g)

devolve `true` se o grafo `h` é um subgrafo próprio do grafo `h` ou `false`, em caso contrário.
"""

# éSubgrafoPróprio(h::Grafo, g::Grafo) = rand(Bool)

function éSubgrafoPróprio(h::Grafo, g::Grafo)::Bool
  return éSubgrafo(h, g) && (nvértices(h) < nvértices(g) || narestas(h) < narestas(g))
end

"""
    éSubgrafoInduzidoVértices(h, g, vh)

devolve `true` se o grafo `h` é um subgrafo induzido por um lista de vértices `vh` do grafo `g` ou   `false`, em caso contrário.
"""

# éSubgrafoInduzidoVértices(h::Grafo, g::Grafo, vh) = rand(Bool)

function éSubgrafoInduzidoVértices(h::Grafo, g::Grafo, vh::Array{Int})::Bool
  if !(éSubgrafo(h, g) && nvértices(h) >= maximum(vh))
    return false
  end

  resposta = true
  ag = arestas(g)

  for (vg1, vg2) in ag
    if é_vértice(h, vg1) && é_vértice(h, vg2) && vg1 in vh && vg2 in vh
      resposta = resposta && é_aresta(h, (vg1, vg2))

      if !resposta
        break
      end
    end
  end

  return resposta
end

"""
    éSubgrafoInduzidoArestas(h, g, ars)

devolve `true` se o grafo `h` é um subgrafo induzido por um lista de arestas `ars` do grafo `g` ou `false`, em caso contrário.
"""

# éSubgrafoInduzidoArestas(h::Grafo, g::Grafo, ars) = rand(Bool)

function éSubgrafoInduzidoArestas(h::Grafo, g::Grafo, ars::Array{Tuple{Int,Int}})::Bool
  if !(éSubgrafo(h, g) && narestas(h) >= length(ars))
    return false
  end

  resposta = true

  for (v1, v2) in ars
    resposta = resposta && é_vértice(h, v1) && é_vértice(h, v2) && é_aresta(g, (v1, v2))

    if !resposta
      break
    end
  end

  return resposta
end

"""
    éClique(h, g)

devolve `true` se o grafo `h` é um clique do grafo `g` ou `false`, em caso contrário.
"""

# éClique(h::Grafo, g::Grafo) = rand(Bool)

function éClique(h::Grafo, g::Grafo)::Bool
  return éSubgrafo(h, g) && éCompleto(h)
end

"""
    éCjIndependenteVértices(h, g)

devolve `true` se o grafo `h` é um conjunto independente de vértices do grafo `g` ou `false`, em caso contrário.
"""
# éCjIndependenteVértices(h::Grafo, g::Grafo) = rand(Bool)

function éCjIndependenteVértices(h::Grafo, g::Grafo)::Bool
  return éSubgrafoInduzidoVértices(h, g, vértices(h)) && narestas(h) == 0
end

"""
    insereVértices(g, vs)

devolve um novo grafo com todos os vértices na lista `vs` inseridos em `g`. A função deve ignorar vértices que já existam no grafo `g`.
"""
# insereVértices(g::Grafo, vs) = nulo()

function insereVértices(g::Grafo, vs::Array{Int})::Grafo
  h = cópia(g)

  qtdVH = nvértices(h)
  maxVS = maximum(vs)

  if qtdVH < maxVS
    for _ in (qtdVH+1):maxVS
      novo_vértice!(h)
    end
  end

  return h
end

"""
    removeVértices(g, vs)

devolve um grafo com todos os vértices (e arestas incidentes) na lista `vs` removidos de `g`. A função deve ignorar vértices que não estão presentes no grafo `g`. Dica: já existe uma função em \texttt{Grafos.jl} que remove um único vértice. Use-a.
"""

# removeVértices(g::Grafo, vs) = nulo()

function removeVértices(g::Grafo, vs::Array{Int})::Grafo
  h = cópia(g)
  fv = filter(v -> v in vértices(h), vs)

  # Remove arestas, mas parece não ser necessário
  # for v in fv
  #   for (v1, v2) in arestas(h)
  #     if v1 == v || v2 == v
  #       remove_aresta!(h, (v1, v2))
  #     end
  #   end
  # end

  remove_vértices!(h, fv)

  return h
end

"""
    insereArestas(g, ars)

devolve um novo grafo com todos as arestas na lista `ars` inseridas em `g`.
A função  deve ignorar arestas que já existam no grafo `g` e deve indicar
o erro `Vértice inexistente` se algum dos vértices das arestas não estiver
em `g`.
"""

# insereArestas(g::Grafo, ars) = nulo()

function insereArestas(g::Grafo, ars::Array{Tuple{Int,Int}})::Grafo
  h = cópia(g)

  for (v1, v2) in ars
    if !é_aresta(h, (v1, v2))
      if é_vértice(h, v1) && é_vértice(h, v2)
        nova_aresta!(h, (v1, v2))
      else
        error("Vértice inexistente")
      end
    end
  end

  return h
end

"""
    removeArestas(g, ars)

devolve um grafo com todos as arestas na lista `ars` removidas de `g`. A
função deve ignorar arestas que não estão presentes no grafo `g`.
Dica: já existe uma função em Grafos.jl que remove uma única aresta. Use-a.
"""

# removeArestas(g::Grafo, ars) = nulo()

function removeArestas(g::Grafo, ars::Array{Tuple{Int,Int}})::Grafo
  h = cópia(g)

  for (v1, v2) in ars
    if é_vértice(h, v1) && é_vértice(h, v2) && é_aresta(h, (v1, v2))
      remove_aresta!(h, (v1, v2))
    end
  end

  return h
end

"""
    contraiVértices(g, v, w)

devolve um grafo com a contração de um par de vértices `v` e `w` no grafo `g`. 
Use o rótulo do menor dos vértices `v` e `w` como o rótulo do vértice resultante da contração.
"""

# contraiVértices(g::Grafo, v::Int, w::Int) = nulo()

function contraiVértices(g::Grafo, v::Int, w::Int)::Grafo
  h = cópia(g)

  if v == w
    return h
  end

  menorv = v < w ? v : w
  maiorv = v > w ? v : w

  if (v, w) in arestas(h) || (w, v) in arestas(h)
    remove_aresta!(h, (v, w))
  end

  for (v1, v2) in arestas(h)
    if v1 == maiorv || v2 == maiorv
      if v1 == maiorv && !é_aresta(h, (menorv, v2))
        nova_aresta!(h, (menorv, v2))
      elseif v2 == maiorv && !é_aresta(h, (v1, menorv))
        nova_aresta!(h, (v1, menorv))
      end

      remove_aresta!(h, (v1, v2))
    end
  end

  remove_vértices!(h, [maiorv])

  return h
end

"""
    contraiAresta(g, (v,w))

devolve um grafo com a contração da aresta `(v,w)`.
"""

# contraiAresta(g::Grafo, (v, w)) = nulo()

function contraiAresta(g::Grafo, (v, w)::Tuple{Int,Int})::Grafo
  return é_vértice(g, v) && é_vértice(g, w) && é_aresta(g, (v, w)) ? contraiVértices(g, v, w) : cópia(g)
end

"""
    éPasseio(g, vs)

verifica se a lista de vértices `vs` é um passeio no grafo `g`.
"""

# éPasseio(g::Grafo, vs) = rand(Bool)

function éPasseio(g::Grafo, vs::Array{Int})::Bool
  if maximum(vs) > nvértices(g)
    return false
  end

  resposta = true

  if (length(vs) > 1)
    resposta = resposta && é_vértice(g, first(vs))

    for i in 2:length(vs)
      resposta = resposta && é_vértice(g, vs[i]) && é_aresta(g, (vs[i-1], vs[i]))

      if !resposta
        break
      end
    end
  end

  return resposta
end

"""
    éPasseioAberto(g, vs)

verifica se a lista de vértices `vs` é um passeio aberto no grafo `g`.
"""

# éPasseioAberto(g::Grafo, vs) = rand(Bool)

function éPasseioAberto(g::Grafo, vs::Array{Int})::Bool
  return éPasseio(g, vs) && first(vs) != last(vs)
end

"""
    éPasseioFechado(g, vs)

verifica se a lista de vértices `vs` é um passeio fechado no grafo `g`.
"""

# éPasseioFechado(g::Grafo, vs) = rand(Bool)

function éPasseioFechado(g::Grafo, vs::Array{Int})::Bool
  return éPasseio(g, vs) && first(vs) == last(vs)
end

"""
    éTrilha(g, vs)

verifica se a lista de vértices `vs` é uma trilha no grafo `g`.
"""

# éTrilha(g::Grafo, vs) = rand(Bool)

function éTrilha(g::Grafo, vs::Array{Int})::Bool
  if éPasseio(g, vs)
    resposta = true

    if length(vs) > 1
      for i in 2:length(vs)
        if length(vs) > 2 && i + 1 <= length(vs)
          for j in (i+1):length(vs)
            resposta = resposta && !((vs[i-1] == vs[j-1] && vs[i] == vs[j]) || (vs[i-1] == vs[j] && vs[i] == vs[j-1]))

            if !resposta
              break
            end
          end
        end

        if !resposta
          break
        end
      end
    end
    return resposta
  else
    return false
  end
end

"""
    éCaminho(g, vs)

verifica se a lista de vértices `vs` é um caminho no grafo `g`.
"""

# éCaminho(g::Grafo, vs) = rand(Bool)

function éCaminho(g::Grafo, vs::Array{Int})::Bool
  if éTrilha(g, vs)
    resposta = true

    for i in 2:length(vs)
      resposta = resposta && !(vs[i-1] in vs[i:end])

      if !resposta
        break
      end
    end

    return resposta
  else
    return false
  end
end

"""
    éCiclo(g, vs)

verifica se a lista de vértices `vs` é um ciclo no grafo `g`.
"""

# éCiclo(g::Grafo, vs) = rand(Bool)

function éCiclo(g::Grafo, vs::Array{Int})::Bool
  return éCaminho(g, vs[1:(end-1)]) && first(vs) == last(vs)
end

"""
    éGrafoCíclico(g)

verifica se o grafo `g` é cíclico.
"""
# éGrafoCíclico(g::Grafo) = rand(Bool)

function éGrafoCíclico(g::Grafo)::Bool
  graus = seqGraus(g)

  if !(first(graus) == last(graus) == 2)
    return false
  end

  resposta = false

  for c in collect(Combinatorics.combinations(vértices(g), nvértices(g)))
    resposta = éCiclo(g, [c[end]; c])

    if resposta
      break
    end
  end

  return resposta
end

"""
    éCn(g, n)

verifica se o grafo `g` é cíclico com `n` vértices.
"""

# éCn(g::Grafo, n::Int) = rand(Bool)

function éCn(g::Grafo, n::Int)::Bool
  return éGrafoCíclico(g) && nvértices(g) == n
end

"""
    éGrafoCaminho g

verifica se o grafo `g` é um grafo caminho.
"""

# éGrafoCaminho(g::Grafo) = rand(Bool)

function éGrafoCaminho(g::Grafo)::Bool
  if seqGraus(g) != [1; 1; repeat([2], nvértices(g) - 2)]
    return false
  end

  resposta = false

  for c in collect(Combinatorics.combinations(vértices(g), nvértices(g)))
    resposta = éCaminho(g, c)

    if resposta
      break
    end
  end

  return resposta
end

"""
    éPn(p, n)

verifica se o grafo `p` é um grafo caminho com `n` vértices.
"""

# éPn(p::Grafo, n::Int) = rand(Bool)

function éPn(p::Grafo, n::Int)::Bool
  return éGrafoCaminho(p) && nvértices(p) == n
end

"""
    éGrafoBipartido(g, v1, v2)

verifica se um grafo `g` é bipartido com a partição dos vértices dada pelas listas de vértices `v1` e `v2`.
"""

# éGrafoBipartido(g::Grafo, v1, v2) = rand(Bool)

function éGrafoBipartido(g::Grafo, v1::Array{Int}, v2::Array{Int})::Bool
  if maximum(v1) > nvértices(g) || maximum(v2) > nvértices(g)
    return false
  end

  resposta = true

  for par in collect(Combinatorics.combinations(v1, 2))
    resposta = !é_aresta(g, (par[1], par[2]))

    if !resposta
      break
    end
  end

  if !resposta
    return false
  end

  for par in collect(Combinatorics.combinations(v2, 2))
    resposta = !é_aresta(g, (par[1], par[2]))

    if !resposta
      break
    end
  end

  return resposta
end

"""
    éTrilhaEuleriana(g, t)

verifica se a trilha `t` é euleriana no grafo `g`.
"""

# éTrilhaEuleriana(g::Grafo, t) = rand(Bool)

function éTrilhaEuleriana(g::Grafo, t::Array{Int})::Bool
  if first(seqGraus(g)) == 0 || sum(seqGraus(g) .% 2) > 0
    return false
  end

  return éTrilha(g, t) && length(t) - 1 == narestas(g)
end

"""
    éGrafoEuleriano(g)

verifica se um dado grafo `g` é euleriano. Use o Teorema de Euler.
"""

function éConexo(g::Grafo)::Bool
  if nvértices(g) == 1
    return true
  end

  vizinhosv1 = vizinhos(g, 1)
  vconectados = [1; vizinhosv1]
  vinexplorado = vizinhosv1

  while length(vinexplorado) !== 0
    vk = popfirst!(vinexplorado)
    vizinhosvk = vizinhos(g, vk)

    for vizinho in vizinhosvk
      if length(findall(v -> v == vizinho, vconectados)) == 0
        push!(vconectados, vizinho)
        push!(vinexplorado, vizinho)
      end
    end
  end

  return length(vconectados) == nvértices(g)
end

# éGrafoEuleriano(g::Grafo) = rand(Bool)

function éGrafoEuleriano(g::Grafo)::Bool
  return !(first(seqGraus(g)) == 0 || sum(seqGraus(g) .% 2) > 0) && éConexo(g)
end

"""
    éSemiEuleriano(g)

verifica se um dado grafo `g` é semi-euleriano.
"""

# éSemiEuleriano(g::Grafo) = rand(Bool)

function éSemiEuleriano(g::Grafo)::Bool
  return !(first(seqGraus(g)) == 0 || sum(seqGraus(g) .% 2) != 2) && éConexo(g)
end

"""
    éHamiltonianoOre(g)

verifica se um grafo `g` é hamiltoniano usando o teorema de Ore.
"""

# éHamiltonianoOre(g::Grafo) = rand(Bool)

function éHamiltonianoOre(g::Grafo)::Bool
  qtdVerticesDeG = nvértices(g)
  verticesDeG = vértices(g)

  if qtdVerticesDeG < 3 && sum(map(v -> sum(vizinhos(g, v) .== v) == 0, verticesDeG)) == 0
    return false
  end

  resposta = true

  for i in verticesDeG
    vizinhosDeI = vizinhos(g, i)
    grauDeI = grau(g, i)

    for j in filter(v -> sum(v .== vizinhosDeI) == 0 && v != i, verticesDeG)
      resposta = resposta && grauDeI + grau(g, j) >= qtdVerticesDeG

      if !resposta
        break
      end
    end

    if !resposta
      break
    end
  end

  return resposta
end

"""
    éHamiltonianoDirac(g)

verfica se um grafo `g` é hamiltoniano usando o teorema de Dirac.
"""

# éHamiltonianoDirac(g::Grafo) = rand(Bool)

function éHamiltonianoDirac(g::Grafo)::Bool
  qtdVerticesDeG = nvértices(g)
  verticesDeG = vértices(g)

  if qtdVerticesDeG < 3 && sum(map(v -> sum(vizinhos(g, v) .== v) == 0, verticesDeG)) == 0
    return false
  end

  k = div(qtdVerticesDeG, 2)

  return sum(map(v -> grau(g, v) >= k, verticesDeG)) == qtdVerticesDeG
end

