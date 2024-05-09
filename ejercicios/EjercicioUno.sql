-- creación de la base de datos
CREATE DATABASE EliasCardonaMeritosBD;
USE EliasCardonaMeritosBD;

-- creación de tablas
CREATE TABLE merito (
    desempeno INT(11) NOT NULL PRIMARY KEY,
    porcentaje FLOAT NOT NULL
);

CREATE TABLE empleado (
    emp_id INT(11) NOT NULL AUTO_INCREMENT,
    emp_nombre VARCHAR(255) NOT NULL,
    desempeno INT(11) DEFAULT NULL,
    salario FLOAT DEFAULT NULL,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_desempeno FOREIGN KEY (desempeno) REFERENCES merito (desempeno)
);


-- llenado de tabla merito
INSERT INTO merito(desempeno,porcentaje)
VALUES(1,0),
      (2,0.01),
      (3,0.03),
      (4,0.05),
      (5,0.08);


-- llenado de tabla empleado
INSERT INTO empleado(emp_nombre,desempeno,salario)      
VALUES('Mary Doe', 1, 50000),
      ('Cindy Smith', 3, 65000),
      ('Sue Greenspan', 4, 75000),
      ('Grace Dell', 5, 125000),
      ('Nancy Johnson', 3, 85000),
      ('John Doe', 2, 45000),
      ('Lily Bush', 3, 55000);

-- comienzo de las consultas
-- consulta 1
SELECT * FROM empleado;

-- consulta 2
SELECT emp_id, emp_nombre FROM empleado WHERE desempeno <> 3;

-- consulta de los tipos de merito existente
SELECT * FROM merito;

-- consultando a los empleados con mejor merito
SELECT e.emp_id, e.emp_nombre, m.porcentaje
FROM empleado e
JOIN merito m ON e.desempeno = m.desempeno
WHERE e.desempeno = 5;

-- consultando a los empleados con el merito mas bajo
SELECT e.emp_nombre, m.porcentaje
FROM empleado e
JOIN merito m ON e.desempeno = m.desempeno
WHERE e.desempeno = 1;
