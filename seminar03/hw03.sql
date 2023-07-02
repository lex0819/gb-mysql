DROP DATABASE IF EXISTS lesson3;
CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;

DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(25),
    lastname VARCHAR(25),
    post VARCHAR(20),
    seniority INT,
    salary INT,
    age INT
);

INSERT INTO staff(firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
    ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
    ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


SELECT * FROM staff;

SELECT * FROM staff
ORDER BY salary ASC;


SELECT * FROM staff
ORDER BY salary DESC;


-- Первые пять самых высоких зарплат
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;


-- Сумарная зарплата по каждой профессии
SELECT post, SUM(salary) AS salary_SUM FROM staff
GROUP BY post;


-- Сколько человек по профессии Рабочий и по возрасту от 24 до 49 лет
SELECT post, COUNT(*) AS people FROM staff
WHERE 24 <= age AND age <=49 AND post = 'Рабочий';


-- Сколько всего профессий на предприятии
SELECT COUNT(DISTINCT post) AS count_of_jobs FROM staff;


-- Средний возраст сотрудников, сгруппированных по профессии
-- вывести только те профессии, где средний возраст <= 30 лет
SELECT post, AVG(age) AS age_AVG FROM staff
GROUP BY post
HAVING age_AVG <= 30;


-- Средняя зарплата, сгруппирована по должностям
-- вывести только те должности, где средняя зп больше 30000
SELECT post, AVG(salary) AS salary_AVG FROM staff
GROUP BY post
HAVING salary_AVG > 30000;
