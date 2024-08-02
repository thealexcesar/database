DROP TABLE IF EXISTS genus, species, habitat CASCADE;
DROP TYPE IF EXISTS HOMINIDAES, regioes;

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE TYPE HOMINIDAES AS ENUM ('Panthera', 'Pongo', 'Gorilla', 'Homo');

CREATE TABLE IF NOT EXISTS genus (
    id SERIAL PRIMARY KEY,
    scientific_name HOMINIDAES UNIQUE NOT NULL DEFAULT 'Homo',
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE IF NOT EXISTS species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    population BIGINT,
    genus_id INTEGER,
    CONSTRAINT fk_genus FOREIGN KEY (genus_id) REFERENCES genus(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS habitat (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    descricao TEXT,
    geom geometry(POLYGON, 4326),
    species_id INTEGER REFERENCES species(id) ON DELETE CASCADE
);

INSERT INTO genus (scientific_name, name, description)
VALUES
    ('Panthera', 'Panthera', 'Gênero que inclui grandes felinos como leões e tigres.'),
    ('Pongo', 'Pongo', 'Gênero que inclui orangotangos.');

INSERT INTO species (name, description, population, genus_id)
VALUES
    ('Ave Migratória Exemplo', 'Espécie de ave migratória que passa pela Amazônia.', 5000, 1),
    ('Mamífero Aquático', 'Mamífero aquático encontrado no Pantanal.', 3000, 1),
    ('Planta Endêmica', 'Espécie de planta endêmica da Mata Atlântica.', 2000, 2),
    ('Espécie do Cerrado', 'Espécie típica do Cerrado.', 1000, 1),
    ('Espécie da Caatinga', 'Espécie adaptada à Caatinga.', 1500, 1);

INSERT INTO habitat (name, geom, species_id)

VALUES
    ('Floresta Amazônica', ST_SetSRID(ST_GeomFromText('POLYGON((-74 -3, -54 -3, -54 5, -74 5, -74 -3))'), 4326), 1),
    ('Pantanal', ST_SetSRID(ST_GeomFromText('POLYGON((-58 -20, -56 -20, -56 -17, -58 -17, -58 -20))'), 4326), 2),
    ('Mata Atlântica', ST_SetSRID(ST_GeomFromText('POLYGON((-45 -25, -35 -25, -35 -15, -45 -15, -45 -25))'), 4326), 3),
    ('Cerrado', ST_SetSRID(ST_GeomFromText('POLYGON((-55 -20, -45 -20, -45 -10, -55 -10, -55 -20))'), 4326), 4),
    ('Caatinga', ST_SetSRID(ST_GeomFromText('POLYGON((-40 -12, -36 -12, -36 -8, -40 -8, -40 -12))'), 4326), 5);

SELECT
    s.name AS species_name,
    s.description AS species_description,
    h.name AS habitat_name,
    ST_AsText(h.geom) AS habitat_geometry
FROM
    species s
JOIN
    habitat h ON s.id = h.species_id;
