-- Elimina la BD
drop database if exists AlumnoCalificacion2024;
-- Crea la BD
create database AlumnoCalificacion2024;
-- para usar una BD creada
use AlumnoCalificacion2024;



-- Crear la tabal alumno
create table alumno (
    id int primary key,
    nombre varchar(30),
    ap varchar(30),
    am varchar(30),
    id_direccion int
);

-- Crear la tabla dirección
create table direccion (
    id_direccion int primary key,
    direccion varchar(60),
    ciudad int
);

create table materia (
    id int primary key,
    nombre char (30)
);


create table calificacion (
    id int,
    id_materia int,
    calificacion int
);

-- crear fk
alter table alumno
add constraint fk_id_direccion
	foreign key (id_direccion)
    references direccion(id_direccion);
    
-- constraints calificacion con materia

alter table calificacion
add constraint fk_id_materia
	foreign key (id_materia)
    references materia(id);




-- inserción de direcciones

insert into direccion values (1,'Calle Piedras negras 17',1);
insert into direccion values (2,'Calle Corregidora 81',1);
insert into direccion values (3,'Calle republica de Uruguay 1105',5);
insert into direccion values (4,'Calle Encino 15',2);
insert into direccion values (5,'Calle Cristobal Colon 204',2);
insert into direccion values (6,'Calle Primavera 29',3);
insert into direccion values (7,'Calle Miguel Hidalgo 70',10);
insert into direccion values (8,'Calle Republica de Panama 57',10);
insert into direccion values (9,'Calle Republica de Panama 57',7);
insert into direccion values (10,'Calle Arcadia 61',7);
insert into direccion values (11,'Calle Arcadia 65',7);
insert into direccion values (12,'Calle Octavio Paz 33',10);
insert into direccion values (13,'Calle Sor Juana Ines 9',5);
insert into direccion values (14,'Calle Sor Juana Ines 18',5);
insert into direccion values (15,'Calle Jose Guadalupe 91',1);
insert into direccion values (16,'Calle Jose Guadalupe 64',1);
insert into direccion values (17,'Calle Jose Guadalupe 64',1);
insert into direccion values (18,'Calle Jose Guadalupe 64',1);
insert into direccion values (19,'Calle Jose Guadalupe 64',1);
insert into direccion values (20,'Calle Necaxa 66',7);
insert into direccion values (21,'Calle Don quijote 42',7);
insert into direccion values (22,'Calle Rio Grande 109',3);
insert into direccion values (23,'Calle Roma 109',4);
insert into direccion values (24,'Calle San Felipe 1',5);
insert into direccion values (25,'Calle Abredul 5',5);
insert into direccion values (26,'Calle Gigantes 99',6);
insert into direccion values (27,'Calle Molinos 99',6);
insert into direccion values (28,'Calle Sancadas 232',6);
insert into direccion values (29,'Calle Nuevo Toledo 54',6);
insert into direccion values (30,'Calle Curevos FC 22',6);
insert into direccion values (31,'Calle Peste Negra 83',6);
insert into direccion values (32,'Calle Rosario 22',7);
insert into direccion values (33,'Calle Vaticano 25',8);
insert into direccion values (34,'Calle Vaticano 29',8);
insert into direccion values (35,'Calle Vaticano 29',8);
insert into direccion values (36,'Calle Republica de Francia 81',9);
insert into direccion values (37,'Calle Sierra Fria 14',9);
insert into direccion values (38,'Calle Sierra Fria 19',9);
insert into direccion values (39,'Calle Tepeyac 48',10);
insert into direccion values (40,'Calle Tepeyac 56',10);
insert into direccion values (41,'Calle 20 de Noviembre 21',7);
insert into direccion values (42,'Calle Orion 60',2);
insert into direccion values (43,'Calle Praga 105',2);
insert into direccion values (44,'Calle Chiapas 97',5);
insert into direccion values (45,'Calle Troya 55',9);



-- inserción de alumnos

insert into alumno values (272849,'Fredo','Vichir','Romo',1);
insert into alumno values (272850,'Antonio','Montana','',2);
insert into alumno values (272851,'Jesus','Araujo','Villa',3);
insert into alumno values (272852,'Carmelita','Garcia','Aguilar',4);
insert into alumno values (272853,'Jose','Mozqueda','Gutierrez',5);
insert into alumno values (272854,'Albany','Padilla','Briones',6);
insert into alumno values (272855,'Mariana','Patron','Dominguez',7);
insert into alumno values (272856,'Nicolas','Huerta','Salcido',8);
insert into alumno values (272857,'Miguel','Corneto','Copolla',9);
insert into alumno values (272858,'Luca','Brasi','Romo',10);
insert into alumno values (272859,'Tomas','Hagen','Leon',11);
insert into alumno values (272860,'Donaldo','Gambino','Gomez',12);
insert into alumno values (272861,'Ana','Sollozzo','Perez',13);
insert into alumno values (272862,'Manuel','Ribera','',14);
insert into alumno values (272863,'Francisco','Arroyo','Ponce',15);
insert into alumno values (272864,'Josefina','Medina','',16);
insert into alumno values (272865,'Elisabeth','Medina','',17);
insert into alumno values (272866,'Aranza','Medina','',18);
insert into alumno values (272867,'Megara','Medina','',19);
insert into alumno values (272868,'Juan','Gomez','Valjean',20);
insert into alumno values (272869,'Cosette','Ruvalcaba','Matamoros',21);
insert into alumno values (272870,'Eponina','Vidal','Delgadillo',22);
insert into alumno values (272871,'Maria','Matinez','',23);
insert into alumno values (272872,'Mario','Cruz','',24);
insert into alumno values (272873,'Damian','Hernandez','',25);
insert into alumno values (272874,'Quijote','Mancha','',26);
insert into alumno values (272875,'Sancho','Panza','',27);
insert into alumno values (272876,'Dulcinea','Mercado','',28);
insert into alumno values (272877,'Salvador','Iglesias','',29);
insert into alumno values (272878,'Isabel','Iglesias','Villagran',30);
insert into alumno values (272879,'Aitor','Cardone','Villagran',31);
insert into alumno values (272880,'Jose','Jimenez','',32);
insert into alumno values (272881,'Dante','Alighieri','Quiroz',33);
insert into alumno values (272882,'Odiseo','Itaca','Barco',34);
insert into alumno values (272883,'Aquiles','Esparza','',35);
insert into alumno values (272884,'Arturo','Justo','Sierra',36);
insert into alumno values (272885,'Chalino','Sanchez','',37);
insert into alumno values (272886,'Marco','Solis','',38);
insert into alumno values (272887,'Juan','Sevilla','Bergoglio',39);
insert into alumno values (272888,'Carolina','Guzman','Alvarez',40);
insert into alumno values (272889,'Amanda','Reyes','Novales',41);
insert into alumno values (272890,'Jimena','Velasco','',42);
insert into alumno values (272891,'Alvaro','Sanchez','Castillo',43);
insert into alumno values (272892,'Leilani','Garay','',44);
insert into alumno values (272893,'Julio','Valle','Ramos',45);


-- lectura de los datos

select * from direccion;
select * from alumno;

