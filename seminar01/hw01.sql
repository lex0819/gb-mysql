CREATE DATABASE mobile;

USE mobile;

CREATE TABLE phones
(id INT PRIMARY KEY NOT NULL,
ProdactName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
ProductCount INT,
Price INT);

INSERT INTO phones(id, ProdactName, Manufacturer, ProductCount, Price)
VALUES
(1, "iPhone X", "Apple", 3, 76000),
(2, "iPhone 8", "Apple", 2, 51000),
(3, "Galaxy S9", "Samsung", 2, 56000),
(4, "Galaxy S8", "Samsung", 1, 41000),
(5, "P 20 Pro", "Huawei", 5, 36000);

SELECT ProdactName, Manufacturer, Price
FROM phones
WHERE ProductCount > 2;

SELECT * FROM phones
WHERE Manufacturer = 'Samsung';

SELECT * FROM phones
WHERE ProdactName LIKE '%iphone%';

SELECT * FROM phones
WHERE Manufacturer REGEXP 'Samsung';

SELECT * FROM phones
WHERE ProdactName REGEXP '8';
