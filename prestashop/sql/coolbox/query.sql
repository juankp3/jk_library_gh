# LISTADO DE TRANSPORTISTAS DISPONIBLES
SELECT * 
FROM ps_carrier 
WHERE deleted = 0 AND active = 1
ORDER BY position ASC


# LISTADO DE ZONAS 
SELECT * FROM ps_zone WHERE active = 1

# LISTADO DE ZONAS POR TRANSPORTISTAS
SELECT id_delivery,d.id_zone,z.name 
FROM ps_delivery as d
INNER JOIN ps_zone AS z ON z.id_zone=d.id_zone
WHERE z.active = 1 AND id_carrier = 67
GROUP BY d.id_zone
ORDER BY z.name  ASC

# LISTADO DE DISTRITOS Y TRANSPORTIASTAS
SELECT id_state,s.name AS 'name_state',iso_code,z.id_zone,z.name AS 'name_zone',
c.id_carrier,c.name AS 'name_carrier'
FROM ps_state AS s 
INNER JOIN ps_zone AS z ON s.id_zone=z.id_zone
INNER JOIN ps_carrier_zone AS cz ON cz.id_zone=z.id_zone
INNER JOIN ps_carrier AS c ON c.id_carrier = cz.id_carrier
WHERE s.active=1 AND z.id_zone = 2 AND c.id_carrier = 2



# CREANDO TABLA DE HORARIO
DROP TABLE IF EXISTS `ps_schedule`;

CREATE TABLE `ps_schedule` (
  `id_schedule` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `finish_time` time DEFAULT NULL,
  PRIMARY KEY (`id_schedule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ps_schedule` (`id_schedule`, `name`, `start_time`, `finish_time`)
VALUES
   (1,'Tu pedido llegará hoy entre las 9am y 2pm','00:00:00','12:00:00'),
   (2,'Tu pedido llegará hoy entre las 3pm y 8pm','13:00:00','19:00:00'),
   (3,'Tu pedido llegará mañana entre las 9am y 2pm','19:00:00','23:59:59'),
   (4,'Tu pedido llegará mañana entre las 9am y 8pm','00:00:00','19:00:00'),
   (5,'Tu pedido llegará mañana entre las 9am y 6pm','00:00:00','17:00:00'),
   (6,'Tu pedido llegará dentro de 2 días de 9am y 6pm','00:00:00','23:59:59'),
   (7,'Tu pedido llegará dentro de 3 días de 9am y 6pm','00:00:00','23:59:59'),
   (8,'Tu pedido llegará dentro de 4 días de 9am y 6pm','00:00:00','23:59:59'),
   (9,'Tu pedido llegará dentro de 6 días de 9am y 6pm','00:00:00','23:59:59');