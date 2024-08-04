-- Aves migratórias que passam pela Amazônia brasileira ----------------------------------------------------------------
UPDATE especie
SET localizacao_pontual = ST_GeomFromText('POINT(-29.06335770109914 -51.703782964101045)', 4326)
WHERE nome_cientifico = 'Ara chloropterus';

SELECT DISTINCT ON (ht.especie)
    ht.especie,
    ht.nome_comum,
    ht.classe,
    ST_Within(h.localizacao, poligono_amazonia_brasileira()) AS passa_pela_amazonia_brasileira
FROM HierarquiaTaxonomica ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
WHERE ht.migratoria = TRUE AND ht.classe = 'Aves'
    AND ST_Within(h.localizacao, poligono_amazonia_brasileira());

-- Densidade populacional de onças-pintadas em áreas protegidas do Cerrado ---------------------------------------------
SELECT
e.nome_cientifico,
    SUM(e.populacao) AS total,
    SUM(ST_Area(a.localizacao::geography)) AS area_total,
    SUM(e.populacao) / SUM(ST_Area(a.localizacao::geography)) AS densidade_populacional
FROM especie e
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area a ON h.id = a.habitat_id
WHERE e.nome_cientifico = 'Panthera onca' AND h.bioma = 'Cerrado' AND a.protegido = TRUE
GROUP BY e.nome_cientifico;

-- Espécies de plantas endêmicas da Mata Atlântica e ameaçadas de extinção ---------------------------------------------
SELECT ht.especie, ht.nome_comum, ht.descricao, ht.reino_descricao
FROM HierarquiaTaxonomica AS ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
WHERE ht.reino = 'Plantae'
    AND h.bioma = 'Mata Atlântica'
    AND ht.status_conservacao IN ('Criticamente em Perigo', 'Em Perigo', 'Vulnerável')
    AND translate(lower(ht.descricao), 'ê', 'e') ILIKE '%endemica%';

-- Doenças que acometem principalmente primatas em áreas de desmatamento -----------------------------------------------
SELECT
    ht.especie AS especie, ht.ordem_nome AS ordem,
    STRING_AGG(d.nome, ', ') AS doencas,
    COUNT(*) AS quantidade_especies,
    AVG(d.taxa_mortalidade) AS taxa_mortalidade_media_doencas_especie_por_especie
FROM doenca d
    INNER JOIN especie_doenca ed ON d.id = ed.doenca_id
    INNER JOIN HierarquiaTaxonomica ht ON ed.especie_id = ht.especie_id
GROUP BY ht.especie, ht.ordem_nome
ORDER BY
    CASE
        WHEN ht.ordem_nome = 'Primatas' THEN 1
        ELSE 2
    END, ht.especie;

-------- Taxa de mortalidade por determinada doença em uma espécie específica ------------------------------------------
SELECT
    e.nome_cientifico AS especie,
    d.nome AS doenca,
    e.populacao,
    ROUND((d.taxa_mortalidade::NUMERIC / NULLIF(e.populacao, 0)) * 100, 2) || '%' AS taxa_mortalidade
FROM especie_doenca ed
    INNER JOIN especie e ON ed.especie_id = e.id
    INNER JOIN doenca d ON ed.doenca_id = d.id
WHERE d.nome = 'Doença de Chagas' AND e.id = 2;


-- Gêneros mais diversos da família Felidae ----------------------------------------------------------------------------
SELECT ht.genero, COUNT(ht.especie_id) AS numero_de_especies FROM hierarquiataxonomica ht
WHERE ht.familia = 'Felidae' GROUP BY ht.genero ORDER BY numero_de_especies DESC;

-- Evolução da população de uma espécie ao longo dos anos --------------------------------------------------------------
SELECT
    d.nome AS doenca,
    e.nome AS especie,
    a.desmatado
FROM doenca d
    INNER JOIN especie_doenca ed ON d.id = ed.doenca_id
    INNER JOIN especie e ON ed.especie_id = e.id
    INNER JOIN genero g ON e.genero_id = g.id
    INNER JOIN familia f ON g.familia_id = f.id
    INNER JOIN ordem o ON f.ordem_id = o.id
    INNER JOIN classe c ON o.classe_id = c.id
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area a ON h.id = a.habitat_id
WHERE
    o.nome = 'Primatas'
    AND a.desmatado = TRUE
    AND ST_Within(e.localizacao_pontual, a.localizacao);

-- Áreas prioritárias para conservação de uma determinada espécie ------------------------------------------------------
SELECT h.bioma, h.bioma, ST_AsText(a.localizacao) AS localizacao, a.protegido, a.desmatado,
       ht.especie, ht.status_conservacao, ht.genero_nome, ht.familia_nome, ht.reino_descricao
FROM hierarquiataxonomica ht
    INNER JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area a ON h.id = a.habitat_id
WHERE ht.especie = 'Panthera onca' AND a.protegido = TRUE AND a.desmatado = FALSE
AND ht.status_conservacao IN ('Criticamente em Perigo', 'Em Perigo', 'Vulnerável');
