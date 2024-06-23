DROP DATABASE IF EXISTS customers_db;
CREATE DATABASE customers_db;

USE customers_db;

DROP TABLE IF EXISTS customer;


CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(160),
    customer_contact_name VARCHAR(120),
    customer_address VARCHAR(120),
    customer_city VARCHAR(50),
    customer_postal_code VARCHAR(15),
    customer_country VARCHAR(50)
);


insert into customer values(1, 'Carlos Lopez', 'Maria Gonzalez', 'Obrere Str. 57', 'Aguascalientes', '20000', 'Mexico');
insert into customer values(2, 'Emma Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico');
insert into customer values(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico');
insert into customer values(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK');
insert into customer values(5, 'Ninna Huskkon', 'Christina Berglund', 'Berguvsvage', 'Tampere', 'S-958 22', 'Finlandia');
-- trabajo del dia 14 de mayo
insert into customer values(6,  'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany');
insert into customer values(7,  'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico');
insert into customer values(8,  'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico');
insert into customer values(9,  'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA 1 1DP', 'UK');
insert into customer values(10, 'Berglunds snabbkop', 'Christina Berglund', 'Berguvsvagen 8', 'Lulea', 'S-958 22', 'Sweden');


-- inicio de las consultas
SELECT * FROM customer;
SELECT * FROM customer WHERE customer_name LIKE 'A%';

-- eliminar datos
DELETE FROM customer WHERE customer_contact_name = 'Antonio Moreno';

-- operaciones de insercion de datos
insert into customer values(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico');

-- operaciones de actualizacion de datos
UPDATE customer SET customer_contact_name = 'Esteban Moreno' WHERE customer_contact_name = 'Antonio Moreno';
UPDATE customer SET customer_contact_name = 'Alfredo Ramirez', customer_city = 'Guadalajara', customer_address = 'Lopez Mateos 503' WHERE customer_id = 1;

-- fin de las consultas del dia 13 de mayo






-- consultas del dia 14 de mayo
SELECT  customer_country, COUNT(*) AS TotalCustomers FROM customer GROUP BY customer_country HAVING COUNT(*) >= 2 ORDER BY TotalCustomers DESC;


SELECT  customer_name, customer_city, customer_country FROM customer WHERE customer_country IN ('United States', 'Canada', 'Mexico') ORDER BY customer_country, customer_city;

SELECT customer_city, COUNT(*) AS TotalCustomers FROM  customer WHERE customer_postal_code IS NOT NULL GROUP BY customer_city HAVING COUNT(*) > 1 ORDER BY TotalCustomers DESC;
