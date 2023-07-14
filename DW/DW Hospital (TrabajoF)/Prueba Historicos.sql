USE Hospital 
GO

UPDATE Hospital.dbo.Asegurado set PrimerNombre = 'Kendra'
WHERE IdAsegurado = 2
GO

SELECT * FROM Asegurado


---Comprobación DW

USE DW_Hospital 
GO
SELECT * FROM DimAsegurado
WHERE IdAsegurado = 2