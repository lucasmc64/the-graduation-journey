-- Cria Esquema

DROP SCHEMA IF EXISTS sec CASCADE;
CREATE SCHEMA sec;
SET search_path TO sec;

-- Domínios

-- -- Estados da Liberação

CREATE DOMAIN estado_liberacao as CHAR(1)
CHECK (VALUE IN ('P', 'L'));

-- -- Estados do Serviço

CREATE DOMAIN estado_servico as CHAR(1)
CHECK (VALUE IN ('P', 'C', 'E', 'G'));

-- -- Tipo de Pessoas

CREATE DOMAIN tipo_pessoa as CHAR(2)
CHECK (VALUE IN ('ES', 'PR', 'EP'));

-- Tabelas

CREATE TABLE empresa (
    idEmpresa SERIAL PRIMARY KEY,
    cnpj INT UNIQUE NOT NULL,
    nomeEmpresa TEXT
);

CREATE TABLE patrocinadora (
    idEmpresa INT PRIMARY KEY,
    valorPatrocinio INT,
    estadoLiberacao estado_liberacao,
    dataLiberacao TIMESTAMP
);

CREATE TABLE organizadora (
    idEmpresa INT PRIMARY KEY
);

CREATE TABLE promotora (
    idEmpresa INT PRIMARY KEY
);

CREATE TABLE prestadora (
    idEmpresa INT PRIMARY KEY,
    idResponsavel INT NOT NULL
);

CREATE TABLE responsavel (
    idResponsavel SERIAL PRIMARY KEY
);

CREATE TABLE servico (
    idServico SERIAL PRIMARY KEY,
    descricaoServico TEXT,
    custoServico INT,
    estadoServico estado_servico,
    dataTerminoServico TIMESTAMP,
    idResponsavel INT NOT NULL
);

CREATE TABLE pessoa (
    idPessoa SERIAL PRIMARY KEY,
    cpf INT UNIQUE NOT NULL,
    nomePessoa TEXT NOT NULL,
    dataPagamentoInscricao TIMESTAMP,
    tipoPessoa tipo_pessoa,
    idEmpresa INT UNIQUE NOT NULL,
    idResponsavel INT UNIQUE NOT NULL
);

CREATE TABLE tarefa (
    idTarefa SERIAL PRIMARY KEY,
    descricaoTarefa TEXT,
    idPessoa INT NOT NULL,
    idSuperTarefa INT NOT NULL
);

CREATE TABLE inscricao (
    idPessoa INT NOT NULL,
    idTarefa INT NOT NULL,
    PRIMARY KEY (idPessoa, idTarefa)
);

-- Chaves Estrangeiras

-- -- Empresa

ALTER TABLE patrocinadora ADD FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa);

ALTER TABLE organizadora ADD FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa);

ALTER TABLE promotora ADD FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa);

ALTER TABLE prestadora ADD FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa);

-- -- Responsável

ALTER TABLE prestadora ADD FOREIGN KEY (idResponsavel) REFERENCES responsavel (idResponsavel);

ALTER TABLE servico ADD FOREIGN KEY (idResponsavel) REFERENCES responsavel (idResponsavel);

ALTER TABLE pessoa ADD FOREIGN KEY (idResponsavel) REFERENCES responsavel (idResponsavel);

-- -- Tarefa

ALTER TABLE tarefa ADD FOREIGN KEY (idPessoa) REFERENCES pessoa (idPessoa);

ALTER TABLE tarefa ADD FOREIGN KEY (idSuperTarefa) REFERENCES tarefa (idTarefa);

-- -- Inscrição

ALTER TABLE inscricao ADD FOREIGN KEY (idPessoa) REFERENCES pessoa (idPessoa);

ALTER TABLE inscricao ADD FOREIGN KEY (idTarefa) REFERENCES tarefa (idTarefa);
