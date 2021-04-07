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
    idEmpresa INT,
    valorPatrocinio INT,
    estadoLiberacao TEXT, -- ???
    dataLiberacao TIMESTAMP
);

CREATE TABLE organizadora (
    idEmpresa INT
);

CREATE TABLE promotora (
    idEmpresa INT
);

CREATE TABLE prestadora (
    idEmpresa INT,
    idResponsavel INT 
);

-- Chaves Estrangeiras

ALTER TABLE "patrocinadora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("id");

ALTER TABLE "organizadora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("id");

ALTER TABLE "promotora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("id");

ALTER TABLE "prestadora" ADD FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("id");
