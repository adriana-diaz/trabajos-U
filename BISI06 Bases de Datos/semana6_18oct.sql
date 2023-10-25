/** SE CREA LA BASE DE DATOS**/
CREATE DATABASE Semana6_Adriana
GO

 

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE Semana6_Adriana
GO

 

/** INSTRUCCION QUE PERMITE CREAR LOS DIAGRAMAS**/
Alter authorization on database::Semana6_Adriana to sa 

 


/*Establece el formato de la fecha en dia/mes/año, 
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish

 


/*Instruccion que indica que la proxima consulta 
se ejecutará hasta que termine de ejecutarse la sentencia anterior*/
GO 