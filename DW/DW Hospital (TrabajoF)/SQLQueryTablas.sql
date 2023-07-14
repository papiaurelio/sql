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
VALUES ('Poliza Hospitalaria B�sica', 'Cobertura b�sica para servicios hospitalarios', 150.0, 75.0, 100000),
       ('Poliza Hospitalaria Extendida', 'Cobertura ampliada para servicios hospitalarios', 200.0, 100.0, 150000),
       ('Poliza Maternidad', 'Cobertura especializada para servicios de maternidad', 250.0, 125.0, 200000),
       ('Poliza Quir�rgica', 'Cobertura para procedimientos quir�rgicos', 300.0, 150.0, 250000),
       ('Poliza Dental', 'Cobertura para servicios odontol�gicos', 100.0, 50.0, 75000);
	   go
----------------------
--Select * from Vendedor

INSERT INTO Vendedor
VALUES ('Ana', 'Mar�a', 'L�pez', 'Garc�a', 'Avenida Central, Managua, Nicaragua (A 2 cuadras al sur)', '23456789');
INSERT INTO Vendedor
VALUES ('Pedro', 'Alejandro', 'Ram�rez', 'S�nchez', 'Calle del Sol, Le�n, Nicaragua (A 1 cuadra al este)', '34567890');
INSERT INTO Vendedor
VALUES ('Mar�a', 'Isabel', 'Mendoza', 'Rodr�guez', 'Calle Principal, Granada, Nicaragua (A 5 cuadras al oeste)', '45678901');
INSERT INTO Vendedor
VALUES ('Luis', 'Antonio', 'Castillo', 'Mart�nez', 'Avenida Libertad, Managua, Nicaragua (A 3 cuadras al norte)', '56789012');
INSERT INTO Vendedor
VALUES ('Sof�a', 'Fernanda', 'G�mez', 'Hern�ndez', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '67890123');
INSERT INTO Vendedor
VALUES ('Javier', 'Andr�s', 'Torres', 'Herrera', 'Calle Principal, Estel�, Nicaragua (A 2 cuadras al oeste)', '78901234');
INSERT INTO Vendedor
VALUES ('Carolina', 'Gabriela', 'Navarro', 'R�os', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '89012345');
INSERT INTO Vendedor
VALUES ('Roberto', 'Miguel', 'Guzm�n', 'Su�rez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '90123456');
INSERT INTO Vendedor
VALUES ('Laura', 'Victoria', 'Lara', 'Ortega', 'Avenida Principal, Matagalpa, Nicaragua (A 2 cuadras al norte)', '01234567');
Insert into Vendedor 
VALUES ('Mario','Antonio','Casta�eda','Zeled�n','Cl�nica don bosco (3 cuadras al norte)','57878998');
----------------------


----------------------
--Select * from FamiliarAsegurado
go
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Carlos', 'Alberto', 'Gonz�lez', 'Hern�ndez', 45, '1978-09-20', 'Calle del Sol, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Mar�a', 'Isabel', 'Mart�nez', 'G�mez', 32, '1991-06-14', 'Avenida Central, Le�n');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Jorge', 'Andr�s', 'L�pez', 'Garc�a', 28, '1995-03-02', 'Calle Principal, Granada');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Ana', 'Mar�a', 'S�nchez', 'Rojas', 35, '1988-11-12', 'Avenida Libertad, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Luis', 'Antonio', 'Guzm�n', 'Torres', 22, '2001-07-05', 'Calle Real, Masaya');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Carolina', 'Gabriela', 'Hern�ndez', 'Navarro', 32, '1989-02-28', 'Calle Principal, Estel�');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Sergio', 'Alejandro', 'Torres', 'P�rez', 40, '1983-05-10', 'Avenida Central, Jinotega');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Laura', 'Victoria', 'Ortega', 'Castillo', 29, '1994-08-18', 'Calle del Bosque, Chinandega');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Fernando', 'Miguel', 'Navarro', 'Su�rez', 38, '1985-01-25', 'Calle Real, Matagalpa');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Isabella', 'Valentina', 'Garc�a', 'Luna', 24, '1999-07-11', 'Avenida Libertad, Le�n');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Ricardo', 'Andr�s', 'Castillo', 'Mendoza', 42, '1979-12-03', 'Calle del Sol, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Gabriela', 'Isabel', 'Su�rez', 'Torres', 36, '1987-03-29', 'Avenida Central, Le�n');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Manuel', 'Alejandro', 'Flores', 'Ch�vez', 29, '1994-09-05', 'Calle Principal, Granada');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Valeria', 'Gabriela', 'G�mez', 'S�nchez', 45, '1978-11-22', 'Avenida Libertad, Managua');
INSERT INTO FamiliarAsegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Edad, FechaNacimiento, DireccionVivienda)
VALUES ('Andr�s', 'Miguel', 'Herrera', 'Rodr�guez', 21, '2002-06-14', 'Calle Real, Masaya');

----------------------
go
----------------------
--Select * from Asegurado
INSERT INTO Asegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Direccion, Telefono)
VALUES ('Luis', 'Antonio', 'Guzm�n', 'Torres', 'Calle del Sol 456, Managua', '65481237'),
       ('Mar�a', 'Alejandra', 'Hern�ndez', 'G�mez', 'Avenida Central 789, Le�n', '75392164'),
       ('Carlos', 'Andr�s', 'L�pez', 'Garc�a', 'Calle Real 123, Granada', '36987451'),
       ('Ana', 'Victoria', 'Ram�rez', 'S�nchez', 'Avenida Libertad 987, Managua', '98741236'),
       ('Pedro', 'Gabriel', 'Torres', 'Herrera', 'Calle Principal 654, Masaya', '21549637'),
       ('Laura', 'Isabella', 'Gonz�lez', 'Mart�nez', 'Avenida Central 852, Le�n', '96358741'),
       ('Fernando', 'Jos�', 'S�nchez', 'P�rez', 'Calle del Sol 369, Managua', '47859612'),
       ('Valeria', 'Gabriela', 'G�mez', 'Castillo', 'Calle Real 741, Granada', '85296347'),
       ('Roberto', 'Miguel', 'P�rez', 'Navarro', 'Avenida Libertad 123, Managua', '36974125'),
       ('Carolina', 'Isabel', 'Su�rez', 'Luna', 'Calle Principal 987, Masaya', '74185296'),
       ('Jorge', 'Alejandro', 'Castro', 'Ch�vez', 'Avenida Central 654, Le�n', '96321457'),
       ('Mar�a', 'Fernanda', 'Morales', 'Garc�a', 'Calle del Sol 369, Managua', '85236974'),
       ('Gabriel', 'Miguel', 'Hern�ndez', 'G�mez', 'Calle Real 741, Granada', '36985214'),
       ('Camila', 'Valentina', 'Guzm�n', 'S�nchez', 'Avenida Libertad 852, Managua', '74123698'),
       ('Andr�s', 'Sebasti�n', 'Torres', 'P�rez', 'Calle Principal 963, Masaya', '36987412');
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

		
		/*EJECUTAR TODO EL QUERY HASTA AQU� PARA CREAR LA BD CON SUS REGISTROS BASICOS*/

----------------------
Select * from FamiliarAsegurado --bug
select * from Vendedor --bug
select * from Asegurado
Select * from ExtensionContrato --Colateral bug
select * from TipoPoliza --bug
Select* from Contrato --Colateral bug

backup database Hospital to disk = 'S:\BD_Backups\Hospital.bak'





---- M�S DATOS
USE Hospital 
GO

--
INSERT INTO Vendedor VALUES ('Gabriela', 'Valeria', 'Mej�a', 'Morales', 'Calle del Parque, Rivas, Nicaragua (A 2 cuadras al sur)', '57889001');
INSERT INTO Vendedor VALUES ('Fernando', 'Jos�', 'Hern�ndez', 'Guti�rrez', 'Avenida Central, Managua, Nicaragua (A 1 cuadra al este)', '58990112');
INSERT INTO Vendedor VALUES ('Elena', 'Cecilia', 'Cruz', 'Soto', 'Calle del Sol, Le�n, Nicaragua (A 5 cuadras al oeste)', '59001223');
INSERT INTO Vendedor VALUES ('Miguel', '�ngel', 'P�rez', 'Ch�vez', 'Calle Principal, Granada, Nicaragua (A 3 cuadras al norte)', '50112334');
INSERT INTO Vendedor VALUES ('Camila', 'Isabella', 'Rivas', 'Vargas', 'Avenida Libertad, Managua, Nicaragua (A 4 cuadras al este)', '51223445');
INSERT INTO Vendedor VALUES ('Alejandro', 'Andr�s', 'Su�rez', 'G�mez', 'Calle Real, Masaya, Nicaragua (A 2 cuadras al oeste)', '52334556');
INSERT INTO Vendedor VALUES ('Valentina', 'Daniela', 'L�pez', 'Castillo', 'Calle Principal, Estel�, Nicaragua (A 3 cuadras al sur)', '53445667');
INSERT INTO Vendedor VALUES ('Andr�s', 'Francisco', 'Torres', 'Mendoza', 'Avenida Central, Jinotega, Nicaragua (A 1 cuadra al oeste)', '54556778');
INSERT INTO Vendedor VALUES ('Isabela', 'Luc�a', 'Garc�a', 'Navarro', 'Calle del Bosque, Chinandega, Nicaragua (A 2 cuadras al norte)', '55667889');
INSERT INTO Vendedor VALUES ('Mart�n', 'Sebasti�n', 'Ram�rez', 'S�nchez', 'Avenida Principal, Matagalpa, Nicaragua (A 3 cuadras al sur)', '56778990');
INSERT INTO Vendedor VALUES ('Ximena', 'Paula', 'Mendoza', 'Herrera', 'Cl�nica don bosco (4 cuadras al este)', '57889001');
INSERT INTO Vendedor VALUES ('Diego', 'Andr�s', 'G�mez', 'R�os', 'Calle del Sol, Le�n, Nicaragua (A 2 cuadras al sur)', '58990112');
INSERT INTO Vendedor VALUES ('Ana', 'Gabriela', 'Herrera', 'L�pez', 'Avenida Central, Managua, Nicaragua (A 1 cuadra al este)', '59001223');
INSERT INTO Vendedor VALUES ('Pedro', 'Jos�', 'Soto', 'Garc�a', 'Calle del Sol, Le�n, Nicaragua (A 5 cuadras al oeste)', '50112334');
INSERT INTO Vendedor VALUES ('Mar�a', 'Isabel', 'Ch�vez', 'Ram�rez', 'Calle Principal, Granada, Nicaragua (A 3 cuadras al norte)', '51223445');
INSERT INTO Vendedor VALUES ('Sof�a', 'Fernanda', 'Gonz�lez', 'Hern�ndez', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '52334556');
INSERT INTO Vendedor VALUES ('Javier', 'Andr�s', 'L�pez', 'Torres', 'Calle Principal, Estel�, Nicaragua (A 2 cuadras al oeste)', '53445667');
INSERT INTO Vendedor VALUES ('Carolina', 'Gabriela', 'R�os', 'Navarro', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '54556778');
INSERT INTO Vendedor VALUES ('Roberto', 'Miguel', 'Guzm�n', 'Su�rez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '55667889');
INSERT INTO Vendedor VALUES ('Laura', 'Victoria', 'Lara', 'Ortega', 'Avenida Principal, Matagalpa, Nicaragua (A 2 cuadras al norte)', '56778990');
INSERT INTO Vendedor VALUES ('Mario', 'Antonio', 'Casta�eda', 'Zeled�n', 'Cl�nica don bosco (3 cuadras al norte)', '57889001');
INSERT INTO Vendedor VALUES ('Gabriel', 'Alejandro', 'Ram�rez', 'Herrera', 'Calle del Parque, Rivas, Nicaragua (A 2 cuadras al sur)', '58990112');
INSERT INTO Vendedor VALUES ('Daniela', 'Isabella', 'G�mez', 'Soto', 'Avenida Central, Managua, Nicaragua (A 1 cuadra al este)', '59001223');
INSERT INTO Vendedor VALUES ('Miguel', 'Jos�', 'Torres', 'Ch�vez', 'Calle del Sol, Le�n, Nicaragua (A 5 cuadras al oeste)', '50112334');
INSERT INTO Vendedor VALUES ('Camila', 'Valentina', 'P�rez', 'Garc�a', 'Calle Principal, Granada, Nicaragua (A 3 cuadras al norte)', '51223445');
INSERT INTO Vendedor VALUES ('Luis', 'Andr�s', 'Hern�ndez', 'Mart�nez', 'Avenida Libertad, Managua, Nicaragua (A 4 cuadras al este)', '52334556');
INSERT INTO Vendedor VALUES ('Sof�a', 'Fernanda', 'Gonz�lez', 'Hern�ndez', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '53445667');
INSERT INTO Vendedor VALUES ('Javier', 'Andr�s', 'L�pez', 'Torres', 'Calle Principal, Estel�, Nicaragua (A 2 cuadras al oeste)', '54556778');
INSERT INTO Vendedor VALUES ('Carolina', 'Gabriela', 'R�os', 'Navarro', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '55667889');
INSERT INTO Vendedor VALUES ('Roberto', 'Miguel', 'Guzm�n', 'Su�rez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '56778990');
INSERT INTO Vendedor VALUES ('Pedro', 'Alejandro', 'Garc�a', 'Zeled�n', 'Avenida Central, Managua, Nicaragua (A 2 cuadras al sur)', '57889001');
INSERT INTO Vendedor VALUES ('Mar�a', 'Isabel', 'Ram�rez', 'S�nchez', 'Calle del Sol, Le�n, Nicaragua (A 1 cuadra al este)', '58990112');
INSERT INTO Vendedor VALUES ('Luis', 'Antonio', 'Mendoza', 'Rodr�guez', 'Calle Principal, Granada, Nicaragua (A 5 cuadras al oeste)', '59001223');
INSERT INTO Vendedor VALUES ('Sof�a', 'Fernanda', 'Castillo', 'Mart�nez', 'Avenida Libertad, Managua, Nicaragua (A 3 cuadras al norte)', '50112334');
INSERT INTO Vendedor VALUES ('Javier', 'Andr�s', 'G�mez', 'Hern�ndez', 'Calle Real, Masaya, Nicaragua (A 4 cuadras al este)', '51223445');
INSERT INTO Vendedor VALUES ('Carolina', 'Gabriela', 'Torres', 'Herrera', 'Calle Principal, Estel�, Nicaragua (A 2 cuadras al oeste)', '52334556');
INSERT INTO Vendedor VALUES ('Roberto', 'Miguel', 'Navarro', 'R�os', 'Avenida Central, Jinotega, Nicaragua (A 3 cuadras al sur)', '53445667');
INSERT INTO Vendedor VALUES ('Laura', 'Victoria', 'Guzm�n', 'Su�rez', 'Calle del Bosque, Chinandega, Nicaragua (A 1 cuadra al oeste)', '54556778');
INSERT INTO Vendedor VALUES ('Mario', 'Antonio', 'Lara', 'Ortega', 'Avenida Principal, Matagalpa, Nicaragua (A 2 cuadras al norte)', '55667889');



INSERT INTO Asegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Direccion, Telefono)
VALUES ('Luis', 'Antonio', 'Guzm�n', 'Torres', 'Calle del Sol 456, Managua', '85481237'),
('Mar�a', 'Alejandra', 'Hern�ndez', 'G�mez', 'Avenida Central 789, Le�n', '85392164'),
('Carlos', 'Andr�s', 'L�pez', 'Garc�a', 'Calle Real 123, Granada', '86887451'),
('Ana', 'Victoria', 'Ram�rez', 'S�nchez', 'Avenida Libertad 987, Managua', '89874123'),
('Pedro', 'Gabriel', 'Torres', 'Herrera', 'Calle Principal 654, Masaya', '81549637'),
('Laura', 'Isabella', 'Gonz�lez', 'Mart�nez', 'Avenida Central 852, Le�n', '89358741'),
('Fernando', 'Jos�', 'S�nchez', 'P�rez', 'Calle del Sol 369, Managua', '87859612'),
('Valeria', 'Gabriela', 'G�mez', 'Castillo', 'Calle Real 741, Granada', '85296348'),
('Roberto', 'Miguel', 'P�rez', 'Navarro', 'Avenida Libertad 123, Managua', '86974125'),
('Carolina', 'Isabel', 'Su�rez', 'Luna', 'Calle Principal 987, Masaya', '84185296'),
('Jorge', 'Alejandro', 'Castro', 'Ch�vez', 'Avenida Central 654, Le�n', '89321457'),
('Mar�a', 'Fernanda', 'Morales', 'Garc�a', 'Calle del Sol 369, Managua', '85236975'),
('Gabriel', 'Miguel', 'Hern�ndez', 'G�mez', 'Calle Real 741, Granada', '86885214'),
('Camila', 'Valentina', 'Guzm�n', 'S�nchez', 'Avenida Libertad 852, Managua', '84123698'),
('Andr�s', 'Sebasti�n', 'Torres', 'P�rez', 'Calle Principal 963, Masaya', '86887413'),
('Luisa', 'Alejandra', 'Ram�rez', 'Garc�a', 'Calle del Sol 852, Managua', '85392148'),
('Pedro', 'Andr�s', 'Hern�ndez', 'G�mez', 'Avenida Central 369, Le�n', '89358742'),
('Carlos', 'Gabriel', 'L�pez', 'Mart�nez', 'Calle Real 741, Granada', '87859613'),
('Ana', 'Victoria', 'Torres', 'S�nchez', 'Avenida Libertad 963, Managua', '84185297'),
('Sof�a', 'Valentina', 'G�mez', 'Castillo', 'Calle Principal 741, Masaya', '86974126')

INSERT INTO Asegurado (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Direccion, Telefono)
VALUES ('Mar�a', 'Fernanda', 'Hern�ndez', 'P�rez', 'Calle del Sol 963, Managua', '85874126'),
('Gabriel', 'Miguel', 'Gonz�lez', 'G�mez', 'Calle Real 369, Granada', '86885215'),
('Camila', 'Valentina', 'Guzm�n', 'Castillo', 'Avenida Libertad 852, Managua', '84123699'),
('Andr�s', 'Sebasti�n', 'Torres', 'P�rez', 'Calle Principal 963, Masaya', '86887414'),
('Luisa', 'Alejandra', 'Ram�rez', 'Garc�a', 'Calle del Sol 852, Managua', '85392149'),
('Pedro', 'Andr�s', 'Hern�ndez', 'G�mez', 'Avenida Central 369, Le�n', '89358743'),
('Carlos', 'Gabriel', 'L�pez', 'Mart�nez', 'Calle Real 741, Granada', '87859614'),
('Ana', 'Victoria', 'Torres', 'S�nchez', 'Avenida Libertad 963, Managua', '84185298'),
('Sof�a', 'Valentina', 'G�mez', 'Castillo', 'Calle Principal 741, Masaya', '86974127'),
('Javier', 'Alejandro', 'Castro', 'Luna', 'Avenida Central 369, Le�n', '88821457'),
('Mar�a', 'Fernanda', 'Morales', 'Garc�a', 'Calle del Sol 369, Managua', '86836974'),
('Gabriel', 'Miguel', 'Hern�ndez', 'G�mez', 'Calle Real 741, Granada', '88885214'),
('Camila', 'Valentina', 'Guzm�n', 'S�nchez', 'Avenida Libertad 852, Managua', '84123697'),
('Andr�s', 'Sebasti�n', 'Torres', 'P�rez', 'Calle Principal 963, Masaya', '88887412'),
('Luisa', 'Alejandra', 'Ram�rez', 'Garc�a', 'Calle del Sol 852, Managua', '85392146'),
('Pedro', 'Andr�s', 'Hern�ndez', 'G�mez', 'Avenida Central 369, Le�n', '89358747'),
('Carlos', 'Gabriel', 'L�pez', 'Mart�nez', 'Calle Real 741, Granada', '87859616'),
('Ana', 'Victoria', 'Torres', 'S�nchez', 'Avenida Libertad 963, Managua', '84185294'),
('Sof�a', 'Valentina', 'G�mez', 'Castillo', 'Calle Principal 741, Masaya', '86974129'),
('Javier', 'Alejandro', 'Castro', 'Luna', 'Avenida Central 369, Le�n', '88821459')


select * from Asegurado

DELETE FROM Vendedor
WHERE IdVendedor >= 16 AND IdVendedor <= 49;

