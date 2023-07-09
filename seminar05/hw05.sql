DROP DATABASE IF EXISTS `lesson5`;
CREATE DATABASE `lesson5`;

USE lesson5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ),
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


-- view автомобили стоимостью до 25 000 долларов

CREATE OR REPLACE VIEW view_25 AS
SELECT * FROM cars
WHERE cost < 25000;

SELECT * FROM view_25;


-- цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW view_25 AS
SELECT * FROM cars
WHERE cost < 30000;

SELECT * FROM view_25;



-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

CREATE OR REPLACE VIEW vag AS
SELECT * FROM cars
WHERE name IN ('Skoda', 'Audi');

SELECT * FROM vag;



-- ранжированный список автомобилей по цене в порядке возрастания

SELECT id, name, cost,
ROW_NUMBER() OVER(ORDER BY cost ASC) AS 'number'
FROM cars;



-- Получить топ-3 самых дорогих автомобилей, а также их общую стоимость

SELECT * FROM cars
ORDER BY cost DESC
LIMIT 3;
    

SELECT *, 
SUM(cost) OVER() AS 'total'
FROM cars
ORDER BY cost DESC
LIMIT 3;



-- Получить список автомобилей, у которых цена больше предыдущей цены

CREATE OR REPLACE VIEW moreprice AS
SELECT *,
LAG(cost, 1, 0.00) OVER() AS "lagcars",
(cost - (LAG(cost, 1, 0.00) OVER())) AS "delta"
FROM cars;


SELECT * FROM moreprice;


SELECT id, name, cost
FROM moreprice
WHERE delta > 0;


-- Получить список автомобилей, у которых цена меньше следующей цены


CREATE OR REPLACE VIEW lessprice AS
SELECT *,
LEAD(cost, 1, 0.00) OVER() AS "leadcars",
(cost - (LEAD(cost, 1, 0.00) OVER())) AS "delta"
FROM cars;


SELECT * FROM lessprice;


SELECT id, name, cost
FROM lessprice
WHERE delta < 0;



-- Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля

SELECT *,
(cost - (LEAD(cost, 1, 0) OVER(ORDER BY cost))) AS "delta"
FROM cars;