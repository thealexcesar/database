-- DROP DATABASE species_genus;
-- CREATE DATABASE species_genus;
DROP TABLE IF EXISTS genus, species;

CREATE TABLE IF NOT EXISTS genus (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    geographical_origin VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    population BIGINT,
    habitat VARCHAR(150),
    genus_id INTEGER,
    FOREIGN KEY (genus_id) REFERENCES genus(id) ON DELETE CASCADE
);

INSERT INTO genus (name, description, geographical_origin) VALUES
    ('Apororrinco', 'Gênero de parasitas do filo Acanthocephala.', 'Mundial'),
    ('Homo', 'Gênero que inclui humanos e espécies extintas próximas.', 'África'),
    ('Canis', 'Gênero que inclui cães e lobos.', 'Mundial'),
    ('Panthera', 'Gênero que inclui grandes felinos como leões e tigres.', 'Ásia, África, América'),
    ('Eucalyptus', 'Gênero de árvores e arbustos.', 'Austrália'),
    ('Amanita', 'Gênero de cogumelos, incluindo espécies tóxicas e comestíveis.', 'Mundial'),
    ('Felis', 'Gênero que inclui gatos selvagens e domésticos.', 'Mundial'),
    ('Equus', 'Gênero que inclui cavalos, zebras e asnos.', 'África, Eurásia'),
    ('Acacia', 'Gênero de árvores e arbustos, comumente encontradas em climas tropicais e subtropicais.', 'África, Austrália'),
    ('Apis', 'Gênero que inclui abelhas melíferas.', 'Mundial'),
    ('Picea', 'Gênero de árvores coníferas conhecidas como abetos.', 'Regiões temperadas e boreais'),
    ('Salmonella', 'Gênero de bactérias patogênicas.', 'Mundial'),
    ('Rosa', 'Gênero de plantas floríferas conhecidas como rosas.', 'Mundial'),
    ('Quercus', 'Gênero que inclui carvalhos.', 'Hemisfério Norte'),
    ('Crocodylus', 'Gênero que inclui crocodilos.', 'Áreas tropicais e subtropicais'),
    ('Psittacus', 'Gênero de aves que inclui papagaios.', 'Regiões tropicais da África e América do Sul'),
    ('Lilium', 'Gênero de plantas com flores conhecidas como lírios.', 'Regiões temperadas do Hemisfério Norte'),
    ('Triticum', 'Gênero que inclui o trigo.', 'Regiões temperadas e subtropicais'),
    ('Ficus', 'Gênero que inclui figueiras.', 'Regiões tropicais e subtropicais'),
    ('Drosophila', 'Gênero que inclui moscas de frutas.', 'Mundial'),
    ('Dendroaspis', 'Gênero de cobras venenosas conhecidas como as cobras mamba.', 'África'),
    ('Opuntia', 'Gênero de cactos, conhecidos por seus espinhos e frutos comestíveis.', 'América do Norte'),
    ('Xenopus', 'Gênero de sapos conhecidos como sapos de unhas.', 'África'),
    ('Acer', 'Gênero de árvores conhecidas como bordos.', 'Hemisfério Norte'),
    ('Carcharodon', 'Gênero de tubarões conhecidos por sua grandeza e poder predatório.', 'Oceano global'),
    ('Mimosa', 'Gênero de plantas conhecidas por suas folhas sensíveis ao toque.', 'África, Américas'),
    ('Sphenodon', 'Gênero de répteis endêmicos da Nova Zelândia, conhecidos como tuatara.', 'Nova Zelândia'),
    ('Hippocampus', 'Gênero de peixes marinhos conhecidos como cavalos-marinhos, caracterizados por seu corpo em forma de cavalo e cauda prensil.', 'Regiões tropicais e subtropicais do oceano'),
    ('Acropora', 'Gênero de corais duros que formam recifes, comum na Grande Barreira de Coral.', 'Austrália');

INSERT INTO species (name, description, population, habitat, genus_id) VALUES
    ('Leão', 'Grande felídeo africano', 20000, 'Savana Africana', 4),
    ('Onça Pintada', 'Grande felídeo encontrado nas Américas, especialmente na Amazônia.', 15000, 'Floresta Amazônica e Pantanal', 4),
    ('Lobo Cinzento', 'Predador social que vive em matilhas.', 30000, 'Florestas e tundras da América do Norte e Eurásia', 3),
    ('Eucalipto', 'Árvore alta, conhecida por suas folhas aromáticas.', 5000000, 'Florestas temperadas da Austrália', 5),
    ('Amanita Muscaria', 'Cogumelo com propriedades alucinógenas, conhecido pelo chapéu vermelho com manchas brancas.', 100000, 'Florestas de coníferas e caducifólias', 6),
    ('Homo Sapiens', 'Espécie humana moderna, amplamente distribuída por todo o mundo.', 7800000000, 'Global', 2),
    ('Gato Doméstico', 'Mamífero felídeo doméstico.', 600000000, 'Habitações humanas', 7),
    ('Cavalo', 'Mamífero herbívoro usado em transporte e agricultura.', 60000000, 'Pastagens e áreas de cultivo', 8),
    ('Zebra', 'Mamífero herbívoro conhecido por suas listras distintas.', 800000, 'Savana Africana', 8),
    ('Acácia', 'Árvore ou arbusto, comumente usado como planta ornamental.', 100000000, 'Regiões áridas e semiáridas', 9),
    ('Abelha Europeia', 'Espécie de abelha melífera.', 50000000, 'Habitações humanas e áreas de cultivo', 10),
    ('Abeto', 'Árvore conífera alta usada em construção e como árvore de Natal.', 100000000, 'Florestas boreais', 11),
    ('Salmonella Enterica', 'Bactéria patogênica causadora de doenças em humanos.', 1000000000, 'Ambientes diversos, incluindo alimentos contaminados', 12),
    ('Rosa', 'Planta com flores popular em jardins e como flor de corte.', 300000000, 'Jardins e viveiros', 13),
    ('Carvalho', 'Árvore robusta conhecida por sua madeira resistente.', 200000000, 'Florestas temperadas', 14),
    ('Crocodilo do Nilo', 'Grande réptil aquático encontrado em rios africanos.', 500000, 'Rios e pântanos africanos', 15),
    ('Papagaio Africano Cinza', 'Ave popular como animal de estimação, conhecida por sua habilidade de imitar sons.', 5000000, 'Florestas tropicais africanas', 16),
    ('Lírio', 'Planta com flores grandes e perfumadas, popular em arranjos florais.', 100000000, 'Jardins e florestas temperadas', 17),
    ('Trigo', 'Cereal básico cultivado para consumo humano e animal.', 1000000000, 'Campos de cultivo', 18),
    ('Figueira', 'Árvore que produz frutos comestíveis.', 100000000, 'Regiões tropicais e subtropicais', 19),
    ('Mosca da Fruta', 'Inseto modelo em pesquisas genéticas.', 1000000000, 'Habitações humanas e áreas de cultivo', 20),
    ('Apororrinco Aculeatus', 'Espécie de parasita encontrada em aves.', 10000, 'Florestas tropicais', 1),
    ('Apororrinco Amphistomi', 'Parasita de aves aquáticas.', 8000, 'Zonas úmidas e pantanosas', 1),
    ('Tatu-Bola', 'Pequeno mamífero com casco duro encontrado na Floresta Amazônica.', 50000, 'Floresta Amazônica', 1),
    ('Búfalo-Caboclo', 'Grande herbívoro que habita áreas alagadas e florestas tropicais.', 12000, 'Floresta Amazônica', 1),
    ('Arara-Azul', 'Aves grandes e coloridas conhecidas por sua plumagem vibrante.', 1500, 'Floresta Amazônica', 16),
    ('Jaguarundi', 'Felídeo de tamanho médio encontrado em florestas tropicais.', 2000, 'Floresta Amazônica', 4),
    ('Canis Lupus', 'Espécie de lobo cinzento, ancestral dos cães domésticos.', 200000, 'Florestas temperadas e árticas', 3),
    ('Canis Lupus Familiaris', 'Espécie de cão doméstico.', 900000000, 'Habitações humanas', 3),
    ('Panthera Leo', 'Leão, um grande felídeo africano.', 20000, 'Savanas africanas', 4),
    ('Panthera Tigris', 'Tigre, o maior felídeo do mundo.', 3900, 'Florestas da Ásia', 4),
    ('Eucalyptus Globulus', 'Espécie de eucalipto conhecida por suas folhas aromáticas.', 100000000, 'Florestas temperadas da Austrália', 5),
    ('Amanita Phalloides', 'Cogumelo venenoso, conhecido como "cogumelo da morte".', 10000, 'Florestas de coníferas e decíduas', 6),
    ('Felis Catus', 'Gato doméstico, um mamífero felídeo.', 600000000, 'Habitações humanas', 7),
    ('Equus Asinus', 'Asno, um animal de carga resistente.', 40000000, 'Regiões áridas e semiáridas', 8),
    ('Equus Quagga', 'Zebra da planície, conhecida por suas listras.', 300000, 'Savana africana', 8),
    ('Acacia Senegal', 'Espécie de acácia usada na produção de goma arábica.', 1000000, 'Regiões áridas da África', 9),
    ('Apis Mellifera', 'Abelha europeia, conhecida pela produção de mel.', 50000000, 'Áreas de cultivo e habitações humanas', 10),
    ('Picea Abies', 'Abeto europeu, usado em construção e decoração.', 10000000, 'Florestas boreais da Europa', 11),
    ('Salmonella Typhimurium', 'Variedade de Salmonella que causa gastroenterite.', 10000000, 'Ambientes diversos', 12),
    ('Rosa Rugosa', 'Espécie de rosa conhecida por suas flores perfumadas e resistente a doenças.', 20000000, 'Jardins e paisagismo', 13),
    ('Quercus Robur', 'Carvalho comum na Europa.', 20000000, 'Florestas temperadas da Europa', 14),
    ('Crocodylus Porosus', 'Crocodilo marinho encontrado na Austrália e regiões próximas.', 5000, 'Rios e áreas costeiras', 15),
    ('Psittacus Erithacus', 'Papagaio cinza africano, conhecido por sua inteligência.', 1000000, 'Florestas tropicais da África', 16),
    ('Lilium Candidum', 'Lírio branco, conhecido por suas flores grandes e perfumadas.', 20000000, 'Jardins e florestas temperadas', 17),
    ('Triticum Aestivum', 'Trigo comum, amplamente cultivado para alimentação.', 1000000000, 'Campos de cultivo', 18),
    ('Ficus Carica', 'Figueira comum, cultivada por seus frutos doces.', 20000000, 'Regiões tropicais e subtropicais', 19),
    ('Drosophila Melanogaster', 'Mosca da fruta, modelo em pesquisas genéticas.', 1000000000, 'Ambientes diversos', 20),
    ('Dendroaspis Polylepis', 'Mamba do Cabo, uma cobra venenosa africana.', 2000, 'Áreas abertas e florestas', 15),
    ('Opuntia Ficus-Indica', 'Cacto conhecido como pera espinhosa, comestível.', 1000000, 'Regiões áridas e semiáridas', 21),
    ('Xenopus Laevis', 'Sapo de unhas africano, usado em pesquisas científicas.', 1000000, 'Áreas alagadas da África', 22),
    ('Acer Saccharum', 'Maple, árvore produtora de xarope de bordo.', 10000000, 'Florestas temperadas da América do Norte', 23),
    ('Carcharodon Carcharias', 'Grande tubarão branco, conhecido por seu tamanho e poder predatório.', 3500, 'Oceano Atlântico e Pacífico', 24),
    ('Carcharodon Megalodon', 'Espécie extinta de tubarão gigante que viveu há milhões de anos.', 3000, 'Oceano global', 24),
    ('Carcharodon Hastalis', 'Espécie extinta de tubarão conhecida como o tubarão-dente-de-serra.', 3000, 'Oceano global', 24),
    ('Hippocampus Reidi', 'Cavalo-marinho-de-focinho-longo, encontrado no Atlântico ocidental.', 20000, 'Recifes de coral e ervas marinhas do Atlântico', 28),
    ('Hippocampus Abdominalis', 'Cavalo-marinho gigante, encontrado ao longo da costa da Austrália e Nova Zelândia.', 10000, 'Recifes de coral e áreas costeiras', 28),
    ('Acropora millepora', 'Coral de recife que forma grandes colônias ramificadas, encontrado na Grande Barreira de Coral.', 3000, 'Recifes de coral da Grande Barreira de Coral', 29),
    ('Acropora cervicornis', 'Coral de recife que se assemelha a galhos, importante para a estrutura do recife.', 3300, 'Recifes de coral da Grande Barreira de Coral', 29),
    ('Pocillopora damicornis', 'Coral de recife que forma colônias compactas e ramificadas, encontrado em águas rasas.', 3080, 'Recifes de coral da Grande Barreira de Coral', 29),
    ('Porites lutea', 'Coral que forma grandes colônias massivas e redondas, comum na Grande Barreira de Coral.', 2900, 'Recifes de coral da Grande Barreira de Coral', 29);

SELECT s.name, s.habitat, s.population, s.habitat, g.name genero_nome, g.description genero_descricao,
       g.geographical_origin genero_origem FROM species s INNER JOIN genus g ON g.id = s.genus_id;

SELECT g.name, g.description, COUNT(g.id) total_generos FROM genus g
    LEFT JOIN species s ON g.id = s.genus_id GROUP BY g.name, g.description ORDER BY total_generos DESC;

-- Enunciado 3 igual ao enunciado 1, vou pular par o enunciado 4.

SELECT g.name, g.description, g.geographical_origin  FROM genus g
    LEFT JOIN species s ON g.id = s.genus_id WHERE s.id IS NULL;

SELECT s.name, s.description, s.population, s.habitat, g.name genero FROM species s
    LEFT JOIN genus g ON g.id = s.genus_id ORDER BY population LIMIT 1;

SELECT s.name, s.description, s.population, s.habitat, g.name genero FROM species s
    LEFT JOIN genus g ON g.id = s.genus_id ORDER BY population DESC;

SELECT s.name, s.description, s.population, s.habitat, g.name genero
    FROM species s LEFT JOIN genus g ON g.id = s.genus_id
    WHERE habitat LIKE '%Floresta Amazônica%' ORDER BY population DESC;

SELECT * FROM species s LEFT JOIN genus g ON g.id = s.genus_id WHERE g.name = 'Carcharodon';

SELECT s.name, s.description, s.habitat, s.population, g.name genero, g.geographical_origin origem
    FROM genus g RIGHT JOIN public.species s ON g.id = s.genus_id WHERE s.name = 'Hippocampus Reidi';

SELECT COUNT(DISTINCT species.id) numero_especies FROM species LEFT JOIN genus ON species.genus_id = genus.id
    WHERE species.habitat = 'Recifes de coral da Grande Barreira de Coral'
    AND (genus.geographical_origin = 'Austrália' OR genus.geographical_origin IS NULL);

SELECT g.name genero, g.geographical_origin, g.description, COUNT(s.id) AS total_especies FROM species s
    INNER JOIN genus g ON s.genus_id = g.id GROUP BY g.name, g.geographical_origin, g.description ORDER BY total_especies DESC;
