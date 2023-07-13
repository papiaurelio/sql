--Los tipos de copia de seguridad se representan con números de la siguiente manera:

--1: Copia de seguridad completa
--5 Diferencial
--2 Log

Restore headeronly from disk = 
'E:\Respaldo BD\EjemploRestauracion.bak'

Restore filelistonly from disk = 'E:\Respaldo BD\EjemploRestauracion.bak'

Restore database Neptuno
from disk = 'E:\Respaldo BD\EjemploRestauracion.bak'
with 
move 'Neptuno_DATA' to 'E:\Respaldo BD\Neptuno\MDF\Neptuno.mdf',
move 'Extension_I' to 'E:\Respaldo BD\Neptuno\NDF\Extension_I.ndf',
move  'Extensión_II'  to 'E:\Respaldo BD\Neptuno\NDF\Extension_II.ndf',
move  'Neptuno_log' to 'E:\Respaldo BD\Neptuno\LDF\Neptuno_log.ldf'


-- Backup Full de Base de Datos Neptuno

Backup database Neptuno
to disk  = 'E:\Respaldo BD\\NEPTUNOOOOOOOOOOO.bak'

--- Restauron la BD
Restore Database Neptuno
from disk = 'D:\BD Respaldo\Neptuno_BD\NeptunoRespaldo.bak'



--Restauracion de la BD.
Restore Database Neptuno
from disk = 'E:\Respaldo BD\EjemploRestauracion.bak'

-------------------------Restauracion de la BD 

--creando un dispositivo de almacenamiento
sp_addumpdevice 'Disk', 'Neptuno_BK','E:\Respaldo BD\EjemploRestauracion.bak' 

Restore headeronly from disk = 
'E:\Respaldo BD\EjemploRestauracion.bak'

Alter database Neptuno
set Recovery Full

Restore headeronly from disk = 
'E:\Respaldo BD\EjemploRestauracion.bak'


Restore Database Neptuno
from Neptuno_BK
with file = 1, NORECOVERY,
REPLACE

Restore Database Neptuno
from Neptuno_BK
with file = 2, NORECOVERY

Restore Database Neptuno
from Neptuno_BK
with file = 3, NORECOVERY

Restore Database Neptuno
from Neptuno_BK
with file = 7, NORECOVERY

Restore Database Neptuno
from Neptuno_BK
with file = 10, NORECOVERY

Restore Database Neptuno
from Neptuno_BK
with file = 17, NORECOVERY

Restore Database Neptuno
from Neptuno_BK
with file = 18, NORECOVERY

Restore Database Neptuno
from Neptuno_BK
with file = 19, RECOVERY


----
USE master
GO
drop database Neptuno
GO
