-- Script de creación de la base de datos con las tablas
USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BD_PROY_ADRIANA_DANIEL')
DROP DATABASE BD_PROY_ADRIANA_DANIEL
GO

CREATE DATABASE BD_PROY_ADRIANA_DANIEL
GO

USE BD_PROY_ADRIANA_DANIEL
GO

CREATE TABLE Libros (
    ID_Libro INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Genero VARCHAR(50),
    ISBN VARCHAR(20),
    Anio_Publicacion INT,
    Dias_Prestamo INT,
    Editorial VARCHAR(100),
    Disponibilidad BIT,
    Cantidad_Prestamos INT
);

CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY,
    Nombre_Completo VARCHAR(100),
    Num_Identificacion VARCHAR(20),
    Correo_Electronico VARCHAR(100),
    Num_Telefono VARCHAR(20),
    Carrera_Universitaria VARCHAR(100)
);

CREATE TABLE Prestamos (
    ID_Prestamo INT PRIMARY KEY,
    ID_Libro INT,
    ID_Usuario INT,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    Estado_Prestamo VARCHAR(20),
    ID_Empleado INT,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE PersonalBiblioteca (
    ID_Empleado INT PRIMARY KEY,
    Nombre_Completo VARCHAR(100),
    Cargo VARCHAR(100),
    Correo_Electronico VARCHAR(100),
    Num_Telefono VARCHAR(20)
);

CREATE TABLE Multas (
 ID_Multa INT PRIMARY KEY IDENTITY,
    Fecha DATE,
    ID_Usuario INT,
    ID_Prestamo INT,
    Dias_Atraso INT,
    Monto_Diario DECIMAL(10, 2),
    Monto_Total DECIMAL(10, 2),
    Estado VARCHAR(20)
);

-- Script para agregar datos a las tablas
-- Actualizar los inserts para reflejar la cantidad de préstamos de cada libro
INSERT INTO Libros (ID_Libro, Titulo, Autor, Genero, ISBN, Anio_Publicacion, Dias_Prestamo, Editorial, Disponibilidad, Cantidad_Prestamos)
VALUES
(1, 'El señor de los anillos', 'J.R.R. Tolkien', 'Fantasía', '978-84-450-0064-0', 1954, 30, 'Minotauro', 1, 2), -- Este libro tiene 2 préstamos
(2, 'Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', '978-84-376-0494-7', 1967, 30, 'Sudamericana', 1, 1), -- Este libro tiene 1 préstamo
(3, '1984', 'George Orwell', 'Ciencia ficción', '978-84-666-6137-8', 1949, 30, 'Secker and Warburg', 1, 3); -- Este libro tiene 3 préstamos

INSERT INTO Usuarios VALUES
(1, 'Juan Pérez', '123456789', 'juan@example.com', '123-456-7890', 'Informática'),
(2, 'María García', '987654321', 'maria@example.com', '987-654-3210', 'Derecho');

INSERT INTO PersonalBiblioteca VALUES
(1, 'Carlos Rodríguez', 'Bibliotecario', 'carlos@example.com', '555-1234'),
(2, 'Laura Martínez', 'Asistente de biblioteca', 'laura@example.com', '555-5678');

-- Inserciones para la tabla Prestamos
-- Inserciones para la tabla Prestamos
INSERT INTO Prestamos (ID_Prestamo, ID_Libro, ID_Usuario, Fecha_Prestamo, Fecha_Devolucion, Estado_Prestamo, ID_Empleado)
VALUES 
(1, 1, 1, '2024-04-01', '2024-04-05', 'Prestado', 1),
(2, 2, 2, '2024-04-02', '2024-04-04', 'Prestado', 2);

-- Inserciones para la tabla Multas
INSERT INTO Multas (Fecha, ID_Usuario, ID_Prestamo, Dias_Atraso, Monto_Diario, Monto_Total, Estado)
VALUES
('2024-04-10', 1, 1, 2, 500, 1000, 'Pendiente'),
('2024-04-11', 2, 2, 3, 500, 1500, 'Pendiente');

-- Vista que lista los datos de los préstamos vencidos
GO
CREATE VIEW PrestamosVencidos AS
SELECT P.ID_Prestamo, P.Fecha_Prestamo, P.Fecha_Devolucion, L.Titulo AS Titulo_Libro, U.Nombre_Completo AS Nombre_Usuario
FROM Prestamos P
INNER JOIN Libros L ON P.ID_Libro = L.ID_Libro
INNER JOIN Usuarios U ON P.ID_Usuario = U.ID_Usuario
WHERE P.Fecha_Devolucion < GETDATE() AND P.Estado_Prestamo = 'Prestado';
GO

-- Vista que muestra los datos de los 3 libros más prestados
GO
-- Vista que muestra los datos de los libros más prestados
CREATE VIEW TopLibrosPrestados AS
SELECT Titulo, Cantidad_Prestamos AS Total_Prestamos
FROM (
    SELECT Titulo, Cantidad_Prestamos,
           ROW_NUMBER() OVER (ORDER BY Cantidad_Prestamos DESC) AS rn
    FROM Libros
) AS Subquery
WHERE rn <= 3;

GO

-- Función que retorna la cantidad de libros pendientes de entregar y vencidos para un usuario dado
CREATE FUNCTION LibrosPendientesEntregar (@ID_Usuario INT) RETURNS INT
AS
BEGIN
    DECLARE @CantidadLibros INT;
    SELECT @CantidadLibros = COUNT(*)
    FROM Prestamos
    WHERE ID_Usuario = @ID_Usuario AND Fecha_Devolucion < GETDATE() AND Estado_Prestamo = 'Prestado';
    RETURN @CantidadLibros;
END;
GO

-- Función que muestra el monto total de las multas en un rango de fechas específico
GO
CREATE FUNCTION MontoTotalMultas (@FechaInicio DATE, @FechaFin DATE) RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @MontoTotal DECIMAL(10, 2);
    SELECT @MontoTotal = SUM(Monto_Total)
    FROM Multas
    WHERE Fecha BETWEEN @FechaInicio AND @FechaFin;
    RETURN @MontoTotal;
END;
GO


-- Procedimiento almacenado para registrar préstamos
GO
-- Procedimiento almacenado para registrar préstamos
CREATE PROCEDURE RegistrarPrestamo 
    @ID_Libro INT,
    @ID_Usuario INT,
    @Fecha_Prestamo DATE,
    @Fecha_Devolucion DATE,
    @ID_Empleado INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Validaciones
        IF NOT EXISTS (SELECT 1 FROM Libros WHERE ID_Libro = @ID_Libro)
        BEGIN
            RAISERROR('El libro especificado no existe.', 16, 1);
        END;

        IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE ID_Usuario = @ID_Usuario)
        BEGIN
            RAISERROR('El usuario especificado no existe.', 16, 1);
        END;

        IF EXISTS (SELECT 1 FROM Prestamos WHERE ID_Libro = @ID_Libro AND Estado_Prestamo = 'Prestado')
        BEGIN
            RAISERROR('El libro especificado ya está prestado.', 16, 1);
        END;

        IF dbo.LibrosPendientesEntregar(@ID_Usuario) > 0
        BEGIN
            RAISERROR('El usuario tiene libros pendientes de devolver.', 16, 1);
        END;

        -- Registro del préstamo
        INSERT INTO Prestamos (ID_Libro, ID_Usuario, Fecha_Prestamo, Fecha_Devolucion, Estado_Prestamo, ID_Empleado)
        VALUES (@ID_Libro, @ID_Usuario, @Fecha_Prestamo, @Fecha_Devolucion, 'Prestado', @ID_Empleado);

        -- Cambio del estado del libro
        UPDATE Libros SET Disponibilidad = 0 WHERE ID_Libro = @ID_Libro;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END;
        
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();
        
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;

GO

-- Trigger para generar multas al devolver un libro fuera del plazo establecido
GO
CREATE TRIGGER GenerarMulta
ON Prestamos
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Estado_Prestamo) -- Solo si se actualiza el estado del préstamo
    BEGIN
        DECLARE @DiasAtraso INT;
        DECLARE @MontoMulta DECIMAL(10, 2);
        DECLARE @ID_Prestamo INT;
        
        SELECT @DiasAtraso = DATEDIFF(DAY, Fecha_Devolucion, GETDATE()), @ID_Prestamo = ID_Prestamo
        FROM inserted
        WHERE Estado_Prestamo = 'Devuelto';
        
        IF @DiasAtraso > 0
        BEGIN
            SET @MontoMulta = @DiasAtraso * 500;
            INSERT INTO Multas (Fecha, ID_Usuario, ID_Prestamo, Dias_Atraso, Monto_Diario, Monto_Total, Estado)
            VALUES (GETDATE(), (SELECT ID_Usuario FROM inserted), @ID_Prestamo, @DiasAtraso, 500, @MontoMulta, 'Pendiente');
        END;
    END;
END;
GO

-- Pruebas de los procedimientos, funciones y triggers
-- Probar la vista de préstamos vencidos
SELECT * FROM PrestamosVencidos;

-- Probar la vista de los 3 libros más prestados
SELECT * FROM TopLibrosPrestados;

-- Probar la función de cantidad de libros pendientes de entregar y vencidos para un usuario dado
SELECT dbo.LibrosPendientesEntregar(2) AS Libros_Pendientes;


-- Probar la función de monto total de multas en un rango de fechas específico
SELECT dbo.MontoTotalMultas('2024-01-01', '2024-05-31') AS Monto_Total_Multas;

-- Probar el procedimiento almacenado de registro de préstamo
EXEC RegistrarPrestamo 1, 1, '2024-04-01', '2024-04-08', 1;

-- Verificar la tabla de multas para comprobar si se generó la multa
SELECT * FROM Multas;

-- Actualiza un registro en la tabla Prestamos para activar el disparador
UPDATE Prestamos
SET Estado_Prestamo = 'Devuelto'
WHERE ID_Prestamo = 1;

