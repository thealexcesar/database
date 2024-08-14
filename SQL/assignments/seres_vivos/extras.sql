-- 1. ------------------------------------------------------------------------------------------------------------------
SELECT
    d.nome doenca,
    d.descricao,
    CONCAT(d.taxa_mortalidade, '%') AS taxa_mortalidade
FROM
    HierarquiaTaxonomica ht
    INNER JOIN especie_doenca ed ON ht.especie_id = ed.especie_id
    INNER JOIN doenca d ON ed.doenca_id = d.id
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area a ON h.id = a.habitat_id
WHERE 
    ht.ordem = 'Primates' AND a.desmatado = TRUE;

-- 2. ------------------------------------------------------------------------------------------------------------------
WITH SpeciesHabitats AS (
    SELECT
        eh.habitat_id
    FROM
        especie e
        INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    WHERE
        e.nome_cientifico = 'Oreochromis niloticus'
),
NativeSpecies AS (
    SELECT DISTINCT e.id AS especie_id,
                    e.nome_cientifico,
                    e.nome AS nome_comum,
                    h.bioma
    FROM especie e
        INNER JOIN especie_habitat eh ON e.id = eh.especie_id
        INNER JOIN habitat h ON eh.habitat_id = h.id
    WHERE
        e.migratoria = FALSE
    AND e.nome_cientifico <> 'Oreochromis niloticus'
    AND eh.habitat_id IN (SELECT habitat_id FROM SpeciesHabitats)
)
SELECT
    ns.nome_cientifico,
    ns.nome_comum,
    ns.bioma,
    iec.tipo_interacao AS interacao_ecologica,
    iec.harmonica AS harmonica,
    iec.descricao AS descricao_interacao
FROM
    NativeSpecies ns
    INNER JOIN interacao_especie ie ON ns.especie_id = ie.especie_nativa_id
    INNER JOIN interacao_ecologica iec ON ie.interacao_ecologica_id = iec.id
WHERE
    ie.especie_invasora_id = (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus')
UNION ALL
SELECT
    ns.nome_cientifico,
    ns.nome_comum,
    ns.bioma,
    iec.tipo_interacao AS interacao_ecologica,
    iec.harmonica AS harmonica,
    iec.descricao AS descricao_interacao
FROM
    NativeSpecies ns
    INNER JOIN interacao_especie ie ON ns.especie_id = ie.especie_invasora_id
    INNER JOIN interacao_ecologica iec ON ie.interacao_ecologica_id = iec.id
WHERE ie.especie_nativa_id = (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus');

-- 3. ------------------------------------------------------------------------------------------------------------------
SELECT
    ht.especie,
    ht.nome_comum,
    ht.status_conservacao,
    a.descricao AS ameaca
FROM
    HierarquiaTaxonomica ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN especie_ameaca ea ON ht.especie_id = ea.especie_id
    INNER JOIN ameaca a ON ea.ameaca_id = a.id
WHERE
    ht.classe = 'Reptilia' AND
    ht.ordem = 'Serpentes' AND
    h.bioma = 'Caatinga' AND
    ht.status_conservacao IN ('Vulnerável', 'Em Perigo')
ORDER BY
    ht.especie;

-- 4. ------------------------------------------------------------------------------------------------------------------
WITH especie_altitude AS (
    SELECT
        e.id AS especie_id,
        g.nome_cientifico AS genero_nome,
        f.nome_cientifico AS familia_nome,
        r.altitude
    FROM
        especie e
        INNER JOIN genero g ON e.genero_id = g.id
        INNER JOIN familia f ON g.familia_id = f.id
        INNER JOIN altitude_raster r ON ST_Intersects(r.rast, e.localizacao_pontual)
    WHERE
        f.nome_cientifico = 'Thraupidae'
)
SELECT
    genero_nome,
    COUNT(DISTINCT especie_id) AS numero_especies,
    altitude
FROM
    especie_altitude
GROUP BY
    genero_nome, altitude
ORDER BY
    genero_nome, altitude;


-- 5. ------------------------------------------------------------------------------------------------------------------
SELECT
    populacao,
    AVG(diversidade_genetica) AS media_diversidade_genetica
FROM
    diversidade_genetica
WHERE
    especie_id = (SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca')
GROUP BY populacao
ORDER BY populacao;

-- 6. ------------------------------------------------------------------------------------------------------------------
WITH avistamentos_anos AS (
    SELECT
        EXTRACT(YEAR FROM data_avistamento) AS ano,
        AVG(altitude) AS media_altitude,
        COUNT(*) AS total_avistamentos
    FROM
        avistamento
    WHERE
        especie_id = (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas')
        AND data_avistamento >= NOW() - INTERVAL '50 years'
    GROUP BY
        EXTRACT(YEAR FROM data_avistamento)
),

altitude_variacao AS (
    SELECT
        ano,
        media_altitude,
        total_avistamentos,
        media_altitude - LAG(media_altitude) OVER (ORDER BY ano) AS variacao_anual
    FROM
        avistamentos_anos
)

SELECT
    ano,
    media_altitude,
    total_avistamentos,
    variacao_anual,
    AVG(variacao_anual) OVER () AS media_variacao_altitude
FROM
    altitude_variacao
WHERE
    variacao_anual IS NOT NULL
ORDER BY
    ano DESC;

-- 7. ------------------------------------------------------------------------------------------------------------------
WITH avistamentos_com_area AS (
    SELECT
        a.id AS avistamento_id,
        a.especie_id,
        a.data_avistamento,
        a.quantidade_individuos,
        ar.protegido AS dentro_area_protegida
    FROM
        avistamento a
    INNER JOIN
        area ar ON ST_Intersects(a.localizacao_pontual, ar.localizacao)
),
populacao_por_ano AS (
    SELECT
        especie_id,
        EXTRACT(YEAR FROM data_avistamento) AS ano,
        dentro_area_protegida,
        SUM(quantidade_individuos) AS total_individuos
    FROM
        avistamentos_com_area
    GROUP BY
        especie_id, EXTRACT(YEAR FROM data_avistamento), dentro_area_protegida
),
taxa_declinio AS (
    SELECT
        especie_id,
        dentro_area_protegida,
        (MAX(total_individuos) - MIN(total_individuos)) / NULLIF(MIN(total_individuos), 0) AS taxa_declinio
    FROM
        populacao_por_ano
    WHERE
        especie_id IN (SELECT id FROM especie WHERE status_conservacao = 'Em Perigo')
    GROUP BY
        especie_id, dentro_area_protegida
)
SELECT
    e.nome_cientifico AS nome_ave,
    CASE
        WHEN td.dentro_area_protegida THEN 'Dentro de Área Protegida'
        ELSE 'Fora de Área Protegida'
    END AS localizacao,
    AVG(td.taxa_declinio) AS media_taxa_declinio
FROM
    taxa_declinio td
INNER JOIN
    especie e ON td.especie_id = e.id
GROUP BY
    e.nome_cientifico, localizacao
ORDER BY
    e.nome_cientifico, localizacao;

-----------------------------------------------------------------------------------------------------------------------
-- 8. Investigando a Coevolução entre Plantas e Polinizadores:
SELECT
    e_planta.nome AS planta,
    p.tamanho_corola,
    e_polinizador.nome AS polinizador,
    po.comprimento_proboscide
FROM
    planta p
    INNER JOIN planta_polinizador pp ON p.id = pp.planta_id
    INNER JOIN polinizador po ON po.id = pp.polinizador_id
    INNER JOIN especie e_planta ON p.especie_id = e_planta.id
    INNER JOIN especie e_polinizador ON po.especie_id = e_polinizador.id;

-- 9. ------------------------------------------------------------------------------------------------------------------
SELECT
    h.bioma AS habitat,
    COUNT(DISTINCT ht.especie_id) AS qtd_especies,
    array_to_string(ARRAY_AGG(DISTINCT ht.especie), ', ') AS especies,
    TO_CHAR(SUM(e.populacao), '999,999,999,999') AS total_populacao
FROM HierarquiaTaxonomica ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN especie e ON ht.especie_id = e.id
WHERE ht.reino = 'Monera'
  AND h.bioma IN ('Mata Atlântica', 'Amazônia Brasileira')
GROUP BY h.bioma;

-- 10. -----------------------------------------------------------------------------------------------------------------
SELECT
    h.bioma,
    COUNT(a.id) AS total_avistamentos,
    SUM(a.quantidade_individuos) AS total_individuos,
    AVG(a.quantidade_individuos) AS media_individuos_por_avistamento
FROM
    avistamento a
    INNER JOIN especie e ON a.especie_id = e.id
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
WHERE
    h.bioma = 'Agrícola'
GROUP BY
    h.bioma
ORDER BY
    total_individuos DESC;
