
create database DW_Hospital
use DW_Hospital

-- Tabla de hechos
CREATE TABLE FactContrato (
    DimIdAsegurado INT not null,
    DimIdVendedor INT not null,
    DimIdPoliza INT null,
	DimFechaID int null,
    CostoExtension FLOAT,
    Total FLOAT
);

-- Dimensiones
CREATE TABLE DimTipoPoliza (
DimIdPoliza int identity(1,1) not null,
    IdPoliza int not null,
    tipoPoliza NVARCHAR(50),
    Descripcion NVARCHAR(100),
    CostoPoliza FLOAT,
    CostoExtension FLOAT,
    ValorCobertura INT
);

CREATE TABLE DimAsegurado (
DimIdAsegurado int identity(1,1) not null,
    IdAsegurado INT not null,
    PrimerNombre NVARCHAR(20),
    SegundoNombre NVARCHAR(20),
    PrimerApellido NVARCHAR(20),
    SegundoApellido NVARCHAR(20),
    Direccion NVARCHAR(50),
    Telefono NVARCHAR(12),
	FechaInicio date,
	FechaFinal date
);

CREATE TABLE DimVendedor (
DimIdVendedor int identity(1,1) not null,
    IdVendedor INT not null,
    PrimerNombre NVARCHAR(20),
    SegundoNombre NVARCHAR(20),
    PrimerApellido NVARCHAR(20),
    SegundoApellido NVARCHAR(20),
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(12),
	FechaInicio date,
	FechaFinal date
);
CREATE TABLE DimFechas(
	DimFechaID int identity (1,1) not null,
	IDFecha date null,
	Año int null,
	NumMes int null,
	NombreMes nvarchar (50) null,
	Dia int null,
	NombreDia nvarchar (50) null,
	Trimestre int null
)

/*
CREATE TABLE FamiliarAsegurado (
	DimIdFamiliarAsegurado int identity(1,1) not null,
    IdFamiliarAsegurado INT,
    PrimerNombre NVARCHAR(20),
    SegundoNombre NVARCHAR(20),
    PrimerApellido NVARCHAR(20),
    SegundoApellido NVARCHAR(20),
    Edad INT,
    FechaNacimiento DATETIME,
    DireccionVivienda NVARCHAR(50),
	FechaInicio date,
	FechaFinal date
);
*/

/*
-- Tabla de relación
CREATE TABLE ExtensionContrato (
    IdContrato INT REFERENCES Contrato(IdContrato),
    IdFamiliarAsegurado INT REFERENCES FamiliarAsegurado(IdFamiliarAsegurado),
    PRIMARY KEY (IdContrato, IdFamiliarAsegurado)
);*/

use Hospital 
go 


select distinct FechaInicial AS IdFecha,
	year(FechaInicial) Año,
	month(FechaInicial) NoMes,
	DATENAME(month, FechaInicial) NombreMes,
	DAY(FechaInicial) NoDia,
	DATENAME(weekday, FechaInicial) NombreDia,
	DATEPART(qq, FechaInicial) Trimestre
	
	
from Hospital.dbo.Contrato


--Creación del MERGE



USE DW_Hospital
GO

select DA.DimIdAsegurado AS DimIdAsegurado,
	DV.DimIdVendedor AS DimIdVendedor,
	DTP.DimIdPoliza AS DimIdPoliza,
	DF.DimFechaID AS DimFechaID,
	C.CostoExtension AS CostoExtension,
	C.Total AS Total
from Hospital.dbo.Contrato as C  
INNER JOIN DimAsegurado DA ON C.IdAsegurado = DA.IdAsegurado
INNER JOIN DimVendedor DV ON C.IdVendedor = DV.IdVendedor
INNER JOIN DimTipoPoliza DTP ON C.IdPoliza = DTP.IdPoliza
INNER JOIN DimFechas DF ON C.FechaInicial = DF.IDFecha 
where DA.FechaFinal = '9999-12-31' and
	DV.FechaFinal = '9999-12-31' and
	DTP.FechaFinal = '9999-12-31'



---------------------------------------------------------------------------------

--MERGE COMPLETO

Merge dbo.FactContrato Destino
using(
	select DA.DimIdAsegurado AS DimIdAsegurado,
	DV.DimIdVendedor AS DimIdVendedor,
	DTP.DimIdPoliza AS DimIdPoliza,
	DF.DimFechaID AS DimFechaID,
	C.CostoExtension AS CostoExtension,
	C.Total AS Total
from Hospital.dbo.Contrato as C  
INNER JOIN DimAsegurado DA ON C.IdAsegurado = DA.IdAsegurado
INNER JOIN DimVendedor DV ON C.IdVendedor = DV.IdVendedor
INNER JOIN DimTipoPoliza DTP ON C.IdPoliza = DTP.IdPoliza
INNER JOIN DimFechas DF ON C.FechaInicial = DF.IDFecha 
where DA.FechaFinal = '9999-12-31' and
	DV.FechaFinal = '9999-12-31' and
	DTP.FechaFinal = '9999-12-31'
) Origen
on
Destino.DimIdAsegurado = Origen.DimIdAsegurado and
Destino.DimIdVendedor = Origen.DimIdVendedor and
Destino.DimIdPoliza = Origen.DimIdPoliza and
Destino.DimFechaID = Origen.DimFechaID 
When Matched and (
	Destino.CostoExtension <> Origen.CostoExtension or 
	Destino.Total <> Origen.Total 
) Then
	Update Set
	Destino.CostoExtension = Origen.CostoExtension, 
	Destino.Total = Origen.Total
When Not Matched
Then
	Insert (DimIdAsegurado, DimIdVendedor, DimIdPoliza, DimFechaID, CostoExtension, Total)
	Values (Origen.DimIdAsegurado, Origen.DimIdVendedor, Origen.DimIdPoliza, Origen.DimFechaID, 
	Origen.CostoExtension, Origen.Total);