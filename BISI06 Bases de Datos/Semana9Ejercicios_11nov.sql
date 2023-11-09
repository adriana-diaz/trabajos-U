1.	Mostrar todos los datos de los empleados de nuestra tabla Empleados.
SELECT * FROM EMPLEADO

2.	Mostrar el apellido, oficio, salario, y el salario anual para aquellos empleados con comisión mayor de 100.000.
SELECT APELLIDO, OFICIO,
SALARIO, SALARIO * 12 AS 'SALARIO ANUAL' FROM EMPLEADO
WHERE COMISION > 100000

3.	Mostrar el apellido, oficio, salario, y el salario anual para aquellos empleados, pero para aquellos empleados que su salario anual supere los 2.200.000.
SELECT APELLIDO, OFICIO,
SALARIO, SALARIO * 12 AS 'SALARIO ANUAL' FROM EMPLEADO
WHERE SALARIO * 12 > 2200000

4.	Mostrar el apellido, oficio, salario, y el salario anual para aquellos empleados, pero para aquellos empleados que sumen entre salario anual y comisión los 3 millones.
SELECT APELLIDO, OFICIO,
SALARIO, SALARIO * 12 AS 'SALARIO ANUAL' FROM EMPLEADO
WHERE SALARIO * 12 + comision > 3.000.000

5.	Mostrar todos los datos de empleados ordenados por departamento y dentro de este por oficio para tener una visión jerárquica.
SELECT * FROM EMPLEADO ORDER BY DEPT_NO, OFICIO

6.	Mostrar todas las salas para el hospital 45.
SELECT * FROM SALA WHERE COD_HOSPITAL = 45

7.	Visualizar los empleados de la tabla EMPLEADO que no ingresaron entre el 01/01/80 y el 12/12/82.
SELECT * FROM EMPLEADO WHERE FECHA_INGRESO NOT BETWEEN '01/01/1980' AND '31/12/1982'

8.	Mostrar los nombres de los departamentos situados en Madrid o en Barcelona.
SELECT DPTO_NOMBRE FROM DEPARTAMENTO WHERE LOCALIZACION IN ('MADRID','BARCELONA')

9.	Mostrar aquellos empleados con fecha de ingreso posterior al 1 de Julio de 1985.
SELECT * FROM EMPLEADO
WHERE FECHA_INGRESO > '01-07-1985'

10.	Mostrar aquellos empleados con salario entre 150.000 y 400.000.
SELECT * FROM EMPLEADO
WHERE FECHA_INGRESO > '01-07-1985'
AND SALARIO BETWEEN 150000 AND 4000000

11.	Mostrar aquellos empleados con salario entre 150.000 y 400.000, pero también incluimos aquellos que no siendo analista pertenecen al departamento 20.
SELECT * FROM EMPLEADO
WHERE FECHA_INGRESO > '01-07-1985'
AND SALARIO BETWEEN 150000 AND 4000000
OR (OFICIO <> 'ANALISTA' AND NUM_DPTO = 20)

12.	Mostrar aquellos empleados cuyo apellido termine en ‘Z’ ordenados por departamento, y dentro de este por antigüedad.
SELECT * FROM EMPLEADO
WHERE APELLIDO LIKE '%Z'
ORDER BY NUM_DPTO, FECHA_INGRESO ASC

13.	Mostrar aquellos empleados cuyo apellido termine en ‘Z’ ordenados por departamento, y dentro de este por antigüedad que superen los 200000 mensuales.
SELECT * FROM EMPLEADO
WHERE APELLIDO LIKE '%Z'
AND SALARIO > 200000
ORDER BY NUM_DPTO, FECHA_INGRESO ASC

14.	Mostrar aquellos empleados cuyo apellido termine en ‘Z’ ordenados por departamento, y dentro de este por antigüedad cuyos salarios estén entre los 100000 y 200000 mensuales.
SELECT * FROM EMPLEADO
WHERE APELLIDO LIKE '%Z'
AND SALARIO >= 100000
AND SALARIO <= 200000
ORDER BY NUM_DPTO, FECHA_INGRESO ASC

15.	Mostrar todos los empleados cuyo oficio no sea analista.
SELECT * FROM EMPLEADO
WHERE OFICIO <> 'ANALISTA'

16.	Mostrar todos los empleados cuyo oficio no sea analista ordenados por oficio, y dentro de este por salario.
SELECT * FROM EMPLEADO
WHERE OFICIO <> 'ANALISTA'
ORDER BY OFICIO, SALARIO DESC

17.	Mostrar todos los empleados cuyo oficio no sea analista, y el número de empleado no este entre 7600 y 7900 ordenados por oficio, y dentro de este por salario.
SELECT * FROM EMPLEADO
WHERE OFICIO <> 'ANALISTA'
AND ID_EMPLEADO NOT BETWEEN 7600 AND 7900
ORDER BY OFICIO, SALARIO DESC

18.	Mostrar los distintos oficios de los empleados.
SELECT DISTINCT OFICIO FROM EMPLEADO

19.	Mostrar los distintos nombres de sala.
SELECT DISTINCT NOMBRE FROM SALA

20.	Justificar el resultado de la siguiente consulta SELECT APELLIDO DISTINCT NUM_DPTO FROM EMPLEADO, Indicar que ocurre y modificarla para que todo este bien.

SELECT DISTINCT APELLIDO,NUM_DPTO FROM EMP

21.	Seleccionar las distintas especialidades que ejercen los médicos, ordenados por especialidad y apellido.
SELECT DISTINCT ESPECIALIDAD, APELLIDO
FROM DOCTOR
ORDER BY ESPECIALIDAD, APELLIDO
