# Урок 4. SQL – работа с несколькими таблицами

См. скрипты с решениями в файле [hw04.sql](./hw04.sql) более подробно.

## Табличка: https://docs.google.com/document/d/1kEwTJhGJeyfNFdr8t7O4ioiqiFthoy4cQZ2CKaDuwY8/edit?usp=sharing

Используя JOIN-ы, выполните следующие операции:

## 1.Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

```sql
SELECT cats.name, shops.shopname
FROM cats
JOIN shops
ON cats.shops_id = shops.id;
```

## 2.Вывести магазин, в котором продается кот “Мурзик”

(попробуйте выполнить 2 способами)

```sql
SELECT s.shopname, c.name
FROM shops s, cats c
WHERE c.shops_id = s.id AND c.name = "Murzik";

SELECT s.shopname, c.name
FROM shops s
JOIN (SELECT * FROM cats
	WHERE name = "Murzik") AS c
ON s.id = c.shops_id;
```

## 3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

```sql
SELECT s.shopname, c.name
FROM shops s
JOIN (SELECT * FROM cats
	WHERE name NOT IN ("Murzik", "Zuza") ) AS c
ON s.id = c.shops_id;
```

## Табличка (после слов “Последнее задание, таблица:”)

## 4.Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

```sql
SELECT a.an_name AS "Название", a.an_price AS "ЦЕНА", o.ord_datetime AS "Дата продажи"
FROM analysis a
JOIN
	(SELECT * FROM Orders
	WHERE Orders.ord_datetime BETWEEN '2020-02-05 00:00:00'
		AND DATE_ADD('2020-02-05 00:00:00', INTERVAL 1 WEEK)
	) AS o
ON a.an_id = o.ord_an
ORDER BY o.ord_datetime;
```
