USE BDSQL
GO

SELECT TOP (2)
Nombre,
Cif
FROM CLIENTE 


--Clausula DISTINCT, nos devuelve el valor una sola vez aunque este se repita en la tabla

SELECT DISTINCT(IvaActual) FROM PRODUCTO
