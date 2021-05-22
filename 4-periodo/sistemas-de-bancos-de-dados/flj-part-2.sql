-- 2

-- -- II

-- -- -- 1

SELECT loja.idloja, nome, quatidade
  FROM produto, estoque, loja
  WHERE 
    produto.idprod = estoque.idprod
    AND
    loja.idloja = estoque.idloja
    AND
    quantidade > 0

-- -- -- 2

SELECT produto.idprod, nome, COUNT(quantidade) AS qtd_vendas
FROM venda_fisica, produto
WHERE
  venda_fisica.idprod = produto.idprod
GROUP BY produto.idprod, nome
ORDER BY nome ASC

-- -- -- 3

SELECT produto.idprod, nome
FROM venda_online, produto
WHERE
  venda_online.idprod = produto.idprod
  AND
  preco >= ALL (
    SELECT preco
    FROM venda_online, produto
    WHERE
      venda_online.idprod = produto.idprod
  )

-- -- III

-- -- -- 1

SELECT cadastrocliente, SUM(quantidade * preco) AS valor_gasto_por_cliente
FROM venda_fisica NATURAL JOIN produto
GROUP BY cadastrocliente

-- -- -- 2

SELECT loja.idloja, COUNT(*) AS num_funcionarios
FROM loja LEFT OUTER JOIN funcionario ON loja.idloja = funcionario.idloja
GROUP BY loja.idloja

-- -- -- 3

SELECT AVG(quantidade * preco) AS gasto_medio_geral
FROM venda_fisica NATURAL JOIN produto, venda_online NATURAL JOIN produto 

-- -- IV

WITH RECURSIVE hierarquiaFunc (nivel, idloja, idfun, nomepes, funcao) AS (
  UNION ALL
)

SELECT DISTINCT nivel, idloja, idfun, nomepes, funcao
FROM hierarquiaFunc
ORDER BY nivel, idloja, idfun;

-- -- VII -> View que informa os nomes dos produtos disponíveis e suas quantidades, sem expor os ids dos produtos ou da respectiva loja a que pertence, além de restingir os dados aos de uma única loja

CREATE VIEW qtdProdutos AS (
  SELECT nome, quatidade
  FROM produto NATURAL JOIN estoque NATURAL JOIN loja
  WHERE 
    quantidade > 0
    AND
    idloja = 1
)