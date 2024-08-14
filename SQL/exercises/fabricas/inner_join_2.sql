SELECT DISTINCT c.* FROM vendas v
    INNER JOIN clientes c ON v.cliente_id = c.id WHERE c.endereco LIKE '%France';

SELECT v.nome AS vendedor_nome, car.numero_serie, car.ano_fabricacao, mod.nome AS modelo_nome FROM Vendedores v
    INNER JOIN Vendas vend ON v.id = vend.vendedor_id INNER JOIN Carros car ON vend.numero_serie_carro = car.numero_serie
    INNER JOIN Modelos mod ON car.modelo_id = mod.id;

SELECT m.*, conc.* FROM Modelos m
    INNER JOIN Carros c ON m.id = c.modelo_id
    INNER JOIN Vendas v ON c.numero_serie = v.numero_serie_carro
    INNER JOIN Concessionarias conc ON v.concessionaria_id = conc.id;

SELECT f.*, c.ano_fabricacao FROM Fabricas f
    INNER JOIN Carros c ON f.id = c.fabrica_id WHERE ano_fabricacao = 2023;

SELECT Clientes.* FROM Carros c
    INNER JOIN Vendas v ON c.numero_serie = v.numero_serie_carro
    INNER JOIN Clientes ON v.cliente_id = Clientes.id WHERE c.cor = 'Red';

SELECT * FROM Concessionarias conc
    INNER JOIN Vendas v ON conc.id = v.concessionaria_id
    INNER JOIN Carros c ON v.numero_serie_carro = c.numero_serie
    INNER JOIN Modelos m ON c.modelo_id = m.id WHERE m.potencia > 150;

SELECT v.* FROM Vendedores
    INNER JOIN Concessionarias conc ON conc.id = Vendedores.concessionaria_id
    INNER JOIN Vendas v ON v.concessionaria_id = conc.id
    INNER JOIN Carros c ON v.numero_serie_carro = c.numero_serie
    INNER JOIN Modelos m ON c.modelo_id = m.id WHERE m.nome LIKE 'BMW%';

SELECT Vendedores.nome "vendedor", conc.nome concessionaria, COUNT(v.id) total_vendas FROM Vendas v
    INNER JOIN Concessionarias conc ON v.concessionaria_id = conc.id
    INNER JOIN Vendedores ON conc.id = Vendedores.concessionaria_id
    GROUP BY conc.nome, Vendedores.id, Vendedores.nome ORDER BY Vendedores.nome;

-- UPDATE Vendas SET preco_venda_final = preco_venda_final - 100 WHERE id = 1;
SELECT m.nome, m.preco_venda_sugerido, v.preco_venda_final FROM Modelos m
    INNER JOIN Carros c on m.id = c.modelo_id
    INNER JOIN Vendas v on c.numero_serie = v.numero_serie_carro
    WHERE v.preco_venda_final < m.preco_venda_sugerido;

-- INSERT INTO Vendas VALUES(6, 'SN456789', '2024-05-01', 75000.00, 1, 1, 1);
SELECT c.*, COUNT(v.id) AS compras FROM Clientes c
    INNER JOIN Vendas v ON c.id = v.cliente_id
    GROUP BY c.id HAVING COUNT(v.id) > 1;