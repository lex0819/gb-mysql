DROP DATABASE IF EXISTS seminar02;
CREATE DATABASE IF NOT EXISTS seminar02;

USE seminar02;

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_date DATE,
  count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

/*
Применение кейза здесь длиннее, чем ифа
*/
SELECT id AS "id заказа", count_product AS "Объем заказа",
  CASE
    WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product >= 100 AND count_product < 300 THEN "Средний заказ"
    WHEN count_product >=300 THEN "Большой заказ"
  END "Тип заказа"
FROM sales;

/*
Хорошее применение IF, т.к. математика и пишем меньше кода,
проверили меньше 100,
проверили больше 300,
остальное проверять не надо, оно и так в середине - это числа.
*/
SELECT id AS "id заказа", count_product AS "Объем заказа",
	IF(count_product < 100, "Маленький заказ",
		IF (count_product >=300, "Большой заказ", "Средний заказ"))
	AS "Тип заказа"
FROM sales;


CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id VARCHAR(5),
  amount DECIMAL,
  order_status VARCHAR(20)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

/*
Хорошее применение CASE
Признаки товару могут добавляться и дальше,
менеджеры это любят,
плоским списком читать такой код гораздо удобнее
*/
SELECT *,
	CASE
		WHEN order_status = 'OPEN' THEN "Order is in open state"
		WHEN order_status = 'CLOSED' THEN "Order is closed"
    WHEN order_status = 'CANCELLED' THEN "Order is cancelled"
  END 'full_order_status'
FROM orders;

/*
Применение IF здесь хуже, т.к. снижает удобство чтения кода
Признаков у заказа может быть все больше и больше
Нам придется дописывать ступени из ифоф все дальше и дальше
в js так выглядел ад колбеков ))
*/
SELECT *,
	IF(order_status = 'OPEN', "Order is in open state",
		IF(order_status = 'CLOSED', "Order is closed",
			IF(order_status = 'CANCELLED', "Order is cancelled", "RESERVED")))
  AS 'full_order_status'
FROM orders;
