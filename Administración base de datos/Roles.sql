USE master 
GO
--Sysadmin
sp_addsrvrolemember AdminBD, sysadmin --permiso MAYOR, equivale a tener poder total en la instancia

sp_dropsrvrolemember AdminBD, sysadmin --removiendo permisos


sp_addsrvrolemember AdminBD, dbcreator

-----------------
---Roles Bases de datos

USE Northwind
GO

--Informacion del LOGIN 
sp_helplogins AdminBD

sp_addrolemember db_backupoperator, Administrador
sp_droprolemember db_backupoperator, Administrador --Revocar Rol

sp_addrolemember db_datawriter, Administrador
sp_addrolemember db_datareader, Administrador

--Para denegar el acceso a un usuario que tiene el rol de lectura no basta con el REVOKE (este solo es válido cuando se edita el permiso)
--Forma correcta de quitar permisos: DENY 

DENY SELECT ON Products TO Administrador
DENY SELECT ON Customers TO Administrador
----

sp_droprolemember db_datawriter, Administrador
sp_droprolemember db_datareader, Administrador

--Eliminando el efecto DENY
REVOKE SELECT ON Products TO Administrador
REVOKE SELECT ON Customers TO Administrador

----


---Creando ROL

CREATE ROLE Digitador
GO

GRANT SELECT ON Products TO Digitador
GRANT SELECT ON Customers TO Digitador

---
DROP ROLE Digitador


--Teniendo la BD siempre en uso...

sp_addrolemember Digitador, Administrador