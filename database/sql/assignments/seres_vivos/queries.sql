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
SELECT e.nome_cientifico, e.nome, e.descricao
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
