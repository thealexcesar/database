
UPDATE fabricas SET endereco = endereco || ', USA' WHERE nome IN ('Tesla Gigafactory', 'Chevrolet Bolt Plant');

SELECT m.nome AS modelo_carro_nome, f.nome AS fabrica_nome FROM modelos m
    INNER JOIN carros c ON m.id = c.modelo_id
    INNER JOIN fabricas f ON c.fabrica_id = f.id WHERE f.endereco LIKE '%USA';

SELECT con.nome AS concessionaria_nome, v.nome AS venda_nome FROM concessionarias con
    INNER JOIN vendedores v ON con.id = v.concessionaria_id WHERE  v.nome = 'Alice Smith';

SELECT c.numero_serie AS carro_numero_serie, cl.nome AS cliente_nome FROM Carros c
    INNER JOIN Vendas v ON c.numero_serie = v.numero_serie_carro
    INNER JOIN Clientes cl ON v.cliente_id = cl.id WHERE c.cor = 'Blue';

SELECT co.nome AS concessionaria_nome, cl.nome AS cliente_nome FROM Concessionarias co
    INNER JOIN Vendas v ON co.id = v.concessionaria_id
    INNER JOIN Clientes cl ON v.cliente_id = cl.id WHERE cl.endereco LIKE '%Australia';

SELECT cl.nome AS cliente_nome, c.numero_serie As carro_numero_serie FROM Carros c
    INNER JOIN Vendas v ON c.numero_serie = v.numero_serie_carro
    INNER JOIN Clientes cl ON v.cliente_id = cl.id WHERE c.ano_fabricacao = '2023';

UPDATE vendas SET data_venda = '2024-07-26' WHERE id IN(3, 4);

SELECT ve.id, v.nome, ve.data_venda FROM Vendedores v
    INNER JOIN Vendas ve ON v.id = ve.vendedor_id WHERE ve.data_venda BETWEEN '2023-01-01' AND '2024-12-31';

SELECT f.nome, f.telefone, c.ano_fabricacao FROM Fabricas f
    INNER JOIN Carros c ON f.id = c.fabrica_id WHERE c.ano_fabricacao BETWEEN 2023 AND 2024;

SELECT c.numero_serie AS carro_numero_serie, v.preco_venda_final AS carro_preco FROM Carros c
    INNER JOIN Vendas v ON c.numero_serie = v.numero_serie_carro WHERE v.preco_venda_final > 50000;

SELECT ve.nome, c.nome AS concessionaria_onde_vendedor_trabalha FROM vendedores As ve
    INNER JOIN concessionarias c on c.id = ve.concessionaria_id WHERE c.endereco LIKE '%San Francisco%';

SELECT cl.nome, v.preco_venda_final FROM Clientes cl
    INNER JOIN Vendas v ON cl.id = v.cliente_id
    INNER JOIN Carros c ON v.numero_serie_carro = c.numero_serie WHERE cl.telefone LIKE '020%';