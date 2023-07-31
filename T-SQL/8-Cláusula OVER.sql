USE BDSQL
GO

----CLÁUSLA OVER

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

ROW_NUMBER(): Asigna un número secuencial único a cada fila dentro de la partición especificada por OVER. No hay duplicados y no hay brechas entre los números.

SELECT
  IdCliente,
  Nombre,
  Email,
  ROW_NUMBER() OVER (ORDER BY IdCliente  ) AS NumeroSecuencial
FROM
  CLIENTE

RANK(): Asigna un número de rango a cada fila dentro de la partición especificada por OVER. Los números de rango pueden tener brechas, pero los valores iguales obtienen el mismo número de rango.

SELECT
  IdProducto,
  Nombre,
  PVP,
  RANK() OVER (ORDER BY PVP DESC) AS NumeroDeRango
FROM
  PRODUCTO;


DENSE_RANK(): Similar a RANK(), pero no tiene brechas entre los números de rango para filas con valores iguales.

SELECT
  IdProducto,
  Nombre,
  PVP,
  Tangible as Tangible,
  DENSE_RANK() OVER (PARTITION BY Tangible ORDER BY PVP DESC) AS NumeroDeRango
FROM
  PRODUCTO;

---Selecciono y particiono los productos tangibles e intagibles y si hay mas de un producto del mismo tipo se crea un "conteo" 


NTILE(n): Divide el conjunto de resultados en n grupos aproximadamente iguales y asigna un número de grupo a cada fila dentro de la partición especificada por OVER.

-- Consulta utilizando NTILE(n)
SELECT IdProducto, Nombre, PVP, NTILE(3) OVER (ORDER BY PVP) AS Grupo
FROM PRODUCTO;
/*NTILE(n) trata de distribuir las filas de manera equitativa entre los grupos, pero no siempre 
será exactamente igual, especialmente si el número de filas no es divisible por 'n'.
*/

LEAD(): Devuelve el valor de una columna de la siguiente fila dentro de la partición especificada por OVER.


SELECT
    IdFactura,
    TotalFactura,
    LEAD(TotalFactura, 1, 0) OVER (ORDER BY FechaFactura) AS MontoSiguiente,
    (LEAD(TotalFactura, 1, 0) OVER (ORDER BY FechaFactura) - TotalFactura) * -1 AS Diferencia
FROM FACTURA;

--El segundo parametro se usa como referencia para saber cual fila tomara en cuenta.


LAG(): Devuelve el valor de una columna de la fila anterior dentro de la partición especificada por OVER.

--Lo contrario de LEAD()
SELECT
    IdFactura,
    IdPedido,
	TotalFactura,
    LAG(TotalFactura, 1, 0) OVER (ORDER BY FechaFactura) AS MontoAnterior,
    TotalFactura - LAG(TotalFactura, 1, 0) OVER (ORDER BY FechaFactura) AS Diferencia
FROM FACTURA;


FIRST_VALUE(): Devuelve el valor de una columna de la primera fila dentro de la partición especificada por OVER.

SELECT
    Vendedor,
    Fecha,
    Monto,
    FIRST_VALUE(Monto) OVER (PARTITION BY Vendedor ORDER BY Fecha) AS PrimeraVenta
FROM Ventas;


Vendedor | Fecha       | Monto   | PrimeraVenta
-----------------------------------------------
Juan     | 2023-07-01  | 1000.00 | 1000.00
Juan     | 2023-07-02  | 1500.00 | 1000.00
Ana      | 2023-07-03  | 2000.00 | 2000.00
Ana      | 2023-07-04  | 1200.00 | 2000.00
Pedro    | 2023-07-05  | 1800.00 | 1800.00


