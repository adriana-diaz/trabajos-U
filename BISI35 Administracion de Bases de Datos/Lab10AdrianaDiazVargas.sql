--CLASE 10
--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 10
--Fecha : 15/07/25
--clase 10
 
 --CREAR BASE DE DATOS
 CREATE DATABASE Spotify
 GO

 --CAMBIO DE BASE DA DATOS
 USE Spotify
 GO

 --CREAR TABLA DE USUARIO PARA AUTEHNTICARSE CON UNA APP
-- 2. Crear tabla Usuarios con campos requeridos
CREATE TABLE dbo.Usuarios (
    IDUsuario INT IDENTITY (1000,5) PRIMARY KEY,
    NombreUsuario NVARCHAR(50) NOT NULL UNIQUE,
    PasswordUsuario NVARCHAR(50) NOT NULL,
    CorreoElectronico NVARCHAR(100) ,
    TarjetaCredito VARCHAR(19),
    FechaNacimiento DATE,
    FechaRegistro DATE,
    FechaSuscripcionPremium DATE
);
GO
 --3. Inserte 20 usuarios, adjunte captura del select
INSERT INTO dbo.Usuarios (NombreUsuario, PasswordUsuario, CorreoElectronico, TarjetaCredito, FechaNacimiento, FechaRegistro, FechaSuscripcionPremium)
VALUES 
('Vargas', '1196444', 'adriana.vargas@gmail.com', '1234-6789-1611-4844', '2005-03-30', GETDATE(), GETDATE()),
('AdrianaDiaz', '9638441Aa$', 'adriana03.@gmail.com', '1234-6789-1011-5555', '2005-03-30', GETDATE(), GETDATE()),
('valeriaS', '9638Val@42A', 'valeria.@gmail.com', '1234-6389-1021-5455', '2005-03-30', GETDATE(), GETDATE()),
('SAmuelM', 'SamM9638@44a', 'samuel.@gmail.com', '1534-6789-1911-5565', '2005-03-30', GETDATE(), GETDATE()),
('Nacho3', 'Na9638443@Xc', 'nacho.@gmail.com', '1534-6789-1911-5566', '2005-03-30', GETDATE(), GETDATE()),
('Rojas4', 'Ro9638#443Bb', 'rojas.@gmail.com', '1534-6789-1911-5567', '2005-03-30', GETDATE(), GETDATE()),
('Abril5', 'AbriL*963843', 'abril.@gmail.com', '1534-6789-1911-5568', '2005-03-30', GETDATE(), GETDATE()),
('javier6', 'Ja9638$JJaa', 'javier.@gmail.com', '1534-6789-1911-5569', '2005-03-30', GETDATE(), GETDATE()),
('rodolfo7', 'Rod#96384Yg', 'rodolfo.@gmail.com', '1534-6789-1911-5570', '2005-03-30', GETDATE(), GETDATE()),
('randall8', 'Ra9638@447G', 'randall.@gmail.com', '1534-6789-1911-5571', '2005-03-30', GETDATE(), GETDATE()),
('tatiana9', 'Tati9638!Bz', 'tatiana.@gmail.com', '1534-6789-1911-5572', '2005-03-30', GETDATE(), GETDATE()),
('paola10', 'Pao9638$zAd', 'paola.@gmail.com', '1534-6789-1911-5573', '2005-03-30', GETDATE(), GETDATE()),
('esteban11', 'Est9638*aaL', 'esteban.@gmail.com', '1534-6789-1911-5574', '2005-03-30', GETDATE(), GETDATE()),
('raul12', 'Raul9638#BbA', 'raul.@gmail.com', '1534-6789-1911-5575', '2005-03-30', GETDATE(), GETDATE()),
('valentina13', 'Vale9638@@As', 'valentina.@gmail.com', '1534-6789-1911-5576', '2005-03-30', GETDATE(), GETDATE()),
('leonel14', 'Leo9638&33a', 'leonel.@gmail.com', '1534-6789-1911-5577', '2005-03-30', GETDATE(), GETDATE()),
('ian15', 'Ian9638##zz', 'ian.@gmail.com', '1534-6789-1911-5578', '2005-03-30', GETDATE(), GETDATE()),
('sofia16', 'Sofi9638&&AA', 'sofia.@gmail.com', '1534-6789-1911-5579', '2005-03-30', GETDATE(), GETDATE()),
('mariela17', 'Mari9638$$12', 'mariela.@gmail.com', '1534-6789-1911-5580', '2005-03-30', GETDATE(), GETDATE()),
('ricardo18', 'Rica9638!!qw', 'ricardo.@gmail.com', '1534-6789-1911-5581', '2005-03-30', GETDATE(), GETDATE());
GO
--pruebita 
select * from dbo.Usuarios
GO
 --CREAR UNA FUNCION PARA VALIDAR LA COMPLEJIDAD DE CONTRASEÑAS
 --4. Cree una función para registro de contraseñas seguras (mayúscula, minúscula, números y símbolos, mínimo 12 caracteres)
 CREATE FUNCTION dbo.fnValidarComplexClaves (@PasswordUsuario NVARCHAR (50))
 RETURNS BIT
 AS
 BEGIN
 DECLARE
 @Mayusculas BIT,
 @Minusculas BIT,
 @Numeros BIT,
 @Simbolos BIT,
 @Result BIT;
 --agrega condiciones con case
 SET @Mayusculas = CASE WHEN @PasswordUsuario COLLATE LATIN1_GENERAL_BIN LIKE N'%[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]%'
 THEN 1 ELSE 0 END; -- si hay pone 1 y si no pone 0
 SET @Minusculas = CASE WHEN @PasswordUsuario COLLATE LATIN1_GENERAL_BIN LIKE N'%[abcdefghijklmnopqrstuvwxyz]%'
 THEN 1 ELSE 0 END;
  SET @Numeros = CASE WHEN @PasswordUsuario COLLATE LATIN1_GENERAL_BIN LIKE N'%[0123456789]%'
 THEN 1 ELSE 0 END;
 SET @Simbolos = CASE WHEN @PasswordUsuario COLLATE LATIN1_GENERAL_BIN LIKE N'%[$%&#*]%'
 THEN 1 ELSE 0 END;

 IF LEN (@PasswordUsuario) >= 12
 AND @Mayusculas = 1
  AND @Minusculas = 1
   AND @Numeros = 1
   AND @Simbolos = 1

   set @Result = 1;

   ELSE

   SET @Result = 0;
   RETURN @Result
   END 
   GO
 
 --drop
 drop function dbo.fnValidarComplexClaves

 --agregar CONSTRAINT PARA VALIDAR LAS CONTRASEÑAS SEGURAS
 --Modifique la tabla agregando el check de la función contraseña segura
ALTER TABLE dbo.Usuarios
WITH NOCHECK --asi no revisa las anteriores
ADD CONSTRAINT CHK_ContraSegura
CHECK (dbo.fnValidarComplexClaves(PasswordUsuario) = 1);
GO

 --Insertar datos validos en la tabla
 INSERT INTO dbo.Usuarios (NombreUsuario, PasswordUsuario)
 VALUES
 ('CROJAS', 'CRojas789#$%')
 go

 --Insertar datos invalidos en la tabla
 INSERT INTO dbo.Usuarios (NombreUsuario, PasswordUsuario)
 VALUES
 ('MFALLAS', 'Mfallas1')
 go

 SELECT * FROM dbo.Usuarios
 -----
 --CREAR MÁSCARAS PARA PROTEGER DATOS SENSIBLES
 --punto 8
--SE MUESTRAN LOS DOS PRIMEROS Y EL ÚLTIMO CARACTER DEL NOMBRE
-- MÁSCARA PARA CORREO ELECTRÓNICO – MOSTRAR 4 INICIALES Y 3 FINALES
ALTER TABLE dbo.Usuarios 
ALTER COLUMN CorreoElectronico 
ADD MASKED WITH (FUNCTION = 'PARTIAL(4,"***@gmail.",3)');
GO
-- MÁSCARA PARA TARJETA DE CRÉDITO – FORMATO: 1234-****-****-5678
ALTER TABLE dbo.Usuarios 
ALTER COLUMN TarjetaCredito 
ADD MASKED WITH (FUNCTION = 'PARTIAL(5,"-****-****-",4)');
GO

--CREAR USUARIO DE PRUEBA
--punto 10
CREATE USER Userttest1 without login;
GO

--DAR PERMISOS DE LECTURA AL USER
GRANT SELECT ON dbo.Usuarios TO Userttest1
GO

--EJECUTAR EL SELECT COMO EL USER Userttest1
EXEC ('SELECT * FROM dbo.Usuarios') AS USER = 'Userttest1'
GO
--11. Haga un select a la tabla con el usuario creado, deberá mostrar los campos enmascarados
EXECUTE AS USER = 'Userttest1';
SELECT * FROM Usuarios;
REVERT;
GO
