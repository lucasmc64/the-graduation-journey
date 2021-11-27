-- Cria Esquema

DROP SCHEMA IF EXISTS academico CASCADE;
CREATE SCHEMA academico;
SET search_path TO academico;

-- Domínios

-- -- Tipo de Aluno

CREATE DOMAIN tipo_alu as CHAR(1)
CHECK (VALUE IN ('A', 'B', 'C'));

-- Tabelas

CREATE TABLE curso (
    idcur SERIAL PRIMARY KEY,
    nomecur TEXT UNIQUE NOT NULL 
);

CREATE TABLE aluno (
    idalu SERIAL PRIMARY KEY,
    nomealu TEXT NOT NULL,
    tipoalu tipo_alu,
    idcurso INT NOT NULL
);

CREATE TABLE disciplina (
    iddis SERIAL PRIMARY KEY,
    nomedis TEXT NOT NULL
);

CREATE TABLE pre_requisito (
    iddis INT NOT NULL,
    idpre INT NOT NULL,
    PRIMARY KEY (iddis, idpre)
);

CREATE TABLE professor (
    idprof SERIAL PRIMARY KEY,
    nomepro TEXT NOT NULL
);

CREATE TABLE turma (
    idtur SERIAL PRIMARY KEY,
    iddis INT NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    codtur TEXT NOT NULL,
    UNIQUE (iddis, ano, semestre, codtur)
);

CREATE TABLE turpro (
    idtur INT NOT NULL,
    idprof INT NOT NULL,
    PRIMARY KEY (idtur, idprof)
);
status_types
CREATE TABLE historico (
    idtur INT NOT NULL,
    idalu INT NOT NULL,
    nota INT
);

-- Chaves Estrangeiras

-- -- Aluno

ALTER TABLE aluno ADD FOREIGN KEY (idcurso) REFERENCES curso (idcur);

-- -- Pré Requisitos

ALTER TABLE pre_requisito ADD FOREIGN KEY (iddis) REFERENCES disciplina (iddis);

ALTER TABLE pre_requisito ADD FOREIGN KEY (idpre) REFERENCES disciplina (iddis);

-- -- Turma

ALTER TABLE turma ADD FOREIGN KEY (iddis) REFERENCES disciplina (iddis);

-- -- Professor da Turma

ALTER TABLE turpro ADD FOREIGN KEY (idtur) REFERENCES turma (idtur);

ALTER TABLE turpro ADD FOREIGN KEY (idprof) REFERENCES professor (idprof);

-- -- Professor da Turma

ALTER TABLE historico ADD FOREIGN KEY (idtur) REFERENCES turma (idtur);

ALTER TABLE historico ADD FOREIGN KEY (idalu) REFERENCES aluno (idalu);
