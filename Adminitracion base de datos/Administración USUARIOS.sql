CREATE LOGIN AdminBD WITH PASSWORD = '123';

USE Northwind
GO

sp_adduser AdminBD, Administrador

GRANT SELECT ON CUSTOMERS TO Administrador
GRANT SELECT ON Products TO Administrador
GRANT INSERT ON Products TO Administrador
REVOKE INSERT ON Products TO Administrador --revocar permiso

GRANT EXECUTE ON "NOMBRE..." TO Administrador

GRANT SELECT ON [dbo].[Order Details Extended] TO Administrador
REVOKE SELECT ON [dbo].[Order Details Extended] TO Administrador