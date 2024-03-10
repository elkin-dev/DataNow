-- ¿cuántos usuarios gustan del jazz?
SELECT
  COUNT(1) AS gustan_jazz
FROM
  users
WHERE
  likejazz = 'true';


-- ¿cuántos usuarios gustan de la ópera y del rock al mismo tiempo?
SELECT
  COUNT(1) gustan_rock_jazz
FROM
  users
WHERE
  likeopera = 'true'
  AND likerock = 'true';


-- ¿cuál es el promedio, moda y mediana del total de ventas?
SELECT
  AVG(pricepaid) AS promedio_ventas,
  (
    SELECT
      pricepaid
    FROM
      (
        SELECT
          pricepaid,
          COUNT(*) AS frequency
        FROM
          sales
        GROUP BY
          pricepaid
        ORDER BY
          frequency DESC
        LIMIT
          1
      ) AS moda
  ) AS moda_ventas,
  PERCENTILE_CONT(0.5) WITHIN GROUP (
    ORDER BY
      pricepaid
  ) AS mediana_ventas
FROM
  sales;


-- ¿cuál el promedio de ventas de usuarios que gustan del rock, pero no del jazz?
SELECT
  AVG(s.pricepaid) AS promedio_ventas_rock_no_jazz
FROM
  sales s
  JOIN users u ON s.buyerid = u.userid
WHERE
  u.likerock = 'true'
  AND u.likejazz = 'false';


-----------------------------------------------------------------
CREATE TABLE
  combined_info AS
SELECT
  u.firstname AS Nombre_de_usuario,
  u.lastname AS Apellido_de_usuario,
  u.email AS Correo_de_usuario,
  e.eventname AS Nombre_del_evento,
  v.venuename AS Lugar_del_evento,
  d.caldate AS Fecha_del_evento,
  s.qtysold AS Cantidad_vendida,
  s.pricepaid AS Total_vendido
FROM
  sales s
  JOIN listing l ON s.listid = l.listid
  JOIN event e ON s.eventid = e.eventid
  JOIN users u ON s.buyerid = u.userid
  JOIN venue v ON e.venueid = v.venueid
  JOIN DATE d ON s.dateid = d.dateid;


-- Exportando la tabla
UNLOAD ('SELECT * FROM combined_info')
TO 's3://datanow-bucked-redshift/output/combined_info'
CREDENTIALS 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow'
region 'us-east-2'
DELIMITER ','
ALLOWOVERWRITE
PARALLEL OFF
CSV;
