CREATE DATABASE EnfermeriaPrueba;
USE EnfermeriaPrueba;

CREATE TABLE Familia (
    familia_id INT PRIMARY KEY,
    apellido VARCHAR(30),
    direccion VARCHAR(50)
);

CREATE TABLE TipoDeTecho (
    techo_codigo TINYINT PRIMARY KEY,
    techo_descripcion VARCHAR(30)
);

CREATE TABLE TipoDePared (
    pared_codigo TINYINT PRIMARY KEY,
    pared_descripcion VARCHAR(30)
);

CREATE TABLE TipoDePiso (
    piso_codigo TINYINT PRIMARY KEY,
    piso_descripcion VARCHAR(30)
);

CREATE TABLE TABLA_CON_CODIGO (
    familia_id INT,
    techo_codigo TINYINT,
    pared_codigo TINYINT,
    piso_codigo TINYINT,
    FOREIGN KEY (familia_id) REFERENCES Familia(familia_id),
    FOREIGN KEY (techo_codigo) REFERENCES TipoDeTecho(techo_codigo),
    FOREIGN KEY (pared_codigo) REFERENCES TipoDePared(pared_codigo),
    FOREIGN KEY (piso_codigo) REFERENCES TipoDePiso(piso_codigo)
);


-- Insertar datos en la tabla Familia
INSERT INTO Familia (familia_id, apellido, direccion) VALUES (1, 'Perez', 'Calle Luna 123');
INSERT INTO Familia (familia_id, apellido, direccion) VALUES (2, 'Martinez', 'Calle Sol 234');

-- Insertar datos en las tablas TipoDeTecho, TipoDePared y TipoDePiso
INSERT INTO TipoDeTecho (techo_codigo, techo_descripcion)
VALUES (1, 'Teja'),
       (2, 'Lámina'),
       (3, 'Concreto');

INSERT INTO TipoDePared (pared_codigo, pared_descripcion)
VALUES (1, 'Ladrillo'),
       (2, 'Adobe'),
       (3, 'Concreto');

INSERT INTO TipoDePiso (piso_codigo, piso_descripcion)
VALUES (1, 'Tierra'),
       (2, 'Cemento'),
       (3, 'Madera');

-- Establecer referencias en la tabla TABLA_CON_CODIGO
INSERT INTO TABLA_CON_CODIGO (familia_id, techo_codigo, pared_codigo, piso_codigo) VALUES (1, 1, 1, 1);


SELECT Familia.apellido, Familia.direccion, TipoDeTecho.techo_descripcion, TipoDePared.pared_descripcion, TipoDePiso.piso_descripcion
FROM Familia
JOIN TABLA_CON_CODIGO ON Familia.familia_id = TABLA_CON_CODIGO.familia_id
JOIN TipoDeTecho ON TABLA_CON_CODIGO.techo_codigo = TipoDeTecho.techo_codigo
JOIN TipoDePared ON TABLA_CON_CODIGO.pared_codigo = TipoDePared.pared_codigo
JOIN TipoDePiso ON TABLA_CON_CODIGO.piso_codigo = TipoDePiso.piso_codigo
WHERE Familia.familia_id = 1;






