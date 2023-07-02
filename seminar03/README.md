# Урок 3. SQL – выборка данных,

сортировка, агрегатные функции

Условие по таблице staff:

См. скрипт SQL [hw03.sgl](./hw03.sql) с решением.

## Отсортируйте данные по полю заработная плата

(salary) в порядке:

убывания;

```sql
SELECT * FROM staff
ORDER BY salary DESC;
```

возрастания

```sql
SELECT * FROM staff
ORDER BY salary ASC;
```

## Выведите 5 максимальных

заработных плат (salary)

```sql
-- Первые пять самых высоких зарплат
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;
```

## Посчитайте суммарную зарплату (salary)

по каждой специальности (роst)

```sql
-- Сумарная зарплата по каждой профессии
SELECT post, SUM(salary) AS salary_SUM FROM staff
GROUP BY post;
```

## Найдите кол-во сотрудников с специальностью (post) «Рабочий»

в возрасте от 24 до 49 лет включительно.

```sql
-- Сколько человек по профессии Рабочий и по возрасту от 24 до 49 лет
SELECT post, COUNT(*) AS people FROM staff
WHERE 24 <= age AND age <=49 AND post = 'Рабочий';
```

## Найдите количество специальностей

```sql
-- Сколько всего профессий на предприятии
SELECT COUNT(DISTINCT post) AS count_of_jobs FROM staff;
```

## Выведите специальности,

у которых средний возраст сотрудников меньше 30 лет включительно

```sql
-- Средний возраст сотрудников, сгруппированных по профессии
-- вывести только те профессии, где средний возраст <= 30 лет
SELECT post, AVG(age) AS age_AVG FROM staff
GROUP BY post
HAVING age_AVG <= 30;
```

## Выведите среднюю заработную плату по должностям,

которая составляет более 30000

```sql
-- Средняя зарплата, сгруппирована по должностям
-- вывести только те должности, где средняя зп больше 30000
SELECT post, AVG(salary) AS salary_AVG FROM staff
GROUP BY post
HAVING salary_AVG > 30000;
```
