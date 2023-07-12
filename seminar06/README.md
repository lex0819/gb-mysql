# Урок 6. SQL – Транзакции.

Временные таблицы, управляющие конструкции, циклы

См. весь скрипт в файле [hw06.sql](./hw06.sql)

## Создайте функцию, которая принимает кол-во сек

и форматирует их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

```sql
DROP FUNCTION IF EXISTS full_time;
DELIMITER $$
CREATE FUNCTION full_time(n INT) -- кол-во секунд
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;

    SET days = n DIV 86400;
    SET hours = (n DIV 3600) - days * 24;
    SET minutes = (n DIV 60) - (days * 24 * 60) - (hours * 60);
    SET seconds = n - (days * 24 * 3600) - (hours * 3600) - (minutes * 60);

    RETURN CONCAT(days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', seconds, ' seconds.');

END $$
DELIMITER ;

SELECT '123456' AS seconds, full_time(123456) AS how_long;
```

## Создайте процедуру, которая выводит только четные числа

от 1 до 10.
Пример: 2,4,6,8,10

```sql
DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER $$
CREATE PROCEDURE even_numbers(n INT)
BEGIN
	DECLARE i INT DEFAULT 2;
    DECLARE res VARCHAR(100) DEFAULT CONCAT(i, ' ');
    IF n > 2 THEN
      WHILE i < n DO
        SET i = i + 2;
        SET res = CONCAT(res, ' ', i);
      END WHILE;
      SELECT n AS n, res AS "even numbers";
	ELSE
		SELECT "You've entered not valid number!";
	END IF;
END $$
DELIMITER ;

CALL even_numbers(10);
```
