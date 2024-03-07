/*
CREATE TABLE EMPLEADO
(
ID               INT,
NOMBRE           VARCHAR(50),
APELLIDO         VARCHAR(59),
SEXO             CHAR(1),
FECHA_NACIMIENTO DATE,
SALARIO          NUMERIC(10, 2)
);
CREATE TABLE VACACIONES
(
ID            INT,
ID_EMP        INT,
FECHA_INICIO  DATE,
FECHA_FIN     DATE,
ESTADO        CHAR(1),
CANTIDAD_DIAS INT
);
 */

/*EN ESTA TABLA SE ALMACENA LA INFORMACIÓN BASICA DE LOS EMPLEADOS*/
/*
INSERT INTO
  EMPLEADO (ID, NOMBRE, APELLIDO, SEXO, FECHA_NACIMIENTO, SALARIO)
VALUES
  (1, 'JUAN', 'PELAEZ', 'M', '1985-01-29', 3500000);


INSERT INTO
  EMPLEADO (ID, NOMBRE, APELLIDO, SEXO, FECHA_NACIMIENTO, SALARIO)
VALUES
  (2, 'ANDRES', 'GARCIA', 'M', '1975-05-22', 5500000);


INSERT INTO
  EMPLEADO (ID, NOMBRE, APELLIDO, SEXO, FECHA_NACIMIENTO, SALARIO)
VALUES
  (3, 'LAURA', 'PEREZ', 'F', '1991-09-10', 2500000);


INSERT INTO
  EMPLEADO (ID, NOMBRE, APELLIDO, SEXO, FECHA_NACIMIENTO, SALARIO)
VALUES
  (4, 'PEPE', 'MARTINEZ', 'M', '1987-12-01', 3800000);


INSERT INTO
  EMPLEADO (ID, NOMBRE, APELLIDO, SEXO, FECHA_NACIMIENTO, SALARIO)
VALUES
  (
    5,
    'MARGARITA',
    'CORRALES',
    'F',
    '1990-07-02',
    4500000
  );
*/