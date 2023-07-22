
CREATE TABLE miTabla (
    ID INT PRIMARY KEY,
    miColumna VARCHAR(50)
);

-- Ahora, agrega la restricción UNIQUE a la columna "miColumna".
ALTER TABLE miTabla
ADD CONSTRAINT UQ_miTabla_miColumna UNIQUE (miColumna);


DROP TABLE miTabla
GO

