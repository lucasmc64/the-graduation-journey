# Teoria dos Grafos - Trabalho 1

# Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012


# Exercício 1

function bissexto(ano::Int64)::Bool 
  return (ano % 4 === 0 && ano % 100 !== 0) || ano % 400 === 0
end

println("Exercício 1")

println(bissexto(2021))
println(bissexto(2000))
println(bissexto(2004))

println("")

# Exercício 2

function acronimo(name::String)::String
  result = ""

  for char in name
    result *= (char >= 'A') && (char <= 'Z') ? char : ""
  end

  return result
end

println("Exercício 2")

println(acronimo("National Aeronautics and Space Administration"))
println(acronimo("Cadastro Nacional de Estabelecimentos de Saúde"))
println(acronimo("Organização do Tratado do Atlântico Norte"))

println("")

# Exercício 3

function romano(ano::Int64)::String
  return ""
end

println("Exercício 3")


println("")

# Exercício 4

println("Exercício 4")


println("")

# Exercício 5

println("Exercício 5")


println("")

# Exercício 6


println("Exercício 6")

println("")
