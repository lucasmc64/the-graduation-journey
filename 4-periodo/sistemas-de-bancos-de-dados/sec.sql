-- DROP SCHEMA sec CASCADE;
-- Testar:
-- -- DROP SCHEMA IF EXISTS sec CASCADE;
CREATE SCHEMA sec;
SET search_path TO sec;

-- Tabelas

CREATE TABLE empresa (
    idEmpresa SERIAL PRIMARY KEY,
    cnpj INT,
    nomeEmpresa TEXT
);

CREATE TABLE patrocinadora (
    idEmpresa INT PRIMARY KEY,
    valorPatrocinio INT,
    estadoLiberacao TEXT, -- ???
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
    idResponsavel INT 
);

CREATE TABLE responsavel (
    idResponsavel SERIAL PRIMARY KEY
);

CREATE TABLE servico (
    idServico SERIAL PRIMARY KEY,
    descricaoServico TEXT,
    custoServico INT,
    estadoServico TEXT, -- ???
    dataTerminoServico TIMESTAMP,
    idResponsavel INT
);

CREATE TABLE pessoa (

);

CREATE TABLE tarefa (
    idTarefa SERIAL PRIMARY KEY,
    descricaoTarefa TEXT,
    idPessoa INT,
    idSuperTarefa INT
);

CREATE TABLE inscricao (

);

-- Chaves Estrangeiras

-- -- Empresa

ALTER TABLE "patrocinadora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("idEmpresa");

ALTER TABLE "organizadora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("idEmpresa");

ALTER TABLE "promotora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("idEmpresa");

ALTER TABLE "prestadora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("idEmpresa");

-- -- Responsável

ALTER TABLE "prestadora" ADD FOREIGN KEY ("idResponsavel") REFERENCES "responsavel" ("idResponsavel");

ALTER TABLE "servico" ADD FOREIGN KEY ("idResponsavel") REFERENCES "responsavel" ("idResponsavel");

-- -- Tarefa

