-- Tabla Recaudaci�n
--------------------------------------------
Insert into  BDRepositorio.dbo.Recaudacion
Select 
      cast(Getdate() as Date) as Fecha,
	  'Northwind' as BD,
	  (Select distinct year(Orderdate) from orders where year(Orderdate) = year(getdate()) and month(Orderdate) = month(getdate())) as A�o,
	  (Select distinct month(Orderdate) from orders where year(Orderdate) = year(getdate()) and month(Orderdate) = month(getdate())) as Mes,

	  round(sum(od.UnitPrice * od.Quantity ),2) as Monto,
	  round(sum(od.UnitPrice * od.Quantity * od.Discount ),2) as Descuento,
	  round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount )),2) as MontoTotal,
	  count(distinct o.orderID) as CantidadOrdenes
from [Order Details] od
inner join Orders o on od.OrderID = o.OrderID
where 
year(Orderdate) = year(getdate())
and
month(Orderdate) = month(getdate())
go

------  Tabla Detalle de la Recaudaci�n------------------------------------------------------------------------------

Insert into  BDRepositorio.dbo.Detalle_Recaudacion
Select 
      (Select IdRecaudacion from  BDRepositorio.dbo.Recaudacion
       where year(Fecha) = year(getdate()) and month(Fecha) = month(getdate())) as IdRecaudaci�n,
	  o.EmployeeID,
	  round(sum(od.UnitPrice * od.Quantity ),2) as Monto,
	  round(sum(od.UnitPrice * od.Quantity * od.Discount ),2) as Descuento,
	  round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount )),2) as MontoTotal,
	  count(distinct o.orderID) as CantidadOrdenes
from [Order Details] od
inner join Orders o on od.OrderID = o.OrderID
where 
year(Orderdate) = year(getdate())
and
month(Orderdate) = month(getdate())
Group by 
 o.EmployeeID
  
 go





Delete from  BDRepositorio.dbo.Recaudacion
Delete from BDRepositorio.dbo.Detalle_Recaudacion

Declare @Dato int
Select @Dato
Select @@IDENTITY