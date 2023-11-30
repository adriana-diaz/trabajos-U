/**Listar todos los datos de los autores**/
SELECT * FROM AUTOR;

/** Listar el nombre y la edad de los estudiantes. **/
SELECT NOMBRE,EDAD FROM ESTUDIANTE;

/**Que estudiantes pertenecen a la carrera de “Informática”. **/
SELECT * FROM ESTUDIANTES WHERE CARRERA = "Informatica"; /** uso comillas porque es algo especifico**/

/**Listar los nombres de los estudiantes cuyo apellido comience con la letra G.**/
SELECT * FROM ESTUDIANTES WHERE APELLIDO LIKE "G%" OR APELLIDO LIKE "g%";

/**¿Qué autores son de nacionalidad “USA” o “Francia”?**/
SELECT * FROM AUTOR WHERE NACIONALIDAD = 'USA' OR NACIONALIDAD = 'Francia';  /** uso comillas porque es algo especifico**/


/**¿Qué libros NO son del Área de “Internet”?**/
SELECT * FROM LIBRO WHERE AREA <> 'Internet';

/**Listar el nombre del estudiante de menor edad.**/
SELECT * FROM ESTUDIANTES WHERE EDAD  = (SELECT MIN(EDAD) FROM ESTUDIANTES);

/**Listar los títulos de los libros que debían devolverse el 10/04/2007.**/
SELECT LIBRO.TITULO FROM LIBRO JOIN Prestamo ON LIBRO.ID_LIBRO = Prestamo.ID_LIBRO WHERE Prestamo.FechaDevolucion <= '2007-04-10';

/**Hallar la suma de las edades de los estudiantes.**/
SELECT SUM(EDAD) AS SumaEdades FROM ESTUDIANTES;

/**Listar los datos de los estudiantes cuya edad es mayor al promedio.**/
SELECT * FROM ESTUDIANTES WHERE EDAD > (SELECT AVG(EDAD) FROM ESTUDIANTES);
