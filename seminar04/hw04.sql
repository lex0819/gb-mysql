DROP DATABASE IF EXISTS `lesson4`;
CREATE DATABASE `lesson4`;

USE lesson4;

DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

SELECT * FROM shops;


DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);


INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

SELECT * FROM cats;


-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

SELECT *
FROM cats, shops
WHERE cats.shops_id = shops.id;

SELECT cats.name, shops.shopname
FROM cats
JOIN shops
ON cats.shops_id = shops.id;


-- Вывести магазин, в котором продается кот “Мурзик”
SELECT id, name, shops_id
FROM cats
WHERE name = "Murzik";

SELECT sh.*, c.*
FROM shops sh
JOIN (SELECT * FROM cats
	WHERE name = "Murzik") AS c
ON sh.id = c.shops_id;
