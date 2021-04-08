-- Inicia o povoamento do BD

BEGIN TRANSACTION;
SET CONSTRAINTS ALL DEFERRED;
SET SEARCH_PATH TO sec; -- DEFINE ESQUEMA DEFAULT

-- Responsáveis

INSERT INTO responsavel (idResponsavel) VALUES (135795793000015);
INSERT INTO responsavel (idResponsavel) VALUES (12345678901);
INSERT INTO responsavel (idResponsavel) VALUES (98765432101);

-- Empresas

INSERT INTO empresa (cnpj, nomeEmpresa) VALUES (123456789000011, 'Empório do Toucinho');
INSERT INTO empresa (cnpj, nomeEmpresa) VALUES (987654321000012, 'Comercial Passe Aqui');
INSERT INTO empresa (cnpj, nomeEmpresa) VALUES (345678912000013, 'Sorveteria Ki-Doçura');
INSERT INTO empresa (cnpj, nomeEmpresa) VALUES (129834765000014, 'Drogaria Cristina');
INSERT INTO empresa (cnpj, nomeEmpresa) VALUES (135795793000015, 'Dedos de Mel');

-- -- Patrocinadora

INSERT INTO patrocinadora (idEmpresa, valorPatrocinio, estadoLiberacao, dataLiberacao) VALUES (1, 10000, 'L', now());

-- -- Organizadora

INSERT INTO organizadora (idEmpresa) VALUES (2);

-- -- Promotora

INSERT INTO promotora (idEmpresa) VALUES (3);

-- -- Prestadora

INSERT INTO prestadora (idEmpresa, idResponsavel) VALUES (4, 135795793000015);

-- Pessoas

INSERT INTO pessoa (cpf, nomePessoa, dataPagamentoInscricao, tipoPessoa, idEmpresa, idResponsavel) VALUES (12345678901, 'Marília Medonça', now(), 'EP', 1, 12345678901);
INSERT INTO pessoa (cpf, nomePessoa, dataPagamentoInscricao, tipoPessoa, idEmpresa, idResponsavel) VALUES (98765432101, 'Paula Fernandes', now(), 'PR', 2, 98765432101);

-- Serviços

INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) VALUES ('Fazer a poção do amor', 666888, 'C', now(), 135795793000015);
INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) VALUES ('Fazer a poção do sono', 32569, 'P', now(), 135795793000015);
INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) VALUES ('Fazer chover', 14752, 'E', now(), 135795793000015);
INSERT INTO servico (descricaoServico, custoServico, estadoServico, dataTerminoServico, idResponsavel) VALUES ('Vender sapos de chocolate', 1876, 'G', now(), 12345678901);

-- Tarefa

INSERT INTO tarefa (descricaoTarefa, idPessoa, idSuperTarefa) VALUES ('Refazer o site da Tesla', 1, NULL);
INSERT INTO tarefa (descricaoTarefa, idPessoa, idSuperTarefa) VALUES ('Criar SVG e animá-los', 1, 1);

-- Inscrição

INSERT INTO inscricao (idPessoa, idTarefa) VALUES (2, 1);

END TRANSACTION;