USE Adventure
GO

SELECT * FROM SALES.SalesOrderHeader WHERE SalesOrderID = 43660

SELECT * FROM SALES.SalesOrderDetail

--------------
sP_addmessage 50002,1, 'El ProductID con ID:%d ha sido afectado, El usuario: %s y el inicio de sesion %s SON LOS RESPONSABLES',
                        'us_english', 'true', replace
--------------


CREATE PROCEDURE Ventas_Cliente_Descuento
    @SalesOrderID INT,
    @SalesOrderDetailID INT
AS
BEGIN

    -- Obtener la información del producto y el descuento actual
    DECLARE @ProductID INT, @CurrentDiscount DECIMAL(10, 4);
    SELECT @ProductID = ProductID, @CurrentDiscount = UnitPriceDiscount
    FROM Sales.SalesOrderDetail
    WHERE SalesOrderID = @SalesOrderID
        AND SalesOrderDetailID = @SalesOrderDetailID;

    -- Actualizar el descuento del precio en Sales.SalesOrderDetail
    UPDATE Sales.SalesOrderDetail
    SET UnitPriceDiscount = 0.50 -- Actualizar aquí con el nuevo valor del descuento
    WHERE SalesOrderID = @SalesOrderID
        AND SalesOrderDetailID = @SalesOrderDetailID;

    -- Generar la alerta del sistema
    DECLARE @ProductInfo NVARCHAR(100), @DBUserName NVARCHAR(100), @LoginName NVARCHAR(100);
    SELECT @ProductInfo = p.Name, @DBUserName = suser_name(), @LoginName = suser_sname()
    FROM Sales.SalesOrderDetail sod
    INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
    WHERE sod.SalesOrderID = @SalesOrderID
        AND sod.SalesOrderDetailID = @SalesOrderDetailID;

    -- Imprimir la alerta del sistema

	
    PRINT 'Alerta del sistema:'

	Raiserror(50002, 1,1, @ProductID, @DBUserName, @LoginName)
END

--
EXEC Ventas_Cliente_Descuento 43660, 13
--


--Usando estos datos de EJEMPLO
--Order 43660-13- productoid= 762 
--SalesOrderID--SalesOrderDetailID --IdProducto

SELECT * FROM SALES.SalesOrderDetail

SELECT TotalDue FROM SALES.SalesOrderHeader where SalesOrderID = 43660