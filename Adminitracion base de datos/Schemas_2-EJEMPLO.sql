-- Crear un inicio de sesión
CREATE LOGIN Lector WITH PASSWORD = '123';

USE HotelDatabase
GO
-- Crear un usuario vinculado al inicio de sesión
CREATE USER LectorVistas FOR LOGIN Lector;


-- Crear un esquema para las vistas
CREATE SCHEMA VW;

-- Asignar permisos de solo lectura para el esquema de vistas
GRANT SELECT ON SCHEMA::VW TO LectorVistas;

-- Denegar permisos para el resto de los objetos en el esquema predeterminado "dbo"
DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO LectorVistas;

-- Asignar el rol predefinido de solo lectura
ALTER ROLE db_datareader ADD MEMBER LectorVistas;


use master 
go
--Ahora agregamos Las vistas al SCHEMA

ALTER SCHEMA VW TRANSFER dbo.DimFecha;
ALTER SCHEMA VW TRANSFER dbo.DimHabitacion;
ALTER SCHEMA VW TRANSFER dbo.DimReserva;
ALTER SCHEMA VW TRANSFER dbo.HechosReserva;
ALTER SCHEMA VW TRANSFER dbo.TotalRecaudacionesPagadas;

--Otorgar permisos en el esquema de las vistas a otros usuarios

GRANT SELECT ON SCHEMA::[NombreEsquema] TO [NombreUsuario];

