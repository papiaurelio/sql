USE DW_Hospital
GO


--------------------
DELETE FROM FactContrato
DELETE FROM DimAsegurado
DELETE FROM DimFechas
DELETE FROM DimTipoPoliza
DELETE FROM DimVendedor
--------------------


SELECT * FROM FactContrato

SELECT * FROM DimFechas
SELECT * FROM DimAsegurado
SELECT * FROM DimTipoPoliza
SELECT * FROM DimVendedor

---Resetear DimID
DBCC CHECKIDENT (DimAsegurado, RESEED,0)
DBCC CHECKIDENT (DimTipoPoliza, RESEED,0)
DBCC CHECKIDENT (DimVendedor, RESEED,0)
