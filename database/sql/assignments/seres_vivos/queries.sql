SELECT
    e.nome_cientifico,
    e.nome
FROM especie e
    INNER JOIN genero g ON e.genero_id = g.id
    INNER JOIN familia f ON g.familia_id = f.id
    INNER JOIN ordem o ON f.ordem_id = o.id
    INNER JOIN classe c ON o.classe_id = c.id
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
WHERE
    e.migratoria = TRUE AND h.bioma = 'Floresta Amazônica' AND c.nome_cientifico = 'Aves';
------------------------------------------------------------------------------------------------------------------------
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
SELECT e.nome_cientifico, e.nome, e.descricao, g.nome_cientifico genero
FROM especie e
    INNER JOIN genero g ON e.genero_id = g.id
    INNER JOIN familia f ON g.familia_id = f.id
    INNER JOIN ordem o ON f.ordem_id = o.id
    INNER JOIN classe c ON o.classe_id = c.id
    INNER JOIN filo fi ON c.filo_id = fi.id
    INNER JOIN reino r ON fi.reino_id = r.id
    INNER JOIN especie_habitat eh ON e.id = eh.especie_id
    INNER JOIN habitat h ON eh.habitat_id = h.id
WHERE
    r.nome_cientifico = 'Plantae'
    AND h.bioma = 'Mata Atlântica'
    AND e.status_conservacao IN ('Criticamente em Perigo', 'Em Perigo', 'Vulnerável')
    AND translate(lower(e.descricao), 'ê', 'e') ILIKE '%endemica%' ;
------------------------------------------------------------------------------------------------------------------------
SELECT
    a.data_avistamento registrado_em,
    LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento) populacao_anterior,
    SUM(a.quantidade_individuos) populacao_atual,
    CASE
        WHEN LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento) IS NULL THEN '0 %'
        ELSE ROUND(
            ((SUM(a.quantidade_individuos)::NUMERIC - LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento)) /
            LAG(SUM(a.quantidade_individuos)) OVER (ORDER BY a.data_avistamento)) * 100, 2
        )::TEXT || ' %'
    END AS evolucao
FROM avistamento a
    INNER JOIN especie e ON a.especie_id = e.id
WHERE e.id = 1
GROUP BY a.data_avistamento
ORDER BY a.data_avistamento;
------------------------------------------------------------------------------------------------------------------------
SELECT
    h.bioma,
    ST_AsText(a.localizacao) AS localizacao,
    a.protegido,
    a.desmatado,
    e.nome_cientifico AS especie_buscada
FROM especie e
    JOIN especie_habitat eh ON e.id = eh.especie_id
    JOIN habitat h ON eh.habitat_id = h.id
    JOIN area a ON h.id = a.habitat_id
WHERE
    e.nome_cientifico = 'Dalbergia nigra'
    AND a.protegido = TRUE
    AND a.desmatado = FALSE
    AND e.status_conservacao IN ('Criticamente em Perigo', 'Quase Ameaçado');
------------------------------------------------------------------------------------------------------------------------
