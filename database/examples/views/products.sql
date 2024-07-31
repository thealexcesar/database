-- CREATE DATABASE products;

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    data_pedido DATE,
    valor_total NUMERIC(10, 2)
);

CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

CREATE TABLE itens_pedido (
    item_pedido_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id),
    produto_id INT REFERENCES produtos(produto_id),
    quantidade INT,
    preco NUMERIC(10, 2)
);

INSERT INTO clientes (nome, email) VALUES ('João Silva', 'joao.silva@exemplo.com');
INSERT INTO clientes (nome, email) VALUES ('Maria Oliveira', 'maria.oliveira@exemplo.com');
INSERT INTO clientes (nome, email) VALUES ('Carlos Pereira', 'carlos.pereira@exemplo.com');
INSERT INTO produtos (nome, preco) VALUES ('Notebook', 2500.00);
INSERT INTO produtos (nome, preco) VALUES ('Smartphone', 1500.00);
INSERT INTO produtos (nome, preco) VALUES ('Tablet', 1000.00);
INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES (1, '2024-07-01', 3000.00);
INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES (2, '2024-07-15', 2000.00);
INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES (3, '2024-07-20', 3500.00);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco) VALUES (3,2,3,3000.00);


CREATE VIEW pedidos_clientes AS
    SELECT p.cliente_id, c.nome nome_cliente, p.data_pedido, p.valor_total
    FROM pedidos p INNER JOIN clientes c on c.cliente_id = p.cliente_id;

SELECT * FROM pedidos_clientes;

CREATE VIEW detalhes_ites_pedido AS
    SELECT ip.item_pedido_id, ip.pedido_id FROM itens_pedido ip
    INNER JOIN produtos p ON p.produto_id = ip.produto_id;

DROP VIEW vendas_mensais;
CREATE VIEW vendas_mensais AS
    SELECT  p.data_pedido FROM pedidos p;

SELECT EXTRACT(MONTH FROM data_pedido) FROM pedidos p;
SELECT TO_CHAR(p.data_pedido, 'Month') AS mes
FROM pedidos p;

CREATE OR REPLACE FUNCTION atualizar_valor_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE pedidos p
    SET valor_total = (
        SELECT COALESCE(SUM(quantidade * preco), 0)
        FROM itens_pedido pi
        WHERE pi.pedido_id = NEW.pedido_id
    )
    WHERE p.pedido_id = NEW.pedido_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_atualizar_valor_total
    AFTER INSERT ON itens_pedido
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_valor_total();

SELECT * FROM pedidos ORDER BY valor_total;





CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    data_pedido DATE,
    valor_total NUMERIC(10, 2)
);

CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

CREATE TABLE itens_pedido (
    item_pedido_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id),
    produto_id INT REFERENCES produtos(produto_id),
    quantidade INT,
    preco NUMERIC(10, 2)
);


INSERT INTO clientes (nome, email) VALUES ('João Silva', 'joao.silva@exemplo.com');
INSERT INTO clientes (nome, email) VALUES ('Maria Oliveira', 'maria.oliveira@exemplo.com');
INSERT INTO clientes (nome, email) VALUES ('Carlos Pereira', 'carlos.pereira@exemplo.com');
INSERT INTO produtos (nome, preco) VALUES ('Notebook', 2500.00);
INSERT INTO produtos (nome, preco) VALUES ('Smartphone', 1500.00);
INSERT INTO produtos (nome, preco) VALUES ('Tablet', 1000.00);
INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES (1, '2024-07-01', 3000.00);
INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES (2, '2024-07-15', 2000.00);
INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES (3, '2024-07-20', 3500.00);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco) VALUES (1, 1, 1, 2500.00);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco) VALUES (1, 3, 1, 500.00);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco) VALUES (2, 2, 2, 1500.00);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco) VALUES (3, 1, 1, 2500.00);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco) VALUES (3, 2, 1, 1500.00);

VIEWS_____________________
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    data_pedido DATE,
    valor_total NUMERIC(10, 2)
);

CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

CREATE TABLE itens_pedido (
    item_pedido_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id),
    produto_id INT REFERENCES produtos(produto_id),
    quantidade INT,
    preco NUMERIC(10, 2)
);

create view pedidos_clientes AS
select p.cliente_id, c.nome AS nome_cliente, p.data_pedido, p.valor_total
from pedidos p
inner join clientes c on p.cliente_id = c.cliente_id;

select * from pedidos_clientes;

create view detalhes_itens_pedido AS
select ip.item_pedido_id, ip.pedido_id, pr.nome AS nome_produto, ip.quantidade, ip.preco,
(ip.quantidade * ip.preco) AS preco_total
from itens_pedido ip
inner join produtos pr on ip.produto_id = pr.produto_id;

select * from detalhes_itens_pedido;

create view vendas_mensais AS
select date_trunc('month', p.data_pedido) as mes, SUM(p.valor_total) as vendas_total
from pedidos p
group by date_trunc('month',p.data_pedido)
order by mes;

select * from vendas_mensais;

drop view detalhes_itens_pedido;

create view view_utilizavel as select * from clientes;

CREATE RULE regra_insercao_view AS
ON INSERT to view_utilizavel
DO INSTEAD
insert into clientes (nome, email) values (NEW.nome, NEW.email);






--------- TRIGGERS SHOPEE ---------
/*create trigger atualizar_valor_total
AFTER INSERT ON itens_pedido
FOR EACH row
EXECUTE PROCEDURE $$
BEGIN
	update pedidos
	set valor_total = (
	SELECT
		COALESCE(SUM(QUANTIDADE * PRECO), 0)
	FROM
		ITENS_PEDIDO
	WHERE
		PEDIDO_ID = COALESCE(NEW.PEDIDO_ID, OLD.PEDIDO_ID)
	)
	where pedido_id = COALESCE(NEW.PEDIDO_ID, OLD.PEDIDO_ID)
END;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION atualizar_valor_total()
returns TRIGGER AS $$
BEGIN
	update pedidos
	set valor_total = valor_total + (
		select COALESCE(sum(quantidade*preco),0)
		from itens_pedido
		where pedido_id = NEW.pedido_id
	)
	where pedido_id = NEW.pedido_id;
	RETURN NEW;
END;
$$ language plpgsql;

CREATE TRIGGER trigger_atualizar_valor_total
AFTER INSERT ON itens_pedido
FOR EACH row
execute function atualizar_valor_total();

select * from pedidos;
--13 3500

select * from produtos;


select * from itens_pedido;

insert into itens_pedido (pedido_id, produto_id,quantidade,preco) values  (13,2,3,3000);



CREATE TABLE livros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ano_publicacao INT,
	quantidade_estoque INT
);

CREATE TABLE emprestimos (
    id SERIAL PRIMARY KEY,
    livro_id INT REFERENCES livros(id),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE
);


CREATE OR REPLACE FUNCTION atualizar_estoque()
RETURNS TRIGGER AS $$
BEGIN

	IF(select quantidade_estoque FROM livros where id = new.livro_id) > 0 THEN
		UPDATE livros
		set quantidade_estoque = quantidade_estoque - 1
		where id = NEW.livro_id;
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Não há estoque suficiente';
	end if;

END;
$$language plpgsql;

create trigger trigger_atualizar_estoque
AFTER INSERT ON emprestimos
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque();

select * from livros;
select * from emprestimos;
insert into livros (titulo, autor, ano_publicacao, quantidade_estoque)
values ('Assassins Creed','Oliver Bowden',2016, 18);

insert into emprestimos (livro_id, data_emprestimo, data_devolucao)
values (1,'2024-07-30',null)


create function contar_livros()
RETURNS tipo_de_retorno  as $$
DECLARE
	campo_para_declarar_variaveis
begin
	escopo_do_codigo;
	return valor do retorno da funcao
end;
$$language plpgsql;

create function contar_livros()
RETURNS INT  as $$
DECLARE
	total INT;
BEGIN
	SELECT Count(*)  INTO total from livros;
	return total;
end;
$$language plpgsql;

select * from livros where id > contar_livros();

create or replace function livros_por_autor(p_autor VARCHAR)
RETURNS TABLE(id int, titulo varchar,autor varchar, ano_publicacao int,quantidade_estoque int) AS $$
BEGIN
	RETURN QUERY
	select  *
	from livros
	where livros.autor = p_autor;
end;
$$language plpgsql;

select * from livros_por_autor('marta a mumia');

drop function livros_por_autor(p_autor VARCHAR);
*/
















