/*-- DROP DATABASE seres_vivos;
-- CREATE DATABASE seres_vivos;
DROP TABLE IF EXISTS dominio, reino, filo, classe, ordem, familia, genero, especie, habitat, especie_habitat, doenca, especie_doenca, populacao CASCADE;
DROP FUNCTION IF EXISTS atualizar_status_conservacao CASCADE;
DROP TYPE IF EXISTS DOMAINS,REINOS,STATUS CASCADE;

CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TYPE DOMAINS AS ENUM('Eukarya', 'Bacteria');
CREATE TYPE  REINOS AS ENUM('Animalia', 'Monera', 'Protista', 'Fungi', 'Plantae', 'Archaea');
CREATE TYPE STATUS AS ENUM (
    'Não Avaliado',
    'Extinto',
    'Extinto na Natureza',
    'Criticamente em Perigo',
    'Em Perigo',
    'Vulnerável',
    'Quase Ameaçado',
    'Pouco Preocupante',
    'Dados Insuficientes'
);

CREATE TABLE IF NOT EXISTS dominio (
     id SERIAL PRIMARY KEY,
     nome_cientifico DOMAINS NOT NULL UNIQUE DEFAULT 'Eukarya'
);

CREATE TABLE IF NOT EXISTS reino (
    id SERIAL PRIMARY KEY,
    nome_cientifico REINOS NOT NULL UNIQUE DEFAULT 'Animalia',
    nome VARCHAR(100),
    descricao TEXT,
    dominio_id BIGINT NOT NULL,
    CONSTRAINT fk_domain FOREIGN KEY (dominio_id) REFERENCES dominio(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS filo (
    id SERIAL PRIMARY KEY,
    nome_cientifico VARCHAR(100) NOT NULL UNIQUE,
    nome VARCHAR(100),
    descricao TEXT,
    reino_id BIGINT NOT NULL,
    CONSTRAINT fk_reino FOREIGN KEY (reino_id) REFERENCES reino(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS classe (
    id SERIAL PRIMARY KEY,
    nome_cientifico varchar(100) NOT NULL UNIQUE,
    nome varchar(100),
    descricao TEXT,
    filo_id BIGINT NOT NULL,
    CONSTRAINT fk_filo_id FOREIGN KEY (filo_id)REFERENCES filo(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ordem (
    id SERIAL PRIMARY KEY,
    nome_cientifico varchar(100) NOT NULL UNIQUE,
    nome varchar(100),
    descricao TEXT,
    classe_id BIGINT NOT NULL,
    CONSTRAINT fk_classe_id FOREIGN KEY (classe_id) REFERENCES classe(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS familia (
    id SERIAL PRIMARY KEY,
    nome_cientifico varchar(100) NOT NULL UNIQUE,
    nome varchar(100),
    descricao TEXT,
    ordem_id BIGINT NOT NULL,
    CONSTRAINT fk_ordem_id FOREIGN KEY (ordem_id) REFERENCES ordem(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS genero (
   id SERIAL PRIMARY KEY,
   nome_cientifico varchar(100) NOT NULL UNIQUE,
   nome varchar(100),
   descricao TEXT,
   familia_id BIGINT NOT NULL,
   CONSTRAINT fk_familia_id FOREIGN KEY (familia_id) REFERENCES familia(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS especie (
    id SERIAL PRIMARY KEY,
    nome_cientifico varchar(100) NOT NULL UNIQUE,
    nome varchar(100),
    descricao TEXT,
    status_conservacao STATUS NOT NULL DEFAULT 'Não Avaliado',
    populacao BIGINT NOT NULL DEFAULT 0 CHECK (populacao >= 0),
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em DATE NOT NULL DEFAULT CURRENT_DATE,
    genero_id BIGINT NOT NULL,
    localizacao_pontual geometry(POINT, 4326),
    CONSTRAINT fk_genero_id FOREIGN KEY (genero_id) REFERENCES genero(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS habitat (
    id SERIAL PRIMARY KEY,
    bioma varchar(255) NOT NULL UNIQUE DEFAULT 'Amazônia',
    localizacao geometry(POLYGON, 4326) NOT NULL
);

CREATE TABLE IF NOT EXISTS especie_habitat (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    habitat_id BIGINT NOT NULL,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE,
    CONSTRAINT fk_habitat FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS doenca (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT,
    taxa_mortalidade INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS especie_doenca (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    doenca_id BIGINT NOT NULL,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE,
    CONSTRAINT fk_doenca FOREIGN KEY (doenca_id) REFERENCES doenca(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS area (
    id SERIAL PRIMARY KEY,
    localizacao geometry(POLYGON, 4326) NOT NULL,
    desmatado BOOLEAN DEFAULT FALSE,
    protegido BOOLEAN DEFAULT FALSE,
    habitat_id BIGINT NOT NULL,
    CONSTRAINT fk_habitat FOREIGN KEY (habitat_id) REFERENCES habitat(id) ON DELETE CASCADE
);

-- CREATE TABLE IF NOT EXISTS populacao (
--     id SERIAL PRIMARY KEY,
--     nome VARCHAR(255),
--     qtd_populacao BIGINT NOT NULL DEFAULT 0 CHECK (qtd_populacao >= 0),
--     criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     atualizado_em DATE NOT NULL DEFAULT CURRENT_DATE,
--     especie_id BIGINT NOT NULL,
--     CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
-- );

/* Functions
--------------------------------------------------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION atualizar_status_conservacao() RETURNS TRIGGER AS
$$
    BEGIN
        UPDATE especie
        SET status_conservacao = CASE
            WHEN NEW.populacao = 0 THEN 'Extinto'::STATUS
            WHEN NEW.populacao BETWEEN 1 AND 500 THEN 'Criticamente em Perigo'::STATUS
            WHEN NEW.populacao BETWEEN 501 AND 1000 THEN 'Em Perigo'::STATUS
            WHEN NEW.populacao BETWEEN 1001 AND 1500 THEN 'Vulnerável'::STATUS
            ELSE 'Pouco Preocupante'::STATUS
        END
        WHERE id = NEW.id;
        RETURN NEW;
    END
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualiza_status_conservacao_especie
    AFTER INSERT OR UPDATE OF populacao ON especie
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_status_conservacao();


/* Inserts
--------------------------------------------------------------------------------------------------------------------- */
INSERT INTO dominio (nome_cientifico) VALUES ('Eukarya'), ('Bacteria');

INSERT INTO reino (nome_cientifico, nome, descricao, dominio_id) VALUES
    ('Animalia', 'Animais', 'Seres multicelulares que se alimentam de outros organismos.', 1),
    ('Plantae', 'Plantas', 'Organismos multicelulares que realizam fotossíntese.', 1);

INSERT INTO filo (nome_cientifico, nome, descricao, reino_id) VALUES
    ('Chordata', 'Cordados', 'Animais com corda dorsal em algum estágio de desenvolvimento.', 1),
    ('Magnoliophyta', 'Angiospermas', 'Plantas com flores e frutos.', 2);

INSERT INTO classe (nome_cientifico, nome, descricao, filo_id) VALUES
    ('Aves', 'Aves', 'Animais com penas e a maioria pode voar.', 1),
    ('Mammalia', 'Mamíferos', 'Animais com pelos e glândulas mamárias.', 1),
    ('Reptilia', 'Répteis', 'Animais de sangue frio com escamas.', 1),
    ('Amphibia', 'Anfíbios', 'Animais que vivem parte de sua vida na água e parte na terra.', 1);

INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id) VALUES
    ('Carnivora', 'Carnívoros', 'Mamíferos que se alimentam principalmente de carne.', 2),
    ('Primates', 'Primatas', 'Mamíferos com grande cérebro e olhos voltados para frente.', 2),
    ('Passeriformes', 'Pássaros', 'Aves de pequeno porte, muitas são canoras.', 1),
    ('Accipitriformes', 'Accipitriformes', 'Aves de rapina, incluindo águias e falcões.', 1);

INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id) VALUES
    ('Felidae', 'Felídeos', 'Família de mamíferos carnívoros que inclui leões, tigres, leopardos, etc.', 1),
    ('Atelidae', 'Atelídeos', 'Família de primatas conhecida por incluir macacos com caudas preênseis.', 2),
    ('Thraupidae', 'Traupídeos', 'Família de aves conhecida por pássaros canoros.', 3),
    ('Accipitridae', 'Accipitrídeos', 'Família de aves de rapina.', 4);

INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES
    ('Panthera', 'Pantera', 'Gênero que inclui grandes felinos como leões e tigres.', 1),
    ('Alouatta', 'Bugio', 'Gênero de macacos conhecidos por seus gritos altos.', 2),
    ('Thraupis', 'Sanhaço', 'Gênero de pássaros de cores vibrantes.', 3),
    ('Aquila', 'Águia', 'Gênero de grandes aves de rapina.', 4);

INSERT INTO especie (nome_cientifico, nome, descricao, status_conservacao, populacao, genero_id, localizacao_pontual) VALUES
    ('Panthera onca', 'Onça-pintada', 'Grande felino encontrado nas Américas.', 'Em Perigo', 3000, 1, ST_GeomFromText('POINT(-60 -3)', 4326)),
    ('Alouatta caraya', 'Bugio-preto', 'Espécie de macaco com forte vocalização.', 'Criticamente em Perigo', 510, 2, ST_GeomFromText('POINT(-55 -12)', 4326)),
    ('Thraupis episcopus', 'Sanhaço-azul', 'Pássaro de cor azul vibrante.', 'Pouco Preocupante', 200, 3, ST_GeomFromText('POINT(-43 -22)', 4326)),
    ('Aquila chrysaetos', 'Águia-real', 'Grande ave de rapina encontrada no Hemisfério Norte.', 'Quase Ameaçado', 5, 4, ST_GeomFromText('POINT(-100 40)', 4326));

INSERT INTO habitat (bioma, localizacao) VALUES
    ('Floresta Amazônica', ST_SetSRID(ST_GeomFromText('POLYGON((-74 -3, -54 -3, -54 5, -74 5, -74 -3))'), 4326)),
    ('Pantanal', ST_SetSRID(ST_GeomFromText('POLYGON((-58 -20, -56 -20, -56 -17, -58 -17, -58 -20))'), 4326)),
    ('Mata Atlântica', ST_SetSRID(ST_GeomFromText('POLYGON((-45 -25, -35 -25, -35 -15, -45 -15, -45 -25))'), 4326)),
    ('Cerrado', ST_SetSRID(ST_GeomFromText('POLYGON((-55 -20, -45 -20, -45 -10, -55 -10, -55 -20))'), 4326)),
    ('Caatinga', ST_SetSRID(ST_GeomFromText('POLYGON((-40 -12, -36 -12, -36 -8, -40 -8, -40 -12))'), 4326));

INSERT INTO especie_habitat (especie_id, habitat_id) VALUES (1, 1), (1, 2), (2, 2), (3, 3), (4, 4);

INSERT INTO doenca (nome, descricao, taxa_mortalidade) VALUES
    ('Febre Amarela', 'Doença viral transmitida por mosquitos.', 30),
    ('Malária', 'Doença parasitária transmitida por mosquitos.', 15),
    ('Doença de Chagas', 'Doença causada pelo parasita Trypanosoma cruzi.', 10),
    ('Tuberculose', 'Doença bacteriana que afeta principalmente os pulmões.', 5);

INSERT INTO especie_doenca (especie_id, doenca_id) VALUES (2, 1), (2, 2);

INSERT INTO area (localizacao, desmatado, protegido, habitat_id) VALUES
    (ST_GeomFromText('POLYGON((-70 -10, -70 0, -60 0, -60 -10, -70 -10))', 4326), TRUE, TRUE, 1),
    (ST_GeomFromText('POLYGON((-50 -15, -50 -5, -45 -5, -45 -15, -50 -15))', 4326), FALSE, TRUE, 2),
    (ST_GeomFromText('POLYGON((-45 -25, -45 -20, -40 -20, -40 -25, -45 -25))', 4326), TRUE, FALSE, 3),
    (ST_GeomFromText('POLYGON((-60 -20, -60 -15, -55 -15, -55 -20, -60 -20))', 4326), FALSE, TRUE, 4);

/* Queries
--------------------------------------------------------------------------------------------------------------------- */
UPDATE especie SET populacao = 0 WHERE id = 1;

SELECT * FROM doenca;
SELECT * FROM area;

SELECT
    especie.nome_cientifico,
    g.nome_cientifico genero,
    TO_CHAR(atualizado_em, 'Month') mes,
    EXTRACT(YEAR FROM atualizado_em) ano,
    especie.status_conservacao,
    especie.populacao,
    ST_AsText(especie.localizacao_pontual) habitat
FROM especie
    LEFT JOIN public.genero g ON g.id = especie.genero_id
    LEFT JOIN especie_habitat eh on especie.id = eh.especie_id and especie.id = eh.especie_id
    LEFT JOIN habitat h on h.id = eh.habitat_id
    LEFT JOIN area a on eh.habitat_id = a.habitat_id
ORDER BY populacao DESC;

*/