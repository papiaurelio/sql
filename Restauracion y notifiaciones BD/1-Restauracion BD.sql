
-- Visualizar los archivos .bak

Restore headeronly from disk = 
'D:\Base de Datos\Respaldos\Northwind.bak'

-- Visualizar los archivos de BD del respaldo

Restore Filelistonly from disk = 
'D:\Base de Datos\Respaldos\Northwind.bak'

-- Restauraci�n de la BD Northwind --Escojer carpeta para sobreescribir archivos

Restore database Northwind
from disk = 'D:\Base de Datos\Respaldos\Northwind.bak'
with 
move 'Northwind' to 'D:\Base de Datos\Archivos de Base de Datos\MDF\northwnd.mdf',
move 'Northwind_1' to 'D:\Base de Datos\Archivos de Base de Datos\NDF\Northwind_1.ndf',
move  'Northwind_2'  to 'D:\Base de Datos\Archivos de Base de Datos\NDF\Northwind_2.ndf',
move  'Northwind_log' to 'D:\Base de Datos\Archivos de Base de Datos\LDF\northwnd.ldf'

-- Backup Full de Base de Datos Northwind

Backup database Northwind
to disk  = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

Restore filelistonly from disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

Use Master
go
Drop database Northwind

Restore database Northwind
from disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
-- Visualizando informaci�n de archivos de BD
sp_helpdb Northwind

-- Separaci�n y vinculaci�n de Base de Datos Northwind
use Master
go
sp_detach_db Northwind

sp_attach_db Northwind,
'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\MDF\northwnd.mdf',
'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\NDF\Northwind_1.ndf',
'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\NDF\Northwind_2.ndf',
'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\LDF\northwnd.ldf'

Restore database Northwind
from disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
with 
move 'Northwind' to 'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\MDF\northwnd.mdf',
move 'Northwind_1' to 'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\NDF\Northwind_1.ndf',
move  'Northwind_2'  to 'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\NDF\Northwind_2.ndf',
move  'Northwind_log' to 'D:\Base de Datos\Archivos de Base de Datos\Archivos Northwind\LDF\northwnd.ldf'

Use Northwind
go
Select * from Region

--Respaldo Full de Base de Datos Northwind

Backup database Northwind
to disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

-- Respaldo Diferencial de Base de Datos Northwind
Backup database Northwind
to disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
With
Differential

-- Respaldo del Registro de Transacciones
Insert into Region values (5, 'Am�rica Central')
Backup log Northwind
to disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

-----------------------------------------------
Insert into Region values (6, 'Am�rica del Sur')
Backup log Northwind
to disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'
----------------------------------------------------------------
Insert into Region values (7, 'Am�rica del Norte')
Backup log Northwind
to disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

Restore Headeronly
from disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

----------------------------------------------------------------------
insert into Region values (8, 'Este')
Backup log Northwind
to disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldoLog.bak'

--------------------------------------------------
insert into Region values (9, 'Norte')
Backup log Northwind
to disk = 'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

----------- Restauraci�n de la Base de Datos Northwind
Restore headeronly from disk = 
'D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

Restore Database Northwind
from Northwind_Backup
with file = 8,
recovery

use Northwind
go
Select * from Region


-- Creaci�n de Dispositivo de Almacenamiento para Respaldos y Restauraci�n de BD

sp_addumpdevice 'Disk', 'Northwind_Backup','D:\Base de Datos\Respaldos\NorthwindRespaldo.bak'

sp_helpdevice 

sp_dropdevice Respaldo_Northwind

Backup database Northwind
to Northwind_Backup 
with Differential

Backup log Northwind
to Northwind_Backup 


-- Modelo de Recuperaci�n: Full -- Simple -- Registro Masivo
Alter database Northwind
set Recovery Simple

Alter database Northwind
set Recovery Full

---backup

BACKUP DATABASE NombreBaseDatos
TO DISK = 'C:\Ruta\ArchivoBackup.bak'
WITH FORMAT, NAME = 'NombreBackup'

--A�adir compression 

BACKUP DATABASE NombreBaseDatos
TO DISK = 'C:\Ruta\ArchivoBackup.bak'
WITH FORMAT, NAME = 'NombreBackup', COMPRESSION;

--NORMAL
BACKUP DATABASE mydatabase 
TO DISK = 'C:\backup\mydatabase.bak';


--Se puede utilizar las siguientes opciones para personalizar su copia de seguridad:

---FORMAT : Especifica que la copia de seguridad se debe crear en un nuevo formato de copia de seguridad.
---COMPRESSION : Especifica que la copia de seguridad debe comprimirse.
---ENCRYPTION : Especifica que la copia de seguridad debe cifrarse.
---RECOVERY : Especifica que la copia de seguridad se debe utilizar para una restauraci�n completa.
---SIMPLE : Especifica que la copia de seguridad se debe utilizar para una restauraci�n diferencial.
---LOG : Especifica que la copia de seguridad se debe realizar de un registro de transacciones.


