/*
1-a
*/
SELECT
    ht.especie,
    ht.nome_comum
FROM HierarquiaTaxonomica ht
    JOIN especie_habitat eh ON ht.especie_id = eh.especie_id
    JOIN Habitat h ON eh.habitat_id = h.id
WHERE
    ht.migratoria = TRUE
    AND h.bioma = 'Floresta Amazônica'
    AND ht.classe = 'Aves';

------------------------------------------------------------------------------------------------------------------------
/*
1-b
*/
SELECT
e.nome_cientifico,
    SUM(e.populacao) AS total,
    SUM(ST_Area(ac.localizacao::geography)) AS area_total,
    SUM(e.populacao) / SUM(ST_Area(ac.localizacao::geography)) AS densidade_populacional
FROM especie e
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area ac ON h.id = ac.habitat_id
WHERE
    e.nome_cientifico = 'Panthera onca' AND h.bioma = 'Cerrado' AND ac.protegido = TRUE
GROUP BY
    e.nome_cientifico;
------------------------------------------------------------------------------------------------------------------------
/*
1-c
*/
SELECT
    ht.especie AS nome_cientifico,
    ht.nome_comum AS nome,
    ht.descricao,
    ht.genero_cientifico AS genero
FROM
    HierarquiaTaxonomica ht
    JOIN Especie_Habitat eh ON ht.especie_id = eh.especie_id
    JOIN Habitat h ON eh.habitat_id = h.id
WHERE
    ht.reino_cientifico = 'Plantae'
    AND h.bioma = 'Mata Atlântica'
    AND ht.status_conservacao IN ('Criticamente em Perigo', 'Em Perigo', 'Vulnerável')
    AND translate(lower(ht.descricao), 'ê', 'e') ILIKE '%endemica%';
------------------------------------------------------------------------------------------------------------------------
/*
3
*/
SELECT genero.nome_cientifico AS genero, COUNT(especie.id) AS numero_de_especies
FROM 
    genero
    JOIN familia ON genero.familia_id = familia.id
    JOIN especie ON especie.genero_id = genero.id
WHERE familia.nome_cientifico = 'Felidae'
    GROUP BY genero.nome_cientifico
    ORDER BY numero_de_especies DESC;

------------------------------------------------------------------------------------------------------------------------
/*
4-a
*/
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
    o.nome_cientifico = 'Primates'
    AND a.desmatado = TRUE
    AND ST_Within(e.localizacao_pontual, a.localizacao);
------------------------------------------------------------------------------------------------------------------------
SELECT
    d.nome AS doenca,
    e.nome AS especie,
    d.taxa_mortalidade
FROM doenca d
    INNER JOIN especie_doenca ed ON d.id = ed.doenca_id
    INNER JOIN especie e ON ed.especie_id = e.id
WHERE
    e.nome_cientifico = 'Pan troglodytes'
    AND d.nome = 'Doença de Chagas';
------------------------------------------------------------------------------------------------------------------------
SELECT genero.nome_cientifico AS genero, COUNT(especie.id) AS numero_de_especies
FROM genero
    INNER JOIN familia ON genero.familia_id = familia.id
    INNER JOIN especie ON especie.genero_id = genero.id
WHERE familia.nome_cientifico = 'Felidae'
GROUP BY genero.nome_cientifico
ORDER BY numero_de_especies DESC;
------------------------------------------------------------------------------------------------------------------------
SELECT
    a.data_avistamento registrado_em,
    LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento) populacao_anterior,
    SUM(a.quantidade_individuos) populacao_atual,
    CASE
        WHEN LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento) IS NULL THEN '0%'
        ELSE ROUND(
            ((SUM(a.quantidade_individuos)::NUMERIC - LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento)) /
            LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento)) * 100, 2
        )::TEXT || '%'
    END AS evolucao
FROM avistamento a
    INNER JOIN especie e ON a.especie_id = e.id
WHERE e.id = 1
GROUP BY a.data_avistamento
ORDER BY a.data_avistamento;
------------------------------------------------------------------------------------------------------------------------
/*
4-b
*/
SELECT
    h.bioma,
    ST_AsText(a.localizacao) AS localizacao,
    a.protegido,
    a.desmatado,
    e.nome_cientifico AS especie_buscada
FROM especie e
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
    INNER JOIN area a ON h.id = a.habitat_id
WHERE
    e.nome_cientifico = 'Dalbergia nigra'
    AND a.protegido = TRUE
    AND a.desmatado = FALSE
    AND e.status_conservacao IN ('Criticamente em Perigo', 'Quase Ameaçado');
------------------------------------------------------------------------------------------------------------------------
