USE Neptuno
GO

--DIMPRODUCTOS
CREATE VIEW DimProductos
AS
	SELECT P.idproducto,
		P.nombreProducto,
		PR.nombreCompañia AS NombreProovedor,
		CAA.nombrecategoria,
		P.cantidadPorUnidad,
		P.precioUnidad,
		P.unidadesEnExistencia,
		P.unidadesEnPedido,
		P.nivelNuevoPedido,
		P.suspendido,
		P.categoriaProducto
	FROM productos P 
	INNER JOIN proveedores PR ON  P.idProveedor = PR.idProveedor
	INNER JOIN categorias CAA ON P.idCategoria = CAA.idcategoria

--DIMPEDIDOS
CREATE VIEW DimPedidos
AS
	SELECT P.IdPedido,
	CL.NombreCompañia AS [Compañia del cliente], 
	E.Nombre + '-'+ E.Apellidos AS NombreEmpleado,
	P.FechaPedido,
	P.FechaEntrega,
	P.FechaEnvio,
	CE.nombreCompañia AS CompañiaEnvio,
	P.cargo,
	P.Destinatario, 
	P.DireccionDestinatario,
	P.CiudadDestinatario,
	P.RegionDestinatario,
	P.CodPostalDestinatario,
	P.PaisDestinatario
	
	FROM Pedidos P 
	INNER JOIN clientes CL ON P.IdCliente = CL.idCliente
	INNER JOIN Empleados E ON P.IdEmpleado = E.IdEmpleado
	INNER JOIN compañiasdeenvios CE ON P.FormaEnvio = CE.idCompañiaEnvios

--DIMFECHAS
CREATE VIEW DimFecha
AS

SELECT  DISTINCT FechaPedido IdFecha,
year(FechaPedido) Año,
month(FechaPedido) NoMes,
DAY(FechaPedido) NoDia,
DATEPART(qq, FechaPedido) Trimestre,
(SELECT 
	CASE 
		WHEN DATEPART(month, FechaPedido) BETWEEN 1 AND 6 THEN '1'
		WHEN DATEPART(month, FechaPedido) BETWEEN 7 AND 12 THEN '2'
END) Semestre,
DATENAME(month, FechaPedido) NombreMes,
DATENAME(weekday, FechaPedido) NombreDia
FROM Pedidos

-----

---CREANDO hechos

CREATE VIEW HechosDetallePedidos
AS
SELECT DT.idpedido AS PedidoID,
	P.FechaPedido AS FechaID,
	DT.idproducto AS ProductoID,
	DT.preciounidad,
	DT.cantidad,
	DT.descuento AS DESCUENTO,
	SUM(DT.preciounidad * DT.cantidad) AS Monto,
	SUM(DT.descuento * DT.preciounidad) AS DescuentoAplicado,
    SUM((preciounidad *cantidad) * (1 - Descuento)) AS MontoTotal
FROM detallesdepedidos DT
INNER JOIN Pedidos P ON DT.idpedido = P.IdPedido
GROUP BY DT.idpedido, P.FechaPedido, DT.idproducto,DT.preciounidad, DT.cantidaD, DT.descuento


------------------------------
----PUNTO 4

-- Crear un inicio de sesión
CREATE LOGIN AdminNeptuno WITH PASSWORD = '123';

USE Neptuno
GO
-- Crear un usuario vinculado al inicio de sesión
CREATE USER AdminNeptuno_V FOR LOGIN AdminNeptuno;


-- Crear un esquema para las vistas
CREATE SCHEMA VW;

-- Asignar permisos de solo lectura para el esquema de vistas
GRANT SELECT ON SCHEMA::VW TO AdminNeptuno_V;

-- Denegar permisos para el resto de los objetos en el esquema predeterminado "dbo"
DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO AdminNeptuno_V;
DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Auditoria TO AdminNeptuno_V;
-- Asignar el rol predefinido de solo lectura
ALTER ROLE db_datareader ADD MEMBER AdminNeptuno_V;

use Neptuno 
go
--Ahora agregamos Las vistas al SCHEMA

ALTER SCHEMA VW TRANSFER dbo.DimFecha;
ALTER SCHEMA VW TRANSFER dbo.DimPedidos;
ALTER SCHEMA VW TRANSFER dbo.DimProductos;
ALTER SCHEMA VW TRANSFER dbo.HechosDetallePedidos;

--ALTER SCHEMA VW TRANSFER dbo.TotalRecaudacionesPagadas;










