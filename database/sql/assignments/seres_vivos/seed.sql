INSERT INTO dominio (nome_cientifico) VALUES ('Eukarya'), ('Bacteria');

INSERT INTO reino (nome_cientifico, nome, descricao, dominio_id) VALUES
    ('Animalia', 'Reino Animalia', 'Reino dos animais', 1),
    ('Protista', 'Reino Protista', 'Reino dos protistas', 1),
    ('Fungi', 'Reino Fungi', 'Reino dos fungos', 1),
    ('Plantae', 'Reino Plantae', 'Reino das plantas', 1),
    ('Archaea', 'Reino Archaea', 'Reino das arqueobactérias', 2),
    ('Monera', 'Reino Monera', 'Reino das bactérias', 2);

INSERT INTO filo (nome_cientifico, nome, descricao, reino_id) VALUES
    ('Chordata', 'Cordados', 'Animais com notocorda', (SELECT id FROM reino WHERE nome_cientifico = 'Animalia')),
    ('Arthropoda', 'Artrópodes', 'Invertebrados com exoesqueleto', (SELECT id FROM reino WHERE nome_cientifico = 'Animalia')),
    ('Ascomycota', 'Ascomicetos', 'Fungos com ascos', (SELECT id FROM reino WHERE nome_cientifico = 'Fungi')),
    ('Bacillariophyta', 'Diatomáceas', 'Algas unicelulares', (SELECT id FROM reino WHERE nome_cientifico = 'Protista')),
    ('Cyanobacteria', 'Cianobactérias', 'Bactérias fotossintéticas', (SELECT id FROM reino WHERE nome_cientifico = 'Monera')),
    ('Echinodermata', 'Equinodermes', 'Animais marinhos deuterostômios', (SELECT id FROM reino WHERE nome_cientifico = 'Animalia')),
    ('Mollusca', 'Moluscos', 'Invertebrados de corpo mole', (SELECT id FROM reino WHERE nome_cientifico = 'Animalia')),
    ('Annelida', 'Anelídeos', 'Vermes segmentados', (SELECT id FROM reino WHERE nome_cientifico = 'Animalia')),
    ('Tracheophyta', 'Tracheófitas', 'Plantas vasculares', (SELECT id FROM reino WHERE nome_cientifico = 'Plantae')),
    ('Magnoliophyta', 'Angiospermas', 'Plantas com flores', (SELECT id FROM reino WHERE nome_cientifico = 'Plantae')),
    ('Angiospermae', 'Angiospermae', 'Plantas com flores e frutos', (SELECT id FROM reino WHERE nome_cientifico = 'Plantae'))

INSERT INTO classe (nome_cientifico, nome, descricao, filo_id) VALUES
    ('Mammalia', 'Mamíferos', 'Animais com glândulas mamárias', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Insecta', 'Insetos', 'Artrópodes com três pares de patas', (SELECT id FROM filo WHERE nome_cientifico = 'Arthropoda')),
    ('Eurotiomycetes', 'Eurotiómicetes', 'Fungos com ascos em peritécios', (SELECT id FROM filo WHERE nome_cientifico = 'Ascomycota')),
    ('Bacillariophyceae', 'Diatomáceas', 'Algas com frústulas de sílica', (SELECT id FROM filo WHERE nome_cientifico = 'Bacillariophyta')),
    ('Cyanophyceae', 'Cianobactérias', 'Bactérias com pigmentos fotossintéticos', (SELECT id FROM filo WHERE nome_cientifico = 'Cyanobacteria')),
    ('Reptilia', 'Répteis', 'Animais com escamas e pele seca', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Aves', 'Aves', 'Animais com penas e capacidade de voar', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Sirenia', 'Sirênios', 'Mamíferos aquáticos', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Anura', 'Anuros', 'Anfíbios sem cauda', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Cetacea', 'Cetáceos', 'Mamíferos marinhos', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Artiodactyla', 'Artiodáctilos', 'Mamíferos com número par de dedos', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Rodentia', 'Roedores', 'Mamíferos roedores', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Pilosa', 'Pilosos', 'Mamíferos com pêlos modificados', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Cingulata', 'Cingulados', 'Mamíferos com carapaça', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Amphibia', 'Anfíbios', 'Classe de animais vertebrados que inclui rãs, sapos, salamandras e cecílias', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')),
    ('Echinoidea', 'Equinóides', 'Equinodermes de corpo globoso ou achatado', (SELECT id FROM filo WHERE nome_cientifico = 'Echinodermata')),
    ('Malacostraca', 'Malacostráceos', 'Crustáceos com corpo segmentado', (SELECT id FROM filo WHERE nome_cientifico = 'Arthropoda')),
    ('Bivalvia', 'Bivalves', 'Moluscos com conchas divididas em duas partes', (SELECT id FROM filo WHERE nome_cientifico = 'Mollusca')),
    ('Polychaeta', 'Poliquetas', 'Anelídeos com muitos segmentos', (SELECT id FROM filo WHERE nome_cientifico = 'Annelida')),
    ('Gastropoda', 'Gastrópodes', 'Moluscos com uma única concha em espiral', (SELECT id FROM filo WHERE nome_cientifico = 'Mollusca')),
    ('Pinopsida', 'Pinopsida', 'Classe de coníferas', (SELECT id FROM filo WHERE nome_cientifico = 'Tracheophyta')),
    ('Liliopsida', 'Monocotiledôneas', 'Plantas com uma folha embrionária', (SELECT id FROM filo WHERE nome_cientifico = 'Angiospermae')),
    ('Magnoliopsida', 'Dicotiledôneas', 'Plantas com dois cotilédones', (SELECT id FROM filo WHERE nome_cientifico = 'Magnoliophyta'));

INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id) VALUES
    ('Carnivora', 'Carnívoros', 'Mamíferos carnívoros', (SELECT id FROM classe WHERE nome_cientifico = 'Mammalia')),
    ('Psittaciformes', 'Psitacídeos', 'Papagaios e araras', (SELECT id FROM classe WHERE nome_cientifico = 'Aves')),
    ('Passeriformes', 'Passeriformes', 'Aves canoras', (SELECT id FROM classe WHERE nome_cientifico = 'Aves')),
    ('Anseriformes', 'Anseriformes', 'Patos e gansos', (SELECT id FROM classe WHERE nome_cientifico = 'Aves')),
    ('Ciconiiformes', 'Ciconiiformes', 'Garças e cegonhas', (SELECT id FROM classe WHERE nome_cientifico = 'Aves')),
    ('Accipitriformes', 'Accipitriformes', 'Águias, gaviões e outros rapinantes', (SELECT id FROM classe WHERE nome_cientifico = 'Aves')),
    ('Apodiformes', 'Apodiformes', 'Beija-flores e andorinhas', (SELECT id FROM classe WHERE nome_cientifico = 'Aves')),
    ('Primates', 'Primatas', 'Mamíferos com polegares oponíveis', (SELECT id FROM classe WHERE nome_cientifico = 'Mammalia')),
    ('Coleoptera', 'Coleópteros', 'Insetos com élitros', (SELECT id FROM classe WHERE nome_cientifico = 'Insecta')),
    ('Fabales', 'Fabales', 'Plantas leguminosas', (SELECT id FROM classe WHERE nome_cientifico = 'Magnoliopsida')),
    ('Asparagales', 'Asparagales', 'Ordem de plantas monocotiledôneas', (SELECT id FROM classe WHERE nome_cientifico = 'Liliopsida')),
    ('Pelecaniformes', 'Pelicaniformes', 'Aves aquáticas de médio a grande porte', (SELECT id FROM classe WHERE nome_cientifico = 'Aves')),
    ('Gastropoda', 'Gastrópodes', 'Moluscos com uma única concha em espiral', (SELECT id FROM filo WHERE nome_cientifico = 'Mollusca')),
    ('Decapoda', 'Decápodes', 'Crustáceos com dez patas', (SELECT id FROM classe WHERE nome_cientifico = 'Malacostraca')),
    ('Neogastropoda', 'Neogastropoda', 'Moluscos gastrópodes avançados', (SELECT id FROM classe WHERE nome_cientifico = 'Gastropoda')),
    ('Sabellida', 'Sabélidos', 'Anelídeos tubícolas', (SELECT id FROM classe WHERE nome_cientifico = 'Polychaeta')),
    ('Echinolampadacea', 'Echinolampadacea', 'Ordem de bolachas-do-mar', (SELECT id FROM classe WHERE nome_cientifico = 'Echinoidea')),
    ('Pinales', 'Pinheiros', 'Coníferas', (SELECT id FROM classe WHERE nome_cientifico = 'Pinopsida')),
    ('Arecales', 'Palmeiras', 'Plantas monocotiledôneas', (SELECT id FROM classe WHERE nome_cientifico = 'Liliopsida')),
    ('Myrtales', 'Mirtales', 'Ordem de plantas dicotiledôneas', (SELECT id FROM classe WHERE nome_cientifico = 'Magnoliopsida')),
    ('Nymphaeales', 'Ninféias', 'Plantas aquáticas', (SELECT id FROM classe WHERE nome_cientifico = 'Magnoliopsida')),
    ('Sapindales', 'Sapindales', 'Ordem de plantas dicotiledôneas', (SELECT id FROM classe WHERE nome_cientifico = 'Magnoliopsida'));

INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id) VALUES
    ('Hominidae', 'Hominídeos', 'Primatas de grande porte', (SELECT id FROM ordem WHERE nome_cientifico = 'Primates')),
    ('Felidae', 'Felídeos', 'Grandes felinos', (SELECT id FROM ordem WHERE nome_cientifico = 'Carnivora')),
    ('Psittacidae', 'Psitacídeos', 'Papagaios e araras', (SELECT id FROM ordem WHERE nome_cientifico = 'Psittaciformes')),
    ('Turdidae', 'Turdídeos', 'Aves canoras', (SELECT id FROM ordem WHERE nome_cientifico = 'Passeriformes')),
    ('Anatidae', 'Anatídeos', 'Patos', (SELECT id FROM ordem WHERE nome_cientifico = 'Anseriformes')),
    ('Cathartidae', 'Catartídeos', 'Urubus e condores', (SELECT id FROM ordem WHERE nome_cientifico = 'Ciconiiformes')),
    ('Accipitridae', 'Accipitrídeos', 'Águias, gaviões e outros rapinantes', (SELECT id FROM ordem WHERE nome_cientifico = 'Accipitriformes')),
    ('Trochilidae', 'Troquilídeos', 'Beija-flores', (SELECT id FROM ordem WHERE nome_cientifico = 'Apodiformes')),
    ('Pipridae', 'Piprídeos', 'Aves', (SELECT id FROM ordem WHERE nome_cientifico = 'Passeriformes')),
    ('Rheidae', 'Rheídeos', 'Emas', (SELECT id FROM ordem WHERE nome_cientifico = 'Ciconiiformes')),
    ('Curculionidae', 'Curculionídeos', 'Besouros gorgulhos', (SELECT id FROM ordem WHERE nome_cientifico = 'Coleoptera')),
    ('Orchidaceae', 'Orquidáceas', 'Família das orquídeas', (SELECT id FROM ordem WHERE nome_cientifico = 'Asparagales')),
    ('Canidae', 'Canídeos', 'Família dos cães, lobos e raposas', (SELECT id FROM ordem WHERE nome_cientifico = 'Carnivora')),
    ('Ardeidae', 'Ardeidae', 'Família das garças e socós', (SELECT id FROM ordem WHERE nome_cientifico = 'Pelecaniformes')),
    ('Mellitidae', 'Mellitidae', 'Família de bolachas-do-mar', (SELECT id FROM ordem WHERE nome_cientifico = 'Echinolampadacea')),
    ('Sesarmidae', 'Sesarmidae', 'Família de caranguejos terrestres', (SELECT id FROM ordem WHERE nome_cientifico = 'Decapoda')),
    ('Muricidae', 'Muricidae', 'Família de moluscos predadores', (SELECT id FROM ordem WHERE nome_cientifico = 'Neogastropoda')),
    ('Sabellariidae', 'Sabellariidae', 'Família de vermes tubícolas', (SELECT id FROM ordem WHERE nome_cientifico = 'Sabellida')),
    ('Araucariaceae', 'Araucariáceas', 'Família das araucárias', (SELECT id FROM ordem WHERE nome_cientifico = 'Pinales')),
    ('Arecaceae', 'Arecáceas', 'Família das palmeiras', (SELECT id FROM ordem WHERE nome_cientifico = 'Arecales')),
    ('Myrtaceae', 'Mirtáceas', 'Família das mirtáceas', (SELECT id FROM ordem WHERE nome_cientifico = 'Myrtales')),
    ('Nymphaeaceae', 'Ninféias', 'Família das plantas aquáticas', (SELECT id FROM ordem WHERE nome_cientifico = 'Nymphaeales')),
    ('Anacardiaceae', 'Anacardiáceas', 'Família do caju', (SELECT id FROM ordem WHERE nome_cientifico = 'Sapindales')),
    ('Fabaceae', 'Fabaceae', 'Família de plantas leguminosas', (SELECT id FROM ordem WHERE nome_cientifico = 'Fabales'));

INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES
    ('Ara', 'Arara', 'Araras', (SELECT id FROM familia WHERE nome_cientifico = 'Psittacidae')),
    ('Amazona', 'Papagaio', 'Papagaios', (SELECT id FROM familia WHERE nome_cientifico = 'Psittacidae')),
    ('Dendrocygna', 'Irerê', 'Patos', (SELECT id FROM familia WHERE nome_cientifico = 'Anatidae')),
    ('Chiroxiphia', 'Tangará', 'Aves', (SELECT id FROM familia WHERE nome_cientifico = 'Pipridae')),
    ('Turdus', 'Sabiá', 'Aves canoras', (SELECT id FROM familia WHERE nome_cientifico = 'Turdidae')),
    ('Cathartes', 'Urubu', 'Urubus', (SELECT id FROM familia WHERE nome_cientifico = 'Cathartidae')),
    ('Geranoaetus', 'Gavião', 'Águias e gaviões', (SELECT id FROM familia WHERE nome_cientifico = 'Accipitridae')),
    ('Rhea', 'Ema', 'Ema', (SELECT id FROM familia WHERE nome_cientifico = 'Rheidae')),
    ('Amazilia', 'Beija-flor', 'Beija-flores', (SELECT id FROM familia WHERE nome_cientifico = 'Trochilidae')),
    ('Panthera', 'Pantera', 'Gênero que inclui grandes felinos como leões e tigres.', (SELECT id FROM familia WHERE nome_cientifico = 'Felidae')),
    ('Homo', 'Homem', 'Primatas bípedes', (SELECT id FROM familia WHERE nome_cientifico = 'Hominidae')),
    ('Pan', 'Chimpanzé', 'Primatas não-humanos, conhecidos como chimpanzés', (SELECT id FROM familia WHERE nome_cientifico = 'Hominidae')),
    ('Araucaria', 'Araucária', 'Árvores coníferas', (SELECT id FROM familia WHERE nome_cientifico = 'Araucariaceae')),
    ('Euterpe', 'Palmeira', 'Palmeiras', (SELECT id FROM familia WHERE nome_cientifico = 'Arecaceae')),
    ('Myrciaria', 'Myrciaria', 'Plantas frutíferas', (SELECT id FROM familia WHERE nome_cientifico = 'Myrtaceae')),
    ('Victoria', 'Vitória-régia', 'Plantas aquáticas', (SELECT id FROM familia WHERE nome_cientifico = 'Nymphaeaceae')),
    ('Anacardium', 'Cajueiro', 'Árvores frutíferas', (SELECT id FROM familia WHERE nome_cientifico = 'Anacardiaceae')),
    ('Dalbergia', 'Dalbergia', 'Árvores e arbustos conhecidos por sua madeira de alta qualidade.', (SELECT id FROM familia WHERE nome_cientifico = 'Fabaceae'));

INSERT INTO especie (nome_cientifico, nome, descricao, migratoria, populacao, localizacao_pontual, genero_id) VALUES
    ('Amazona ochrocephala', 'Papagaio-cabeça-amarela', 'Papagaio encontrado em florestas tropicais', FALSE, 50000, ST_GeomFromText('POINT(-3.71722 -38.54337)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazona')),
    ('Amazona aestiva', 'Papagaio-verdadeiro', 'Papagaio comum nas florestas brasileiras', FALSE, 100000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazona')),
    ('Dendrocygna viduata', 'Irerê', 'Pato encontrado em lagos e pântanos', FALSE, 300000, ST_GeomFromText('POINT(-5.79448 -35.211)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Dendrocygna')),
    ('Turdus rufiventris', 'Sabiá-laranjeira', 'Ave canora comum em todo o Brasil', FALSE, 2000000, ST_GeomFromText('POINT(-19.9167 -43.9345)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Turdus')),
    ('Cathartes aura', 'Urubu-de-cabeça-vermelha', 'Grande ave necrófaga', FALSE, 100000, ST_GeomFromText('POINT(-15.7941 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Cathartes')),
    ('Geranoaetus melanoleucus', 'Gavião-de-rabo-branco', 'Grande ave de rapina', true, 50000, ST_GeomFromText('POINT(-22.9068 -43.1729)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Geranoaetus')),
    ('Rhea americana', 'Ema', 'Grande ave não voadora', FALSE, 50000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Rhea')),
    ('Homo sapiens', 'Ser humano', 'Espécie humana moderna', FALSE, 7800000000, ST_GeomFromText('POINT(0 0)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Homo')),
    ('Ara ararauna', 'Arara-canindé', 'Grande arara azul e amarela encontrada em florestas tropicais', FALSE, 60000, ST_GeomFromText('POINT(-3.71722 -38.54337)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Ara')),
    ('Dendrocygna autumnalis', 'Irerê-de-cara-branca', 'Pato encontrado em lagos e pântanos', FALSE, 250000, ST_GeomFromText('POINT(-5.79448 -35.211)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Dendrocygna')),
    ('Chiroxiphia lanceolata', 'Tangará-dançarino', 'Pequena ave frugívora encontrada em matas', FALSE, 45000, ST_GeomFromText('POINT(-15.7941 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Chiroxiphia')),
    ('Turdus leucomelas', 'Sabiá-barranco', 'Ave canora comum em várias regiões do Brasil', FALSE, 1500000, ST_GeomFromText('POINT(-19.9167 -43.9345)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Turdus')),
    ('Cathartes burrovianus', 'Urubu-de-cabeça-amarela', 'Grande ave necrófaga', true, 120000, ST_GeomFromText('POINT(-15.7941 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Cathartes')),
    ('Geranoaetus polyosoma', 'Gavião-cinzento', 'Grande ave de rapina', true, 40000, ST_GeomFromText('POINT(-22.9068 -43.1729)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Geranoaetus')),
    ('Rhea pennata', 'Ema-de-darwin', 'Grande ave não voadora', FALSE, 55000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Rhea')),
    ('Amazilia lactea', 'Beija-flor-de-peito-azul', 'Pequena ave nectarívora', true, 450000, ST_GeomFromText('POINT(-15.7941 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazilia')),
    ('Ara chloropterus', 'Arara-vermelha', 'Grande arara encontrada em florestas tropicais', true, 50000, ST_GeomFromText('POINT(-3.71722 -38.54337)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Ara')),
    ('Panthera leo', 'Leão', 'Grande felino encontrado na savana africana', FALSE, 20000, ST_GeomFromText('POINT(1.2921 36.8219)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Panthera')),
    ('Homo neanderthalensis', 'Neandertal', 'Espécie extinta de hominídeo que viveu na Europa e na Ásia', FALSE, 0, ST_GeomFromText('POINT(50.1109 8.6821)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Homo')),
    ('Pan troglodytes', 'Chimpanzé-comum', 'Espécie de chimpanzé encontrada na África subsaariana', FALSE, 200000, ST_GeomFromText('POINT(15 0)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Pan')),
    ('Panthera tigris', 'Tigre', 'Grande felino encontrado na Ásia', FALSE, 3900, ST_GeomFromText('POINT(26.8206 30.8025)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Panthera')),
    ('Homo erectus', 'Homo erectus', 'Espécie extinta de hominídeo que viveu na África e na Ásia', FALSE, 0, ST_GeomFromText('POINT(0.0000 37.0000)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Homo')),
    ('Pan paniscus', 'Bonobo', 'Espécie de chimpanzé encontrada na África Central', FALSE, 100000, ST_GeomFromText('POINT(-2.0000 23.0000)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Pan')),
    ('Araucaria angustifolia', 'Pinheiro-do-Paraná', 'Árvore conífera nativa do Brasil', FALSE, 2000000, ST_GeomFromText('POINT(-25.4284 -49.2733)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Araucaria')),
    ('Euterpe edulis', 'Palmito-juçara', 'Palmeira nativa da Mata Atlântica brasileira', FALSE, 5000000, ST_GeomFromText('POINT(-23.5505 -46.6333)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Euterpe')),
    ('Myrciaria dubia', 'Camu-camu', 'Fruto nativo da Amazônia conhecido por seu alto teor de vitamina C', FALSE, 1000000, ST_GeomFromText('POINT(-3.4653 -62.2159)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Myrciaria')),
    ('Victoria amazonica', 'Vitória-régia', 'Planta aquática nativa da Amazônia', FALSE, 100000, ST_GeomFromText('POINT(-3.4166 -65.8561)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Victoria')),
    ('Anacardium occidentale', 'Cajueiro', 'Árvore frutífera nativa do Nordeste do Brasil', FALSE, 2000000, ST_GeomFromText('POINT(-5.79448 -35.211)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Anacardium')),
    ('Ara macao', 'Arara-vermelha', 'Grande arara vermelha encontrada em florestas tropicais', FALSE, 700, ST_GeomFromText('POINT(-3.71722 -38.54337)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Ara')),
    ('Panthera onca', 'Onça-pintada', 'Grande felino encontrado nas Américas', FALSE, 800000, ST_GeomFromText('POINT(-50 -15)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Panthera')),
    ('Amazona farinosa', 'Papagaio-moleiro', 'Papagaio comum nas florestas brasileiras', FALSE, 75000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazona')),
    ('Dalbergia nigra', 'Jacarandá-da-Bahia', 'Árvore de madeira nobre, endêmica da Mata Atlântica, e criticamente ameaçada.', FALSE, 100, ST_GeomFromText('POINT(-43.2 -22.9)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Dalbergia'));

INSERT INTO habitat (bioma, localizacao) VALUES
    ('Floresta Amazônica', ST_SetSRID(ST_GeomFromText('POLYGON((-74 -3, -54 -3, -54 5, -74 5, -74 -3))'), 4326)),
    ('Pantanal', ST_SetSRID(ST_GeomFromText('POLYGON((-58 -20, -56 -20, -56 -17, -58 -17, -58 -20))'), 4326)),
    ('Mata Atlântica', ST_SetSRID(ST_GeomFromText('POLYGON((-45 -25, -35 -25, -35 -15, -45 -15, -45 -25))'), 4326)),
    ('Cerrado', ST_SetSRID(ST_GeomFromText('POLYGON((-55 -20, -45 -20, -45 -10, -55 -10, -55 -20))'), 4326)),
    ('Caatinga', ST_SetSRID(ST_GeomFromText('POLYGON((-40 -12, -36 -12, -36 -8, -40 -8, -40 -12))'), 4326)),
    ('Recife de Coral', ST_SetSRID(ST_GeomFromText('POLYGON((145 -10, 145 -5, 150 -5, 150 -10, 145 -10))'), 4326));

INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara ararauna'), (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona ochrocephala'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna autumnalis'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Chiroxiphia lanceolata'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Cathartes burrovianus'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus polyosoma'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Rhea pennata'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Amazilia lactea'), (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Ara chloropterus'), (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona aestiva'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna viduata'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus rufiventris'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Cathartes aura'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus melanoleucus'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Ara chloropterus'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus rufiventris'), (SELECT id FROM habitat WHERE bioma = 'Caatinga'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Ara macao'), (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Pan troglodytes'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona farinosa'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona farinosa'), (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus melanoleucus'), (SELECT id FROM habitat WHERE bioma = 'Recife de Coral'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Caatinga'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES  ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Recife de Coral'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Dalbergia nigra'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));

INSERT INTO doenca (nome, descricao, taxa_mortalidade) VALUES
    ('Malária', 'Doença parasitária transmitida por mosquitos', 5),
    ('Doença de Chagas', 'Doença parasitária causada por Trypanosoma cruzi', 10),
    ('Leptospirose', 'Infecção bacteriana transmitida por água contaminada', 2),
    ('Tuberculose', 'Infecção bacteriana que afeta os pulmões', 15),
    ('Febre Amarela', 'Doença viral transmitida por mosquitos', 7);

INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara ararauna'), (SELECT id FROM doenca WHERE nome = 'Doença de Chagas'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona ochrocephala'), (SELECT id FROM doenca WHERE nome = 'Leptospirose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna autumnalis'), (SELECT id FROM doenca WHERE nome = 'Tuberculose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Chiroxiphia lanceolata'), (SELECT id FROM doenca WHERE nome = 'Febre Amarela'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), (SELECT id FROM doenca WHERE nome = 'Doença de Chagas'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Cathartes burrovianus'), (SELECT id FROM doenca WHERE nome = 'Leptospirose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus polyosoma'), (SELECT id FROM doenca WHERE nome = 'Tuberculose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Rhea pennata'), (SELECT id FROM doenca WHERE nome = 'Febre Amarela'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazilia lactea'), (SELECT id FROM doenca WHERE nome = 'Leptospirose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona aestiva'), (SELECT id FROM doenca WHERE nome = 'Febre Amarela'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna viduata'), (SELECT id FROM doenca WHERE nome = 'Doença de Chagas'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Cathartes aura'), (SELECT id FROM doenca WHERE nome = 'Tuberculose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), (SELECT id FROM doenca WHERE nome = 'Malária'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Pan troglodytes'), (SELECT id FROM doenca WHERE nome = 'Doença de Chagas'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona farinosa'), (SELECT id FROM doenca WHERE nome = 'Leptospirose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara chloropterus'), (SELECT id FROM doenca WHERE nome = 'Febre Amarela'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus rufiventris'), (SELECT id FROM doenca WHERE nome = 'Tuberculose'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus melanoleucus'), (SELECT id FROM doenca WHERE nome = 'Malária'));
INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara macao'), (SELECT id FROM doenca WHERE nome = 'Febre Amarela'));

INSERT INTO area (localizacao, desmatado, protegido, habitat_id) VALUES
    (ST_GeomFromText('POLYGON((-60 -2, -60 2, -54 2, -54 -2, -60 -2))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Floresta Amazônica')),
    (ST_GeomFromText('POLYGON((-58 -20, -56 -20, -56 -17, -58 -17, -58 -20))', 4326), TRUE, FALSE, (SELECT id FROM habitat WHERE bioma = 'Pantanal')),
    (ST_GeomFromText('POLYGON((-45 -25, -35 -25, -35 -15, -45 -15, -45 -25))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica')),
    (ST_GeomFromText('POLYGON((-55 -20, -45 -20, -45 -10, -55 -10, -55 -20))', 4326), TRUE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Cerrado')),
    (ST_GeomFromText('POLYGON((-40 -12, -36 -12, -36 -8, -40 -8, -40 -12))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Caatinga')),
    (ST_GeomFromText('POLYGON((145 -10, 145 -5, 150 -5, 150 -10, 145 -10))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Recife de Coral'));

INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id) VALUES
    (5, 'Avistados próximos ao rio', '2024-08-01 10:00:00', 'Dr. João Silva', (SELECT id FROM especie WHERE nome_cientifico = 'Pan troglodytes')),
    (12, 'Grupo avistado nas copas das árvores', '2024-07-20 09:30:00', 'Dra. Maria Oliveira', (SELECT id FROM especie WHERE nome_cientifico = 'Ara ararauna')),
    (3, 'Indivíduos observados alimentando-se de frutos', '2024-06-15 14:45:00', 'Dr. Pedro Lima', (SELECT id FROM especie WHERE nome_cientifico = 'Amazona ochrocephala')),
    (7, 'Avistados nadando em lagoa', '2024-05-10 11:00:00', 'Dra. Ana Paula', (SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna autumnalis')),
    (10, 'Grupo observando o comportamento de dança', '2024-04-25 16:20:00', 'Dr. Carlos Alberto', (SELECT id FROM especie WHERE nome_cientifico = 'Chiroxiphia lanceolata')),
    (20, 'Indivíduos cantando no amanhecer', '2024-03-30 05:50:00', 'Dra. Fernanda Costa', (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas')),
    (8, 'Avistados em área aberta', '2024-07-10 12:30:00', 'Dra. Elisa Martins', (SELECT id FROM especie WHERE nome_cientifico = 'Cathartes burrovianus')),
    (15, 'Grupo grande encontrado em uma área de floresta', '2024-06-22 08:00:00', 'Dr. Rodrigo Mendes', (SELECT id FROM especie WHERE nome_cientifico = 'Rhea pennata')),
    (30, 'Indivíduos observados durante o voo', '2024-09-05 10:45:00', 'Dra. Camila Ferreira', (SELECT id FROM especie WHERE nome_cientifico = 'Amazilia lactea')),
    (18, 'Grupo encontrado em área de floresta tropical', '2024-07-27 07:20:00', 'Dr. Marcelo Alves', (SELECT id FROM especie WHERE nome_cientifico = 'Amazona aestiva')),
    (50, 'Avistados em uma área de pantanal', '2024-05-22 17:00:00', 'Dr. Lucas Moreira', (SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna viduata'));

INSERT INTO interacao_ecologica (descricao, tipo_interacao) VALUES
    ('Polinização por abelhas', 'Mutualismo'),
    ('Predação por onças', 'Predação'),
    ('Dispersão de sementes por aves', 'Mutualismo'),
    ('Competição por recursos', 'Competição'),
    ('Parasitismo por fungos', 'Parasitismo');

INSERT INTO interacao_especie (especie_id, interacao_ecologica_id) VALUES
    ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona ochrocephala'), (SELECT id FROM interacao_ecologica WHERE descricao = 'Dispersão de sementes por aves')),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), (SELECT id FROM interacao_ecologica WHERE descricao = 'Predação por onças')),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), (SELECT id FROM interacao_ecologica WHERE descricao = 'Polinização por abelhas')),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Cathartes burrovianus'), (SELECT id FROM interacao_ecologica WHERE descricao = 'Competição por recursos')),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Dalbergia nigra'), (SELECT id FROM interacao_ecologica WHERE descricao = 'Parasitismo por fungos'));
