CREATE DATABASE estudiantes;
USE estudiantes;

CREATE TABLE tablaEstudiante (
	id int,
	uname varchar(40),
	grade int,
	gradeId varchar(8)
);

INSERT INTO tablaEstudiante values(1, 'Emilio', 5, 'g-5');
INSERT INTO tablaEstudiante values(2, 'carlos', 4, 'g-8');
INSERT INTO tablaEstudiante values(3, 'alex', 7, 'g-8');
INSERT INTO tablaEstudiante values(4, 'jesus', 12, 'A20');
INSERT INTO tablaEstudiante values(5, 'elias', 22, 'A20');
INSERT INTO tablaEstudiante values(6, 'fabian', 30, 'C40');








SELECT * FROM tablaEstudiante;