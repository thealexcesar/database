-- CREATE DATABASE fabricas;
-- Criando a tabela de Fábricas
CREATE TABLE Fabricas (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(255) NOT NULL,
telefone VARCHAR(20) NOT NULL
);
-- Criando a tabela de Modelos de Carros
CREATE TABLE Modelos (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
descricao TEXT,
imagem BYTEA, -- Armazenamento da imagem em formato binário
potencia INT NOT NULL,
quilometragem INT NOT NULL,
preco_venda_sugerido DECIMAL(10, 2) NOT NULL,
categoria VARCHAR(50) NOT NULL
);
-- Criando a tabela de Carros Produzidos
CREATE TABLE Carros (
numero_serie VARCHAR(50) PRIMARY KEY,
cor VARCHAR(50) NOT NULL,
ano_fabricacao INT NOT NULL,
modelo_id INT REFERENCES Modelos(id),
fabrica_id INT REFERENCES Fabricas(id)
);
-- Criando a tabela de Concessionárias
CREATE TABLE Concessionarias (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(255) NOT NULL,
telefone VARCHAR(20) NOT NULL
);
-- Criando a tabela de Vendedores
CREATE TABLE Vendedores (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
concessionaria_id INT REFERENCES Concessionarias(id)
);
-- Criando a tabela de Clientes
CREATE TABLE Clientes (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(255) NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL
);
-- Criando a tabela de Vendas
CREATE TABLE Vendas (
id SERIAL PRIMARY KEY,
numero_serie_carro VARCHAR(50) REFERENCES Carros(numero_serie),
data_venda DATE NOT NULL,
preco_venda_final DECIMAL(10, 2) NOT NULL,
vendedor_id INT REFERENCES Vendedores(id),
cliente_id INT REFERENCES Clientes(id),
concessionaria_id INT REFERENCES Concessionarias(id)
);
-- Inserindo alguns dados de exemplo nas tabelas Fabricas, Modelos, Carros, Concessionarias, Vendedores, Clientes e Vendas
-- Inserindo dados na tabela Fabricas
INSERT INTO Fabricas (nome, endereco, telefone) VALUES
('Tesla Gigafactory', '3500 Deer Creek Road, Palo Alto, CA', '6506815000'),
('Nissan Leaf Plant', '12345 Example Street, Yokohama, Japan',
'0451234567'),
('BMW i Plant', '5678 Example Lane, Leipzig, Germany', '0341123456'),
('Chevrolet Bolt Plant', '91011 Example Avenue, Detroit, MI', '3131234567');
-- Inserindo dados na tabela Modelos
INSERT INTO Modelos (nome, descricao, potencia, quilometragem,
preco_venda_sugerido, categoria) VALUES
('Tesla Model S', 'Luxury electric sedan', 670, 396, 79999.99, 'Sedan'),
('Nissan Leaf', 'Affordable electric car', 147, 226, 31999.99, 'Hatchback'),
('BMW i3', 'Compact electric car', 170, 153, 44999.99, 'Compact'),
('Chevrolet Bolt EV', 'Electric car with long range', 200, 259, 36999.99,
'Hatchback');
-- Inserindo dados na tabela Carros
INSERT INTO Carros (numero_serie, cor, ano_fabricacao, modelo_id,
fabrica_id) VALUES
('SN123456', 'Red', 2022, 1, 1),
('SN234567', 'Blue', 2023, 2, 2),
('SN345678', 'White', 2021, 3, 3),
('SN456789', 'Black', 2023, 4, 4),
('SN567890', 'Silver', 2022, 2, 3);
-- Inserindo dados na tabela Concessionarias
INSERT INTO Concessionarias (nome, endereco, telefone) VALUES
('Tesla Showroom', '456 Elm Street, San Francisco, CA', '4151234567'),
('Nissan Dealer', '789 Oak Street, Tokyo, Japan', '0351234567'),
('BMW Dealership', '123 Maple Street, Berlin, Germany', '0301234567'),
('Chevrolet Dealer', '456 Pine Street, New York, NY', '2121234567');
-- Inserindo dados na tabela Vendedores
INSERT INTO Vendedores (nome, concessionaria_id) VALUES
('Alice Smith', 1),
('Bob Johnson', 2),
('Charlie Brown', 3),
('David Wilson', 4),
('Eve Davis', 1);
-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (nome, endereco, telefone, email) VALUES
('John Doe', '789 Birch Street, Austin, TX, USA', '5121234567', 'john.doe@example.com'),
('Jane Roe', '101 Pine Street, London, UK', '0201234567', 'jane.roe@example.com'),
('Richard Roe', '202 Cedar Street, Paris, France', '0145123456', 'richard.roe@example.com'),
('Mary Major', '303 Spruce Street, Sydney, Australia', '0291234567', 'mary.major@example.com'),
('James Smith', '404 Fir Street, Toronto, Canada', '4161234567', 'james.smith@example.com'),
('Alice Johnson', '505 Maple Street, New York, NY, USA', '2121234567', 'alice.johnson@example.com');
-- Inserindo dados na tabela Vendas
INSERT INTO Vendas (numero_serie_carro, data_venda, preco_venda_final,
vendedor_id, cliente_id, concessionaria_id) VALUES
('SN123456', '2023-05-01', 79999.99, 1, 1, 1),
('SN234567', '2023-06-15', 31999.99, 2, 2, 2),
('SN345678', '2022-11-20', 44999.99, 3, 3, 3),
('SN456789', '2023-07-04', 36999.99, 4, 4, 4),
('SN567890', '2023-08-10', 33999.99, 1, 5, 3);