--Función CAST y CONVERT
--CAST funciona con tipos de datos 'familiares'

DECLARE @numero MONEY 

SET @numero = 301.12
PRINT(@numero)

SELECT CAST(@numero AS INT) AS NumeroINT --Lo representa solo en memoria temporal. No es una conversión definiva.

---CONVERT 

DECLARE @fecha DATETIME
SET @fecha = GETDATE()
PRINT(@fecha)
PRINT(CONVERT(CHAR(20), @fecha, 112))
PRINT(CONVERT(DATETIME2, @fecha))

