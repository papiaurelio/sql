USE BDSQL
GO

SELECT top 1 MAX(PVP)as precio, nombre as nombre 
FROM PRODUCTO 
GROUP BY Nombre, PVP
ORDER BY PVP desc 


---La función MAX y MIN tambien se pueden usar con tipos de datos VARCHAR

SELECT MAX(cif), MIN(Cif) FROM CLIENTE
