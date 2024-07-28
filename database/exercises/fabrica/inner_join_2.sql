SELECT DISTINCT c.* FROM vendas v
    INNER JOIN clientes c on v.cliente_id = c.id WHERE c.endereco LIKE '%France';

SELECT v.nome AS vendedor_nome, car.numero_serie, car.ano_fabricacao, mod.nome AS modelo_nome FROM Vendedores v
    INNER JOIN Vendas vend ON v.id = vend.vendedor_id INNER JOIN Carros car ON vend.numero_serie_carro = car.numero_serie
    INNER JOIN Modelos mod ON car.modelo_id = mod.id;

-- 3. Listar todos os modelos de carros que foram vendidos, junto com as concessionárias onde foram vendidos:
SELECT * FROM modelos JOIN public.carros c on modelos.id = c.modelo_id;
-- 4. Listar todas as fábricas que produziram carros vendidos em 2023:


-- 5. Listar todos os clientes que compraram carros da cor vermelha:


-- 6. Listar todas as concessionárias que venderam carros com potência maior que 150:


-- 7. Listar todos os vendedores que venderam carros da BMW:


-- 8. Listar todas as vendas feitas por cada vendedor em cada concessionária:


-- 9. Listar todos os modelos de carros que foram vendidos a um preço menor que o preço de venda sugerido:


-- 10. Listar todos os clientes que compraram mais de um carro: