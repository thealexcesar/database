-- DROP DATABASE seres_vivos;
-- DROP TABLE IF EXISTS dominio, reino, filo, classe, ordem, familia, genero, especie, habitat, especie_habitat, doenca, especie_doenca, populacao, avistamento, area CASCADE;
-- DROP FUNCTION IF EXISTS atualizar_status_conservacao CASCADE;
-- DROP FUNCTION IF EXISTS incrementar_populacao_especie CASCADE;
-- DROP TYPE IF EXISTS DOMAINS, REINOS, STATUS CASCADE;
-- DROP VIEW IF EXISTS HierarquiaTaxonomica;

CREATE DATABASE seres_vivos;
CREATE EXTENSION IF NOT EXISTS postgis;

/* ENUMS
----------------------------------------------------------------------------------------------------------------------*/
CREATE TYPE DOMAINS AS ENUM ('Eukarya', 'Bacteria');
CREATE TYPE REINOS AS ENUM ('Animalia', 'Monera', 'Protista', 'Fungi', 'Plantae', 'Archaea');
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
/* End ENUMS ---------------------------------------------------------------------------------------------------------*/

/* Tables
----------------------------------------------------------------------------------------------------------------------*/
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
    nome_cientifico VARCHAR(24) NOT NULL UNIQUE,
    nome VARCHAR(100),
    descricao TEXT,
    reino_id BIGINT NOT NULL,
    CONSTRAINT fk_reino FOREIGN KEY (reino_id) REFERENCES reino(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS classe (
    id SERIAL PRIMARY KEY,
    nome_cientifico VARCHAR(24) NOT NULL UNIQUE,
    nome VARCHAR(100),
    descricao TEXT,
    filo_id BIGINT NOT NULL,
    CONSTRAINT fk_filo_id FOREIGN KEY (filo_id) REFERENCES filo(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ordem (
    id SERIAL PRIMARY KEY,
    nome_cientifico VARCHAR(24) NOT NULL UNIQUE,
    nome VARCHAR(100),
    descricao TEXT,
    classe_id BIGINT NOT NULL,
    CONSTRAINT fk_classe_id FOREIGN KEY (classe_id) REFERENCES classe(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS familia (
    id SERIAL PRIMARY KEY,
    nome_cientifico VARCHAR(24) NOT NULL UNIQUE,
    nome VARCHAR(100),
    descricao TEXT,
    ordem_id BIGINT NOT NULL,
    CONSTRAINT fk_ordem_id FOREIGN KEY (ordem_id) REFERENCES ordem(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS genero (
    id SERIAL PRIMARY KEY,
    nome_cientifico VARCHAR(24) NOT NULL UNIQUE,
    nome VARCHAR(100),
    descricao TEXT,
    familia_id BIGINT,
    CONSTRAINT fk_familia_id FOREIGN KEY (familia_id) REFERENCES familia(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS especie (
    id SERIAL PRIMARY KEY,
    nome_cientifico VARCHAR(40) NOT NULL UNIQUE,
    nome VARCHAR(100),
    descricao TEXT,
    status_conservacao STATUS NOT NULL DEFAULT 'Não Avaliado',
    populacao BIGINT NOT NULL DEFAULT 0 CHECK (populacao >= 0),
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em DATE NOT NULL DEFAULT CURRENT_DATE,
    genero_id BIGINT,
    migratoria BOOLEAN NOT NULL DEFAULT FALSE,
    localizacao_pontual geometry(POINT, 4326),
    CONSTRAINT fk_genero_id FOREIGN KEY (genero_id) REFERENCES genero(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS habitat (
    id SERIAL PRIMARY KEY,
    bioma VARCHAR(100) NOT NULL UNIQUE DEFAULT 'Amazônia',
    localizacao geometry(POLYGON, 4326) NOT NULL
);

CREATE TABLE IF NOT EXISTS especie_habitat (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    habitat_id BIGINT NOT NULL,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE,
    CONSTRAINT fk_habitat FOREIGN KEY (habitat_id) REFERENCES habitat(id) ON DELETE CASCADE
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

CREATE TABLE IF NOT EXISTS avistamento (
    id SERIAL PRIMARY KEY,
    quantidade_individuos BIGINT,
    observacao TEXT,
    data_avistamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nome_biologo VARCHAR(100) NOT NULL,
    especie_id BIGINT NOT NULL,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS interacao_ecologica (
    id SERIAL PRIMARY KEY,
    tipo_interacao VARCHAR(255) UNIQUE NULL DEFAULT 'Não Definido',
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS interacao_especie (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    interacao_ecologica_id BIGINT,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE,
    CONSTRAINT fk_interacao_ecologica FOREIGN KEY (interacao_ecologica_id) REFERENCES interacao_ecologica(id) ON DELETE CASCADE
);
/* End Tables ------------------------------------------------------------------------------------------------------- */

/* Functions
--------------------------------------------------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION atualizar_status_conservacao() RETURNS TRIGGER AS $$
BEGIN
    UPDATE especie
    SET status_conservacao = CASE
        WHEN NEW.populacao = 0 THEN 'Extinto'::STATUS
        WHEN NEW.populacao BETWEEN 1 AND 500 THEN 'Criticamente em Perigo'::STATUS
        WHEN NEW.populacao BETWEEN 501 AND 1000 THEN 'Em Perigo'::STATUS
        WHEN NEW.populacao BETWEEN 1001 AND 1500 THEN 'Vulnerável'::STATUS
        WHEN NEW.populacao BETWEEN 1501 AND 2000 THEN 'Quase Ameaçado'::STATUS
        WHEN NEW.populacao > 2000 THEN 'Pouco Preocupante'::STATUS
        ELSE 'Dados Insuficientes'::STATUS
    END
    WHERE id = NEW.id;

    RAISE NOTICE 'Status de conservação da espécie "%" atualizado para: "%"', NEW.nome_cientifico,
    (SELECT status_conservacao FROM especie WHERE id = NEW.id);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION incrementar_populacao_especie() RETURNS TRIGGER AS $$
BEGIN
    UPDATE especie SET populacao = especie.populacao + NEW.quantidade_individuos
    WHERE especie.id = NEW.especie_id;
    RAISE NOTICE 'População de espécie incrementada pelo biólogo: %', NEW.nome_biologo;
    RETURN NEW;
END
$$ language plpgsql;
/* End Functions ---------------------------------------------------------------------------------------------------- */

/* Triggers
--------------------------------------------------------------------------------------------------------------------- */
CREATE TRIGGER atualiza_status_conservacao_especie
    AFTER INSERT OR UPDATE OF populacao ON especie
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_status_conservacao();

/* OBS:
------------------------------------------------------------------------------------------------------------------------
 Entendemos que uma espécie não deveria ser incrementada sempre que avistada. Pois, ela pode já estar no número de
 populações registrada. Porém, para este trabalho, consideremos que todas as avistadas não estavam contadas no sistema.
--------------------------------------------------------------------------------------------------------------------- */
CREATE TRIGGER incrementa_species_quando_avistadas
    AFTER INSERT ON avistamento
    FOR EACH ROW
    EXECUTE FUNCTION incrementar_populacao_especie();
/* End Triggers ----------------------------------------------------------------------------------------------------- */

/* Views
--------------------------------------------------------------------------------------------------------------------- */
CREATE VIEW HierarquiaTaxonomica AS
SELECT
    e.id AS especie_id,
    e.nome_cientifico AS especie,
    e.nome AS nome_comum,
    e.migratoria AS migratoria,
    r.nome AS reino,
    f.nome AS filo,
    c.nome AS classe,
    o.nome AS ordem,
    fa.nome AS familia,
    g.nome AS genero
FROM
    especie e
JOIN
    Genero g ON e.genero_id = g.id
JOIN
    Familia fa ON g.familia_id = fa.id
JOIN
    Ordem o ON fa.ordem_id = o.id
JOIN
    Classe c ON o.classe_id = c.id
JOIN
    Filo f ON c.filo_id = f.id
JOIN
    Reino r ON f.reino_id = r.id;


/* End Views ----------------------------------------------------------------------------------------------------- */