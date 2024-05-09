-- creando base de datos
CREATE DATABASE EjemploUno;

CREATE TABLE platillos (
	pk INT PRIMARY KEY,
	nombre VARCHAR(40),
	extra VARCHAR(60)
);

insert into platillos values(1, 'huevo 1', 'al gusto');
insert into platillos values(2, 'huevo 2', 'al gusto');
insert into platillos values(3, 'frijoles', 'frances');
insert into platillos values(4, 'frijoles', 'peruano');
insert into platillos values(5, 'enchilada 2', 'piconte');
insert into platillos values(6, 'enchilada 2', 'picante');

CREATE VIEW vista_uno AS
SELECT pk, nombre, extra
FROM platillos
WHERE extra like 'f%';

SELECT * FROM vista_uno where pk=4;