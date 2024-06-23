DROP DATABASE IF EXISTS  proveedoresDB;
CREATE DATABASE proveedoresDB;
USE proveedoresDB;

CREATE TABLE estado (
	estado_id char(2),
    nombre char(15)
);

CREATE TABLE cliente (
	num_cliente int,
    nombre char(21),
    apellidos char(21),
    compania char(20),
    direccion1 char(40),
    direccion2 char(40),
    ciudad char(21),
    estado char(21),
    cp char(9),
    telefono char(22)
);

CREATE TABLE proveedor (
	codigo_proveedor char(3),
    nombre_proveedor char(15)
);


CREATE TABLE orden (
	num_orden int,
    num_cliente int,
    fecha_orden date,
	instrucciones char(40),
	disponible char(1),
	num_pedido char(10),
    fecha_envio date,
	peso_envio decimal(8,2),
	cargo_envio decimal(8,2),
	fecha_pago date
);

CREATE TABLE inventario (
	num_inventario smallint,
    codigo_proveedor char(3),
    descripcion char(15),
    precio_unitario decimal(6,2),
    unidad char(4),
    descripcion_unidad char(15)
);

CREATE TABLE articulo (
	num_articulo smallint,
    num_orden int,
    num_inventario smallint,
    codigo_proveedor char(3),
    cantidad smallint,
    precio_total decimal(8,2)
);
-- **************************************************************************************************************************
ALTER TABLE estado ADD CONSTRAINT pk_estado PRIMARY KEY (estado_id);
ALTER TABLE cliente ADD CONSTRAINT fk_estado FOREIGN KEY (estado) REFERENCES estado (estado_id);

ALTER TABLE cliente ADD CONSTRAINT unique_num_cliente UNIQUE (num_cliente);
ALTER TABLE orden ADD CONSTRAINT fk_cliente FOREIGN KEY (num_cliente) REFERENCES cliente (num_cliente);

ALTER TABLE orden ADD CONSTRAINT unique_num_orden UNIQUE (num_orden);
ALTER TABLE articulo ADD CONSTRAINT fk_orden FOREIGN KEY (num_orden) REFERENCES orden (num_orden);
-- **************************************************************************************************************************
-- inicio de inserciones

INSERT INTO estado VALUES ('CA', 'California'),
						('NY', 'New York'),
						('TX', 'Texas'),
						('FL', 'Florida'),
						('IL', 'Illinois'),
						('OH', 'Ohio'),
						('PA', 'Pennsylvania'),
						('GA', 'Georgia'),
						('MI', 'Michigan'),
						('NC', 'North Carolina');


INSERT INTO proveedor VALUES ('001', 'Proveedor A'),
							('002', 'Proveedor B'),
							('003', 'Proveedor C'),
							('004', 'Proveedor D'),
							('005', 'Proveedor E'),
							('006', 'Proveedor F'),
							('007', 'Proveedor G'),
							('008', 'Proveedor H'),
							('009', 'Proveedor I'),
							('010', 'Proveedor J');


INSERT INTO cliente VALUES (1, 'Juan', 'Perez', 'Empresa A', 'Calle Principal 123', 'Piso 2', 'Ciudad A', 'CA', '12345', '555-123-4567'),
							(2, 'María', 'González', 'Empresa B', 'Avenida Central 456', 'Oficina 1', 'Ciudad B', 'NY', '23456', '555-234-5678'),
							(3, 'Pedro', 'Rodríguez', 'Empresa C', 'Plaza Mayor 789', 'Local 5', 'Ciudad C', 'TX', '34567', '555-345-6789'),
							(4, 'Ana', 'López', 'Empresa D', 'Calle Secundaria 321', 'Apartamento 10', 'Ciudad D', 'FL', '45678', '555-456-7890'),
							(5, 'Carlos', 'Martínez', 'Empresa E', 'Boulevard Norte 654', 'Piso 3', 'Ciudad E', 'IL', '56789', '555-567-8901'),
							(6, 'Laura', 'Hernández', 'Empresa F', 'Calle Sur 987', 'Local 8', 'Ciudad F', 'OH', '67890', '555-678-9012'),
							(7, 'Jorge', 'Díaz', 'Empresa G', 'Avenida Este 210', 'Oficina 15', 'Ciudad G', 'PA', '78901', '555-789-0123'),
							(8, 'Sofía', 'Ramírez', 'Empresa H', 'Plaza Oeste 543', 'Piso 5', 'Ciudad H', 'GA', '89012', '555-890-1234'),
							(9, 'Miguel', 'Sánchez', 'Empresa I', 'Calle Principal 753', 'Apartamento 12', 'Ciudad I', 'MI', '90123', '555-901-2345'),
							(10, 'Elena', 'Torres', 'Empresa J', 'Avenida Central 987', 'Local 3', 'Ciudad J', 'NC', '01234', '555-012-3456');


INSERT INTO orden VALUES (1, 1, '2024-05-17', 'Instrucción 1', 'S', 'P001', '2024-05-20', 10.5, 25.00, '2024-06-01'),
						(2, 2, '2024-05-18', 'Instrucción 2', 'N', 'P002', '2024-05-21', 8.2, 20.50, '2024-06-02'),
						(3, 3, '2024-05-19', 'Instrucción 3', 'S', 'P003', '2024-05-22', 12.7, 30.75, '2024-06-03'),
						(4, 4, '2024-05-20', 'Instrucción 4', 'N', 'P004', '2024-05-23', 9.8, 22.80, '2024-06-04'),
						(5, 5, '2024-05-21', 'Instrucción 5', 'S', 'P005', '2024-05-24', 15.3, 35.20, '2024-06-05'),
						(6, 6, '2024-05-22', 'Instrucción 6', 'N', 'P006', '2024-05-25', 11.6, 28.40, '2024-06-06'),
						(7, 7, '2024-05-23', 'Instrucción 7', 'S', 'P007', '2024-05-26', 13.9, 32.10, '2024-06-07'),
						(8, 8, '2024-05-24', 'Instrucción 8', 'N', 'P008', '2024-05-27', 10.2, 24.90, '2024-06-08'),
						(9, 9, '2024-05-25', 'Instrucción 9', 'S', 'P009', '2024-05-28', 14.5, 33.60, '2024-06-09'),
						(10, 10, '2024-05-26', 'Instrucción 10', 'N', 'P010', '2024-05-29', 16.8, 37.30, '2024-06-10');


INSERT INTO inventario VALUES (1, '001', 'Producto A', 10.99, 'UND', 'Unidad'),
								(2, '002', 'Producto B', 15.50, 'KG', 'Kilogramo'),
								(3, '003', 'Producto C', 8.75, 'LTR', 'Litro'),
								(4, '004', 'Producto D', 25.00, 'CAJ', 'Caja'),
								(5, '005', 'Producto E', 5.99, 'PZA', 'Pieza'),
								(6, '006', 'Producto F', 18.25, 'MTR', 'Metro'),
								(7, '007', 'Producto G', 12.50, 'PAR', 'Par'),
								(8, '008', 'Producto H', 30.75, 'JGO', 'Juego'),
								(9, '009', 'Producto I', 7.99, 'BOT', 'Botella'),
								(10, '010', 'Producto J', 22.50, 'DOC', 'Docena');


INSERT INTO articulo VALUES (1, 1, 1, '001', 5, 54.95),
							(2, 2, 2, '002', 3, 46.50),
							(3, 3, 3, '003', 8, 70.00),
							(4, 4, 4, '004', 2, 50.00),
							(5, 5, 5, '005', 6, 35.94),
							(6, 6, 6, '006', 4, 73.00),
							(7, 7, 7, '007', 1, 12.50),
							(8, 8, 8, '008', 9, 276.75),
							(9, 9, 9, '009', 2, 15.98),
							(10, 10, 10, '010', 7, 157.50);
-- TERMINA TRABAJO DEL DIA 16 DE MAYO
-- INICIA TRABAJO DIA 20 DE MAYO
-- **************** INICIAN LAS CONSULTAS *********************
-- Listar todos los clientes y sus estados
SELECT 
concat(c.nombre, '', c.apellidos) AS 'Nombre completo', 
c.estado, 
e.nombre AS nombre_estado 
FROM cliente c JOIN estado e ON c.estado = e.estado_id
WHERE e.estado_id = 'TX';


-- Listar todas las órdenes con información del cliente
SELECT 
o.num_orden, o.fecha_orden, 
c.nombre, c.apellidos, c.compania 
FROM orden o 
JOIN cliente c ON o.num_cliente = c.num_cliente;


-- num_inventario smallint,  -- codigo_proveedor char(3),  -- descripcion char(15),
-- precio_unitario decimal(6,2),  -- unidad char(4),   -- descripcion_unidad char(15)
SELECT prv.nombre_proveedor FROM proveedor prv JOIN inventario ivt ON prv.codigo_proveedor = ivt.codigo_proveedor;




-- actualización de registros
UPDATE proveedor SET proveedor.nombre_proveedor = 'Juguetes-1' WHERE proveedor.nombre_proveedor = 'Proveedor A';
UPDATE proveedor SET proveedor.nombre_proveedor = 'Fruta-1' WHERE proveedor.nombre_proveedor = 'Proveedor B';
UPDATE proveedor SET proveedor.nombre_proveedor = 'Vegetales-1' WHERE proveedor.nombre_proveedor = 'Proveedor C';

-- eliminación de registros con buenas prácticas
START TRANSACTION;
SELECT * FROM proveedor;
DELETE FROM proveedor WHERE codigo_proveedor = 009;
DELETE FROM proveedor WHERE codigo_proveedor = 010;
SELECT * FROM proveedor;
ROLLBACK;
-- END TRANSACTION;
SELECT ivt.descripcion, ivt.unidad FROM inventario ivt JOIN proveedor prv ON  ivt.codigo_proveedor = prv.codigo_proveedor;
-- TERMINA TRABAJO DE LOS DIAS 20 Y 21 DE MAYO


-- INICIA TRABAJO DEL DIA 22 DE MAYO

SELECT estado, count(*) AS clientes_ubicados_en FROM cliente GROUP BY estado HAVING count(*) >= 1;

SELECT * FROM cliente;
UPDATE cliente c SET c.estado = 'TX' WHERE c.num_cliente = 4;
UPDATE cliente c SET c.estado = 'CA' WHERE c.num_cliente = 7;
UPDATE cliente c SET c.estado = 'TX' WHERE c.num_cliente = 8;
UPDATE cliente c SET c.estado = 'TX' WHERE c.num_cliente = 9;
UPDATE cliente c SET c.estado = 'TX' WHERE c.num_cliente = 10;


SELECT fecha_orden, SUM(peso_envio) AS peso_total 
FROM orden 
GROUP BY fecha_orden;

SELECT fecha_orden, SUM(peso_envio) AS peso_total 
FROM orden 
GROUP BY fecha_orden 
HAVING SUM(peso_envio) > 10;

SELECT fecha_orden, SUM(peso_envio) AS peso_total 
FROM orden 
WHERE peso_envio > 10
GROUP BY fecha_orden;

SELECT num_orden, SUM(cantidad) as cantidad_total
FROM articulo
GROUP BY num_orden;

-- calcular la cantidad total de articulos por cada orden, pero solo se debe mostrar la cantidad toal a partir de 5
SELECT num_orden, SUM(cantidad) as cantidad_total
FROM articulo
GROUP BY num_orden
HAVING SUM(cantidad) > 5;

-- todos los registros de tabla estado, en donde estado comience con letra M
UPDATE proveedor SET proveedor.nombre_proveedor = 'CELooo' WHERE proveedor.codigo_proveedor = 008;
SELECT * 
FROM proveedor p 
WHERE p.nombre_proveedor LIKE '%CEL';

-- nombre de proveedor, en donde esta contenido la letra f
SELECT nombre_proveedor 
FROM proveedor p 
WHERE p.nombre_proveedor LIKE '%f%'
GROUP BY nombre_proveedor;

--     ****   TRABAJO DEL DIA 24 DE MAYO DE 2024    ****

-- todos los registros de cliente, donde el apellido del cliente termine con z
SELECT * 
FROM cliente c 
WHERE c.apellidos LIKE '%z';

-- todos los registros de cliente, donde el apellido del cliente termine con z
SELECT num_cliente, apellidos, estado 
FROM cliente c 
WHERE c.estado != 'CA' AND c.estado != 'OK';

-- todos los registros de cliente, donde el apellido del cliente termine con z  (OTRA MANERA DE HACERLO)
SELECT num_cliente, apellidos, estado 
FROM cliente c 
WHERE c.estado NOT IN ('CA', 'OK');


-- nombres de clientes que no son iguales
SELECT DISTINCT nombre FROM cliente;



SELECT num_cliente, nombre, apellidos FROM cliente c WHERE c.nombre = 'Pedro';

SELECT num_cliente, nombre, apellidos FROM cliente c WHERE c.nombre = 'Pedro' AND c.apellidos = 'Rodriguez';


SELECT num_cliente, nombre, apellidos FROM cliente c WHERE c.direccion1 IS NOT NULL;

SELECT * FROM orden WHERE num_cliente IN (2, 3) AND fecha_envio >= '2024-05-01' AND fecha_envio <= '2024-05-09';
-- SELECT * FROM orden od JOIN cliente ON od.num_cliente = cliente.num_cliente WHERE od.num_cliente = 1001 AND od.num_cliente = 1001;

SELECT num_orden, fecha_orden, num_pedido
FROM orden ord 
WHERE ord.instrucciones LIKE '%5%';

SELECT * FROM orden;

SELECT num_orden, SUM(precio_total) AS SumaPrecios FROM articulo 
GROUP BY num_orden 
HAVING SUM(precio_total) > 250;


SELECT num_cliente AS id, CONCAT(nombre, " ", apellidos) AS nombre_completo, count(*) as Total FROM cliente GROUP BY num_cliente;

SELECT count(*) FROM articulo, inventario;

SELECT num_cliente, estado, CONCAT(nombre, " ", apellidos) AS nombre_completo, count(*) FROM cliente GROUP BY num_cliente, estado;

-- ************************************************************************************************************
-- ********************************             DIA   27 DE MAYO       ****************************************
SELECT cargo_envio, MAX(peso_envio) FROM orden
GROUP BY cargo_envio
HAVING MAX(peso_envio) > 10 AND MAX(peso_envio) <= 15;

SELECT '2023-0-30' IN (select fecha_envio from orden);
SELECT 'g' IN ('u', 'o', 'p');
SELECT 5 IN (1, 2, 3, 4, 5);
SELECT INTERVAL (55, 30, 40, 50, 60, 70);

-- Uso de operadores aritmeticos
SET @a=10, @b=2;
SELECT @a-@b AS resta, -@a as negativo, @a*@b as multiplicacion, @a/@b AS division, @a%@b AS porcentaje;

-- Selecciona el cliente (nombre + apellidos) cuyo estado es 'CA
SELECT concat(nombre, '', apellidos) as 'Nombre Completo'
FROM cliente
WHERE estado IN (SELECT estado FROM estado WHERE estado = 'CA');

SELECT concat(c.nombre, '', c.apellidos) AS 'Nombre completo'
FROM cliente c
JOIN estado e ON c.estado = e.estado_id
WHERE e.estado_id = 'CA';

-- Selecciona el nombre del cliente y el nombre el estado (no codigo), que viva en elestado CA
SELECT CONCAT(c.nombre, ' ', c.apellidos) AS 'Nombre de Esatdo' 
FROM cliente c 
JOIN estado e ON c.estado = e.estado_id 
WHERE e.estado_id = 'CA';
    
-- Forma Alternativa
SELECT CONCAT(c.nombre, ' ', c.apellidos) AS 'Nombre completo', (
	SELECT e.nombre FROM estado e 
	WHERE e.estado_id = c.estado) AS 'Nombre de Estado' 
	FROM cliente c 
	WHERE c.estado 
	IN(SELECT e.estado_id FROM estado e WHERE e.estado_id = 'CA');


-- ************************************************************************************************************
-- ********************************             DIA   28 DE MAYO       ****************************************
SELECT MAX(cargo_envio) AS costo FROM proveedoresDB.orden;

SELECT num_articulo, num_orden, cantidad 
FROM proveedoresDB.articulo 
WHERE precio_total=(SELECT MAX(precio_total) FROM proveedoresDB.articulo);


SELECT num_articulo, num_orden, cantidad 
FROM proveedoresDB.articulo 
ORDER BY precio_total DESC LIMIT 1;


SELECT num_articulo, MAX(precio_total) AS precio 
FROM articulo 
GROUP BY num_articulo;


SELECT num_articulo, codigo_proveedor, cantidad 
FROM  articulo s1 
WHERE precio_total = (
	SELECT MAX(s2.precio_total)
    FROM articulo s2
    WHERE s1.num_articulo = s2.num_articulo
);

--  consulta pendiente
-- manera de obtener el precio minimo y el maximo
SELECT @min_precio_total := MIN(precio_total) AS minimo,
@min_precio_total := MAX(precio_total) AS maximo
FROM articulo;

-- otra manera de obtener el precio minimo y el maximo
SELECT * FROM articulo
WHERE precio_total = @min_precio_total
OR precio_total = @max_precio_total;


SELECT * FROM orden WHERE num_cliente IN (1004, 1006); 

SELECT * FROM orden WHERE num_cliente = 1004 AND num_cliente = 1006;

SELECT * FROM orden WHERE num_cliente = 1004 OR num_cliente = 1006;

SELECT * FROM orden WHERE num_cliente NOT IN (1004, 1006); 

SELECT @variable := 'Hola mundo' AS texto;




