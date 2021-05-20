SET SEARCH_PATH TO scm;

-- 1

-- -- A

SELECT nomepes, titulospil
FROM piloto JOIN pessoa ON piloto.idpes = pessoa.idpes

-- -- B

SELECT idcir, nomecir, localcir
FROM circuito
WHERE EXISTS (
  SELECT *
  FROM corrida
  WHERE 
    circuito.idcir = corrida.idcir
    AND
    EXISTS (
      SELECT voltaspar
      FROM participacao
      WHERE 
        corrida.idcor = participacao.idcor
        AND
        corrida.voltascor > participacao.voltaspar
    )
)

-- -- C

SELECT nomecir, datacor, categoriacor
FROM circuito LEFT OUTER JOIN corrida ON circuito.idcir = corrida.idcir
ORDER BY nomecir ASC

-- -- D

SELECT nomeequ, COUNT(*) AS qtdemecanicos
FROM equipe, mecanico NATURAL JOIN pessoa AS mp
WHERE equipe.idequ = mp.idequ
GROUP BY nomeequ
HAVING COUNT(*) > 1

-- -- E

-- 2

CREATE VIEW vencedores AS (
  SELECT part.idcor, datacor, categoriacor, nomepes AS nomeven, 'Piloto' AS tipoven
  FROM participacao AS part, pessoa, corrida
  WHERE
    part.idpes = pessoa.idpes
    AND
    part.idcor = corrida.idcor
    AND
    part.tempopar <= ALL (
      SELECT tempopar
      FROM participacao
      WHERE part.idcor = participacao.idcor
    )
  
  UNION
  
  SELECT part.idcor, datacor, categoriacor, nomeequ AS nomeven, 'Equipe' AS tipoven
  FROM participacao AS part, pessoa, equipe, corrida
  WHERE
    part.idpes = pessoa.idpes
    AND
    pessoa.idequ = equipe.idequ
    AND
    part.idcor = corrida.idcor
    AND
    part.tempopar <= ALL (
      SELECT tempopar
      FROM participacao
      WHERE part.idcor = participacao.idcor
    )
)

-- 3

WITH RECURSIVE hierarquia (nivel, idsup, idpes, nomepes, especialidademec) AS (
  SELECT 0, idsup, mecanico.idpes, nomepes, especialidademec
  FROM mecanico, pessoa, equipe
  WHERE 
    nomeequ = 'Canarinho'
    AND
    mecanico.idpes = pessoa.idpes
    AND
    pessoa.idequ = equipe.idequ
  
  UNION ALL
  
  SELECT nivel + 1, mecanico.idsup, pessoa.idpes, pessoa.nomepes, mecanico.especialidademec
  FROM hierarquia, mecanico, pessoa, equipe
  WHERE 
    mecanico.idpes = pessoa.idpes
    AND
    pessoa.idequ = equipe.idequ
    AND
    hierarquia.idpes = mecanico.idsup
    AND
    mecanico.idpes != mecanico.idsup
)
SELECT DISTINCT nivel, idsup, idpes, nomepes, especialidademec
FROM hierarquia
ORDER BY nivel, idsup, idpes;