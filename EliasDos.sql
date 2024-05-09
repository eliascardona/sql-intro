-- creando base de datos
CREATE DATABASE AlumnoCalificacionBD;
USE AlumnoCalificacionBD;

DROP TABLE IF EXISTS ALUMNO;

-- el prefijo 'al' es una abrevicación de la palabra 'alumno'
CREATE TABLE ALUMNO (
	al_id INT PRIMARY KEY,
	al_nombre_uno VARCHAR(40),
    al_nombre_dos VARCHAR(40),
	al_apellido_uno VARCHAR(50),
    al_apellido_dos VARCHAR(50),
    al_telefono INT,
    dom_id INT
);


DROP TABLE IF EXISTS DIRECCION;
-- el prefijo 'dom' es una abrevicación de la palabra 'domicilio'
CREATE TABLE DIRECCION (
	dom_id INT PRIMARY KEY,
    dom_calle VARCHAR(20),
    dom_num_calle SMALLINT,
    dom_colonia VARCHAR(20),
    dom_municipio VARCHAR(20),
    dom_estado VARCHAR(20),
    dom_codigo_postal INT
);

-- añadiendo una restricción de negocio
ALTER TABLE ALUMNO
	ADD constraint dom_id_fk
	foreign key (dom_id)
	REFERENCES DIRECCION(dom_id);
-- fin de nuestra restricción de negocio

-- el prefijo 'dom' es una abrevicación de la palabra 'domicilio'
CREATE TABLE MATERIA (
	materia_codigo INT PRIMARY KEY,
    materia_nombre VARCHAR(40),
    materia_num_creditos INT
);


-- el prefijo 'dom' es una abrevicación de la palabra 'domicilio'
CREATE TABLE ALUMNO_MATERIA (
	al_id INT,
	materia_codigo INT
);

-- añadiendo una restricción de negocio
ALTER TABLE ALUMNO_MATERIA
	ADD constraint al_id_fk
	foreign key (al_id)
	REFERENCES ALUMNO(al_id);

ALTER TABLE ALUMNO_MATERIA
	ADD constraint materia_codigo_fk
	foreign key (materia_codigo)
	REFERENCES MATERIA(materia_codigo);
-- fin de nuestra restricción de negocio



-- el prefijo 'dom' es una abrevicación de la palabra 'domicilio'
CREATE TABLE CALIFICACION (
	calif_id INT PRIMARY KEY,
	calif_valor INT,
	calif_num_parcial INT,
	materia_codigo INT,
	al_id INT
);

-- inserción de datos
INSERT INTO DIRECCION values(1, 'ALPES', 33, 'Col Montañas', 'Ags', 'Ags', 20116, 1);




-- inserción de datos
INSERT INTO ALUMNO values(1, 'Elias', 'Eduardo', 'Cardona', 'Rodriguez', 10020, 1);
INSERT INTO ALUMNO values(2, 'Caleb', 'null', 'Altamirano', 'Zarate', 10030, 2);
INSERT INTO ALUMNO values(3, 'Fabian', 'null', 'Rodriguez', 'Herrera', 20030, 3);
INSERT INTO ALUMNO values(4, 'Emilio', 'Jesus', 'Marentes', 'Vejar', 30030, 4);

-- selección/lectura de datos
SELECT al_nombre_uno FROM ALUMNO;

