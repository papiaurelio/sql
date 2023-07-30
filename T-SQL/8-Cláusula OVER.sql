USE BDSQL
GO

----CL�USLA OVER

SELECT
  IdProducto,
  Nombre,
  PVP,
  SUM(PVP) OVER (ORDER BY IdProducto) AS SumaAcumulada
FROM
  PRODUCTO;


--ejemplo 2 --agregando partition by 

SELECT
  IdProducto,
  Nombre,
  PVP,
  SUM(PVP) OVER ( PARTITION BY Tangible ORDER BY IdProducto) AS SumaAcumulada
FROM
  PRODUCTO;
 
SELECT * FROM PRODUCTO


----------------------------------------------------------------------------------
--Ejemplos

ROW_NUMBER(): Asigna un n�mero secuencial �nico a cada fila dentro de la partici�n especificada por OVER. No hay duplicados y no hay brechas entre los n�meros.

SELECT
  IdCliente,
  Nombre,
  Email,
  ROW_NUMBER() OVER (ORDER BY IdCliente  ) AS NumeroSecuencial
FROM
  CLIENTE

RANK(): Asigna un n�mero de rango a cada fila dentro de la partici�n especificada por OVER. Los n�meros de rango pueden tener brechas, pero los valores iguales obtienen el mismo n�mero de rango.

SELECT
  IdProducto,
  Nombre,
  PVP,
  RANK() OVER (ORDER BY PVP DESC) AS NumeroDeRango
FROM
  PRODUCTO;


DENSE_RANK(): Similar a RANK(), pero no tiene brechas entre los n�meros de rango para filas con valores iguales.

SELECT
  IdProducto,
  Nombre,
  PVP,
  Tangible as Tangible,
  DENSE_RANK() OVER (PARTITION BY Tangible ORDER BY PVP DESC) AS NumeroDeRango
FROM
  PRODUCTO;

---Selecciono y particiono los productos tangibles e intagibles y si hay mas de un producto del mismo tipo se crea un "conteo" 


NTILE(n): Divide el conjunto de resultados en n grupos aproximadamente iguales y asigna un n�mero de grupo a cada fila dentro de la partici�n especificada por OVER.

LEAD(): Devuelve el valor de una columna de la siguiente fila dentro de la partici�n especificada por OVER.

LAG(): Devuelve el valor de una columna de la fila anterior dentro de la partici�n especificada por OVER.

FIRST_VALUE(): Devuelve el valor de una columna de la primera fila dentro de la partici�n especificada por OVER.

LAST_VALUE(): Devuelve el valor de una columna de la �ltima fila dentro de la partici�n especificada por OVER.