USE BDSQL
GO

UPDATE CLIENTE 
SET Nombre = 'Byron Aurelio'
WHERE IdCliente = 1


--importante el poner el WHERE
UPDATE CLIENTE
SET FechaBaja = GETDATE()

SELECT * FROM CLIENTE

UPDATE CLIENTE
SET FechaBaja = NULL