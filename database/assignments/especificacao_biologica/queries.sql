UPDATE especie SET populacao = 0 WHERE id = 1;

SELECT * FROM doenca;
SELECT * FROM area;

SELECT DISTINCT
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

