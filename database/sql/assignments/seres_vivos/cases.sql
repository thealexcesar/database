-- 1. "Doenças emergentes associadas a primatas em áreas de desmatamento e a taxa de mortalidade dessas doenças"
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

-- 2. "Coexistência de espécies de peixe nativas com espécies invasoras e suas interações ecológicas"
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
