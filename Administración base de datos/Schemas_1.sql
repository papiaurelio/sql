CREATE LOGIN ProgramadorBD WITH PASSWORD = '123'


USE Northwind
GO

sp_adduser ProgramadorBD, Programador

--Asignación de PERMISOS

GRANT CREATE TABLE TO Programador
GRANT CREATE VIEW TO Programador
GRANT CREATE PROCEDURE TO Programador


--Al crear una tabla con ese usuario, automáticamente crea un SCHEMA con su nombre. Y la tabla estará dentro de ese SCHEMA.


--CREACION DE SCHEMA CON PROPIETARIO

CREATE SCHEMA Ventas AUTHORIZATION Programador

--CREACION DE SCHEMA SIN PROPIETARIO (eL PAPEL "PROPIETARIO" lo tendran el rol de servidor SYSADMIN y rol de base de datos db_owner)

CREATE SCHEMA Ventas

--CAMBIO DE PROPIETARIO

ALTER AUTHORIZATION ON SCHEMA :: Ventas TO user

--PERMISOS DE ACCESO AL ESQUEMA A USUARIOS NO PROPIETARIOS

GRANT SELECT ON SCHEMA :: Ventas TO user