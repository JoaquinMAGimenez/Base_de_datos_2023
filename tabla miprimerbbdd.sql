/*1*/
CREATE TABLE "empleado" (
	dni numeric NOT NULL Primary Key,
	apellido varchar(40) NOT NULL,
	nombre varchar(40) NOT NULL,
	genero char NOT NULL,
	sueldo int NOT NULL
);
/*2*/
insert into empleado (dni,apellido,nombre,genero,sueldo)values
(25100000,'PEREZ','PABLO','M',18000),(29332501,'SLOTOWIAZDA','MARIA','F',35000),
(19302500,'TENEMBAUN','ENRNESTO','M',22500),(33001321,'RINEIRI','EVANGELINA','F',17000),
(22958543,'DIAZ','XIMENA','F',48000),(35254310,'PEREZ LINDO','MATIAS','M',29000),
(33387695,'RICCA','JAVIER','M',29700),(25321542,'SIGNORINI','ESTELA','F',45000),
(27123456,'REZONICO','CONSTANZA','F',31000),(13334401,'RETAMAR','JOAQUIN','F',35000);
/*3*/
create table "departamento"(
codigo numeric primary key, 
nombre varchar (20)
);
/*4*/
insert into "departamento" (codigo,nombre) values (1,'PRODUCCION'),
(2,'COMPUTOS'),(3,'VENTAS'),(4,'DEPOSITO');
/*5*/
delete from departamento where (nombre='VENTAS');
/*6*/
CREATE TABLE "trabajapara" (
    dni numeric,
    codigo INT,
    horas INT,
	constraint PK_trabajapara primary key(dni, codigo),
	constraint FK_dni foreign key (dni) references empleado (dni),
	constraint FK_codigo foreign key (codigo) references departamento (codigo)
);
/*7*/
insert into "trabajapara" (dni,codigo,horas)values 
(25100000,1,15),(29332501,2,30),
(19302500,4,45),(33001321,4,20),
(22958543,1,25),(35254310,2,30),
(33387695,1,50),(25321542,1,15),
(27123456,1,12),(13334401,4,28);
/*se omitio (25321542,4,25) porque DNI esta repetido*/
/*8*/
update empleado set genero ='M' where dni=13334401;
/*9*/
/*9a*/
SELECT * FROM empleado;
/*9b*/
SELECT * FROM empleado WHERE genero = 'M';
/*9c*/
SELECT MAX(sueldo) AS mayor_sueldo, MIN(sueldo) AS menor_sueldo, AVG(sueldo) AS sueldo_promedio FROM empleado;
/*9d*/
SELECT COUNT(*) AS cantidad FROM empleado WHERE sueldo > 20000;
/*9e*/
SELECT AVG(e.sueldo) AS promedio_sueldos FROM empleado e
JOIN trabajapara tp ON e.dni = tp.dni
JOIN departamento d ON tp.codigo = d.codigo
WHERE d.nombre = 'COMPUTOS';
/*9f*/
SELECT SUM(horas) AS total_horas FROM trabajapara tp
JOIN departamento d ON tp.codigo = d.codigo
WHERE d.nombre = 'PRODUCCION';
/*9g*/
SELECT e.nombre FROM empleado e
JOIN trabajapara tp ON e.dni = tp.dni
JOIN departamento d ON tp.codigo = d.codigo
WHERE d.nombre = 'DEPOSITO' AND tp.horas >= 25;
/*todos los datos a mostrar*/
SELECT e.dni, e.apellido, e.nombre, e.genero, e.sueldo,
       d.codigo AS codigo_departamento, d.nombre AS nombre_departamento, tp.horas
FROM empleado e
JOIN trabajapara tp ON e.dni = tp.dni
JOIN departamento d ON tp.codigo = d.codigo;
