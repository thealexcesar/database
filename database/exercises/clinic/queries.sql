
-- 1. Atualize o telefone de um médico com id = 2.
UPDATE medicos set telefone = '(47)997000099' WHERE id = 2;

-- 2. Selecione todos os médicos que possuem um CRM específico, por exemplo, "CRM12345".
SELECT * FROM medicos WHERE id = 2;

-- 3. Selecione todas as consultas de um determinado médico com id_medico = 3.
SELECT * FROM medicos WHERE crm = '789012';

-- 4. Atualize o nome de um paciente com id = 1 para "Carlos Silva".
SELECT * FROM consultas WHERE id_medico = '3';

-- 5. Selecione todos os pacientes e ordene por data de nascimento.
UPDATE pacientes SET nome = 'Carlos Silva' WHERE id = 1;

-- 6. Selecione o nome e telefone de todos os pacientes.
SELECT * FROM pacientes ORDER BY data_nascimento;

-- 7. Atualize o endereço de um paciente com id = 4 para "Rua Nova, 123".
SELECT nome, telefone FROM pacientes;

-- Atualize o endereço de um paciente com id = 4 para "Rua Nova, 123".
UPDATE pacientes SET endereco = 'Rua Nova, 123' WHERE  id = 4;

-- 8. Delete uma consulta com id = 5.
DELETE FROM consultas WHERE id = 5;

-- 9. Delete um paciente com id = 3.
DELETE FROM consultas WHERE id = 3;

-- 10. Selecione todas as especialidades que contêm a palavra "cardio" na descrição.
SELECT * FROM especiadades WHERE descricao LIKE '%cardio%';

-- 11. Atualize a data de uma consulta com id = 2 para "2024-08-01 10:00:00".
UPDATE consultas SET data_consulta = '2024-08-01 10:00:00' WHERE id = 2;

-- 12. Atualize a descrição de uma especialidade com id = 2 para
UPDATE especiadades SET descricao = 'Especialidade em cirurgia cardíaca' WHERE ID = 2;

-- 13. Selecione todos os médicos e ordene por nome.
SELECT * FROM medicos ORDER BY nome;

-- 14. Delete todas as consultas anteriores a "2024-01-01".
DELETE FROM consultas WHERE data_consulta < '2024-01-01';

-- 15. Atualize o telefone de todos os médicos que possuem o email
UPDATE medicos SET telefone = '987654321' WHERE email = 'dr.jose@clinic.com';

-- 16. Selecione todos os pacientes que nasceram antes de "1990-01-01".
SELECT * FROM pacientes WHERE data_nascimento < '1990-01-01';

-- 17. Delete uma especialidade com id = 4.
DELETE FROM especiadades WHERE id = 4;

-- 18.Atualize a descrição de todas as especialidades que contêm "geral" na
UPDATE especiadades SET descricao = 'Medicina Geral' WHERE descricao LIKE '%geral%';

-- 19. Delete um médico com id = 2.
DELETE FROM medicos WHERE id = 2;

-- 20. Selecione todos os pacientes cujo nome começa com "H".
SELECT * FROM pacientes WHERE nome LIKE 'H%';

-- 21.Selecione todas as consultas em um determinado mês, por exemplo, "2024-07".
SELECT * FROM consultas WHERE data_consulta >= '2024-07-01' AND data_consulta < '2024-08-01';

-- 22. Atualize o telefone de um paciente com id = 5 para "123456789".
UPDATE pacientes SET telefone = '123456789' WHERE id = 5;

-- 23. Selecione todas as consultas que ocorrerão em uma determinada data, por exemplo, "2024-08-15".
SELECT * FROM consultas WHERE DATE(data_consulta) = '2024-08-09 ';

-- 24. Delete todas as especialidades que não têm descrição.
DELETE FROM especiadades WHERE descricao IS NULL;

-- 25. Selecione todos os pacientes que têm "Silva" no nome.
SELECT * FROM pacientes WHERE nome LIKE '%Silva';

-- 26. Atualize o email de um médico com id = 3 para "novoemail@clinic.com".
UPDATE medicos SET email = 'novoemail@clinic.com' WHERE id = 3;

-- 27. Selecione todos os pacientes cujo nome contém "ana" (independentemente de maiúsculas e minúsculas).
-- UPDATE pacientes SET nome = 'Ana Simpson' WHERE nome = 'Lisa Simpson';
SELECT * FROM  pacientes WHERE nome ILIKE '%ana%';

-- 28. Selecione todas as especialidades cujo nome começa com "Cardio";
SELECT * FROM especiadades WHERE nome LIKE 'Cardio%';

-- 29. Selecione todos os médicos cujo email termina com "clinic.com";
SELECT * FROM medicos WHERE email LIKE '%clinic.com';

-- 30. Selecione todas as consultas cuja descrição contém a palavra "retorno" (independentemente de maiúsculas e minúsculas)
SELECT * FROM consultas WHERE descricao ILIKE '%retorno%';

-- 31. Selecione todos os pacientes cujo endereço contém "Rua"
SELECT * FROM pacientes WHERE endereco ILIKE 'Rua%';