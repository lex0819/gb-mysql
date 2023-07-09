# Урок 5. SQL – оконные функции

https://drive.google.com/file/d/1rkNr6GHSE9ulRs39BB4RC80aKMg1c7Jw/view

## Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

```sql
CREATE OR REPLACE VIEW view_25 AS
SELECT * FROM cars
WHERE cost < 25000;

SELECT * FROM view_25;
```

## Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

```sql
ALTER VIEW view_25 AS
SELECT * FROM cars
WHERE cost < 30000;

SELECT * FROM view_25;
```

## Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

```sql
CREATE OR REPLACE VIEW vag AS
SELECT * FROM cars
WHERE name IN ('Skoda', 'Audi');

SELECT * FROM vag;
```

## Доп задания:

### 1 Получить ранжированный список автомобилей по цене в порядке возрастания

```sql
SELECT id, name, cost,
ROW_NUMBER() OVER(ORDER BY cost ASC) AS 'number'
FROM cars;
```

### 2 Получить топ-3 самых дорогих автомобилей, а также их общую стоимость

```sql
SELECT *,
SUM(cost) OVER() AS 'total'
FROM cars
ORDER BY cost DESC
LIMIT 3;
```

### 3 Получить список автомобилей, у которых цена больше предыдущей цены

```sql
CREATE OR REPLACE VIEW moreprice AS
SELECT *,
LAG(cost, 1, 0.00) OVER() AS "lagcars",
(cost - (LAG(cost, 1, 0.00) OVER())) AS "delta"
FROM cars;

SELECT id, name, cost
FROM moreprice
WHERE delta > 0;
```

### 4 Получить список автомобилей, у которых цена меньше следующей цены

```sql
CREATE OR REPLACE VIEW lessprice AS
SELECT *,
LEAD(cost, 1, 0.00) OVER() AS "leadcars",
(cost - (LEAD(cost, 1, 0.00) OVER())) AS "delta"
FROM cars;

SELECT id, name, cost
FROM lessprice
WHERE delta < 0;
```

### 5 Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля

```sql
SELECT *,
(cost - (LEAD(cost, 1, 0) OVER(ORDER BY cost))) AS "delta"
FROM cars;
```
