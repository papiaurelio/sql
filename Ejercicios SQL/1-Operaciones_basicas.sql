--DAR DE ALTA 6 CLIENTES Y 10 PRODUCTOS
--ALTA CLIENTES

USE BDSQL
GO
DECLARE @Pass varchar(500)
DECLARE @passEncriptada varbinary(500)
SET @PASS='PassCliente6'
SET @passEncriptada = ENCRYPTBYPASSPHRASE('ClaveIndiscifrable',@Pass)
INSERT INTO dbo.CLIENTE(Nombre,Cif,Email,Direccion,Usuario,Password,FechaAlta,FechaBaja)
VALUES ('Cliente 6','W1822548B','emailCliente6@mail.es','Direccion cliente 6','Login6',@passEncriptada,GETDATE(),NULL)

SET @PASS='PassCliente7'	
SET @passEncriptada = ENCRYPTBYPASSPHRASE('ClaveIndiscifrable',@Pass)
INSERT INTO dbo.CLIENTE(Nombre,Cif,Email,Direccion,Usuario,Password,FechaAlta,FechaBaja)
VALUES ('Cliente 7','S5727243G','emailCliente7@mail.es','Direccion cliente 7','Login7',@passEncriptada,GETDATE(),NULL)

SET @PASS='PassCliente8'	
SET @passEncriptada = ENCRYPTBYPASSPHRASE('ClaveIndiscifrable',@Pass)
INSERT INTO dbo.CLIENTE(Nombre,Cif,Email,Direccion,Usuario,Password,FechaAlta,FechaBaja)
VALUES ('Cliente 8','B50164797','emailCliente8@mail.es','Direccion cliente 8','Login8',@passEncriptada,GETDATE(),NULL)

SET @PASS='PassCliente9'	
SET @passEncriptada = ENCRYPTBYPASSPHRASE('ClaveIndiscifrable',@Pass)
INSERT INTO dbo.CLIENTE(Nombre,Cif,Email,Direccion,Usuario,Password,FechaAlta,FechaBaja)
VALUES ('Cliente 9','F20563318','emailCliente9@mail.es','Direccion cliente 9','Login9',@passEncriptada,GETDATE(),NULL)

SET @PASS='PassCliente10'	
SET @passEncriptada = ENCRYPTBYPASSPHRASE('ClaveIndiscifrable',@Pass)
INSERT INTO dbo.CLIENTE(Nombre,Cif,Email,Direccion,Usuario,Password,FechaAlta,FechaBaja)
VALUES ('Cliente 10','G13185137','emailCliente6@mail.es','Direccion cliente 10','Login10',@passEncriptada,GETDATE(),NULL)

SET @PASS='PassCliente11'	
SET @passEncriptada = ENCRYPTBYPASSPHRASE('ClaveIndiscifrable',@Pass)
INSERT INTO dbo.CLIENTE(Nombre,Cif,Email,Direccion,Usuario,Password,FechaAlta,FechaBaja)
VALUES ('Cliente 11','J5476031','emailCliente11@mail.es','Direccion cliente 11','Login11',@passEncriptada,GETDATE(),NULL)

UPDATE CLIENTE SET Cif='R3580281H' where IdCliente=16

SELECT * FROM CLIENTE

--Agregar PRODUCTOS
INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 6',20.00,10.00,0,21.00,29)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 7',21.00,10.00,0,21.00,8)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 8',24.00,11.00,0,21.00,2254)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 9',25.00,15.50,1,21.00,21)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 10',2.30,1.00,1,21.00,456)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 11',20.00,5.00,0,21.00,100)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 12',14.00,5.00,0,21.00,26)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 13',667.00,222.00,0,21.00,8)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 14',23.00,9.50,1,21.00,1)

INSERT INTO dbo.PRODUCTO(CodProducto,Nombre,PVP,PrecioCompra,Tangible,IvaActual,StockDisponible)
VALUES(NEWID(),'Producto 15',12.30,11.00,0,21.00,14)


--HACER 2 PEDIDOS QUE CONTENGAN 1 DE LOS PRODUCTOS
DECLARE @id int

INSERT INTO dbo.PEDIDO(IdCliente,FechaPedido,FechaAnulacion) VALUES(5,GETDATE(),NULL)
SET @id = @@IDENTITY

INSERT INTO dbo.LINEAS_PEDIDO(IdPedido,IdProducto,PVP,Cantidad,IvaDetalle)
VALUES(@id ,8,21,4,21)

INSERT INTO dbo.PEDIDO(IdCliente,FechaPedido,FechaAnulacion) VALUES(6,GETDATE(),NULL)
SET @id = @@IDENTITY

INSERT INTO dbo.LINEAS_PEDIDO(IdPedido,IdProducto,PVP,Cantidad,IvaDetalle)
VALUES(@id ,9,12.3,1,21)



--HACER 2 PEDIDOS QUE CONTENGA 2 O MÁS PRODUCTOS
INSERT INTO dbo.PEDIDO(IdCliente,FechaPedido,FechaAnulacion) VALUES(5,GETDATE(),NULL)
SET @id = @@IDENTITY

INSERT INTO dbo.LINEAS_PEDIDO(IdPedido,IdProducto,PVP,Cantidad,IvaDetalle)
VALUES(@id ,8,20,1,21)
INSERT INTO dbo.LINEAS_PEDIDO(IdPedido,IdProducto,PVP,Cantidad,IvaDetalle)
VALUES(@id ,9,10.98,1,10)

INSERT INTO dbo.PEDIDO(IdCliente,FechaPedido,FechaAnulacion) VALUES(6,GETDATE(),NULL)
SET @id = @@IDENTITY

INSERT INTO dbo.LINEAS_PEDIDO(IdPedido,IdProducto,PVP,Cantidad,IvaDetalle)
VALUES(@id ,9,15.99,2,21)
INSERT INTO dbo.LINEAS_PEDIDO(IdPedido,IdProducto,PVP,Cantidad,IvaDetalle)
VALUES(@id ,8,11,1,21)

SELECT * FROM LINEAS_PEDIDO
SELECT * FROM PEDIDO

--FACTURAR TODS LOS PEDIDOS GENERADOS
SELECT  * FROM FACTURA
SELECT * FROM PEDIDO

INSERT INTO dbo.FACTURA(IdPedido,TotalProductos,TotalIva,TotalFactura,FechaFactura,FechaAnulacion)
VALUES(9,84,17.64,101.64,GETDATE(),NULL)

INSERT INTO dbo.FACTURA(IdPedido,TotalProductos,TotalIva,TotalFactura,FechaFactura,FechaAnulacion)
VALUES(10,16,2.58,18.58,GETDATE(),NULL)

INSERT INTO dbo.FACTURA(IdPedido,TotalProductos,TotalIva,TotalFactura,FechaFactura,FechaAnulacion)
VALUES(11,30.98,4.30,35.28,GETDATE(),NULL)

INSERT INTO dbo.FACTURA(IdPedido,TotalProductos,TotalIva,TotalFactura,FechaFactura,FechaAnulacion)
VALUES(12,42.98,8.82,51.8,GETDATE(),NULL)

--ANULAR UNO DE LOS PEDIDOS GENERADOS
UPDATE PEDIDO SET FechaAnulacion=GETDATE() WHERE IdPedido=9
UPDATE FACTURA SET FechaAnulacion=GETDATE() WHERE IdPedido=9

SELECT * FROM FACTURA

--BORRAR UN CLIENTE QUE NO HAYA COMPRADO NADA Y LOS PEDIDOS QUE NO TENGAN PRODUCTOS ASOCIADOS
DELETE CLIENTE WHERE IdCliente=14
DELETE PEDIDO WHERE IdPedido>1 AND IdPedido<9

SELECT * FROM PEDIDO
SELECT * FROM LINEAS_PEDIDO