-- Cria Esquema

DROP SCHEMA IF EXISTS flj CASCADE;
CREATE SCHEMA flj;
SET SEARCH_PATH TO flj;

-- -- Vendas Online e Físicas

CREATE DOMAIN tipo_pagamento_o as CHAR(2)
CHECK (VALUE IN ('CC', 'CD', 'BL')); -- Cartão de Crédito, Cartão de Débito e Boleto Bancário
CREATE DOMAIN tipo_pagamento_f as CHAR(2)
CHECK (VALUE IN ('CC', 'CD', 'AV', ‘PI’)); -- Cartão de Crédito, Cartão de Débito, À Vista e Pix

-- Tabelas

CREATE TABLE loja (
	idloja SERIAL PRIMARY KEY,
	cnpj BIGINT UNIQUE NOT NULL,
	idgerente INT NOT NULL,
	endereco TEXT,
	cep INT,
	tel INT
);

CREATE TABLE pessoa (
 	cpf INT PRIMARY KEY,
 	nomepes TEXT NOT NULL,
 	datanasc DATE NOT NULL,
 	endereco TEXT,
 	cep INT,
 	tel INT
);

CREATE TABLE cliente (
 	cpf INT PRIMARY KEY,
 	cadastro TEXT UNIQUE NOT NULL
);

CREATE TABLE funcionario (
 	idfun SERIAL PRIMARY KEY,
 	cpf INT UNIQUE NOT NULL,
 	idloja INT UNIQUE NOT NULL,
 	salario INT NOT NULL,
 	funcao TEXT NOT NULL,
 	dataent DATE NOT NULL
);

CREATE TABLE produto (
 	idprod SERIAL PRIMARY KEY,
 	nome TEXT NOT NULL,
 	descricao TEXT,
 	console TEXT NOT NULL,
 	preco INT NOT NULL
);

CREATE TABLE estoque (
 	idloja INT UNIQUE NOT NULL,
 	idprod INT UNIQUE NOT NULL,
 	quantidade INT NOT NULL
);

CREATE TABLE empresa (
 	cnpj BIGINT PRIMARY KEY,
 	nomeemp TEXT NOT NULL,
 	endereco TEXT,
 	cep INT,
 	tel INT
);

CREATE TABLE fornecedor (
 	cnpj BIGINT PRIMARY KEY
);

CREATE TABLE transportador (
 	cnpj BIGINT PRIMARY KEY
);

CREATE TABLE compra (
 	idcompra SERIAL PRIMARY KEY,
 	cnpjfornecedor BIGINT NOT NULL,
 	idprod INT NOT NULL,
 	quantidade INT NOT NULL,
 	preco INT NOT NULL,
 	data DATE NOT NULL
);

CREATE TABLE transporte_estoque (
 	idtransporte SERIAL PRIMARY KEY,
 	idlojadistribuidora INT NOT NULL,
 	idlojadestino INT NOT NULL,
 	cnpjtransportador BIGINT NOT NULL,
 	idprod INT NOT NULL,
 	quantidade INT NOT NULL,
 	datasaida DATE NOT NULL,
 	dataprevista DATE NOT NULL,
 	custo INT NOT NULL
);

CREATE TABLE entrega (
 	codigorastreamento TEXT PRIMARY KEY,
 	idlojasaida INT NOT NULL,
	cnpjtransportador BIGINT NOT NULL,
 	cadastrocliente TEXT NOT NULL,
 	idprod INT NOT NULL,
 	quantidade INT NOT NULL,
 	datasaida DATE NOT NULL,
 	dataprevista DATE NOT NULL,
 	custo INT NOT NULL
);

CREATE TABLE venda_fisica (
 	idvendafi SERIAL PRIMARY KEY,
 	idloja INT NOT NULL,
 	cadastrocliente TEXT NOT NULL,
 	idprod INT NOT NULL,
 	quantidade INT NOT NULL,
 	tipopag tipo_pagamento_f NOT NULL,
 	data DATE NOT NULL
);

CREATE TABLE venda_online (
 	idvendaon SERIAL PRIMARY KEY,
 	cadastrocliente TEXT NOT NULL,
 	idprod INT NOT NULL,
 	quantidade INT NOT NULL,
 	tipopag tipo_pagamento_o NOT NULL,
 	data DATE NOT NULL,
 	codigorastreamento TEXT UNIQUE NOT NULL
);

-- Chaves Estrangeiras

-- -- Loja

ALTER TABLE loja ADD FOREIGN KEY (idgerente) REFERENCES funcionario (idfun);

-- -- Cliente

ALTER TABLE cliente ADD FOREIGN KEY (cpf) REFERENCES pessoa (cpf);

-- -- Funcionário

ALTER TABLE funcionario ADD FOREIGN KEY (cpf) REFERENCES pessoa (cpf);
ALTER TABLE funcionario ADD FOREIGN KEY (idloja) REFERENCES loja (idloja);

-- -- Estoque

ALTER TABLE estoque ADD FOREIGN KEY (idloja) REFERENCES loja (idloja);
ALTER TABLE estoque ADD FOREIGN KEY (idprod) REFERENCES produto (idprod);

-- -- Fornecedor

ALTER TABLE fornecedor ADD FOREIGN KEY (cnpj) REFERENCES empresa (cnpj);

-- -- Transportador

ALTER TABLE transportador ADD FOREIGN KEY (cnpj) REFERENCES empresa (cnpj);

-- -- Compra

ALTER TABLE compra ADD FOREIGN KEY (cnpjfornecedor) REFERENCES fornecedor (cnpj);
ALTER TABLE compra ADD FOREIGN KEY (idprod) REFERENCES produto (idprod);

-- -- Transporte Estoque

ALTER TABLE transporte_estoque ADD FOREIGN KEY (idlojadistribuidora) REFERENCES loja (idloja);
ALTER TABLE transporte_estoque ADD FOREIGN KEY (idlojadestino) REFERENCES loja (idloja);
ALTER TABLE transporte_estoque ADD FOREIGN KEY (cnpjtransportador) REFERENCES transportador (cnpj);
ALTER TABLE transporte_estoque ADD FOREIGN KEY (idprod) REFERENCES produto (idprod);

-- -- Entrega

ALTER TABLE entrega ADD FOREIGN KEY (idlojasaida) REFERENCES loja (idloja);
ALTER TABLE entrega ADD FOREIGN KEY (cnpjtransportador) REFERENCES transportador (cnpj);
ALTER TABLE entrega ADD FOREIGN KEY (cadastrocliente) REFERENCES cliente (cadastro);
ALTER TABLE entrega ADD FOREIGN KEY (idprod) REFERENCES produto (idprod);

-- -- Venda Física

ALTER TABLE venda_fisica ADD FOREIGN KEY (idloja) REFERENCES loja (idloja);
ALTER TABLE venda_fisica ADD FOREIGN KEY (cadastrocliente) REFERENCES cliente (cadastro);
ALTER TABLE venda_fisica ADD FOREIGN KEY (idprod) REFERENCES produto (idprod);

-- -- Venda Online

ALTER TABLE venda_online ADD FOREIGN KEY (cadastrocliente) REFERENCES cliente (cadastro);
ALTER TABLE venda_online ADD FOREIGN KEY (idprod) REFERENCES produto (idprod);
ALTER TABLE venda_online ADD FOREIGN KEY (codigorastreamento) REFERENCES entrega (codigorastreamento);
