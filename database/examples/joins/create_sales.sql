-- CREATE DATABASE sales;
-- DROP DATABASE sales;
CREATE TABLE IF NOT EXISTS cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pedido (
    id SERIAL PRIMARY KEY,
    data DATE,
    cliente_id INT REFERENCES cliente(id)
);

INSERT INTO cliente (nome) VALUES
    ('João'),
    ('Maria'),
    ('Pedro'),
    ('Ana');

INSERT INTO pedido (data, cliente_id) VALUES
    ('2024-07-01', 1),
    ('2024-07-20', 1),
    ('2024-07-08', 2);

-- DROP TABLE IF EXISTS pedido, cliente;
