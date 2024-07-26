INSERT INTO pacientes (nome, data_nascimento, telefone, endereco) VALUES
    ('Homer Simpson', '1956-05-12', '234-567-8901', 'Rua Evergreen Terrace, 742'),
    ('Marge Simpson', '1956-10-01', '234-567-8902', 'Rua Evergreen Terrace, 742'),
    ('Bart Simpson', '1980-04-01', '234-567-8903', 'Rua Evergreen Terrace, 742'),
    ('Lisa Simpson', '1982-05-09', '234-567-8904', 'Rua Evergreen Terrace, 742'),
    ('Maggie Simpson', '1990-11-01', '234-567-8905', 'Rua Evergreen Terrace, 742'),
    ('Rick Sanchez', '1946-01-26', '345-678-9012', 'Rua Interdimensional, 101'),
    ('Morty Smith', '2000-02-20', '456-789-0123', 'Rua Interdimensional, 102'),
    ('Chapolin Colorado', '1973-09-03', '567-890-1234', 'Rua Heróis, 303'),
    ('Chaves', '1971-06-20', '678-901-2345', 'Rua Vila, 8');

INSERT INTO medicos (nome, crm, telefone, email) VALUES
    ('Dr. Julius Hibbert', '123456', '789-012-3456', 'hibbert@hospital.com'),
    ('Dr. Nick Riviera', '234567', '890-123-4567', 'nick@hospital.com'),
    ('Dr. Zoidberg', '345678', '901-234-5678', 'zoidberg@futurama.com'),
    ('Dr. Benton Quest', '456789', '012-345-6789', 'quest@jonnyquest.com'),
    ('Dr. Doofenshmirtz', '567890', '123-456-7890', 'doof@owca.com'),
    ('Dr. Perry Cox', '678901', '234-567-8901', 'perry@sacredheart.com'),
    ('Dr. John Dorian', '789012', '345-678-9012', 'jd@sacredheart.com'),
    ('Dr. Turk', '890123', '456-789-0123', 'turk@sacredheart.com');

INSERT INTO especiadades (nome, descricao) VALUES
    ('Cardiologia', 'Doenças do coração.'),
    ('Neurologia', 'Sistema nervoso.'),
    ('Ortopedia', 'Doenças dos ossos e músculos.'),
    ('Pediatria', 'Saúde infantil.'),
    ('Dermatologia', 'Doenças da pele.'),
    ('Psiquiatria', 'Doenças mentais.'),
    ('Oftalmologia', 'Doenças dos olhos.'),
    ('Ginecologia', 'Saúde da mulher.'),
    ('Gastroenterologia', 'Sistema digestivo.'),
    ('Endocrinologia', 'Glândulas e hormônios.');

INSERT INTO consultas (data_consulta, descricao, id_paciente, id_medico) VALUES
('2024-08-01 10:00:00', 'Consulta de rotina.', 1, 1),
('2024-08-02 11:00:00', 'Check-up anual.', 2, 2),
('2024-08-03 14:00:00', 'Exame de sangue.', 3, 3),
('2024-08-04 15:00:00', 'Consulta de emergência.', 4, 4),
('2024-08-05 09:00:00', 'Revisão pós-operatória.', 5, 5),
('2024-08-06 13:00:00', 'Consulta de dermatologia.', 6, 6),
('2024-08-07 16:00:00', 'Avaliação psiquiátrica.', 7, 7),
('2024-08-08 12:00:00', 'Consulta oftalmológica.', 8, 8),
('2024-08-09 10:30:00', 'Consulta de rotina.', 9, 1),
('2024-08-10 14:30:00', 'Consulta de gastroenterologia.', 1, 2),
('2024-08-11 15:00:00', 'Consulta de endocrinologia.', 2, 3);