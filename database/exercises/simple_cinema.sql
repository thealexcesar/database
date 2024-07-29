-- CREATE DATABASE simple_cinema;
CREATE TABLE IF NOT EXISTS cinema (
    id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    genre VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL
);

INSERT INTO cinema (movie_name, director, release_year, genre, duration_minutes) VALUES
    ('A Origem', 'Christopher Nolan', 2010, 'Ficção Científica', 148),
    ('O Poderoso Chefão', 'Francis Ford Coppola', 1972, 'Drama', 175),
    ('Fight Club (Clube da Luta)', 'David Fincher', 1999, 'Thriller', 139),
    ('Deadpool & Wolverine', 'Shawn Levy', 2024, 'Aventura', 127),
    ('Matrix', 'Lana Wachowski', 1999, 'Ficção Científica', 136);

SELECT * FROM cinema;

UPDATE cinema SET duration_minutes = 150 WHERE movie_name = 'Matrix';
SELECT movie_name AS nome, duration_minutes AS "Duração Atualizada de MAtrix agora é" FROM cinema WHERE movie_name = 'Matrix';

ALTER TABLE cinema ADD COLUMN IF NOT EXISTS rating DECIMAL(3,1);
UPDATE cinema SET rating = 9.2 WHERE movie_name = 'O Poderoso Chefão';
SELECT movie_name, rating FROM cinema;

SELECT * FROM cinema WHERE genre = 'Ficção Científica';
SELECT * FROM cinema ORDER BY release_year DESC;

DELETE FROM cinema WHERE movie_name = 'A Origem';
SELECT movie_name FROM cinema;