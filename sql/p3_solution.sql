-- Seleccione nombre, apellido y salario de todos los empleados
SELECT
  nombre,
  apellido,
  salario
FROM
  empleado;


-- Seleccione nombre, apellido y salario de todos los empleados que ganen más de 4 millones.
SELECT
  nombre,
  apellido,
  salario
FROM
  empleado
WHERE
  salario > 4000000;


-- Cuente los empleados por sexo.
SELECT
  sexo,
  COUNT(*) AS numero_de_empleados
FROM
  empleado
GROUP BY
  sexo;


-- Seleccione los empleados que no han hecho solicitud de vacaciones.
SELECT
  id,
  nombre,
  apellido
FROM
  empleado
WHERE
  id NOT IN (
    SELECT DISTINCT
      id_emp
    FROM
      vacaciones
  );


-- Seleccione los empleados que tengan más de una solicitud de vacaciones y muestre cuantas solicitudes tienen los que cumplen.
SELECT
  e.id,
  e.nombre,
  e.apellido,
  COUNT(*) AS numero_de_solicitudes
FROM
  empleado e
  JOIN vacaciones v ON e.id = v.id_emp
GROUP BY
  e.id,
  e.nombre,
  e.apellido
HAVING
  COUNT(*) > 1;


-- Determine el salario promedio de los empleados.
SELECT
  AVG(salario) AS salario_promedio
FROM
  empleado;


-- Determine la cantidad de días promedio solicitados de vacaciones por cada empleado.
SELECT
  id_emp,
  AVG(cantidad_dias) AS dias_promedio
FROM
  vacaciones
GROUP BY
  id_emp;


-- Seleccione el empleado que mayor cantidad de días de vacaciones ha solicitado, muestre el nombre, apellido y cantidad de días totales solicitados.
SELECT
  e.nombre,
  e.apellido,
  SUM(v.cantidad_dias) AS dias_totales_solicitados
FROM
  empleado e
  JOIN vacaciones v ON e.id = v.id_emp
GROUP BY
  e.id,
  e.nombre,
  e.apellido
ORDER BY
  dias_totales_solicitados DESC
LIMIT
  1;


-- Consulte la cantidad de días aprobados y rechazados por cada empleado, en caso de no tener solicitudes mostrar 0.
SELECT
  e.id AS id_empleado,
  e.nombre,
  e.apellido,
  COALESCE(
    SUM(
      CASE
        WHEN v.estado = 'A' THEN v.cantidad_dias
        ELSE 0
      END
    ),
    0
  ) AS dias_aprobados,
  COALESCE(
    SUM(
      CASE
        WHEN v.estado = 'R' THEN v.cantidad_dias
        ELSE 0
      END
    ),
    0
  ) AS dias_rechazados
FROM
  empleado e
  LEFT JOIN vacaciones v ON e.id = v.id_emp
GROUP BY
  e.id,
  e.nombre,
  e.apellido;
