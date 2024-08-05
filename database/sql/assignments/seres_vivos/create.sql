CREATE EXTENSION IF NOT EXISTS postgis;

-- ENUMS ---------------------------------------------------------------------------------------------------------------------
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

-- Tabelas ---------------------------------------------------------------------------------------------------------------------
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
    localizacao_pontual geometry(POINT, 4326) NOT NULL DEFAULT ST_SetSRID(ST_MakePoint(-4.0965, -63.3176), 4326),
    CONSTRAINT fk_genero_id FOREIGN KEY (genero_id) REFERENCES genero(id) ON DELETE CASCADE
);

CREATE OR REPLACE FUNCTION poligono_amazonia_brasileira() RETURNS geometry AS $$
BEGIN
    RETURN ST_GeomFromText(
            'POLYGON((5.2631 -60.0518,1.8549 -48.4792,-15.5944 -52.8781,-10.4952 -70.4036,5.2631 -60.0518))', 4326
           );
END;
$$ LANGUAGE plpgsql;

CREATE TABLE IF NOT EXISTS habitat (
    id SERIAL PRIMARY KEY,
    bioma VARCHAR(100) UNIQUE NOT NULL DEFAULT 'Amazônia Brasileira',
    localizacao geometry(POLYGON, 4326) NOT NULL DEFAULT poligono_amazonia_brasileira()
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
    localizacao geometry(POLYGON, 4326) NOT NULL DEFAULT poligono_amazonia_brasileira(),
    desmatado BOOLEAN DEFAULT FALSE,
    protegido BOOLEAN DEFAULT FALSE,
    habitat_id BIGINT NOT NULL,
    CONSTRAINT fk_habitat FOREIGN KEY (habitat_id) REFERENCES habitat(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS avistamento (
    id SERIAL PRIMARY KEY,
    observacao TEXT,
    altitude INTEGER DEFAULT 10 CHECK(altitude > 0),
    quantidade_individuos INTEGER NOT NULL NOT NULL DEFAULT 1 CHECK(quantidade_individuos > 0),
    registrar_individuo BOOLEAN NOT NULL DEFAULT FALSE,
    localizacao_pontual geometry(POINT, 4326) NOT NULL DEFAULT ST_SetSRID(ST_MakePoint(-1.7312, -62.7151), 4326),
    data_avistamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nome_biologo VARCHAR(100) NOT NULL,
    especie_id BIGINT NOT NULL,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS interacao_ecologica (
    id SERIAL PRIMARY KEY,
    harmonica boolean NOT NULL DEFAULT FALSE,
    tipo_interacao VARCHAR(255) UNIQUE NULL DEFAULT 'Competição',
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS interacao_especie (
    id SERIAL PRIMARY KEY,
    especie_nativa_id BIGINT NOT NULL,
    especie_invasora_id BIGINT NOT NULL,
    interacao_ecologica_id BIGINT,
    CONSTRAINT fk_especie_nativa FOREIGN KEY (especie_nativa_id) REFERENCES especie(id) ON DELETE CASCADE,
    CONSTRAINT fk_especie_invasora FOREIGN KEY (especie_invasora_id) REFERENCES especie(id) ON DELETE CASCADE,
    CONSTRAINT fk_interacao_ecologica FOREIGN KEY (interacao_ecologica_id) REFERENCES interacao_ecologica(id) ON DELETE CASCADE
);
ALTER TABLE interacao_especie
    ADD COLUMN avistamento_id BIGINT,
    ADD CONSTRAINT fk_avistamento FOREIGN KEY (avistamento_id) REFERENCES avistamento(id) ON DELETE SET NULL;

CREATE TABLE IF NOT EXISTS diversidade_genetica (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    populacao VARCHAR(100) NOT NULL,
    diversidade_genetica NUMERIC,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS planta (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    tamanho_corola DECIMAL(5,2) NOT NULL,
    CONSTRAINT fk_especie_planta FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS polinizador (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    comprimento_proboscide DECIMAL(5,2) NOT NULL,
    CONSTRAINT fk_especie_polinizador FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS planta_polinizador (
    id SERIAL PRIMARY KEY,
    planta_id BIGINT NOT NULL,
    polinizador_id BIGINT NOT NULL,
    CONSTRAINT fk_planta FOREIGN KEY (planta_id) REFERENCES planta(id) ON DELETE CASCADE,
    CONSTRAINT fk_polinizador FOREIGN KEY (polinizador_id) REFERENCES polinizador(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS altitude_raster (
    id SERIAL PRIMARY KEY,
    rast geometry(POLYGON, 4326) NOT NULL DEFAULT poligono_amazonia_brasileira(),
    altitude INTEGER
);

CREATE TABLE IF NOT EXISTS diversidade_genetica (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    populacao VARCHAR(100) NOT NULL,
    diversidade_genetica NUMERIC,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ameaca (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS especie_ameaca (
    id SERIAL PRIMARY KEY,
    especie_id BIGINT NOT NULL,
    ameaca_id BIGINT NOT NULL,
    CONSTRAINT fk_especie FOREIGN KEY (especie_id) REFERENCES especie(id) ON DELETE CASCADE,
    CONSTRAINT fk_ameaca FOREIGN KEY (ameaca_id) REFERENCES ameaca(id) ON DELETE CASCADE
);
ALTER TABLE ameaca ADD CONSTRAINT unique_ameaca_descricao UNIQUE (descricao);

-- Funções ---------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION atualizar_status_conservacao() RETURNS TRIGGER AS $$
BEGIN
    UPDATE especie
    SET status_conservacao = CASE
        WHEN NEW.populacao = 0 THEN 'Extinto'::STATUS
        WHEN NEW.populacao <= 50 THEN 'Criticamente em Perigo'::STATUS
        WHEN NEW.populacao <= 250 THEN 'Em Perigo'::STATUS
        WHEN NEW.populacao <= 1000 THEN 'Vulnerável'::STATUS
        WHEN NEW.populacao <= 2000 THEN 'Quase Ameaçado'::STATUS
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
    IF NEW.registrar_individuo THEN
        UPDATE especie SET populacao = especie.populacao + NEW.quantidade_individuos
        WHERE especie.id = NEW.especie_id;
        RAISE NOTICE 'População de espécie incrementada pelo biólogo: %', NEW.nome_biologo;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION atualizar_avistamento_altitude()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE avistamento
    SET altitude = (
        SELECT r.altitude
        FROM altitude_raster r
        WHERE ST_Intersects(r.rast, (SELECT e.localizacao_pontual FROM especie e WHERE e.id = avistamento.especie_id))
        LIMIT 1
    )
    WHERE altitude IS NULL;
    RAISE NOTICE 'Altitude atualizada para %', NEW.altitude;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers ---------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER atualiza_status_conservacao_especie
    AFTER INSERT OR UPDATE OF populacao ON especie
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_status_conservacao();

CREATE TRIGGER incrementa_species_quando_avistadas
    AFTER INSERT ON avistamento
    FOR EACH ROW
    EXECUTE FUNCTION incrementar_populacao_especie();

CREATE TRIGGER trigger_atualizar_avistamento_altitude
AFTER INSERT ON altitude_raster
FOR EACH ROW
EXECUTE FUNCTION atualizar_avistamento_altitude();

-- Views ---------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW HierarquiaTaxonomica AS
SELECT
    e.id                  AS especie_id,
    e.nome_cientifico     AS especie,
    e.nome                AS nome_comum,
    e.descricao           AS descricao,
    e.migratoria          AS migratoria,
    e.localizacao_pontual AS localizacao_pontual,
    e.status_conservacao  AS status_conservacao,
    r.nome_cientifico     AS reino,
    r.nome                AS reino_nome,
    r.descricao           AS reino_descricao,
    f.nome_cientifico     AS filo,
    f.nome                AS filo_nome,
    c.nome_cientifico     AS classe,
    c.nome                AS classe_nome,
    o.nome_cientifico     AS ordem,
    o.nome                AS ordem_nome,
    fa.nome_cientifico    AS familia,
    fa.nome               AS familia_nome,
    g.nome_cientifico     AS genero,
    g.nome                AS genero_nome
FROM especie e
    INNER JOIN genero g ON e.genero_id = g.id
    INNER JOIN familia fa ON g.familia_id = fa.id
    INNER JOIN ordem o ON fa.ordem_id = o.id
    INNER JOIN classe c ON o.classe_id = c.id
    INNER JOIN filo f ON c.filo_id = f.id
    INNER JOIN reino r ON f.reino_id = r.id;

-- Index ---------------------------------------------------------------------------------------------------------------------
CREATE INDEX index_reino_dominio_id ON reino(dominio_id);
CREATE INDEX index_filo_reino_id ON filo(reino_id);
CREATE INDEX index_classe_filo_id ON classe(filo_id);
CREATE INDEX index_ordem_classe_id ON ordem(classe_id);
CREATE INDEX index_familia_ordem_id ON familia(ordem_id);
CREATE INDEX index_genero_familia_id ON genero(familia_id);
CREATE INDEX index_especie_genero_id ON especie(genero_id);
CREATE INDEX index_especie_habitat_especie_id ON especie_habitat(especie_id);
CREATE INDEX index_especie_habitat_habitat_id ON especie_habitat(habitat_id);
CREATE INDEX index_especie_doenca_especie_id ON especie_doenca(especie_id);
CREATE INDEX index_especie_doenca_doenca_id ON especie_doenca(doenca_id);
CREATE INDEX index_area_habitat_id ON area(habitat_id);
CREATE INDEX index_avistamento_especie_id ON avistamento(especie_id);
CREATE INDEX index_interacao_especie_especie_id ON interacao_especie(especie_id);
CREATE INDEX index_interacao_especie_interacao_ecologica_id ON interacao_especie(interacao_ecologica_id);
