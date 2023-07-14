--DDL -> CREATE, ALTER, DROP, TRUNCATE
--DML -> UPDATE, DELETE, INSERT, SELECT  
--DCL -> GRANT, REVOKE..

CREATE DATABASE PruebaSQL

USE PruebaSQL
GO

CREATE TABLE Personas(
    id int PRIMARY KEY IDENTITY(1,1),
    Nombre varchar(50)
)

CREATE TABLE Proyectos(
    id int PRIMARY KEY IDENTITY(1,1),
    NombreProyecto varchar(50)
)

--Agregar otros campos
ALTER TABLE Personas ADD Apellido varchar(50)

--
INSERT INTO Proyectos VALUES('Proyecto 1')
SELECT *  FROM Proyectos

--ELIMINAR TABLA
DROP TABLE Proyectos

--ELIMINAR DATOS TABLA 
TRUNCATE TABLE Proyectos --Elimina la tabla de forma total. No deja logs ni dispara triggers

DELETE FROM Proyectos --Elimina linea por linea dejando logs y no resetea los identificadores (no es muy eficiente)


