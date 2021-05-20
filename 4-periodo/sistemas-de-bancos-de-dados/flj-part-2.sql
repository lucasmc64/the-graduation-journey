-- 2

-- -- IV

WITH RECURSIVE nome () AS (
  UNION ALL
)

SELECT DISTINCT 
FROM nome
ORDER BY ;

-- -- VII -> View que informa os nomes dos produtos disponíveis e suas quantidades, sem expor os ids dos produtos ou da respectiva loja a que pertence, além de restingir os dados aos de uma única loja

CREATE VIEW qtdProdutos AS (
  SELECT nome, quatidade
  FROM produto NATURAL JOIN estoque NATURAL JOIN loja
  WHERE 
    quantidade > 0
    AND
    idloja = 1
)