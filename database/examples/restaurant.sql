CREATE TABLE IF NOT EXISTS customers (
	Id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	email VARCHAR(150),
	phone VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS tables (
	id SERIAL PRIMARY KEY,
	number INT NOT NULL,
	capacity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS menu_items (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description TEXT,
	price DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
	id SERIAL PRIMARY KEY,
	date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	quantity INT NOT NULL,
	total_amount DECIMAL(10,2) NOT NULL,
	customer_id INT REFERENCES customers(Id),
	table_id INT REFERENCES tables(Id),
	menu_item_id INT REFERENCES menu_items(Id)
);

INSERT INTO customers (name, email, phone) VALUES
('Sylvana Correventos', 'sylzina_corre_corre@gmail.com', '(11)99786-7543'),
('Cintia das Correntes', 'correntes@gmail.com', '(12)95464-8521'),
('Thrall', 'orc_thral@gmail.com', '(25)96487-1125'),
('Michael Scott', 'fake_do_Scott_summers@gmail.com', '(47)93235-8042'),
('Jaina Proudmoore', 'jaina.proudmoore@gmail.com', '(31)97865-4321'),
('Arthas Menethil', 'arthas.menethil@gmail.com', '(19)91234-5678'),
('Sylvia Harkonnen', 'sylvia.harkonnen@example.com', '(27)95432-0987'),
('John Doe', 'john.doe@example.com', '(13)99876-5432'),
('Jane Smith', 'jane.smith@example.com', '(15)98765-4321'),
('Bruce Wayne', 'bruce.wayne@wayneenterprises.com', '(45)97654-3210');

INSERT INTO tables (number, capacity) VALUES
(1, 4),
(2, 6),
(3, 2),
(4, 8),
(5, 4),
(6, 6),
(7, 2),
(8, 4),
(9, 8),
(10, 6);

INSERT INTO menu_items (name, description, price) VALUES
('Pizza Margherita', 'Classic pizza with tomato sauce, mozzarella, and basil.', 29.90),
('Cheeseburger', 'Juicy beef burger with cheese, lettuce, and tomato.', 19.90),
('Caesar Salad', 'Crisp romaine lettuce with Caesar dressing and croutons.', 15.50),
('Spaghetti Carbonara', 'Pasta with creamy sauce, pancetta, and parmesan.', 25.90),
('Chicken Alfredo', 'Grilled chicken with fettuccine in Alfredo sauce.', 27.90),
('Sushi Platter', 'Assorted sushi with fresh fish and vegetables.', 45.00),
('Steak and Fries', 'Grilled steak with crispy fries.', 35.00),
('Tiramisu', 'Traditional Italian dessert with mascarpone and coffee.', 12.00),
('Chocolate Cake', 'Rich chocolate cake with ganache.', 10.50),
('Margarita', 'Classic cocktail with tequila, lime, and salt.', 18.00);

INSERT INTO orders (date, quantity, total_amount, customer_id, table_id, menu_item_id) VALUES
('2024-07-01 12:00:00', 2, 39.80, 1, 1, 2),
('2024-07-02 13:00:00', 1, 29.90, 2, 2, 1),
('2024-07-03 14:00:00', 3, 135.00, 3, 3, 6),
('2024-07-04 15:00:00', 4, 111.60, 4, 4, 5),
('2024-07-05 16:00:00', 1, 10.50, 5, 5, 9),
('2024-07-06 17:00:00', 2, 35.00, 6, 6, 7),
('2024-07-07 18:00:00', 3, 54.00, 7, 7, 3),
('2024-07-08 19:00:00', 1, 18.00, 8, 8, 10),
('2024-07-09 20:00:00', 2, 50.00, 9, 9, 4),
('2024-07-10 21:00:00', 4, 140.00, 10, 10, 6),
('2024-07-11 12:00:00', 2, 39.80, 2, 1, 2),
('2024-07-12 13:00:00', 1, 29.90, 3, 2, 1),
('2024-07-13 14:00:00', 3, 135.00, 4, 3, 6),
('2024-07-14 15:00:00', 4, 111.60, 5, 4, 5),
('2024-07-15 16:00:00', 1, 10.50, 6, 5, 9),
('2024-07-16 17:00:00', 2, 35.00, 7, 6, 7),
('2024-07-17 18:00:00', 3, 54.00, 8, 7, 3),
('2024-07-18 19:00:00', 1, 18.00, 9, 8, 10),
('2024-07-19 20:00:00', 2, 50.00, 10, 9, 4),
('2024-07-20 21:00:00', 4, 140.00, 1, 10, 6),
('2024-07-21 11:00:00', 2, 35.00, 1, 1, 2),
('2024-07-22 12:30:00', 1, 19.90, 2, 2, 3),
('2024-07-23 14:00:00', 4, 100.00, 3, 3, 4),
('2024-07-24 15:45:00', 3, 81.00, 4, 4, 5),
('2024-07-25 17:15:00', 2, 70.00, 5, 5, 6),
('2024-07-26 18:30:00', 1, 18.00, 6, 6, 10),
('2024-07-27 19:00:00', 2, 50.00, 7, 7, 7),
('2024-07-28 20:30:00', 1, 12.00, 8, 8, 8),
('2024-07-29 21:00:00', 3, 90.00, 9, 9, 9),
('2024-07-30 22:15:00', 4, 140.00, 10, 10, 1),
('2024-07-31 10:00:00', 2, 45.80, 1, 1, 6),
('2024-08-01 12:00:00', 1, 35.00, 2, 2, 7),
('2024-08-02 13:00:00', 3, 81.00, 3, 3, 8),
('2024-08-03 14:00:00', 4, 100.00, 4, 4, 3),
('2024-08-04 15:00:00', 2, 40.00, 5, 5, 4),
('2024-08-05 16:00:00', 1, 18.00, 6, 6, 10),
('2024-08-06 17:00:00', 2, 50.00, 7, 7, 7),
('2024-08-07 18:00:00', 1, 12.00, 8, 8, 8),
('2024-08-08 19:00:00', 3, 90.00, 9, 9, 9),
('2024-08-09 20:00:00', 4, 140.00, 10, 10, 2),
('2024-08-10 11:00:00', 2, 35.00, 1, 1, 5),
('2024-08-11 12:30:00', 1, 19.90, 2, 2, 1),
('2024-08-12 14:00:00', 4, 100.00, 3, 3, 4),
('2024-08-13 15:45:00', 3, 81.00, 4, 4, 6),
('2024-08-14 17:15:00', 2, 70.00, 5, 5, 3),
('2024-08-15 18:30:00', 1, 18.00, 6, 6, 10),
('2024-08-16 19:00:00', 2, 50.00, 7, 7, 7),
('2024-08-17 20:30:00', 1, 12.00, 8, 8, 8),
('2024-08-18 21:00:00', 3, 90.00, 9, 9, 2),
('2024-08-19 22:15:00', 4, 140.00, 10, 10, 9);

SELECT COUNT(*) AS quantidade_clientes FROM customers;
SELECT number FROM tables WHERE capacity >= 6 AND id > 4;
SELECT * FROM tables WHERE NOT capacity > 6;
SELECT SUM(capacity) FROM tables;
SELECT * FROM customers WHERE email ILIKE '%a%';
SELECT * from customers where POSITION('a' in name) > 0;
SELECT * from customers where STRPOS(email, '@gmail') >0;
SELECT lower(name) from customers;
SELECT upper(name) from customers;
DELETE from customers where id  = 8;
DELETE from orders where customer_id = 8;
UPDATE customers SET name = 'Alexstraza', email = 'alexsssss@gmail.com' where id = 12;
SELECT * FROM menu_items;
UPDATE customers set name = 'Go''El' WHERE name = 'Go`El';
SELECT * FROM customers;