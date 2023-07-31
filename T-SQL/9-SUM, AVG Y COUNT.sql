--SUM, AVG, COUNT

SELECT COUNT(*) FROM CLIENTE

SELECT SUM(PVP), AVG(PVP), COUNT(IdProducto) FROM PRODUCTO

SELECT IdPedido ID, SUM(PVP) TOTAL, COUNT(IdPedido) AS 'Productos' FROM LINEAS_PEDIDO GROUP BY IdPedido