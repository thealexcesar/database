-- CREATE DATABASE clinic;
CREATE TABLE IF NOT EXISTS pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS medicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    crm VARCHAR(20),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS consultas (
    id SERIAL PRIMARY KEY,
    data_consulta TIMESTAMP,
    descricao TEXT,
    id_paciente  INT NOT NULL REFERENCES pacientes(id) ON DELETE CASCADE,
    id_medico  INT NOT NULL REFERENCES medicos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS especiadades (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);