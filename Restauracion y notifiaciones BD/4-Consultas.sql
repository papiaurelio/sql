


Use Northwind
go
Select RegionDescription, sum(Recaudación) as Recaudación from (
Select Distinct  et.EmployeeID,
                 e.FirstName,
	             r.RegionDescription
from EmployeeTerritories et
inner join Employees e on e.EmployeeID = et.EmployeeID
inner join Territories t on t.TerritoryID = et.TerritoryID
inner join Region r on r.RegionID = t.RegionID) A
inner join 
(Select
o.EmployeeID,
round(sum((od.Quantity * od.UnitPrice) * (1 -od.Discount)),2)
as Recaudación
from [Order Details] od
inner join Orders o on od.OrderID = o.OrderID
Group by 
o.EmployeeID) B
on B.EmployeeID = A.EmployeeID
Group by 
 RegionDescription
