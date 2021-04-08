-- Inicia o povoamento do BD

BEGIN TRANSACTION;
SET CONSTRAINTS ALL DEFERRED;
SET SEARCH_PATH TO sec; -- DEFINE ESQUEMA DEFAULT

-- Responsáveis

INSERT INTO responsavel (idResponsavel) 
VALUES (13579000015);
INSERT INTO responsavel (idResponsavel) 
VALUES (12345678901);
INSERT INTO responsavel (idResponsavel) 
VALUES (98765432101);
INSERT INTO responsavel (idResponsavel) 
VALUES (13467156345);
INSERT INTO responsavel (idResponsavel) 
VALUES (34834736647);
INSERT INTO responsavel (idResponsavel) 
VALUES (23848378724);


-- Empresas

INSERT INTO empresa (idEmpresa, cnpj, nomeEmpresa) 
VALUES (1, 12345678000011, 'BioCorp.');
INSERT INTO empresa (idEmpresa, cnpj, nomeEmpresa) 
VALUES (2, 98765432000012, 'SpaceEngine');
INSERT INTO empresa (idEmpresa, cnpj, nomeEmpresa) 
VALUES (3, 34567891000013, 'ChemicalLifes');
INSERT INTO empresa (idEmpresa, cnpj, nomeEmpresa) 
VALUES (4, 12983476000014, 'RoboTech');
INSERT INTO empresa (idEmpresa, cnpj, nomeEmpresa) 
VALUES (5, 13579579000015, 'LogicBrains');

-- -- Patrocinadora

INSERT INTO patrocinadora (idEmpresa, valorPatrocinio, estadoLiberacao, dataLiberacao) 
VALUES (2, 10000, 'L', now());

INSERT INTO patrocinadora (idEmpresa, valorPatrocinio, estadoLiberacao, dataLiberacao) 
VALUES (1, 15000, 'L', now());

-- -- Organizadora

INSERT INTO organizadora (idEmpresa) 
VALUES (1);
INSERT INTO organizadora (idEmpresa) 
VALUES (5);

-- -- Promotora

INSERT INTO promotora (idEmpresa) 
VALUES (2);
INSERT INTO promotora (idEmpresa) 
VALUES (3);

-- -- Prestadora

INSERT INTO prestadora (idEmpresa, idResponsavel) 
VALUES (4, 13579000015);
INSERT INTO prestadora (idEmpresa, idResponsavel) 
VALUES (5, 13467156345);

-- Pessoas

INSERT INTO pessoa (cpf, nomePessoa, dataPagamentoInscricao, tipoPessoa, idEmpresa, idResponsavel) 
VALUES (11122233344, 'Marília Medonça', now(), 'EP', 1, 12345678901);
INSERT INTO pessoa (cpf, nomePessoa, dataPagamentoInscricao, tipoPessoa, idEmpresa, idResponsavel) 
VALUES (55562677788, 'Paula Fernandes', now(), 'PR', 2, 98765432101);
INSERT INTO pessoa (cpf, nomePessoa, dataPagamentoInscricao, tipoPessoa, idEmpresa, idResponsavel) 
VALUES (63453652634, 'Romero Britto', now(), 'ES', 3, 34834736647);
INSERT INTO pessoa (cpf, nomePessoa, dataPagamentoInscricao, tipoPessoa, idEmpresa, idResponsavel) 
VALUES (34657663474, 'Fausto Silva', now(), 'PR', 4, 23848378724);

-- Serviços

INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) 
VALUES ('Manage Data Base', 666888, 'C', now(), 13579000015);
INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) 
VALUES ('Offer logistics solutions', 32569, 'P', now(), 13579000015);
INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) 
VALUES ('Fix software bugs', 14752, 'E', now(), 98765432101);
INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) 
VALUES ('Manage start-up applications', 1876, 'G', now(), 12345678901);
INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) 
VALUES ('Manage event staff', 45000, 'C', now(), 13467156345);


-- Tarefa

INSERT INTO tarefa (descricaoTarefa, idPessoa, idSuperTarefa) 
VALUES ('Build swimmer robot prototype', 2, NULL);
INSERT INTO tarefa (descricaoTarefa, idPessoa, idSuperTarefa) 
VALUES ('Develop face-recognition software', 1, 1);
INSERT INTO tarefa (descricaoTarefa, idPessoa, idSuperTarefa) 
VALUES ('Develop drone software', 3, NULL);
INSERT INTO tarefa (descricaoTarefa, idPessoa, idSuperTarefa) 
VALUES ('Build a game console that makes coffee', 4, NULL);

-- Inscrição

INSERT INTO inscricao (idPessoa, idTarefa) 
VALUES (2, 1);
INSERT INTO inscricao (idPessoa, idTarefa) 
VALUES (1, 2);
INSERT INTO inscricao (idPessoa, idTarefa) 
VALUES (3, 3);
INSERT INTO inscricao (idPessoa, idTarefa) 
VALUES (4, 4);


END TRANSACTION;
