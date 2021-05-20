SET SEARCH_PATH TO sec; -- DEFINE ESQUEMA DEFAULT

-- 8.1

-- -- A

-- -- B

-- -- C

CREATE VIEW vpatrocinioevento AS
  SELECT SUM(valorPatrocinio)
  FROM sec.patrocinadora

-- -- D

CREATE VIEW vservicoatrasado AS
  (
    SELECT descricaoServico, estadoServico, dataTerminoServico, nomePessoa AS nome_responsavel
    FROM (sec.responsavel JOIN sec.pessoa ON sec.responsavel.idResponsavel = sec.pessoa.idResponsavel) AS rp JOIN sec.servico ON rp.idResponsavel - sec.servico.idResponsavel

    UNION

    SELECT descricaoServico, estadoServico, dataTerminoServico, nomeEmpresa AS nome_responsavel
    FROM ((sec.responsavel JOIN sec.patrocinadora ON sec.responsavel.idResponsavel = sec.patrocinadora.idResponsavel) AS rp JOIN sec.empresa ON rp.idEmpresa = sec.empresa.idEmpresa) AS rpe JOIN sec.servico ON rpe.idResponsavel - sec.servico.idResponsavel
  )
  
-- FALTA: para cada serviço cuja data de término seja inferior ao dia corrente 1 e cujo estado seja 'previsto' ou 'contratado';

-- 8.2

-- -- Disponibilidade: A última consulta é mais simples (para o usuário da visão).

CREATE VIEW valorPatrocinioDisponivel AS
  SELECT SUM(valorPatrocinio)
  FROM sec.patrocinadora
  WHERE sec.patrocinadora.estadoLiberacao = 
  
GRANT SELECT ON valorPatrocinioDisponivel TO lucas_marcal;
  
SELECT * FROM valorPatrocinioDisponivel;

-- -- Confidencialidade: Lista apenas o id (referente a empresa no banco de dados) da empresa patrocinadora e o seu nome, não expondo seu CNPJ nem o valor cedido como patrocínio.

CREATE VIEW empresasPatrocinadoras AS
  SELECT idEmpresa, nomeEmpresa
  FROM sec.patrocinadora JOIN sec.empresa ON sec.patrocinadora.idEmpresa = sec.empresa.idEmpresa

-- -- Integridade: Não é possível fazer atualização por deio de uma visão como essa, o que diminui o risco de alterações indevidas no BD.

CREATE VIEW vservicoatrasado AS
  (
    SELECT descricaoServico, estadoServico, dataTerminoServico, nomePessoa AS nome_responsavel
    FROM (sec.responsavel JOIN sec.pessoa ON sec.responsavel.idResponsavel = sec.pessoa.idResponsavel) AS rp JOIN sec.servico ON rp.idResponsavel - sec.servico.idResponsavel

    UNION

    SELECT descricaoServico, estadoServico, dataTerminoServico, nomeEmpresa AS nome_responsavel
    FROM ((sec.responsavel JOIN sec.patrocinadora ON sec.responsavel.idResponsavel = sec.patrocinadora.idResponsavel) AS rp JOIN sec.empresa ON rp.idEmpresa = sec.empresa.idEmpresa) AS rpe JOIN sec.servico ON rpe.idResponsavel - sec.servico.idResponsavel
  )

-- 8.3

-- -- A

WITH RECURSIVE hierarquiaSubtarefas (nivel, idSuperTarefa, idTarefa, descricaoTarefa) AS
  (
    SELECT 0, idSuperTarefa, idTarefa, descricaoTarefa
    FROM sec.tarefa
    WHERE sec.tarefa.idTarefa = 1

    UNION ALL

    SELECT nivel + 1, idSuperTarefa, idTarefa, descricaoTarefa
    FROM hierarquiaSubtarefas, sec.tarefa
    WHERE hierarquiaSubtarefas.idTarefa = sec.tarefa.idSuperTarefa
  )


-- -- B