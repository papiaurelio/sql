create database Hospital
go
use Hospital
go
create table TipoPoliza(
IdPoliza int primary key identity(1,1),
tipoPoliza nvarchar(20),
Descripcion nvarchar(100),
CostoPoliza float,
CostoExtension float,
ValorCobertura int
)
go
alter table TipoPoliza alter column tipoPoliza nvarchar(50)
go 
create table Asegurado(
IdAsegurado int primary key identity(1,1),
PrimerNombre nvarchar(20),
SegundoNombre nvarchar(20),
PrimerApellido nvarchar(20),
SegundoApellido nvarchar(20),
Direccion nvarchar(40),
Telefono nvarchar(12)
)
go
alter table Asegurado alter column Direccion nvarchar(50)
go 
create table Vendedor(
IdVendedor int primary key identity(1,1),
PrimerNombre nvarchar(20),
SegundoNombre nvarchar(20),
PrimerApellido nvarchar(20),
SegundoApellido nvarchar(20),
Direccion nvarchar(100),
Telefono nvarchar(12)
)
go
create table Contrato(
IdContrato int primary key identity(1,1),
IdAsegurado int references Asegurado(IdAsegurado),
IdVendedor int references Vendedor(IdVendedor),
IdPoliza int references TipoPoliza(IdPoliza),
FechaInicial datetime default getdate(),
FechaFinal datetime default dateadd(year,1,getdate()),
CostoExtension float,
Total float
)
go
create table FamiliarAsegurado(
IdFamiliarAsegurado int primary key identity(1,1),
PrimerNombre nvarchar(20),
SegundoNombre nvarchar(20),
PrimerApellido nvarchar(20),
SegundoApellido nvarchar(20),
Edad int,
FechaNacimiento datetime,
DireccionVivienda nvarchar(20)
)
go
alter table FamiliarAsegurado alter column DireccionVivienda nvarchar(50)

go
create table ExtensionContrato(
IdContrato int references Contrato(IdContrato),
IdFamiliarAsegurado int references FamiliarAsegurado(IdFamiliarAsegurado)
)
go
----------------------

----------------------
--Select * from TipoPoliza

INSERT INTO TipoPoliza (tipoPoliza, Descripcion, CostoPoliza, CostoExtension, ValorCobertura)
VALUES ('Poliza Hospitalaria Básica', 'Cobertura básica para servicios hospitalarios', 150.0, 75.0, 100000),
       ('Poliza Hospitalaria Extendida', 'Cobertura ampliada para servicios hospitalarios', 200.0, 100.0, 150000),
       ('Poliza Maternidad', 'Cobertura especializada para servicios de maternidad', 250.0, 125.0, 200000),
       ('Poliza Quirúrgica', 'Cobertura para procedimientos quirúrgicos', 300.0, 150.0, 250000),
       ('Poliza Dental', 'Cobertura para servicios odontológicos', 100.0, 50.0, 75000);
	   go
----------------------
--Select * from Vendedor

INSERT INTO Vendedor
VALUES ('Ana', 'María', 'López', 'García', 'Avenida Central, Managua, Nicaragua (A 2 cuadras al sur)', '23456789');
INSERT INTO Vendedor
VALUES ('Pedro', 'Alejandro', 'Ramírez', 'Sánchez', 'Calle del Sol, León, Nicaragua (A 1 cuadra al este)', '34567890');
INSERT INTO Vendedor
VALUES ('María', 'Isabel', 'Mendoza', 'Rodríguez', 'Calle Principal, Granada, Nicaragua (A 5 cuadras al oeste)', '45678901');
INSERT INTO Vendedor
VALUES ('Luis', 'Antonio', 'Castillo', 'Martínez', 'Avenida Libertad, Managua, Nicaragua (A 3 cuadras al norte)', '56789012');
INSERT INTO Vendedor
VALUES ('Sofía', 'Fernanda', 'Gómez', 'Hernández', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '67890123');
INSERT INTO Vendedor
VALUES ('Javier', 'Andrés', 'Torres', 'Herrera', 'Calle Principal, Estelí, Nicaragua (A 2 cuadras al oeste)', '78901234');
INSERT INTO Vendedor
VALUES ('Carolina', 'Gabriela', 'Navarro', 'Ríos', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '89012345');
INSERT INTO Vendedor
VALUES ('Roberto', 'Miguel', 'Guzmán', 'Suárez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '90123456');
INSERT INTO Vendedor
VALUES ('Laura', 'Victoria', 'Lara', 'Ortega', 'Avenida Principal, Matagalpa, Nicaragua (A 2 cuadras al norte)', '01234567');
Insert into Vendedor 
VALUES ('Mario','Antonio','Castañeda','Zeledón','Clínica don bosco (3 cuadras al norte)','57878998');
----------------------


----------------------
--Select * from FamiliarAsegurado
go
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Carlos', 'Alberto', 'González', 'Hernández', 45, '1978-09-20', 'Calle del Sol, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('María', 'Isabel', 'Martínez', 'Gómez', 32, '1991-06-14', 'Avenida Central, León');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Jorge', 'Andrés', 'López', 'García', 28, '1995-03-02', 'Calle Principal, Granada');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Ana', 'María', 'Sánchez', 'Rojas', 35, '1988-11-12', 'Avenida Libertad, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Luis', 'Antonio', 'Guzmán', 'Torres', 22, '2001-07-05', 'Calle Real, Masaya');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Carolina', 'Gabriela', 'Hernández', 'Navarro', 32, '1989-02-28', 'Calle Principal, Estelí');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Sergio', 'Alejandro', 'Torres', 'Pérez', 40, '1983-05-10', 'Avenida Central, Jinotega');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Laura', 'Victoria', 'Ortega', 'Castillo', 29, '1994-08-18', 'Calle del Bosque, Chinandega');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Fernando', 'Miguel', 'Navarro', 'Suárez', 38, '1985-01-25', 'Calle Real, Matagalpa');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Isabella', 'Valentina', 'García', 'Luna', 24, '1999-07-11', 'Avenida Libertad, León');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Ricardo', 'Andrés', 'Castillo', 'Mendoza', 42, '1979-12-03', 'Calle del Sol, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Gabriela', 'Isabel', 'Suárez', 'Torres', 36, '1987-03-29', 'Avenida Central, León');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Manuel', 'Alejandro', 'Flores', 'Chávez', 29, '1994-09-05', 'Calle Principal, Granada');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Valeria', 'Gabriela', 'Gómez', 'Sánchez', 45, '1978-11-22', 'Avenida Libertad, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Andrés', 'Miguel', 'Herrera', 'Rodríguez', 21, '2002-06-14', 'Calle Real, Masaya');

----------------------
go
----------------------
--Select * from Asegurado
INSERT INTO Asegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Direccion, Telefono)
VALUES ('Luis', 'Antonio', 'Guzmán', 'Torres', 'Calle del Sol 456, Managua', '65481237'),
       ('María', 'Alejandra', 'Hernández', 'Gómez', 'Avenida Central 789, León', '75392164'),
       ('Carlos', 'Andrés', 'López', 'García', 'Calle Real 123, Granada', '36987451'),
       ('Ana', 'Victoria', 'Ramírez', 'Sánchez', 'Avenida Libertad 987, Managua', '98741236'),
       ('Pedro', 'Gabriel', 'Torres', 'Herrera', 'Calle Principal 654, Masaya', '21549637'),
       ('Laura', 'Isabella', 'González', 'Martínez', 'Avenida Central 852, León', '96358741'),
       ('Fernando', 'José', 'Sánchez', 'Pérez', 'Calle del Sol 369, Managua', '47859612'),
       ('Valeria', 'Gabriela', 'Gómez', 'Castillo', 'Calle Real 741, Granada', '85296347'),
       ('Roberto', 'Miguel', 'Pérez', 'Navarro', 'Avenida Libertad 123, Managua', '36974125'),
       ('Carolina', 'Isabel', 'Suárez', 'Luna', 'Calle Principal 987, Masaya', '74185296'),
       ('Jorge', 'Alejandro', 'Castro', 'Chávez', 'Avenida Central 654, León', '96321457'),
       ('María', 'Fernanda', 'Morales', 'García', 'Calle del Sol 369, Managua', '85236974'),
       ('Gabriel', 'Miguel', 'Hernández', 'Gómez', 'Calle Real 741, Granada', '36985214'),
       ('Camila', 'Valentina', 'Guzmán', 'Sánchez', 'Avenida Libertad 852, Managua', '74123698'),
       ('Andrés', 'Sebastián', 'Torres', 'Pérez', 'Calle Principal 963, Masaya', '36987412');
	   go
----------------------
--Select * from Contrato
insert into Contrato (IdAsegurado,IdVendedor,IdPoliza,FechaInicial,FechaFinal,CostoExtension,Total) 
Values (1,1,1,'2023-04-14','2023-05-14',0,150),
(3,2,2,'2023-01-17','2023-06-17',400,600),
(4,3,3,'2023-03-16','2023-04-16',0,250),
(6,4,4,'2023-05-14','2023-07-14',150,450),
(5,5,5,'2023-04-20','2023-08-20',150,250),
(7,6,1,'2023-02-01','2023-12-14',675,825),
(9,7,2,'2023-09-11','2023-10-11',0,200),
(8,8,3,'2023-03-23','2023-04-23',0,250),
(10,9,4,'2023-01-19','2023-02-19',0,300),
(11,10,5,'2023-10-11','2023-11-11',0,100)
----------------------
go
--Select * from ExtensionContrato
insert into ExtensionContrato (IdContrato,IdFamiliarAsegurado) /* 1-10 || 16-30*/
values  (1,1),
		(2,3),
		(3,2),
		(4,5),
		(5,4),
		(6,15),
		(7,10),
		(8,11),
		(9,6),
		(10,14)

		
		/*EJECUTAR TODO EL QUERY HASTA AQUÍ PARA CREAR LA BD CON SUS REGISTROS BASICOS*/

----------------------
Select * from FamiliarAsegurado --bug
select * from Vendedor --bug
select * from Asegurado
Select * from ExtensionContrato --Colateral bug
select * from TipoPoliza --bug
Select* from Contrato --Colateral bug

backup database Hospital to disk = 'S:\BD_Backups\Hospital.bak'





---- MÁS DATOS
USE Hospital 
GO

--
INSERT INTO Vendedor VALUES ('Gabriela', 'Valeria', 'Mejía', 'Morales', 'Calle del Parque, Rivas, Nicaragua (A 2 cuadras al sur)', '57889001');
INSERT INTO Vendedor VALUES ('Fernando', 'José', 'Hernández', 'Gutiérrez', 'Avenida Central, Managua, Nicaragua (A 1 cuadra al este)', '58990112');
INSERT INTO Vendedor VALUES ('Elena', 'Cecilia', 'Cruz', 'Soto', 'Calle del Sol, León, Nicaragua (A 5 cuadras al oeste)', '59001223');
INSERT INTO Vendedor VALUES ('Miguel', 'Ángel', 'Pérez', 'Chávez', 'Calle Principal, Granada, Nicaragua (A 3 cuadras al norte)', '50112334');
INSERT INTO Vendedor VALUES ('Camila', 'Isabella', 'Rivas', 'Vargas', 'Avenida Libertad, Managua, Nicaragua (A 4 cuadras al este)', '51223445');
INSERT INTO Vendedor VALUES ('Alejandro', 'Andrés', 'Suárez', 'Gómez', 'Calle Real, Masaya, Nicaragua (A 2 cuadras al oeste)', '52334556');
INSERT INTO Vendedor VALUES ('Valentina', 'Daniela', 'López', 'Castillo', 'Calle Principal, Estelí, Nicaragua (A 3 cuadras al sur)', '53445667');
INSERT INTO Vendedor VALUES ('Andrés', 'Francisco', 'Torres', 'Mendoza', 'Avenida Central, Jinotega, Nicaragua (A 1 cuadra al oeste)', '54556778');
INSERT INTO Vendedor VALUES ('Isabela', 'Lucía', 'García', 'Navarro', 'Calle del Bosque, Chinandega, Nicaragua (A 2 cuadras al norte)', '55667889');
INSERT INTO Vendedor VALUES ('Martín', 'Sebastián', 'Ramírez', 'Sánchez', 'Avenida Principal, Matagalpa, Nicaragua (A 3 cuadras al sur)', '56778990');
INSERT INTO Vendedor VALUES ('Ximena', 'Paula', 'Mendoza', 'Herrera', 'Clínica don bosco (4 cuadras al este)', '57889001');
INSERT INTO Vendedor VALUES ('Diego', 'Andrés', 'Gómez', 'Ríos', 'Calle del Sol, León, Nicaragua (A 2 cuadras al sur)', '58990112');
INSERT INTO Vendedor VALUES ('Ana', 'Gabriela', 'Herrera', 'López', 'Avenida Central, Managua, Nicaragua (A 1 cuadra al este)', '59001223');
INSERT INTO Vendedor VALUES ('Pedro', 'José', 'Soto', 'García', 'Calle del Sol, León, Nicaragua (A 5 cuadras al oeste)', '50112334');
INSERT INTO Vendedor VALUES ('María', 'Isabel', 'Chávez', 'Ramírez', 'Calle Principal, Granada, Nicaragua (A 3 cuadras al norte)', '51223445');
INSERT INTO Vendedor VALUES ('Sofía', 'Fernanda', 'González', 'Hernández', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '52334556');
INSERT INTO Vendedor VALUES ('Javier', 'Andrés', 'López', 'Torres', 'Calle Principal, Estelí, Nicaragua (A 2 cuadras al oeste)', '53445667');
INSERT INTO Vendedor VALUES ('Carolina', 'Gabriela', 'Ríos', 'Navarro', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '54556778');
INSERT INTO Vendedor VALUES ('Roberto', 'Miguel', 'Guzmán', 'Suárez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '55667889');
INSERT INTO Vendedor VALUES ('Laura', 'Victoria', 'Lara', 'Ortega', 'Avenida Principal, Matagalpa, Nicaragua (A 2 cuadras al norte)', '56778990');
INSERT INTO Vendedor VALUES ('Mario', 'Antonio', 'Castañeda', 'Zeledón', 'Clínica don bosco (3 cuadras al norte)', '57889001');
INSERT INTO Vendedor VALUES ('Gabriel', 'Alejandro', 'Ramírez', 'Herrera', 'Calle del Parque, Rivas, Nicaragua (A 2 cuadras al sur)', '58990112');
INSERT INTO Vendedor VALUES ('Daniela', 'Isabella', 'Gómez', 'Soto', 'Avenida Central, Managua, Nicaragua (A 1 cuadra al este)', '59001223');
INSERT INTO Vendedor VALUES ('Miguel', 'José', 'Torres', 'Chávez', 'Calle del Sol, León, Nicaragua (A 5 cuadras al oeste)', '50112334');
INSERT INTO Vendedor VALUES ('Camila', 'Valentina', 'Pérez', 'García', 'Calle Principal, Granada, Nicaragua (A 3 cuadras al norte)', '51223445');
INSERT INTO Vendedor VALUES ('Luis', 'Andrés', 'Hernández', 'Martínez', 'Avenida Libertad, Managua, Nicaragua (A 4 cuadras al este)', '52334556');
INSERT INTO Vendedor VALUES ('Sofía', 'Fernanda', 'González', 'Hernández', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '53445667');
INSERT INTO Vendedor VALUES ('Javier', 'Andrés', 'López', 'Torres', 'Calle Principal, Estelí, Nicaragua (A 2 cuadras al oeste)', '54556778');
INSERT INTO Vendedor VALUES ('Carolina', 'Gabriela', 'Ríos', 'Navarro', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '55667889');
INSERT INTO Vendedor VALUES ('Roberto', 'Miguel', 'Guzmán', 'Suárez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '56778990');
INSERT INTO Vendedor VALUES ('Pedro', 'Alejandro', 'García', 'Zeledón', 'Avenida Central, Managua, Nicaragua (A 2 cuadras al sur)', '57889001');
INSERT INTO Vendedor VALUES ('María', 'Isabel', 'Ramírez', 'Sánchez', 'Calle del Sol, León, Nicaragua (A 1 cuadra al este)', '58990112');
INSERT INTO Vendedor VALUES ('Luis', 'Antonio', 'Mendoza', 'Rodríguez', 'Calle Principal, Granada, Nicaragua (A 5 cuadras al oeste)', '59001223');
INSERT INTO Vendedor VALUES ('Sofía', 'Fernanda', 'Castillo', 'Martínez', 'Avenida Libertad, Managua, Nicaragua (A 3 cuadras al norte)', '50112334');
INSERT INTO Vendedor VALUES ('Javier', 'Andrés', 'Gómez', 'Hernández', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '51223445');
INSERT INTO Vendedor VALUES ('Carolina', 'Gabriela', 'Torres', 'Herrera', 'Calle Principal, Estelí, Nicaragua (A 2 cuadras al oeste)', '52334556');
INSERT INTO Vendedor VALUES ('Roberto', 'Miguel', 'Navarro', 'Ríos', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '53445667');
INSERT INTO Vendedor VALUES ('Laura', 'Victoria', 'Guzmán', 'Suárez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '54556778');
INSERT INTO Vendedor VALUES ('Mario', 'Antonio', 'Lara', 'Ortega', 'Avenida Principal, Matagalpa, Nicaragua (A 2 cuadras al norte)', '55667889');



INSERT INTO Asegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Direccion, Telefono)
VALUES ('Luis', 'Antonio', 'Guzmán', 'Torres', 'Calle del Sol 456, Managua', '85481237'),
('María', 'Alejandra', 'Hernández', 'Gómez', 'Avenida Central 789, León', '85392164'),
('Carlos', 'Andrés', 'López', 'García', 'Calle Real 123, Granada', '86887451'),
('Ana', 'Victoria', 'Ramírez', 'Sánchez', 'Avenida Libertad 987, Managua', '89874123'),
('Pedro', 'Gabriel', 'Torres', 'Herrera', 'Calle Principal 654, Masaya', '81549637'),
('Laura', 'Isabella', 'González', 'Martínez', 'Avenida Central 852, León', '89358741'),
('Fernando', 'José', 'Sánchez', 'Pérez', 'Calle del Sol 369, Managua', '87859612'),
('Valeria', 'Gabriela', 'Gómez', 'Castillo', 'Calle Real 741, Granada', '85296348'),
('Roberto', 'Miguel', 'Pérez', 'Navarro', 'Avenida Libertad 123, Managua', '86974125'),
('Carolina', 'Isabel', 'Suárez', 'Luna', 'Calle Principal 987, Masaya', '84185296'),
('Jorge', 'Alejandro', 'Castro', 'Chávez', 'Avenida Central 654, León', '89321457'),
('María', 'Fernanda', 'Morales', 'García', 'Calle del Sol 369, Managua', '85236975'),
('Gabriel', 'Miguel', 'Hernández', 'Gómez', 'Calle Real 741, Granada', '86885214'),
('Camila', 'Valentina', 'Guzmán', 'Sánchez', 'Avenida Libertad 852, Managua', '84123698'),
('Andrés', 'Sebastián', 'Torres', 'Pérez', 'Calle Principal 963, Masaya', '86887413'),
('Luisa', 'Alejandra', 'Ramírez', 'García', 'Calle del Sol 852, Managua', '85392148'),
('Pedro', 'Andrés', 'Hernández', 'Gómez', 'Avenida Central 369, León', '89358742'),
('Carlos', 'Gabriel', 'López', 'Martínez', 'Calle Real 741, Granada', '87859613'),
('Ana', 'Victoria', 'Torres', 'Sánchez', 'Avenida Libertad 963, Managua', '84185297'),
('Sofía', 'Valentina', 'Gómez', 'Castillo', 'Calle Principal 741, Masaya', '86974126')

INSERT INTO Asegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Direccion, Telefono)
VALUES ('María', 'Fernanda', 'Hernández', 'Pérez', 'Calle del Sol 963, Managua', '85874126'),
('Gabriel', 'Miguel', 'González', 'Gómez', 'Calle Real 369, Granada', '86885215'),
('Camila', 'Valentina', 'Guzmán', 'Castillo', 'Avenida Libertad 852, Managua', '84123699'),
('Andrés', 'Sebastián', 'Torres', 'Pérez', 'Calle Principal 963, Masaya', '86887414'),
('Luisa', 'Alejandra', 'Ramírez', 'García', 'Calle del Sol 852, Managua', '85392149'),
('Pedro', 'Andrés', 'Hernández', 'Gómez', 'Avenida Central 369, León', '89358743'),
('Carlos', 'Gabriel', 'López', 'Martínez', 'Calle Real 741, Granada', '87859614'),
('Ana', 'Victoria', 'Torres', 'Sánchez', 'Avenida Libertad 963, Managua', '84185298'),
('Sofía', 'Valentina', 'Gómez', 'Castillo', 'Calle Principal 741, Masaya', '86974127'),
('Javier', 'Alejandro', 'Castro', 'Luna', 'Avenida Central 369, León', '88821457'),
('María', 'Fernanda', 'Morales', 'García', 'Calle del Sol 369, Managua', '86836974'),
('Gabriel', 'Miguel', 'Hernández', 'Gómez', 'Calle Real 741, Granada', '88885214'),
('Camila', 'Valentina', 'Guzmán', 'Sánchez', 'Avenida Libertad 852, Managua', '84123697'),
('Andrés', 'Sebastián', 'Torres', 'Pérez', 'Calle Principal 963, Masaya', '88887412'),
('Luisa', 'Alejandra', 'Ramírez', 'García', 'Calle del Sol 852, Managua', '85392146'),
('Pedro', 'Andrés', 'Hernández', 'Gómez', 'Avenida Central 369, León', '89358747'),
('Carlos', 'Gabriel', 'López', 'Martínez', 'Calle Real 741, Granada', '87859616'),
('Ana', 'Victoria', 'Torres', 'Sánchez', 'Avenida Libertad 963, Managua', '84185294'),
('Sofía', 'Valentina', 'Gómez', 'Castillo', 'Calle Principal 741, Masaya', '86974129'),
('Javier', 'Alejandro', 'Castro', 'Luna', 'Avenida Central 369, León', '88821459')


select * from Asegurado

DELETE FROM Vendedor
WHERE IdVendedor >= 16 AND IdVendedor <= 49;

