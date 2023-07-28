--CLÁUSULA DELETE 

USE BDSQL
GO

--Borrar todo la inoformación tabla clientes
DELETE FROM CLIENTE
GO

DELETE FROM CLIENTE WHERE IdCliente = 4

--otra forma
DELETE CLIENTE WHERE IdCliente = 11



