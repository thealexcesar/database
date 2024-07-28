CREATE TABLE Generos (
    id SERIAL PRIMARY KEY,
    nome_genero VARCHAR(100) NOT NULL,
    descricao_genero TEXT,
    origem_geografica_genero VARCHAR(100)
);

-- CREATE DATABASE especie_genero;
-- DROP DATABASE IF EXISTS especie_genero;

CREATE TABLE IF NOT EXISTS especies (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(255),
    populacao INT,
    habitat VARCHAR(255)
);