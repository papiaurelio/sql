--Creando una BASE DE DATOS aleatoria usando comandos necesarios.
CREATE DATABASE TALLER
GO

USE Taller
GO


-- Creaci�n de Catalogos/Entidades/Sujetos de la BD

CREATE TABLE Cliente
(
IdCliente INT PRIMARY KEY IDENTITY(0,1),  --Comienza desde cliente 0,1,2 ...
Primer_Nombre VARCHAR(80) NOT NULL,
Primer_Apellido VARCHAR(80) NOT NULL,
Cedula VARCHAR(16),
Correo VARCHAR(50)
)

CREATE TABLE Mecanico
(
IdMecanico INT PRIMARY KEY IDENTITY(0,1),
Primer_Nombre VARCHAR(80),
Primer_Apellido VARCHAR(80),
Cedula VARCHAR(16),
Correo VARCHAR(80)
)

CREATE TABLE Servicio
(
IdServicio INT PRIMARY KEY IDENTITY(0,1),
Descripcion NVARCHAR(100),
Precio MONEY,
Tipo_Mantenimiento VARCHAR(80)
)

CREATE TABLE Vehiculo
(
IdVehiculo INT PRIMARY KEY IDENTITY(0,1),
IdCliente INT,
Marca VARCHAR(50),
Modelo VARCHAR(50),
Anio INT
)

CREATE TABLE Repuesto
(
IdRepuesto INT PRIMARY KEY IDENTITY(0,1),
Titulo VARCHAR(80),
Descripcion VARCHAR(100),
Marca VARCHAR(50),
Modelo VARCHAR(50),
Precio MONEY
)

--Creaci�n de tablas de OPERACIONES de la BD

CREATE TABLE Mantenimiento
(
IdMantenimiento INT PRIMARY KEY IDENTITY(0,1),
IdVehiculo INT,
Fecha_Ingreso DATE,
Fecha_Salida DATE
)

CREATE TABLE Servicio_Mantenimiento
(
IdServicio_Mantenimiento INT PRIMARY KEY IDENTITY(0,1),
IdMantenimiento INT,
IdServicio INT,
IdMecanico INT,
Costo MONEY
)

CREATE TABLE Servicio_Repuesto
(
IdServicio_Mantenimiento INT NOT NULL,
IdRepuesto INT NOT NULL,
Costo MONEY,
Cantidad INT
)

--Creaci�n de Integridad Referencial/Relaciones

ALTER TABLE Vehiculo
ADD FOREIGN KEY (IdCliente)
REFERENCES Cliente (IdCliente)


ALTER TABLE Mantenimiento 
ADD FOREIGN KEY (IdVehiculo)
REFERENCES Vehiculo (IdVehiculo)


ALTER TABLE Servicio_Mantenimiento 
ADD FOREIGN KEY (IdMantenimiento)
REFERENCES Mantenimiento (IdMantenimiento)

ALTER TABLE Servicio_Mantenimiento
ADD FOREIGN KEY (IdServicio)
REFERENCES Servicio (IdServicio)

ALTER TABLE Servicio_Mantenimiento
ADD FOREIGN KEY (IdMecanico)
REFERENCES Mecanico (IdMecanico)

ALTER TABLE Servicio_Repuesto
ADD FOREIGN KEY (IdServicio_Mantenimiento)
REFERENCES Servicio_Mantenimiento (IdServicio_Mantenimiento)

ALTER TABLE Servicio_Repuesto
ADD FOREIGN KEY (IdRepuesto)
REFERENCES Repuesto(IdRepuesto)

-----------AGREGANDO PRIMARY KEY A UNA TABLA QUE NO TIENE (EJEMPLO PRIMARY KEY COMPUESTA)

ALTER TABLE Servicio_Repuesto
ADD PRIMARY KEY (IdServicio_Mantenimiento, IdRepuesto)



-----------------------
-----------------------
----------------------------Otra Forma de agregar una llave foránea
CREATE TABLE Vehiculo
(
    IdVehiculo INT PRIMARY KEY IDENTITY(0,1),
    IdCliente INT,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Anio INT,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);



--Para ALTERAR una columna en X tabla

ALTER TABLE CLIENTE 
ALTER COLUMN Correo VARCHAR(70)


--RESETEAR EL IDENTITY DE UNA TABLA 

DBCC CHECKIDENT('Cliente', RESEED, -1); --Comienza desde 0
DBCC CHECKIDENT('Cliente', RESEED, 0); --Comienza desde 1

