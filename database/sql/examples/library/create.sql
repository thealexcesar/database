-- Criando as tabelas
CREATE TABLE IF NOT EXISTS Autor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS genero (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS livro (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento INT,
    autor_id INT REFERENCES Autor(id),
    genero_id INT REFERENCES genero(id)
);

-- Inserindo autores
INSERT INTO Autor (nome)
VALUES
    ('J.K. Rowling'),
    ('George R.R. Martin'),
    ('J.R.R. Tolkien');

-- Inserindo gêneros
INSERT INTO genero (nome)
VALUES
    ('Fantasia'),
    ('Ficção Científica'),
    ('Mistério');

-- Inserindo livros
INSERT INTO livro (titulo, ano_lancamento, autor_id, genero_id)
VALUES
    ('Harry Potter e a Pedra Filosofal', 1997, 1, 1),
    ('As Crônicas de Gelo e Fogo', 1996, 2, 1),
    ('O Senhor dos Anéis', 1954, 3, 1),
    ('Duna', 1965, 4, 2),
    ('O Hobbit', 1937, 3, 1);
