-- Você pode executar só o BD ou só o esquema se preferir

-- Cria Banco de dados

DROP DATABASE IF EXISTS infernava;
CREATE DATABASE infernava WITH OWNER lucasmc64; -- Favor mudar para o seu usuário

-- Cria Esquema

-- DROP SCHEMA IF EXISTS infernava CASCADE;
-- CREATE SCHEMA infernava;
-- SET search_path TO infernava;

-- -- Tipos de Categorias

CREATE DOMAIN category_types as TEXT
CHECK (VALUE IN ('standard', 'family', 'top'));

-- -- Tipos de Status

CREATE DOMAIN status_types as TEXT
CHECK (VALUE IN ('livre', 'ocupado'));

-- Tabelas

CREATE TABLE accommodation (
    id SERIAL PRIMARY KEY,
    number INT UNIQUE NOT NULL,
    category category_types NOT NULL,
    cost FLOAT NOT NULL,
    capacity INT NOT NULL,
    status status_types NOT NULL
);

CREATE TABLE guest (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL,
    age INT NOT NULL CHECK (age >= 18)
);

CREATE TABLE reserve (
    id SERIAL PRIMARY KEY,
    cpf TEXT NOT NULL,
    entryDate DATE NOT NULL,
    departureDate DATE NOT NULL,
    guestsQuantity INT NOT NULL,
    accommodationNumber INT NOT NULL,
    checkOut BOOLEAN DEFAULT false
);

-- Chaves Estrangeiras

ALTER TABLE reserve ADD FOREIGN KEY (accommodationNumber) REFERENCES accommodation (number);