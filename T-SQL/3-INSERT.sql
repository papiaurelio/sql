USE BDSQL
GO

ALTER TABLE PRODUCTO ADD Nombre VARCHAR(100)

---Insertando Datos tabla producto---

INSERT INTO PRODUCTO VALUES(NEWID(), 20, 14, 1, 0.15, 100, 'Leche 500ml')

---Insetando Datos tabla cliente
---Para agregar una contraseña en una tabla lo más recomendable es cifrarla

DECLARE @Password NVARCHAR(50)
SET @Password = 'contaseña1'

DECLARE @PasswordCifrada VARBINARY(500)
SET @PasswordCifrada = ENCRYPTBYPASSPHRASE(@Password, @Password)

INSERT INTO CLIENTE VALUES('Kendra', '401-202021', 'kendra@gmail.com', 'Calle las flores', 
'KendraFrom', @PasswordCifrada, GETDATE(), NULL) 



