-- Cria Esquema

DROP SCHEMA IF EXISTS scm CASCADE;
CREATE SCHEMA scm;
SET search_path TO scm;

-- Domínios

-- -- Tipo de Pessoa

CREATE DOMAIN tipo_pes as CHAR(1)
CHECK (VALUE IN ('P', 'M'));

-- Tabelas

CREATE TABLE equipe (
    idequ SERIAL PRIMARY KEY,
    nomeequ TEXT UNIQUE NOT NULL,
    paisequ TEXT,
    titulosequ TEXT
);

CREATE TABLE pessoa (
    idpes SERIAL PRIMARY KEY,
    nomepes TEXT NOT NULL,
    tipopes tipo_pes,
    idequ INT NOT NULL 
);

CREATE TABLE piloto (
    idpes INT PRIMARY KEY, 
    titulospes TEXT, 
    pontuacao INT
);

CREATE TABLE mecanico (
    idpes INT PRIMARY KEY, 
    especialidademec TEXT
);

CREATE TABLE circuito (
    idcir SERIAL PRIMARY KEY,
    nomecir TEXT UNIQUE NOT NULL, 
    paiscir TEXT
);

CREATE TABLE corrida (
    idcor SERIAL PRIMARY KEY,
    datacor TIMESTAMP NOT NULL,
    idcir INT NOT NULL, 
    categoria TEXT NOT NULL,
    nvoltas INT,
    UNIQUE (datacor, idcir, categoria)
);

CREATE TABLE participacao (
    idpes INT NOT NULL,
    idcor INT NOT NULL,
    tempo INT,
    PRIMARY KEY (idpes, idcor)
);



-- Chaves Estrangeiras

-- -- Pessoa

ALTER TABLE pessoa ADD FOREIGN KEY (idequ) REFERENCES equipe (idequ);

-- -- Piloto

ALTER TABLE piloto ADD FOREIGN KEY (idpes) REFERENCES pessoa (idpes);

-- -- Mecânico

ALTER TABLE mecanico ADD FOREIGN KEY (idpes) REFERENCES pessoa (idpes);

-- -- Corrida

ALTER TABLE corrida ADD FOREIGN KEY (idcir) REFERENCES circuito (idcir);


-- -- Participação

ALTER TABLE participacao ADD FOREIGN KEY (idpes) REFERENCES piloto (idpes);

ALTER TABLE participacao ADD FOREIGN KEY (idcor) REFERENCES corrida (idcor);

