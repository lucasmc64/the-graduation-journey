# Teoria dos Grafos - Trabalho 1

# Aluno: Lucas Marçal Coutinho
# Matrícula: 11911BCC012


# Exercício 1

function bissexto(ano::Number)::Bool 
  return ano % 4 === 0 ? false : ano % 100 === 0 && ano % 400 !== 0 ? false : true
end

# println(bissexto(2021))
# println(bissexto(2000))
# println(bissexto(2004))

# Exercício 2

function acronimo(name::String)::String
  result = ""

  for char in name
    result *= (char >= 'A') && (char <= 'Z') ? char : ""
  end

  return result
end

println(acronimo("National Aeronautics and Space Administration"))
println(acronimo("Cadastro Nacional de Estabelecimentos de Saúde"))
println(acronimo("Organização do Tratado do Atlântico Norte"))

# Exercício 3



# Exercício 4



# Exercício 5



# Exercício 6


