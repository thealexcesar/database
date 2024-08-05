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
    ('Angiospermae', 'Angiospermae', 'Plantas com flores e frutos', (SELECT id FROM reino WHERE nome_cientifico = 'Plantae'));
INSERT INTO filo (nome_cientifico, nome, descricao, reino_id) VALUES ('Proteobacteria', 'Proteobactérias', 'Filo das proteobactérias', (SELECT id FROM reino WHERE nome_cientifico = 'Monera'));
INSERT INTO filo (nome_cientifico, nome, descricao, reino_id) VALUES ('Firmicutes', 'Firmicutes', 'Filo dos firmicutes', (SELECT id FROM reino WHERE nome_cientifico = 'Monera'));
INSERT INTO filo (nome_cientifico, nome, descricao, reino_id) VALUES ('Actinobacteria', 'Actinobactérias', 'Filo das actinobactérias', (SELECT id FROM reino WHERE nome_cientifico = 'Monera'));

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
INSERT INTO classe (nome_cientifico, nome, descricao, filo_id) VALUES ('Gammaproteobacteria', 'Gammaproteobactérias', 'Classe das gammaproteobactérias', (SELECT id FROM filo WHERE nome_cientifico = 'Proteobacteria'));
INSERT INTO classe (nome_cientifico, nome, descricao, filo_id) VALUES ('Bacilli', 'Bacilos', 'Classe dos bacilos', (SELECT id FROM filo WHERE nome_cientifico = 'Firmicutes'));
INSERT INTO classe (nome_cientifico, nome, descricao, filo_id) VALUES ('Actinobacteria', 'Actinobactérias', 'Classe das actinobactérias', (SELECT id FROM filo WHERE nome_cientifico = 'Actinobacteria'));
INSERT INTO classe (nome_cientifico, nome, descricao, filo_id) VALUES ('Actinopterygii', 'Peixes ósseos', 'Classe dos peixes ósseos', (SELECT id FROM filo WHERE nome_cientifico = 'Chordata')) ON CONFLICT (nome_cientifico) DO NOTHING;

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
INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id) VALUES ('Enterobacterales', 'Enterobacteriais', 'Ordem das enterobacteriais', (SELECT id FROM classe WHERE nome_cientifico = 'Gammaproteobacteria'));
INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id) VALUES ('Lactobacillales', 'Lactobacilales', 'Ordem das lactobacilales', (SELECT id FROM classe WHERE nome_cientifico = 'Bacilli'));
INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id) VALUES ('Clostridiales', 'Clostridiales', 'Ordem das clostridiales', (SELECT id FROM classe WHERE nome_cientifico = 'Bacilli'));
INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id) VALUES ('Actinomycetales', 'Actinomicetales', 'Ordem das actinomicetales', (SELECT id FROM classe WHERE nome_cientifico = 'Actinobacteria'));
INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id) VALUES
('Perciformes', 'Perciformes', 'Ordem dos perciformes', (SELECT id FROM classe WHERE nome_cientifico = 'Actinopterygii')) ON CONFLICT (nome_cientifico) DO NOTHING;
INSERT INTO ordem (nome_cientifico, nome, descricao, classe_id)
VALUES ('Diptera', 'Dipteros', 'Descrição da Ordem Dipteros', (SELECT id FROM classe WHERE nome_cientifico = 'Insecta'));

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
INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id) VALUES ('Enterobacteriaceae', 'Enterobacteriáceas', 'Família das enterobacteriáceas', (SELECT id FROM ordem WHERE nome_cientifico = 'Enterobacterales'));
INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id) VALUES ('Lactobacillaceae', 'Lactobaciláceas', 'Família das lactobaciláceas', (SELECT id FROM ordem WHERE nome_cientifico = 'Lactobacillales'));
INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id) VALUES ('Clostridiaceae', 'Clostridiaceae', 'Família dos clostrídios', (SELECT id FROM ordem WHERE nome_cientifico = 'Clostridiales'));
INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id) VALUES ('Streptomycetaceae', 'Streptomycetaceae', 'Família das streptomycetaceae', (SELECT id FROM ordem WHERE nome_cientifico = 'Actinomycetales'));
INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id) VALUES ('Cichlidae', 'Ciclídeos', 'Família dos ciclídeos', (SELECT id FROM ordem WHERE nome_cientifico = 'Perciformes'));
INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id)VALUES ('Thraupidae', 'Thraupidae', 'Família de aves que inclui muitos pássaros brasileiros.', 1);
INSERT INTO familia (nome_cientifico, nome, descricao, ordem_id)
VALUES ('Culicidae', 'Culicídeos', 'Descrição da Família Culicídeos', (SELECT id FROM ordem WHERE nome_cientifico = 'Diptera'));


INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES
    ('Ara', 'Arara', 'Araras', (SELECT id FROM familia WHERE nome_cientifico = 'Psittacidae')),
    ('Gorilla', 'Gorila', 'Gênero de grandes primatas encontrados nas florestas da África central', (SELECT id FROM familia WHERE nome_cientifico = 'Hominidae')),
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
    ('Dalbergia', 'Dalbergia', 'Árvores e arbustos conhecidos por sua madeira de alta qualidade.', (SELECT id FROM familia WHERE nome_cientifico = 'Fabaceae')),
    ('Felis', 'Gatos', 'Gênero de pequenos felinos dentro da família Felidae', (SELECT id FROM familia WHERE nome_cientifico = 'Felidae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES ('Escherichia', 'Escherichia', 'Gênero das Escherichia', (SELECT id FROM familia WHERE nome_cientifico = 'Enterobacteriaceae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES ('Salmonella', 'Salmonela', 'Gênero das salmonelas', (SELECT id FROM familia WHERE nome_cientifico = 'Enterobacteriaceae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES ('Lactobacillus', 'Lactobacilos', 'Gênero dos lactobacilos', (SELECT id FROM familia WHERE nome_cientifico = 'Lactobacillaceae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES ('Streptomyces', 'Streptomyces', 'Gênero das streptomyces', (SELECT id FROM familia WHERE nome_cientifico = 'Streptomycetaceae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES ('Clostridium', 'Clostrídio', 'Gênero dos clostrídios', (SELECT id FROM familia WHERE nome_cientifico = 'Clostridiaceae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES
    ('Pygocentrus', 'Piranha', 'Genus de piranhas', (SELECT id FROM familia WHERE nome_cientifico = 'Serrasalmidae')),
    ('Hoplias', 'Traíra', 'Genus de traíras', (SELECT id FROM familia WHERE nome_cientifico = 'Erythrinidae')),
    ('Astronotus', 'Oscar', 'Genus de ciclídeos', (SELECT id FROM familia WHERE nome_cientifico = 'Cichlidae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES
    ('Tangara', 'Tangara', 'Gênero que inclui pássaros como o saíra.', (SELECT id FROM familia WHERE nome_cientifico = 'Thraupidae')),
    ('Sporophila', 'Sporophila', 'Gênero que inclui pássaros como o coleirinho.', (SELECT id FROM familia WHERE nome_cientifico = 'Thraupidae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id) VALUES
    ('Sarcoramphus', 'Sarcoramphus', 'Gênero que inclui aves como o Urubu-rei.', (SELECT id FROM familia WHERE nome_cientifico = 'Cathartidae'));
INSERT INTO genero (nome_cientifico, nome, descricao, familia_id)
VALUES ('Aedes', 'Aedes', 'Descrição do Gênero Aedes', (SELECT id FROM familia WHERE nome_cientifico = 'Culicidae'));


INSERT INTO especie (nome_cientifico, nome, descricao, migratoria, populacao, localizacao_pontual, genero_id) VALUES
    ('Amazona ochrocephala', 'Papagaio-cabeça-amarela', 'Papagaio encontrado em florestas tropicais', FALSE, 50000, ST_GeomFromText('POINT(-7.0943 -66.3519)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazona')),
    ('Gorilla gorilla', 'Gorila', 'Gorila das florestas da África central', FALSE, 127, ST_GeomFromText('POINT(-55 -15)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Gorilla')),
    ('Amazona aestiva', 'Papagaio-verdadeiro', 'Papagaio comum nas florestas brasileiras', FALSE, 100000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazona')),
    ('Dendrocygna viduata', 'Irerê', 'Pato encontrado em lagos e pântanos', FALSE, 300000, ST_GeomFromText('POINT(-5.79448 -35.211)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Dendrocygna')),
    ('Turdus rufiventris', 'Sabiá-laranjeira', 'Ave canora comum em todo o Brasil', FALSE, 2000000, ST_GeomFromText('POINT(-19.9167 -43.9345)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Turdus')),
    ('Cathartes aura', 'Urubu-de-cabeça-vermelha', 'Grande ave necrófaga', FALSE, 100000, ST_GeomFromText('POINT(-15.7941 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Cathartes')),
    ('Geranoaetus melanoleucus', 'Gavião-de-rabo-branco', 'Grande ave de rapina', true, 50000, ST_GeomFromText('POINT(7.0399 -62.8369)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Geranoaetus')),
    ('Rhea americana', 'Ema', 'Grande ave não voadora', FALSE, 50000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Rhea')),
    ('Homo sapiens', 'Ser humano', 'Espécie humana moderna', FALSE, 7800000000, ST_GeomFromText('POINT(0 0)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Homo')),
    ('Ara ararauna', 'Arara-canindé', 'Grande arara azul e amarela encontrada em florestas tropicais', FALSE, 60000, ST_GeomFromText('POINT(-3.71722 -38.54337)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Ara')),
    ('Dendrocygna autumnalis', 'Irerê-de-cara-branca', 'Pato encontrado em lagos e pântanos', FALSE, 250000, ST_GeomFromText('POINT(-5.79448 -35.211)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Dendrocygna')),
    ('Chiroxiphia lanceolata', 'Tangará-dançarino', 'Pequena ave frugívora encontrada em matas', FALSE, 45000, ST_GeomFromText('POINT(-15.7941 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Chiroxiphia')),
    ('Turdus leucomelas', 'Sabiá-barranco', 'Ave canora comum em várias regiões do Brasil', FALSE, 1500000, ST_GeomFromText('POINT(-19.9167 -43.9345)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Turdus')),
    ('Cathartes burrovianus', 'Urubu-de-cabeça-amarela', 'Grande ave necrófaga', true, 120000, ST_GeomFromText('POINT(-7.5513 -60.3237)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Cathartes')),
    ('Geranoaetus polyosoma', 'Gavião-cinzento', 'Grande ave de rapina', true, 40000, ST_GeomFromText('POINT(-5.1281 -66.3519)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Geranoaetus')),
    ('Rhea pennata', 'Ema-de-darwin', 'Grande ave não voadora', FALSE, 55000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Rhea')),
    ('Amazilia lactea', 'Beija-flor-de-peito-azul', 'Pequena ave nectarívora', true, 450000, ST_GeomFromText('POINT(-6.4246 -68.0676)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazilia')),
    ('Ara chloropterus', 'Arara-vermelha', 'Grande arara encontrada em florestas tropicais', true, 50, ST_GeomFromText('POINT(0.0908 -57.9350)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Ara')),
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
    ('Ara macao', 'Arara-vermelha', 'Grande arara vermelha encontrada em florestas tropicais', FALSE, 7000000, ST_GeomFromText('POINT(-3.71722 -38.54337)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Ara')),
    ('Panthera onca', 'Onça-pintada', 'Grande felino encontrado nas Américas', FALSE, 847090, ST_GeomFromText('POINT(-1.0440 -62.9076)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Panthera')),
    ('Amazona farinosa', 'Papagaio-moleiro', 'Papagaio comum nas florestas brasileiras', FALSE, 75000, ST_GeomFromText('POINT(-15.7801 -47.9292)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Amazona')),
    ('Dalbergia nigra', 'Jacarandá-da-Bahia', 'Árvore de madeira nobre, endêmica da Mata Atlântica, e criticamente ameaçada.', FALSE, 100, ST_GeomFromText('POINT(-43.2 -22.9)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Dalbergia')),
    ('Dalbergia frutescens', 'Jacarandá-do-serrado', 'Árvore de madeira nobre, endêmica do Cerrado brasileiro, e vulnerável à extinção.', FALSE, 100, ST_GeomFromText('POINT(-43.2 -22.9)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Dalbergia')),
    ('Felis catus', 'Gato-doméstico', 'Pequeno felino amplamente domesticado e encontrado em todo o mundo', FALSE, 500000000, ST_GeomFromText('POINT(-23.5290 -46.4859)', 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Felis'));
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria) VALUES ('Escherichia coli', 'E. coli', 'Espécie de bactéria comum', 1000000000, (SELECT id FROM genero WHERE nome_cientifico = 'Escherichia'), FALSE);
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria) VALUES ('Salmonella enterica', 'S. enterica', 'Espécie de bactéria causadora de salmonelose', 500000000, (SELECT id FROM genero WHERE nome_cientifico = 'Salmonella'), FALSE);
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria) VALUES ('Lactobacillus acidophilus', 'L. acidophilus', 'Espécie de bactéria probiótica', 100000000, (SELECT id FROM genero WHERE nome_cientifico = 'Lactobacillus'), FALSE);
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria) VALUES ('Streptomyces griseus', 'S. griseus', 'Espécie produtora de antibióticos', 200000000, (SELECT id FROM genero WHERE nome_cientifico = 'Streptomyces'), FALSE);
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria) VALUES ('Clostridium botulinum', 'C. botulinum', 'Espécie causadora de botulismo', 80000000, (SELECT id FROM genero WHERE nome_cientifico = 'Clostridium'), FALSE);
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria) VALUES ('Clostridium difficile', 'C. difficile', 'Espécie causadora de infecções intestinais', 50000000, (SELECT id FROM genero WHERE nome_cientifico = 'Clostridium'), FALSE);
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, localizacao_pontual, genero_id, migratoria) VALUES ('Zonotrichia capensis', 'Tico-tico', 'Ave encontrada em áreas montanhosas e planícies, adaptada a uma variedade de habitats', 1000000, ST_SetSRID(ST_MakePoint(-43.2, -22.9), 4326), (SELECT id FROM genero WHERE nome_cientifico = 'Zonotrichia'), FALSE);
INSERT INTO especie (nome_cientifico, nome, descricao, genero_id) VALUES
    ('Pygocentrus nattereri', 'Piranha Vermelha', 'Espécie de piranha nativa da Amazônia',(SELECT id FROM genero WHERE nome_cientifico = 'Pygocentrus')),
    ('Hoplias malabaricus', 'Traíra', 'Espécie de traíra nativa da América do Sul',(SELECT id FROM genero WHERE nome_cientifico = 'Hoplias')),
    ('Astronotus ocellatus', 'Oscar', 'Espécie de ciclídeo nativa da Amazônia',(SELECT id FROM genero WHERE nome_cientifico = 'Astronotus'));
INSERT INTO especie (nome_cientifico, nome, descricao, genero_id) VALUES
    ('Oreochromis niloticus', 'Tilápia-do-Nilo', 'Espécie exótica de peixe introduzida em várias bacias hidrográficas',(SELECT id FROM genero WHERE nome_cientifico = 'Oreochromis'));
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria, localizacao_pontual)
VALUES
('Tangara seledon', 'Saíra-sete-cores', 'A saíra-sete-cores é uma ave colorida encontrada na Mata Atlântica.', 50000,
        (SELECT id FROM genero WHERE nome_cientifico = 'Tangara'), FALSE, ST_SetSRID(ST_MakePoint(-43.2, -22.9), 4326)),
('Tangara chilensis', 'Saíra-militar', 'A saíra-militar é uma ave encontrada na Amazônia.', 30000,
        (SELECT id FROM genero WHERE nome_cientifico = 'Tangara'), FALSE, ST_SetSRID(ST_MakePoint(-60.0, -3.1), 4326)),
('Sporophila angolensis', 'Coleirinho', 'O coleirinho é uma ave muito comum em várias regiões do Brasil.', 100000,
        (SELECT id FROM genero WHERE nome_cientifico = 'Sporophila'), FALSE, ST_SetSRID(ST_MakePoint(-47.9, -15.8), 4326)),
('Sporophila maximiliani', 'Bicudo', 'O bicudo é uma ave encontrada em áreas abertas e é conhecida pelo seu canto.', 2500,
        (SELECT id FROM genero WHERE nome_cientifico = 'Sporophila'), FALSE, ST_SetSRID(ST_MakePoint(-49.2, -16.0), 4326));
INSERT INTO especie (nome_cientifico, nome, descricao, populacao, genero_id, migratoria, localizacao_pontual)
VALUES ('Sarcoramphus papa', 'Urubu-rei', 'Uma espécie de abutre da família Cathartidae.', 1000, (SELECT id FROM genero WHERE nome_cientifico = 'Sarcoramphus'), false, ST_SetSRID(ST_MakePoint(-49.2, -16.0), 4326));
INSERT INTO especie (nome_cientifico, nome, descricao, genero_id, localizacao_pontual)
VALUES
('Aedes aegypti', 'Mosquito da Dengue', 'Descrição do Mosquito da Dengue',
    (SELECT id FROM genero WHERE nome_cientifico = 'Aedes'), ST_SetSRID(ST_MakePoint(0.5, 0.5), 4326)),
('Anopheles gambiae', 'Mosquito da Malária', 'Descrição do Mosquito da Malária',
    (SELECT id FROM genero WHERE nome_cientifico = 'Aedes'), ST_SetSRID(ST_MakePoint(2.5, 2.5), 4326));
INSERT INTO especie (nome_cientifico, nome, descricao, status_conservacao, populacao, genero_id, migratoria, localizacao_pontual)
VALUES
('Bothrops erythromelas', 'Jaracussu', 'Descrição da Bothrops erythromelas', 'Vulnerável', 500, (SELECT id FROM genero WHERE nome_cientifico = 'Bothrops'), FALSE, ST_SetSRID(ST_MakePoint(-40.5, -9.5), 4326)),
('Micrurus ibiboboca', 'Coral Verdadeira', 'Descrição da Micrurus ibiboboca', 'Em Perigo', 200, (SELECT id FROM genero WHERE nome_cientifico = 'Micrurus'), FALSE, ST_SetSRID(ST_MakePoint(-40.6, -9.4), 4326));

INSERT INTO habitat (bioma, localizacao) VALUES ('Amazônia Brasileira', poligono_amazonia_brasileira());
INSERT INTO habitat (bioma, localizacao) VALUES ('Caatinga', ST_GeomFromText('POLYGON((-2.6220 -40.5416, -7.2616 -35.6197, -15.4404 -43.7057, -10.5607 -45.0240, -2.6220 -40.5416))', 4326));
INSERT INTO habitat (bioma, localizacao) VALUES ('Cerrado', ST_GeomFromText('POLYGON((-2.4542 -43.1908, -18.0492 -45.1119, -21.4402 -49.2428, -14.2510 -58.1197, -2.4542 -43.1908))', 4326));
INSERT INTO habitat (bioma, localizacao) VALUES ('Mata Atlântica', ST_SetSRID(ST_GeomFromText('POLYGON((-5.272 -35.469, -8.057 -34.882, -24.007 -46.422, -29.687 -51.162, -19.924 -43.935, -5.272 -35.469))'), 4326));
INSERT INTO habitat (bioma, localizacao) VALUES ('Pantanal', ST_GeomFromText('POLYGON((-15.6097 -57.0651, -16.4545 -55.8346, -21.7671 -58.0319, -15.7790 -59.8776, -15.6097 -57.0651))', 4326));
INSERT INTO habitat (bioma, localizacao) VALUES ('Zona Costeira e Marinha', ST_SetSRID(ST_GeomFromText('POLYGON((-8.0456 -35.2682, -8.21 -35.1803, -30.2851 -52.4947, -29.8287 -57.5045, -8.0456 -35.2682))'), 4326));
INSERT INTO habitat (bioma, localizacao)
VALUES ('Agrícola', ST_GeomFromText('POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))', 4326)),
('Não Agrícola', ST_GeomFromText('POLYGON((2 2, 3 2, 3 3, 2 3, 2 2))', 4326));


INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara ararauna'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Gorilla gorilla'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona ochrocephala'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna autumnalis'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Chiroxiphia lanceolata'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Cathartes burrovianus'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus polyosoma'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Rhea pennata'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazilia lactea'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara chloropterus'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona aestiva'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna viduata'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus rufiventris'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Cathartes aura'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus melanoleucus'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara chloropterus'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Turdus rufiventris'), (SELECT id FROM habitat WHERE bioma = 'Caatinga'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara macao'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Pan troglodytes'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona farinosa'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Amazona farinosa'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Geranoaetus melanoleucus'), (SELECT id FROM habitat WHERE bioma = 'Zona Costeira e Marinha'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Caatinga'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Homo sapiens'), (SELECT id FROM habitat WHERE bioma = 'Zona Costeira e Marinha'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Dalbergia nigra'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Dalbergia frutescens'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara chloropterus'), (SELECT id FROM habitat WHERE bioma = 'Cerrado'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'), (SELECT id FROM habitat WHERE bioma = 'Pantanal'));
INSERT INTO especie_habitat (especie_id, habitat_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Astronotus ocellatus'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Escherichia coli'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Salmonella enterica'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Lactobacillus acidophilus'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Streptomyces griseus'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Clostridium botulinum'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Clostridium difficile'), (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES
((SELECT id FROM especie WHERE nome_cientifico = 'Aedes aegypti'), (SELECT id FROM habitat WHERE bioma = 'Agrícola')),
((SELECT id FROM especie WHERE nome_cientifico = 'Anopheles gambiae'), (SELECT id FROM habitat WHERE bioma = 'Não Agrícola'));
INSERT INTO especie_habitat (especie_id, habitat_id)
VALUES
((SELECT id FROM especie WHERE nome_cientifico = 'Bothrops erythromelas'), (SELECT id FROM habitat WHERE bioma = 'Caatinga')),
((SELECT id FROM especie WHERE nome_cientifico = 'Micrurus ibiboboca'), (SELECT id FROM habitat WHERE bioma = 'Caatinga'));


INSERT INTO doenca (nome, descricao, taxa_mortalidade) VALUES
    ('Malária', 'Doença parasitária transmitida por mosquitos', 5),
    ('Doença de Chagas', 'Doença parasitária causada por Trypanosoma cruzi', 10),
    ('Leptospirose', 'Infecção bacteriana transmitida por água contaminada', 2),
    ('Tuberculose', 'Infecção bacteriana que afeta os pulmões', 15),
    ('Febre Amarela', 'Doença viral transmitida por mosquitos', 7);

INSERT INTO especie_doenca (especie_id, doenca_id) VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Ara ararauna'), (SELECT id FROM doenca WHERE nome = 'Doença de Chagas'));
INSERT INTO especie_doenca (especie_id, doenca_id)
VALUES ((SELECT id FROM especie WHERE nome_cientifico = 'Gorilla gorilla'), (SELECT id FROM doenca WHERE nome = 'Malária')), ((SELECT id FROM especie WHERE nome_cientifico = 'Gorilla gorilla'), (SELECT id FROM doenca WHERE nome = 'Doença de Chagas'));
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

INSERT INTO area (localizacao, desmatado, protegido, habitat_id)
VALUES (poligono_amazonia_brasileira(), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));
INSERT INTO area (localizacao, desmatado, protegido, habitat_id) VALUES
    (ST_GeomFromText('POLYGON((-58 -20, -56 -20, -56 -17, -58 -17, -58 -20))', 4326), TRUE, FALSE, (SELECT id FROM habitat WHERE bioma = 'Pantanal')),
    (ST_GeomFromText('POLYGON((-45 -25, -35 -25, -35 -15, -45 -15, -45 -25))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica')),
    (ST_GeomFromText('POLYGON((-55 -20, -45 -20, -45 -10, -55 -10, -55 -20))', 4326), TRUE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Cerrado')),
    (ST_GeomFromText('POLYGON((-40 -12, -36 -12, -36 -8, -40 -8, -40 -12))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Caatinga')),
    (ST_GeomFromText('POLYGON((145 -10, 145 -5, 150 -5, 150 -10, 145 -10))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Zona Costeira e Marinha'));

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
    (50, 'Avistados em uma área de pantanal', '2024-05-22 17:00:00', 'Dr. Lucas Moreira', (SELECT id FROM especie WHERE nome_cientifico = 'Dendrocygna viduata')),
    (50, 'Observação em floresta densa', '2024-01-15', 'Dr. Ana Silva', 1),
    (30, 'Observação durante o dia', '2024-06-22', 'Dr. João Oliveira', 1),
    (40, 'Observação em área restaurada', '2024-12-05', 'Dr. Maria Costa', 1);
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude) VALUES (5, 'Avistados próximos ao rio', '1974-08-01 10:00:00', 'Dr. João Silva', (SELECT id FROM especie WHERE nome_cientifico = 'Zonotrichia capensis'), 1500);
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude) VALUES (8, 'Grupo avistado nas copas das árvores', '1984-07-20 09:30:00', 'Dra. Maria Oliveira', (SELECT id FROM especie WHERE nome_cientifico = 'Zonotrichia capensis'), 1400);
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude) VALUES (3, 'Indivíduos observados alimentando-se de frutos', '1994-06-15 14:45:00', 'Dr. Pedro Lima', (SELECT id FROM especie WHERE nome_cientifico = 'Zonotrichia capensis'), 1300);
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude) VALUES (7, 'Avistados nadando em lagoa', '2004-05-10 11:00:00', 'Dra. Ana Paula', (SELECT id FROM especie WHERE nome_cientifico = 'Zonotrichia capensis'), 1200);
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude) VALUES (10, 'Grupo observando o comportamento de dança', '2014-04-25 16:20:00', 'Dr. Carlos Alberto', (SELECT id FROM especie WHERE nome_cientifico = 'Zonotrichia capensis'), 1100);
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude) VALUES (20, 'Indivíduos cantando no amanhecer', '2024-03-30 05:50:00', 'Dra. Fernanda Costa', (SELECT id FROM especie WHERE nome_cientifico = 'Zonotrichia capensis'), 1000);
INSERT INTO avistamento (quantidade_individuos, observacao, localizacao_pontual, nome_biologo, especie_id, altitude, registrar_individuo) VALUES
(5, 'Avistamento de grupo de aves', ST_SetSRID(ST_MakePoint(-60.0, -3.0), 4326), 'Dr. João Silva', (SELECT id FROM especie WHERE nome_cientifico = 'Ara chloropterus'), 300, TRUE),
(3, 'Avistamento de grupo de aves', ST_SetSRID(ST_MakePoint(-47.0, -16.0), 4326), 'Dr. Maria Souza', (SELECT id FROM especie WHERE nome_cientifico = 'Ara macao'), 500, TRUE),
(8, 'Avistamento de grupo de aves', ST_SetSRID(ST_MakePoint(-46.6, -23.5), 4326), 'Dr. Pedro Santos', (SELECT id FROM especie WHERE nome_cientifico = 'Ara ararauna'), 200, TRUE);
INSERT INTO avistamento (observacao, altitude, quantidade_individuos, registrar_individuo, localizacao_pontual, data_avistamento, nome_biologo, especie_id) VALUES
('Avistamento de piranha vermelha', 15, 3, TRUE, ST_SetSRID(ST_MakePoint(-1.7312, -62.7151), 4326), '2024-08-05 10:00:00', 'Dr. Smith', (SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri')),
('Avistamento de traíra', 10, 5, TRUE, ST_SetSRID(ST_MakePoint(-1.7300, -62.7100), 4326), '2024-08-05 11:00:00', 'Dr. Johnson', (SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'));
INSERT INTO avistamento (observacao, altitude, quantidade_individuos, registrar_individuo, localizacao_pontual, data_avistamento, nome_biologo, especie_id)
VALUES ('Observação de interação em área de estudo.', 150, 5, TRUE, ST_SetSRID(ST_MakePoint(-1.7345, -62.7185), 4326), '2024-08-01 10:00:00', 'Dr. João Silva', 1);
INSERT INTO avistamento (quantidade_individuos, observacao, nome_biologo, especie_id) VALUES (200, 'Avistamento comum', 'Dr. Souza', (SELECT id FROM especie WHERE nome_cientifico = 'Escherichia coli'));
INSERT INTO avistamento (quantidade_individuos, observacao, nome_biologo, especie_id) VALUES (120, 'Avistamento raro', 'Dr. Fernandes', (SELECT id FROM especie WHERE nome_cientifico = 'Lactobacillus acidophilus'));
INSERT INTO avistamento (quantidade_individuos, observacao, nome_biologo, especie_id)
VALUES (90, 'Avistamento em solo seco', 'Dr. Oliveira', (SELECT id FROM especie WHERE nome_cientifico = 'Streptomyces griseus'));
INSERT INTO avistamento (quantidade_individuos, observacao, nome_biologo, especie_id)
VALUES (60, 'Avistamento raro em solo úmido', 'Dr. Gomes', (SELECT id FROM especie WHERE nome_cientifico = 'Clostridium botulinum'));
INSERT INTO avistamento (quantidade_individuos, observacao, nome_biologo, especie_id)
VALUES (75, 'Avistamento em solo de floresta', 'Dr. Silva', (SELECT id FROM especie WHERE nome_cientifico = 'Clostridium difficile'));
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude) VALUES
    (5, 'Avistados próximos ao rio', '1974-08-01 10:00:00', 'Dr. João Silva', (SELECT id FROM especie WHERE nome_cientifico = 'Sarcoramphus papa'), 1500),
    (8, 'Grupo avistado nas copas das árvores', '1984-07-20 09:30:00', 'Dra. Maria Oliveira', (SELECT id FROM especie WHERE nome_cientifico = 'Sarcoramphus papa'), 1400),
    (3, 'Indivíduos observados alimentando-se de frutos', '1994-06-15 14:45:00', 'Dr. Pedro Lima', (SELECT id FROM especie WHERE nome_cientifico = 'Sarcoramphus papa'), 1300),
    (7, 'Avistados nadando em lagoa', '2004-05-10 11:00:00', 'Dra. Ana Paula', (SELECT id FROM especie WHERE nome_cientifico = 'Sarcoramphus papa'), 1200),
    (10, 'Grupo observando o comportamento de dança', '2014-04-25 16:20:00', 'Dr. Carlos Alberto', (SELECT id FROM especie WHERE nome_cientifico = 'Sarcoramphus papa'), 1100),
    (20, 'Indivíduos cantando no amanhecer', '2024-03-30 05:50:00', 'Dra. Fernanda Costa', (SELECT id FROM especie WHERE nome_cientifico = 'Sarcoramphus papa'), 1000);
INSERT INTO avistamento (quantidade_individuos, observacao, data_avistamento, nome_biologo, especie_id, altitude)
VALUES
    (5, 'Avistados próximos ao rio', '1974-08-01 10:00:00', 'Dr. João Silva', (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), 1500),
    (8, 'Grupo avistado nas copas das árvores', '1984-07-20 09:30:00', 'Dra. Maria Oliveira', (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), 1400),
    (3, 'Indivíduos observados alimentando-se de frutos', '1994-06-15 14:45:00', 'Dr. Pedro Lima', (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), 1300),
    (7, 'Avistados nadando em lagoa', '2004-05-10 11:00:00', 'Dra. Ana Paula', (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), 1200),
    (10, 'Grupo observando o comportamento de dança', '2014-04-25 16:20:00', 'Dr. Carlos Alberto', (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), 1100),
    (20, 'Indivíduos cantando no amanhecer', '2024-03-30 05:50:00', 'Dra. Fernanda Costa', (SELECT id FROM especie WHERE nome_cientifico = 'Turdus leucomelas'), 1000);
INSERT INTO avistamento (especie_id, quantidade_individuos, localizacao_pontual, nome_biologo)
VALUES
((SELECT id FROM especie WHERE nome_cientifico = 'Aedes aegypti'), 10, ST_SetSRID(ST_MakePoint(0.5, 0.5), 4326), 'Biologo 1'),
((SELECT id FROM especie WHERE nome_cientifico = 'Aedes aegypti'), 5, ST_SetSRID(ST_MakePoint(0.5, 0.5), 4326), 'Biologo 2'),
((SELECT id FROM especie WHERE nome_cientifico = 'Anopheles gambiae'), 20, ST_SetSRID(ST_MakePoint(2.5, 2.5), 4326), 'Biologo 3');


INSERT INTO interacao_ecologica (tipo_interacao, descricao, harmonica)
VALUES
('Predação', 'Um organismo preda outros organismos menores', FALSE),
('Competição', 'Um organismo compete por recursos com outros organismos', FALSE),
('Dispersão de sementes', 'Um organismo dispersa sementes de plantas', TRUE),
('Colônia', 'Organismos vivendo em uma colônia', TRUE),
('Mutualismo', 'Dois organismos interagem de forma benéfica para ambos', TRUE)
ON CONFLICT (tipo_interacao) DO NOTHING;


-- Inserir interações entre espécies
INSERT INTO interacao_especie (especie_nativa_id, especie_invasora_id, interacao_ecologica_id)
VALUES
((SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri'),
 (SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'),
 (SELECT id FROM interacao_ecologica WHERE descricao = 'A piranha vermelha preda outros peixes menores')),

((SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'),
 (SELECT id FROM especie WHERE nome_cientifico = 'Astronotus ocellatus'),
 (SELECT id FROM interacao_ecologica WHERE descricao = 'A traíra compete por recursos com outras espécies de peixes')),

((SELECT id FROM especie WHERE nome_cientifico = 'Astronotus ocellatus'),
 (SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri'),
 (SELECT id FROM interacao_ecologica WHERE descricao = 'O Oscar dispersa sementes de plantas aquáticas')),

((SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri'),
 (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus'),
 (SELECT id FROM interacao_ecologica WHERE descricao = 'A tilápia compete por recursos com espécies nativas')),

((SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'),
 (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus'),
 (SELECT id FROM interacao_ecologica WHERE descricao = 'A tilápia preda pequenos invertebrados aquáticos'))
ON CONFLICT DO NOTHING;

INSERT INTO area (localizacao, protegido, desmatado, habitat_id) VALUES
(ST_GeomFromText('POLYGON((-39.6 -13.1, -39.6 -12.9, -39.4 -12.9, -39.4 -13.1, -39.6 -13.1))', 4326), TRUE, FALSE, (SELECT id FROM habitat WHERE bioma = 'Mata Atlântica'));
INSERT INTO area (localizacao, desmatado, protegido, habitat_id) VALUES
    (ST_GeomFromText('POLYGON((-60.0 -3.0, -60.0 -2.5, -59.5 -2.5, -59.5 -3.0, -60.0 -3.0))', 4326), TRUE, FALSE, (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira')),
    (ST_GeomFromText('POLYGON((-61.0 -4.0, -61.0 -3.5, -60.5 -3.5, -60.5 -4.0, -61.0 -4.0))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira')),
    (ST_GeomFromText('POLYGON((-62.0 -5.0, -62.0 -4.5, -61.5 -4.5, -61.5 -5.0, -62.0 -5.0))', 4326), TRUE, FALSE, (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira')),
    (ST_GeomFromText('POLYGON((-63.0 -6.0, -63.0 -5.5, -62.5 -5.5, -62.5 -6.0, -63.0 -6.0))', 4326), FALSE, TRUE, (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'));

INSERT INTO interacao_especie (especie_nativa_id, especie_invasora_id, interacao_ecologica_id) VALUES
((SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'),
 (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus'),
 (SELECT id FROM interacao_ecologica WHERE descricao = 'A tilápia preda pequenos invertebrados aquáticos'))
ON CONFLICT DO NOTHING;

UPDATE interacao_especie
SET interacao_ecologica_id = 2
WHERE especie_nativa_id = (SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri')
  AND especie_invasora_id = (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus');

UPDATE interacao_especie
SET interacao_ecologica_id = 1
WHERE especie_nativa_id = (SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus')
  AND especie_invasora_id = (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus');

INSERT INTO interacao_especie (especie_nativa_id, especie_invasora_id, interacao_ecologica_id) VALUES
((SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri'), (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus'), (SELECT id FROM interacao_ecologica WHERE descricao = 'Competição')),
((SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'), (SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus'), (SELECT id FROM interacao_ecologica WHERE descricao = 'Predação'))
ON CONFLICT DO NOTHING;

INSERT INTO especie_habitat (especie_id, habitat_id) VALUES
((SELECT id FROM especie WHERE nome_cientifico = 'Oreochromis niloticus'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira')),
((SELECT id FROM especie WHERE nome_cientifico = 'Pygocentrus nattereri'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira')),
((SELECT id FROM especie WHERE nome_cientifico = 'Hoplias malabaricus'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira')),
((SELECT id FROM especie WHERE nome_cientifico = 'Astronotus ocellatus'), (SELECT id FROM habitat WHERE bioma = 'Amazônia Brasileira'))
ON CONFLICT DO NOTHING;

INSERT INTO diversidade_genetica (especie_id, populacao, diversidade_genetica) VALUES
    ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), 'População Amazônia', 0.75),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), 'População Pantanal', 0.68),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), 'População Mata Atlântica', 0.80),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), 'População Cerrado', 0.72),
    ((SELECT id FROM especie WHERE nome_cientifico = 'Panthera onca'), 'População Caatinga', 0.65);

INSERT INTO altitude_raster (rast, altitude)
VALUES
(ST_GeomFromText('POLYGON((-44 -23, -44 -22, -42 -22, -42 -23, -44 -23))', 4326), 500),
(ST_GeomFromText('POLYGON((-61 -4, -61 -3, -59 -3, -59 -4, -61 -4))', 4326), 1000),
(ST_GeomFromText('POLYGON((-48 -16, -48 -15, -46 -15, -46 -16, -48 -16))', 4326), 1500),
(ST_GeomFromText('POLYGON((-50 -17, -50 -16, -48 -16, -48 -17, -50 -17))', 4326), 2000);
