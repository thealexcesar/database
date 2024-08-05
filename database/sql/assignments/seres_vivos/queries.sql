-- 1º Distribuição Geográfica e Ecologia ----------------------------------------------------------------
-- A) Aves migratórias que passam pela Amazônia brasileira ----------------------------------------------------------------
SELECT DISTINCT ON (ht.especie)
    ht.especie,
    ht.nome_comum,
    ht.classe,
    ST_Within(h.localizacao, poligono_amazonia_brasileira()) AS passa_pela_amazonia_brasileira
FROM
    HierarquiaTaxonomica ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
WHERE
    ht.migratoria = TRUE
    AND ht.classe = 'Aves'
    AND ST_Within(h.localizacao, poligono_amazonia_brasileira());

-- B) Densidade populacional de onças-pintadas em áreas protegidas do Cerrado ---------------------------------------------
SELECT
    e.nome_cientifico, SUM(e.populacao) AS total,
    ROUND(CAST(SUM(ST_Area(a.localizacao::geography)) / 1000000.0 AS numeric), 2) AS area_km2,
    ROUND(CAST(SUM(e.populacao) / (SUM(ST_Area(a.localizacao::geography)) / 1000000.0) AS numeric), 6) AS densidade
FROM
    especie e
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area a ON h.id = a.habitat_id
WHERE
    e.nome_cientifico = 'Panthera onca'
    AND h.bioma = 'Cerrado'
    AND a.protegido = TRUE
GROUP BY
    e.nome_cientifico;

-- C) Espécies de plantas endêmicas da Mata Atlântica e ameaçadas de extinção ---------------------------------------------
SELECT
    ht.especie, ht.nome_comum, ht.descricao, ht.reino_descricao
FROM
    HierarquiaTaxonomica AS ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
WHERE
    ht.reino = 'Plantae'
    AND h.bioma = 'Mata Atlântica'
    AND ht.status_conservacao IN ('Criticamente em Perigo', 'Em Perigo', 'Vulnerável')
    AND translate(lower(ht.descricao), 'ê', 'e') ILIKE '%endemica%';

-- 2º Doenças e Saúde Animal ----------------------------------------------------------------
-- A) Doenças que acometem principalmente primatas em áreas de desmatamento -----------------------------------------------
SELECT
    ht.especie AS especie,
    CASE
        WHEN ht.ordem_nome = 'Primatas' THEN 'SIM' ELSE 'NÃO'
    END AS "Primatas?",
    STRING_AGG(d.nome, ', ') AS doencas,
    COUNT(*) AS quantidade_especies,
    AVG(d.taxa_mortalidade) AS taxa_mortalidade_media_doencas_por_especie,
    ht.ordem_nome AS ordem
FROM
    doenca d
    INNER JOIN especie_doenca ed ON d.id = ed.doenca_id
    INNER JOIN HierarquiaTaxonomica ht ON ed.especie_id = ht.especie_id
GROUP BY
    ht.especie, ht.ordem_nome
ORDER BY
    ht.ordem_nome = 'Primatas' DESC, quantidade_especies DESC, ht.especie;

-- B) Taxa de mortalidade por determinada doença em uma espécie específica ------------------------------------------------
SELECT
    e.nome_cientifico AS especie,
    d.nome AS doenca,
    e.populacao,
    ROUND((d.taxa_mortalidade::NUMERIC / NULLIF(e.populacao, 0)) * 100, 2) || '%' AS taxa_mortalidade
FROM
    especie_doenca ed
    INNER JOIN especie e ON ed.especie_id = e.id
    INNER JOIN doenca d ON ed.doenca_id = d.id
WHERE
    d.nome = 'Doença de Chagas' AND e.id = 2;

-- 3º Evolução e Filogenia ----------------------------------------------------------------
-- A) Gêneros mais diversos da família Felidae ----------------------------------------------------------------------------
SELECT
    ht.genero, COUNT(ht.especie_id) AS numero_de_especies
FROM
    hierarquiataxonomica ht
WHERE
    ht.familia = 'Felidae'
GROUP BY
    ht.genero
ORDER BY
    numero_de_especies DESC;

-- 4º Monitoramento e Conservação ----------------------------------------------------------------
-- A) Evolução da população de uma espécie ao longo dos anos --------------------------------------------------------------
SELECT
    especie, ano,
    COALESCE(populacao_anterior, 0) AS populacao_anterior,
    COALESCE(populacao_atual, 0) AS populacao_atual,
    COALESCE(
        CASE
            WHEN populacao_anterior IS NULL OR populacao_anterior = 0 THEN '0%'
            ELSE ROUND(
                ((populacao_atual - populacao_anterior) / populacao_anterior::NUMERIC) * 100, 2
            )::TEXT || '%'
        END, '0%'
    ) evolucao
FROM (
    SELECT
        e.nome_cientifico AS especie,
        EXTRACT(YEAR FROM a.data_avistamento) ano,
        SUM(a.quantidade_individuos) AS populacao_atual,
        LAG(SUM(a.quantidade_individuos))OVER(
            PARTITION BY e.nome_cientifico ORDER BY EXTRACT(YEAR FROM a.data_avistamento)
            ) AS populacao_anterior
    FROM
        avistamento a
        INNER JOIN especie e ON a.especie_id = e.id
    WHERE
        e.nome = 'Tico-tico'
    GROUP
        BY e.nome_cientifico, EXTRACT(YEAR FROM a.data_avistamento)
) sub
ORDER BY
    ano DESC, evolucao DESC, especie;


-- B) Áreas prioritárias para conservação de uma determinada espécie ------------------------------------------------------
SELECT
    h.bioma, h.bioma, ht.especie,
    ht.status_conservacao,
    ST_AsText(a.localizacao) AS localizacao,
    a.protegido, a.desmatado, ht.reino_descricao
FROM
    hierarquiataxonomica ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area a ON h.id = a.habitat_id
WHERE
    ht.especie = 'Dalbergia nigra'
    AND a.protegido = TRUE AND a.desmatado = FALSE
    AND ht.status_conservacao IN ('Criticamente em Perigo', 'Em Perigo', 'Vulnerável');

