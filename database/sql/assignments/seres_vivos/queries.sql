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

-- c) Quais espécies de plantas são endêmicas da Mata Atlântica e estão ameaçadas de extinção?
SELECT
    e.nome_cientifico,
    e.nome
FROM
    especie e
INNER JOIN
    genero g ON e.genero_id = g.id
INNER JOIN
    familia f ON g.familia_id = f.id
INNER JOIN
    ordem o ON f.ordem_id = o.id
INNER JOIN
    classe c ON o.classe_id = c.id
INNER JOIN
    especie_habitat eh ON e.id = eh.especie_id
INNER JOIN
    habitat h ON eh.habitat_id = h.id
-- WHERE translate(lower(e.descricao), 'ê', 'e') ILIKE '%endemica%';
--     AND e.status_conservacao IN ('Criticamente em Perigo', 'Em Perigo', 'Vulnerável')
--     AND c.nome = 'Plantae';





/*SELECT
    e.nome_cientifico,
    e.nome,e.descricao,
    e.populacao,
    e.status_conservacao,
    g.nome_cientifico GENERO,
    f.nome FILO,
    o.nome ORDEM,
    c.nome CLASSE
FROM especie e
    INNER JOIN public.genero g ON g.id = e.genero_id
    INNER JOIN public.familia f on f.id = g.familia_id
    INNER JOIN public.ordem o on o.id = f.ordem_id
    INNER JOIN public.classe c on c.id = o.classe_id
    INNER JOIN public.filo f2 on f2.id = c.filo_id
WHERE g.nome_cientifico = 'Homo';*/