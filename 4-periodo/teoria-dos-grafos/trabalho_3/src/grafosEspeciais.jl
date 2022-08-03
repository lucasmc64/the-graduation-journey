#=
      Aluno: Lucas Marçal Coutinho
  Matrícula: 11911BCC012
=#

export caminho, grade, dama, bispo, cavalo,
  torre, rei, cubo, petersen,
  ciclo, completo, amigo, roda, estrela

""""
    caminho(n)

Devolve um grafo caminho com `n` vértices.
"""

# caminho(n::Int)::Grafo = nulo()

function caminho(n::Int)::Grafo
  g = nulo()

  if n >= 1
    novo_vértice!(g)
  end

  if n > 1
    for i in 2:n
      novo_vértice!(g)
      nova_aresta!(g, (i - 1, i))
    end
  end

  return g
end

""""
   grade(p, q)

Devolve uma grade `p`-por-`q`.
Veja o exercício E 1.6 do livro do Paulo Feofiloff.
"""

# grade(p::Int, q::Int)::Grafo = nulo()

function grade(p::Int, q::Int)::Grafo
  g = nulo()

  if p == 1 && q == 1
    novo_vértice!(g)
  end

  if (p != 1 || q != 1) && p > 0 && q > 0
    for i in 1:p
      for j in 1:q
        novo_vértice!(g)

        if j > 1
          nova_aresta!(g, ((i - 1) * q + j, (i - 1) * q + j - 1))
        end

        if i > 1
          nova_aresta!(g, ((i - 1) * q + j, (i - 1) * q + j - q))
        end
      end
    end
  end

  return g
end

"""
   dama(t)

Devolve o grafo da dama |t|-por-|t|.
Veja o exercício E 1.8 do livro do Paulo Feofiloff.
"""

# dama(t::Int)::Grafo = nulo()

function dama(t::Int)::Grafo
  g = vazio(t * t)

  for i in 1:t
    for j in 1:t
      # Coluna
      for k in (i+1):t
        nova_aresta!(g, ((i - 1) * t + j, (k - 1) * t + j))
      end

      # Linha
      for k in (j+1):t
        nova_aresta!(g, ((i - 1) * t + j, (i - 1) * t + k))
      end

      for k in 1:t
        if j + k <= t
          # Diagonal secundária
          if i - k >= 1
            nova_aresta!(g, ((i - 1) * t + j, (i - 1 - k) * t + (j + k)))
          end

          # Diagonal principal
          if i + k <= t
            nova_aresta!(g, ((i - 1) * t + j, (i - 1 + k) * t + (j + k)))
          end
        end
      end
    end
  end

  return g
end

"""
  cavalo(t)

Devolve o grafo do cavalo |t| por |t|. Os vértices, ou seja, as casas do
tabuleiro, devem ser numerados de 1 a t^2, de baixo para cima e da
esquerda para a direita. Veja o exercício E 1.9 do livro do Paulo Feofiloff.
Dica: para se inspirar, leia o documento em

    https://bradfieldcs.com/algos/graphs/knights-tour
"""

# cavalo(t::Int)::Grafo = nulo()

function cavalo(t::Int)::Grafo
  g = vazio(t * t)

  for i in 1:t
    for j in 1:t
      # Algoritmo passível de otimizações
      # - Adição de arestas repetidas

      # Duas posições acima (à direita e à esquerda)
      if i - 2 >= 1
        if j - 1 >= 1
          nova_aresta!(g, ((i - 1) * t + j, (i - 2 - 1) * t + (j - 1)))
        end

        if j + 1 <= t
          nova_aresta!(g, ((i - 1) * t + j, (i - 2 - 1) * t + (j + 1)))
        end
      end

      # Duas posições abaixo (à direita e à esquerda)
      if i + 2 <= t
        if j - 1 >= 1
          nova_aresta!(g, ((i - 1) * t + j, (i + 2 - 1) * t + (j - 1)))
        end

        if j + 1 <= t
          nova_aresta!(g, ((i - 1) * t + j, (i + 2 - 1) * t + (j + 1)))
        end
      end

      # Duas posições à esquesta (acima e abaixo)
      if j - 2 >= 1
        if i - 1 >= 1
          nova_aresta!(g, ((i - 1) * t + j, (i - 1 - 1) * t + (j - 2)))
        end

        if i + 1 <= t
          nova_aresta!(g, ((i - 1) * t + j, (i + 1 - 1) * t + (j - 2)))
        end
      end

      # Duas posições à direita (acima e abaixo)
      if j + 2 <= t
        if i - 1 >= 1
          nova_aresta!(g, ((i - 1) * t + j, (i - 1 - 1) * t + (j + 2)))
        end

        if i + 1 <= t
          nova_aresta!(g, ((i - 1) * t + j, (i + 1 - 1) * t + (j + 2)))
        end
      end
    end
  end

  return g
end

"""
   bispo(t)

Devolve o grafo do bispo |t|-por-|t|.
Veja o exercício E 1.10 do livro do Paulo Feofiloff.
"""

# bispo(t::Int)::Grafo = nulo()

function bispo(t::Int)::Grafo
  g = vazio(t * t)

  for i in 1:t
    for j in 1:t
      for k in 1:t
        if j + k <= t
          # Diagonal secundária
          if i - k >= 1
            nova_aresta!(g, ((i - 1) * t + j, (i - 1 - k) * t + (j + k)))
          end

          # Diagonal principal
          if i + k <= t
            nova_aresta!(g, ((i - 1) * t + j, (i - 1 + k) * t + (j + k)))
          end
        end
      end
    end
  end

  return g
end

"""
   torre(t)

Devolve o grafo da torre |t|-por-|t|.
Veja o exercício E 1.11 do livro do Paulo Feofiloff.
"""

# torre(t::Int)::Grafo = nulo()

function torre(t::Int)::Grafo
  g = vazio(t * t)

  for i in 1:t
    for j in 1:t
      # Coluna
      for k in (i+1):t
        nova_aresta!(g, ((i - 1) * t + j, (k - 1) * t + j))
      end

      # Linha
      for k in (j+1):t
        nova_aresta!(g, ((i - 1) * t + j, (i - 1) * t + k))
      end
    end
  end
  return g
end

"""
   rei(t)

Devolve o grafo do rei |t|-por-|t|.
Veja o exercício E 1.12 do livro do Paulo Feofiloff.
"""

#rei(t::Int)::Grafo = nulo()

function rei(t::Int)::Grafo
  g = vazio(t * t)

  for i in 1:t
    for j in 1:t
      if i - 1 >= 1
        if j - 1 >= 1
          nova_aresta!(g, ((i - 1) * t + j, (i - 1 - 1) * t + (j - 1)))
        end

        nova_aresta!(g, ((i - 1) * t + j, (i - 1 - 1) * t + j))

        if j + 1 <= t
          nova_aresta!(g, ((i - 1) * t + j, (i - 1 - 1) * t + (j + 1)))
        end
      end

      if j - 1 >= 1
        nova_aresta!(g, ((i - 1) * t + j, (i - 1) * t + (j - 1)))
      end

      if j + 1 <= t
        nova_aresta!(g, ((i - 1) * t + j, (i - 1) * t + (j + 1)))
      end

      if i + 1 <= t
        if j - 1 >= 1
          nova_aresta!(g, ((i - 1) * t + j, (i + 1 - 1) * t + (j - 1)))
        end

        nova_aresta!(g, ((i - 1) * t + j, (i + 1 - 1) * t + j))

        if j + 1 <= t
          nova_aresta!(g, ((i - 1) * t + j, (i + 1 - 1) * t + (j + 1)))
        end
      end
    end
  end
  return g
end
"""
   cubo(k)

Devolve o grafo do cubo de dimensão |k|.
Veja o exercício E 1.14 do livro do Paulo Feofiloff.
"""

# cubo(k)::Grafo = nulo()

function converte_binario(n::Int)::String
  return n == 0 ? "0" : string(converte_binario(div(n, 2)), n % 2)
end

function compara_binarios(bin1, bin2)::Int
  maior_tamanho = length(bin1) < length(bin2) ? length(bin2) : length(bin1)

  bin1_pad = lpad(bin1, maior_tamanho, "0")
  bin2_pad = lpad(bin2, maior_tamanho, "0")

  num_dif = 0

  for i in 1:maior_tamanho
    num_dif += bin1_pad[i] != bin2_pad[i]
  end

  return num_dif
end

function cubo(k::Int)::Grafo
  g = vazio(2^k)

  #= 
    ATENÇÃO
    Dado o uso obrigatório dos módulos do professor e proibição de alteração destes,
    para este exercício considere que o vértice, na realidade representa um valor a menos
    em seu rótulo.

    Exemplo: Vértice 1 na verdade representa Vértice 0.

    Isso se dá diante da implementação imposta onde a numeração dos rótulos é positiva e NÃO nula.

    Contudo, porém, todavia, como esse exerício trata de bits, com sua representação iniciando em 0
    este pequeno ajuste "abstrato" DEVE se ter em mente dado minha impotência diante das restrições.
  =#

  # Funciona apenas até k = 2
  # for i in 0:(2^k-1)
  #   j = 0

  #   while i + 2^j < 2^k
  #     if i != 2^j
  #       nova_aresta!(g, (i + 1, i + 1 + 2^j))
  #     end

  #     j = j + 1
  #   end
  # end

  # Funciona apenas até k = 3
  # for i in 0:(2^k-1)
  #   j = 0

  #   while i + 2^j < 2^k
  #     if i != 2^j && !adjacente(g, i + 1, 1 + 2^j)
  #       nova_aresta!(g, (i + 1, i + 1 + 2^j))
  #     end

  #     j = j + 1
  #   end
  # end

  for i in 0:(2^k-1)
    for j in (i+1):(2^k-1)
      if compara_binarios(converte_binario(i), converte_binario(j)) == 1
        nova_aresta!(g, (i + 1, j + 1))
      end
    end
  end

  return g
end

"""
   petersen()

Devolve o grafo de Petersen.
Veja o exercício E 1.15 do livro do Paulo Feofiloff.
"""

# petersen()::Grafo = nulo()

function petersen()::Grafo
  g = vazio(10)

  for i in 1:10
    if i <= 5
      nova_aresta!(g, (i, i % 5 + 1))
      nova_aresta!(g, (i, i + 5))
    else
      nova_aresta!(g, (i, i + 2 > 10 ? (i + 2) % 5 + 5 : i + 2))
      nova_aresta!(g, (i, i + 3 > 10 ? (i + 3) % 5 + 5 : i + 3))
    end
  end

  return g
end

"""
   ciclo(n)

Devolve um grafo ciclo com |n| vértices.
"""

# ciclo(n::Int)::Grafo = nulo()

function ciclo(n::Int)::Grafo
  if (n < 3)
    return nulo()
  end

  g = vazio(n)

  for i in 1:n
    nova_aresta!(g, (i, i % n + 1))
  end

  return g
end

"""
  completo(n)

Devolve um grafo completo com |n| vértices (K_n).
"""

# completo(n::Int)::Grafo = nulo()

function completo(n::Int)::Grafo
  g = vazio(n)

  for i in 1:(n-1)
    for j in (i+1):n
      nova_aresta!(g, (i, j))
    end
  end

  return g
end

"""
   amigo(n)

Devolve um grafo amigo com |2n+1| vértices e |3n| arestas.
Ver
   https://en.wikipedia.org/wiki/Friendship_graph
"""

# amigo(n::Int)::Grafo = nulo()

function amigo(n::Int)::Grafo
  g = vazio(2 * n + 1)

  for i in 2:2:(2*n)
    nova_aresta!(g, (i - 1, i))
    nova_aresta!(g, (i - 1, 2 * n + 1))
    nova_aresta!(g, (i, 2 * n + 1))
  end

  return g
end

"""
   roda(n)

Devolve um grafo roda com |n| vértices.
Ver
  https://en.wikipedia.org/wiki/Wheel_graph
"""

# roda(n::Int)::Grafo = nulo()

function roda(n::Int)::Grafo
  g = vazio(n)

  for i in 1:(n-1)
    nova_aresta!(g, (i, i % (n - 1) + 1))
    nova_aresta!(g, (i, n))
  end

  return g
end

"""
   estrela(n)

Devolve um grafo estrela com |n+1| vértices.
Ver
   https://pt.wikipedia.org/wiki/Estrela_(teoria_dos_grafos)
"""

# estrela(n::Int)::Grafo = nulo()

function estrela(n::Int)::Grafo
  g = vazio(n + 1)

  for i in 1:n
    nova_aresta!(g, (n + 1, i))
  end

  return g
end

