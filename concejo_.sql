# SQL Manager 2010 for MySQL 4.5.0.9
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : concejo_


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `concejo_`;

CREATE DATABASE `concejo_`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `concejo_`;

SET sql_mode = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

#
# Structure for the `estado_exp` table : 
#

DROP TABLE IF EXISTS `estado_exp`;

CREATE TABLE `estado_exp` (
  `id_estado_exp` int(11) NOT NULL AUTO_INCREMENT,
  `estado_exp` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for the `organismos` table : 
#

DROP TABLE IF EXISTS `organismos`;

CREATE TABLE `organismos` (
  `id_org` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_org` int(11) NOT NULL,
  `nombre_org` varchar(50) NOT NULL,
  PRIMARY KEY (`id_org`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

#
# Structure for the `tipo_expediente` table : 
#

DROP TABLE IF EXISTS `tipo_expediente`;

CREATE TABLE `tipo_expediente` (
  `id_tipo_exp` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_exp` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `expediente` table : 
#

DROP TABLE IF EXISTS `expediente`;

CREATE TABLE `expediente` (
  `id_exp` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_exp` int(11) NOT NULL,
  `fecha_ini_exp` date NOT NULL,
  `referencia_exp` varchar(100) DEFAULT 'SIN REFERENCIAS',
  `observaciones_exp` varchar(100) DEFAULT 'SIN OBSERVACIONES',
  `id_tipo_exp` int(11) NOT NULL,
  `id_estado_exp` int(11) NOT NULL,
  `estado_pen_acp` int(11) NOT NULL,
  `id_org` int(11) NOT NULL,
  `cantidad_folios` int(11) NOT NULL,
  PRIMARY KEY (`id_exp`),
  UNIQUE KEY `num_exp` (`num_exp`,`fecha_ini_exp`),
  KEY `id_tipo_exp` (`id_tipo_exp`),
  KEY `id_estado_exp` (`id_estado_exp`),
  KEY `id_org` (`id_org`),
  CONSTRAINT `expediente_fk` FOREIGN KEY (`id_tipo_exp`) REFERENCES `tipo_expediente` (`id_tipo_exp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expediente_fk1` FOREIGN KEY (`id_estado_exp`) REFERENCES `estado_exp` (`id_estado_exp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expediente_fk2` FOREIGN KEY (`id_org`) REFERENCES `organismos` (`id_org`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `InsertarExpediente` BEFORE INSERT ON `expediente`
  FOR EACH ROW
INSERT INTO expediente_audit (id_exp,num_exp_nueva,num_exp_anterior,fecha_ini_exp_nueva,fecha_ini_exp_anterior,referencia_exp_nueva,referencia_exp_anterior,observaciones_exp_nueva,observaciones_exp_anterior,id_tipo_exp_nueva,id_tipo_exp_anterior,id_estado_exp_nueva,id_estado_exp_anterior,estado_pen_acp_nueva,estado_pen_acp_anterior,id_org_nueva,id_org_anterior,cantidad_folios_nueva,cantidad_folios_anterior,usuario,fecha,accion) VALUES (NEW.id_exp,NEW.num_exp,DEFAULT,NEW.fecha_ini_exp,DEFAULT,NEW.referencia_exp,DEFAULT,NEW.observaciones_exp,DEFAULT,NEW.id_tipo_exp,DEFAULT,NEW.id_estado_exp,DEFAULT,NEW.estado_pen_acp,DEFAULT,NEW.id_org,DEFAULT,NEW.cantidad_folios,DEFAULT,USER(),NOW(),'Inserto')$$

CREATE DEFINER = 'root'@'localhost' TRIGGER `ModificarExpediente` BEFORE UPDATE ON `expediente`
  FOR EACH ROW
INSERT INTO expediente_audit (id_exp,num_exp_nueva,num_exp_anterior,fecha_ini_exp_nueva,fecha_ini_exp_anterior,referencia_exp_nueva,referencia_exp_anterior,observaciones_exp_nueva,observaciones_exp_anterior,id_tipo_exp_nueva,id_tipo_exp_anterior,id_estado_exp_nueva,id_estado_exp_anterior,estado_pen_acp_nueva,estado_pen_acp_anterior,id_org_nueva,id_org_anterior,cantidad_folios_nueva,cantidad_folios_anterior,usuario,fecha,accion) VALUES (OLD.id_exp,NEW.num_exp,OLD.num_exp,NEW.fecha_ini_exp,OLD.fecha_ini_exp,NEW.referencia_exp,OLD.referencia_exp,NEW.observaciones_exp,OLD.observaciones_exp,NEW.id_tipo_exp,OLD.id_tipo_exp,NEW.id_estado_exp,OLD.id_estado_exp,NEW.estado_pen_acp,OLD.estado_pen_acp,NEW.id_org,OLD.id_org,NEW.cantidad_folios,OLD.cantidad_folios,USER(),NOW(),'Modifico')$$

CREATE DEFINER = 'root'@'localhost' TRIGGER `EliminarExpediente` BEFORE DELETE ON `expediente`
  FOR EACH ROW
INSERT INTO expediente_audit (id_exp,num_exp_nueva,num_exp_anterior,fecha_ini_exp_nueva,fecha_ini_exp_anterior,referencia_exp_nueva,referencia_exp_anterior,observaciones_exp_nueva,observaciones_exp_anterior,id_tipo_exp_nueva,id_tipo_exp_anterior,id_estado_exp_nueva,id_estado_exp_anterior,estado_pen_acp_nueva,estado_pen_acp_anterior,id_org_nueva,id_org_anterior,cantidad_folios_nueva,cantidad_folios_anterior,usuario,fecha,accion) VALUES (OLD.id_exp,DEFAULT,OLD.num_exp,DEFAULT,OLD.fecha_ini_exp,DEFAULT,OLD.referencia_exp,DEFAULT,OLD.observaciones_exp,DEFAULT,OLD.id_tipo_exp,DEFAULT,OLD.id_estado_exp,DEFAULT,OLD.estado_pen_acp,DEFAULT,OLD.id_org,DEFAULT,OLD.cantidad_folios,USER(),NOW(),'Elimino')$$

DELIMITER ;

#
# Structure for the `adjunto` table : 
#

DROP TABLE IF EXISTS `adjunto`;

CREATE TABLE `adjunto` (
  `id_cabecera` bigint(20) NOT NULL,
  `id_adjunto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_cabecera`,`id_adjunto`),
  KEY `id_cabecera` (`id_cabecera`),
  KEY `id_adjunto` (`id_adjunto`),
  CONSTRAINT `adjunto_fk` FOREIGN KEY (`id_cabecera`) REFERENCES `expediente` (`id_exp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adjunto_fk1` FOREIGN KEY (`id_adjunto`) REFERENCES `expediente` (`id_exp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `InsertarAdjunto` BEFORE INSERT ON `adjunto`
  FOR EACH ROW
INSERT INTO adjunto_audit (id_cabecera_nueva,id_cabecera_anterior,id_adjunto_nueva,id_adjunto_anterior,usuario,fecha,accion)
VALUES (NEW.id_cabecera,DEFAULT,NEW.id_adjunto,DEFAULT,USER(),NOW(),'Inserto')$$

CREATE DEFINER = 'root'@'localhost' TRIGGER `ModificarAdjunto` BEFORE UPDATE ON `adjunto`
  FOR EACH ROW
INSERT INTO adjunto_audit (id_cabecera_nueva,id_cabecera_anterior,id_adjunto_nueva,id_adjunto_anterior,usuario,fecha,accion)
VALUES (NEW.id_cabecera,OLD.id_cabecera,NEW.id_adjunto,OLD.id_adjunto,USER(),NOW(),'Modifico')$$

CREATE DEFINER = 'root'@'localhost' TRIGGER `EliminarAdjunto` BEFORE DELETE ON `adjunto`
  FOR EACH ROW
INSERT INTO adjunto_audit (id_cabecera_nueva,id_cabecera_anterior,id_adjunto_nueva,id_adjunto_anterior,usuario,fecha,accion)
VALUES (DEFAULT,OLD.id_cabecera,DEFAULT,OLD.id_adjunto,USER(),NOW(),'Elimino')$$

DELIMITER ;

#
# Structure for the `adjunto_audit` table : 
#

DROP TABLE IF EXISTS `adjunto_audit`;

CREATE TABLE `adjunto_audit` (
  `id_adjunto_audit` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cabecera_nueva` bigint(20) DEFAULT '0',
  `id_cabecera_anterior` bigint(20) DEFAULT '0',
  `id_adjunto_nueva` bigint(20) DEFAULT '0',
  `id_adjunto_anterior` bigint(20) DEFAULT '0',
  `usuario` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_adjunto_audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `adjunto_ini` table : 
#

DROP TABLE IF EXISTS `adjunto_ini`;

CREATE TABLE `adjunto_ini` (
  `id_adjunto` int(11) NOT NULL AUTO_INCREMENT,
  `adjunto` varchar(20) NOT NULL,
  PRIMARY KEY (`id_adjunto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `comision` table : 
#

DROP TABLE IF EXISTS `comision`;

CREATE TABLE `comision` (
  `id_comision` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_comision` varchar(100) NOT NULL,
  `nombre_encargado_comision` varchar(20) NOT NULL,
  `apellido_encargado_comision` varchar(20) NOT NULL,
  PRIMARY KEY (`id_comision`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Structure for the `expediente_audit` table : 
#

DROP TABLE IF EXISTS `expediente_audit`;

CREATE TABLE `expediente_audit` (
  `id_exp_audit` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_exp` bigint(20) DEFAULT NULL,
  `num_exp_nueva` int(11) DEFAULT '0',
  `num_exp_anterior` int(11) DEFAULT '0',
  `fecha_ini_exp_nueva` date DEFAULT '2000-01-01',
  `fecha_ini_exp_anterior` date DEFAULT '2000-01-01',
  `referencia_exp_nueva` varchar(100) DEFAULT 'VACIO',
  `referencia_exp_anterior` varchar(100) DEFAULT 'VACIO',
  `observaciones_exp_nueva` varchar(100) DEFAULT 'VACIO',
  `observaciones_exp_anterior` varchar(100) DEFAULT 'VACIO',
  `id_tipo_exp_nueva` int(11) DEFAULT '0',
  `id_tipo_exp_anterior` int(11) DEFAULT '0',
  `id_estado_exp_nueva` int(11) DEFAULT '0',
  `id_estado_exp_anterior` int(11) DEFAULT '0',
  `estado_pen_acp_nueva` int(11) DEFAULT '100',
  `estado_pen_acp_anterior` int(11) DEFAULT '100',
  `id_org_nueva` int(11) DEFAULT '0',
  `id_org_anterior` int(11) DEFAULT '0',
  `cantidad_folios_nueva` int(11) DEFAULT '0',
  `cantidad_folios_anterior` int(11) DEFAULT '0',
  `usuario` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_exp_audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `tipo_iniciador` table : 
#

DROP TABLE IF EXISTS `tipo_iniciador`;

CREATE TABLE `tipo_iniciador` (
  `id_tipo_ini` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_ini` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_ini`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for the `iniciador` table : 
#

DROP TABLE IF EXISTS `iniciador`;

CREATE TABLE `iniciador` (
  `id_ini` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_ini` varchar(20) NOT NULL,
  `apellido_ini` varchar(20) NOT NULL,
  `dni_ini` varchar(20) NOT NULL,
  `id_tipo_ini` int(11) NOT NULL,
  `direccion_ini` varchar(50) NOT NULL DEFAULT '\r\n',
  `barrio_ini` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ini`),
  KEY `id_tipo_ini` (`id_tipo_ini`),
  CONSTRAINT `iniciador_fk` FOREIGN KEY (`id_tipo_ini`) REFERENCES `tipo_iniciador` (`id_tipo_ini`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `ini_x_exp` table : 
#

DROP TABLE IF EXISTS `ini_x_exp`;

CREATE TABLE `ini_x_exp` (
  `id_ini_exp` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ini` bigint(20) NOT NULL,
  `id_exp` bigint(20) NOT NULL,
  `id_adjunto` int(11) NOT NULL,
  PRIMARY KEY (`id_ini_exp`),
  KEY `id_ini` (`id_ini`),
  KEY `id_exp` (`id_exp`),
  KEY `id_adjunto` (`id_adjunto`),
  CONSTRAINT `ini_x_exp_fk` FOREIGN KEY (`id_ini`) REFERENCES `iniciador` (`id_ini`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ini_x_exp_fk1` FOREIGN KEY (`id_exp`) REFERENCES `expediente` (`id_exp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ini_x_exp_fk2` FOREIGN KEY (`id_adjunto`) REFERENCES `adjunto_ini` (`id_adjunto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `movimiento` table : 
#

DROP TABLE IF EXISTS `movimiento`;

CREATE TABLE `movimiento` (
  `fecha_movimiento` datetime NOT NULL,
  `id_exp` bigint(20) NOT NULL,
  `id_comision_actual` int(11) NOT NULL,
  `id_comision_anterior` int(11) NOT NULL,
  `id_movimiento` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_exp` (`id_exp`),
  KEY `id_comision_actual` (`id_comision_actual`),
  KEY `id_comision_anterior` (`id_comision_anterior`),
  CONSTRAINT `movimiento_fk` FOREIGN KEY (`id_exp`) REFERENCES `expediente` (`id_exp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimiento_fk1` FOREIGN KEY (`id_comision_actual`) REFERENCES `comision` (`id_comision`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimiento_fk2` FOREIGN KEY (`id_comision_anterior`) REFERENCES `comision` (`id_comision`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER `InsertarMovimiento` BEFORE INSERT ON `movimiento`
  FOR EACH ROW
INSERT INTO movimiento_audit (id_movimiento,fecha_movimiento_nueva,fecha_movimiento_anterior,id_exp_nueva,id_exp_anterior,id_comision_actual_nueva,id_comision_actual_anterior,id_comision_anterior_nueva,id_comision_anterior_anterior,usuario,fecha,accion)
VALUES (NEW.id_movimiento,NEW.fecha_movimiento,DEFAULT,NEW.id_exp,DEFAULT,NEW.id_comision_actual,DEFAULT,NEW.id_comision_anterior,DEFAULT,USER(),NOW(),'Inserto')$$

CREATE DEFINER = 'root'@'localhost' TRIGGER `ModificarMovimiento` BEFORE UPDATE ON `movimiento`
  FOR EACH ROW
INSERT INTO movimiento_audit (id_movimiento,fecha_movimiento_nueva,fecha_movimiento_anterior,id_exp_nueva,id_exp_anterior,id_comision_actual_nueva,id_comision_actual_anterior,id_comision_anterior_nueva,id_comision_anterior_anterior,usuario,fecha,accion) 
VALUES (OLD.id_movimiento,NEW.fecha_movimiento,OLD.fecha_movimiento,NEW.id_exp,OLD.id_exp,NEW.id_comision_actual,OLD.id_comision_actual,NEW.id_comision_anterior,OLD.id_comision_anterior,USER(),NOW(),'Modifico')$$

CREATE DEFINER = 'root'@'localhost' TRIGGER `EliminarMovimiento` BEFORE DELETE ON `movimiento`
  FOR EACH ROW
INSERT INTO movimiento_audit (id_movimiento,fecha_movimiento_nueva,fecha_movimiento_anterior,id_exp_nueva,id_exp_anterior,id_comision_actual_nueva,id_comision_actual_anterior,id_comision_anterior_nueva,id_comision_anterior_anterior,usuario,fecha,accion)
VALUES (OLD.id_movimiento,DEFAULT,OLD.fecha_movimiento,DEFAULT,OLD.id_exp,DEFAULT,OLD.id_comision_actual,DEFAULT,OLD.id_comision_anterior,USER(),NOW(),'Elimino')$$

DELIMITER ;

#
# Structure for the `movimiento_audit` table : 
#

DROP TABLE IF EXISTS `movimiento_audit`;

CREATE TABLE `movimiento_audit` (
  `id_movimiento_audit` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_movimiento` bigint(20) DEFAULT NULL,
  `fecha_movimiento_nueva` datetime DEFAULT '2000-01-01 00:00:00',
  `fecha_movimiento_anterior` datetime DEFAULT '2000-01-01 00:00:00',
  `id_exp_nueva` bigint(20) DEFAULT '0',
  `id_exp_anterior` bigint(20) DEFAULT '0',
  `id_comision_actual_nueva` int(11) DEFAULT '0',
  `id_comision_actual_anterior` int(11) DEFAULT '0',
  `id_comision_anterior_nueva` int(11) DEFAULT '0',
  `id_comision_anterior_anterior` int(11) DEFAULT '0',
  `usuario` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_movimiento_audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `usuario_usuario` table : 
#

DROP TABLE IF EXISTS `usuario_usuario`;

CREATE TABLE `usuario_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `usuario` int(11) NOT NULL,
  `id_comision` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_comision` (`id_comision`),
  CONSTRAINT `usuario_fk` FOREIGN KEY (`id_comision`) REFERENCES `comision` (`id_comision`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for the `tipo_expediente` table  (LIMIT 0,500)
#

INSERT INTO `tipo_expediente` (`id_tipo_exp`, `tipo_exp`) VALUES 
  (1,'ORDENANZA'),
  (2,'DECLARACION'),
  (3,'RESOLUCION'),
  (4,'INFORMES'),
  (5,'CONDONACION'),
  (6,'PROYECTO'),
  (7,'EXPEDIENTE');
COMMIT;

#
# Data for the `estado_exp` table  (LIMIT 0,500)
#

INSERT INTO `estado_exp` (`id_estado_exp`, `estado_exp`) VALUES 
  (1,'NUEVO'),
  (2,'APROBADO'),
  (3,'RECHAZADO'),
  (4,'DERIVADO');
COMMIT;

#
# Data for the `organismos` table  (LIMIT 0,500)
#

INSERT INTO `organismos` (`id_org`, `codigo_org`, `nombre_org`) VALUES 
  (2,1,'SECRETARIA GENERAL DE LA GOBERNACION'),
  (3,2,'DELEGACION CASA DE SALTA'),
  (4,4,'DIRECCIÓN GENERAL DE PERSONAL'),
  (5,5,'SECRETARÍA DE PRENSA, CEREMONIAL Y COMUNICACIONES'),
  (6,6,'TESORERÍA GENERAL DE LA PROVINCIA'),
  (7,7,'FISCALÍA DE ESTADO'),
  (8,8,'ESCRIBANÍA DE GOBIERNO'),
  (9,9,'SUB-SECRETARÍA AREA DE FRONTERA'),
  (10,10,'SECRETARÍA DE PLANEAMIENTO Y CONTROL DE GESTIÓN'),
  (11,11,'MINISTERIO DE FINANZAS Y OBRAS PUBLICAS'),
  (12,13,'PROVIPO'),
  (13,16,'SECRETARÍA DE LA GOBERNACIÓN DE TURISMO'),
  (14,17,'DIRECCIÓN GENERAL DE ESTADÍSTICAS Y CENSOS'),
  (15,18,'DIRECCIÓN GENERAL DE INMUEBLES (DPTO. TÉCNICO)'),
  (16,20,'DIRECCIÓN GENERAL DE TRANSPORTE'),
  (17,21,'CONTADURÍA GENERAL DE LA PROVINCIA'),
  (18,22,'DIRECCIÓN GENERAL DE RENTAS'),
  (19,26,'FONDO ESPECIAL DEL TABACO'),
  (20,29,'DIRECCIÓN GENERAL DE INMUEBLES (MESA CENTRAL)'),
  (21,30,'DIRECCIÓN GENERAL DE INMUEBLES (DPTO. JURÍDICO)'),
  (22,31,'DIRECCIÓN GENERAL DE AVIACIÓN CIVIL'),
  (23,33,'DIRECCIÓN DE VIALIDAD'),
  (24,34,'ADMINISTRACIÓN GENERAL DE AGUAS DE SALTA'),
  (25,35,'BANCO DE PRÉSTAMOS Y ASISTENCIA SOCIAL'),
  (26,36,'DIRECCIÓN PROVINCIAL DE ENERGÍA'),
  (27,37,'DIRECCIÓN GENERAL DE OBRAS SANITARIAS'),
  (28,38,'DIRECCIÓN GENERAL DE INDUSTRIA'),
  (29,39,'BANCO PROVINCIAL DE SALTA'),
  (30,41,'MINISTERIO DE GOBIERNO (MESA CENTRAL)'),
  (31,43,'HOGAR BUEN PASTOR'),
  (32,44,'POLICÍA DE SALTA'),
  (33,46,'DIRECCIÓN GENERAL DE EDUCACIÓN SUPERIOR'),
  (34,47,'SECRETARÍA DE EDUCACIÓN'),
  (35,49,'DIRECCIÓN GENERAL DE COMUNICACIONES'),
  (36,50,'DIRECCIÓN GENERAL DE INSTITUTOS PENALES'),
  (37,54,'INSPECCIÓN GENERAL DE PERSONAS JURÍDICAS'),
  (38,55,'ARCHIVO DE LA PROVINCIA'),
  (39,57,'BIBLIOTECA PRIVADA \"DR. VICTORINO DE LA PLAZA\"'),
  (40,58,'BOLETÍN OFICIAL DE LA PROVINCIA'),
  (41,59,'DIRECCIÓN GENERAL DE CULTURA'),
  (42,60,'ARCHIVO Y BIBLIOTECA HISTÓRICOS'),
  (43,62,'MUSEO DE ANTROPOLOGÍA DE SALTA'),
  (44,63,'MUSEO DE BELLAS ARTES'),
  (45,64,'DIRECCIÓN PROVINCIAL DEL TRABAJO'),
  (46,65,'IMPRENTA DE LA LEGISLATURA'),
  (47,517,'SAETA'),
  (48,69,'DIRECCIÓN DE PROMOCIÓN SOCIAL'),
  (49,70,'HOTEL TERMAS \"ROSARIO DE LA FRONTERA\"'),
  (50,71,'DIRECCIÓN GENERAL DE COOPERATIVAS Y MUTUALIDADES'),
  (51,72,'DIRECCIÓN DE DEPORTES Y RECREACIÓN'),
  (52,73,'CAJA DE PREVISIÓN SOCIAL'),
  (53,74,'INSTITUTO PROVINCIAL DE SEGUROS'),
  (54,75,'HOSPITAL \"CHRISTOFREDO JAKOB\"'),
  (55,77,'DIRECCIÓN GENERAL DE FAMILIA Y MINORIDAD'),
  (56,78,'DIRECCIÓN ZONA NORTE'),
  (57,79,'DIRECCIÓN ZONA SUR'),
  (58,80,'DIRECCIÓN ZONA OESTE'),
  (59,81,'TRIBUNAL DE CUENTAS DE LA PROVINCIA'),
  (60,83,'DIRECCIÓN GENERAL DE INFORMÁTICA PROVINCIAL'),
  (61,85,'PODER JUDICIAL'),
  (62,87,'HOSPITAL MATERNO INFANTIL'),
  (63,88,'DIRECCIÓN PROVINCIAL DE DEFENSA CIVIL'),
  (64,89,'HOSPITAL SAN BERNARDO'),
  (65,90,'CÁMARA DE SENADORES'),
  (66,91,'CÁMARA DE DIPUTADOS'),
  (67,97,'HOSPITAL COLONIA SANTA ROSA'),
  (68,98,'HOSPITAL EL GALPÓN'),
  (69,101,'DIRECCIÓN DE CEREMONIAL Y AUDIENCIAS'),
  (70,104,'PATRONATO DE PRESOS Y LIBERADOS'),
  (71,107,'DIRECCIÓN DE ACCIÓN CULTURAL'),
  (72,111,'ENTE AUTÁRQUICO PARQUE INDUSTRIAL'),
  (73,115,'DIRECCIÓN GENERAL DE ORGANIZACIÓN Y SISTEMAS'),
  (74,120,'INSTITUTO PROVINCIAL DEL ABORIGEN'),
  (75,121,'MINISTERIO DE SALUD PÚBLICA'),
  (76,122,'HOSPITAL DE SALVADOR MAZZA'),
  (77,123,'HOSPITAL DE AGUARAY'),
  (78,124,'HOSPITAL DE SANTA VICTORIA ESTE'),
  (79,129,'DIRECCIÓN GENERAL DE EDUCACIÓN PRIVADA'),
  (80,134,'HOSPITAL DEL MILAGRO'),
  (81,135,'CONCEJO'),
  (82,137,'SECRETARÍA DE INGRESOS PÉBLICOS'),
  (83,139,'SECRETARÍA DE LA FUNCIÓN PÉBLICA'),
  (84,140,'MINISTERIO DE EDUCACIÓN'),
  (85,141,'SECRETARÍA DE FINANZAS'),
  (86,142,'SECRETARÍA DE LA PRODUCCIÓN'),
  (87,143,'SECRETARÍA DE MINERÍA Y RECURSOS ENERGÉTICO'),
  (88,144,'SECRETARÍA DE ESTADO DE GOBIERNO'),
  (89,145,'SECRETARÍA DE DERECHOS HUMANOS'),
  (90,146,'SECRETARÍA DEL SEGURO SOCIAL'),
  (91,147,'SECRETARÍA DE SERVICIOS DE SALUD'),
  (92,148,'SECRETARÍA DE GESTIÓN EDUCATIVA'),
  (93,149,'SECRETARÍA DE LA GOBERNACIÓN DE SEGURIDAD'),
  (94,150,'SUBSECRETARÍA DE PROTECCIÓN A LA COMUNIDAD'),
  (95,151,'SUBSECRETARÍA DE SEGURIDAD Y PLANIFICACIÓN'),
  (96,152,'SECRETARÍA DE LA GOBERNACIÓN DE DESARROLLO SOCIAL'),
  (97,153,'SUBSECRETARÍA DE DESARROLLO FAMILIAR'),
  (98,154,'SUBSECRETARÍA DE PROGRAMACIÓN Y ACCIÓN SOCIAL'),
  (99,155,'SUBSECRETARÍA DE DEPORTES Y RECREACIÓN'),
  (100,156,'DELEGACIÓN DE ADMINISTRACIÓN DE LA GOBERNACIÓN'),
  (101,159,'DIRECCIÓN DE PERSONAL - MINISTERIO DE EDUCACIÓN'),
  (102,164,'COORDINACIÓN GENERAL (MINISTERIO DE LA PRODUCCIÓN)'),
  (103,165,'UNIDAD DE EMPLEO (MINISTERIO DE LA PRODUCCIÓN)'),
  (104,166,'UNIDAD EJECUTORA (MINISTERIO DE LA PRODUCCIÓN)'),
  (105,167,'\"HOSPITAL \"\"DR. VICENTE ARROYABE\"\" (PICHANAL)\"'),
  (106,168,'HOSPITAL MORILLO'),
  (107,170,'\"HOSPITAL \"\"SAN VICENTE DE PAUL\"\" (ORÁN)\"'),
  (108,171,'\"HOSPITAL \"\"PRESIDENTE JUAN D. PERÓN\"\" (TARTAGAL)\"'),
  (109,172,'HOSPITAL RIVADAVIA BANDA SUD,'),
  (110,173,'HOSPITAL GRAL. MOSCONI'),
  (111,174,'HOSPITAL HIPÓLITO IRIGOYEN'),
  (112,175,'HOSPITAL ALTO LA SIERRA'),
  (113,176,'HOSPITAL LAS LAJITAS'),
  (114,177,'\"HOSPITAL \"\"DR. OSCAR H. COSTAS\"\" (J.V.GONZÁLEZ)\"'),
  (115,178,'HOSPITAL EL QUEBRACHAL'),
  (116,180,'\"HOSPITAL \"\"EL CARMEN\"\" (METÁN)\"'),
  (117,181,'\"HOSPITAL \"\"SANTA TERESA\"\" (EL TALA)\"'),
  (118,183,'HOSPITAL APOLINARIO SARAVIA'),
  (119,184,'HOSPITAL EL POTRERO'),
  (120,185,'\"HOSPITAL \"\"NTRA.SRA. DEL ROSARIO\"\" (CAFAYATE)\"'),
  (121,186,'HOSPITAL. SAN CARLOS'),
  (122,187,'\"HOSPITAL \"\"J.A.FERNÁNDEZ\"\" (MOLINOS)\"'),
  (123,188,'\"HOSPITAL \"\"DR.A. HOYGAARD\"\" (SAN JOSÉ DE CACHI)\"'),
  (124,189,'HOSPITAL SAN ANTONIO DE LOS COBRES'),
  (125,190,'\"HOSPITAL \"\"STA. TERESITA\"\" (CERRILLOS)\"'),
  (126,191,'\"HOSPITAL \"\"DR.JOAQUÍN CORBALÁN\"\" (R. DE LERMA)\"'),
  (127,192,'\"HOSPITAL \"\"DR.RAFAEL VILLAGRÁN\"\" (CHICOANA)\"'),
  (128,193,'\"HOSPITAL \"\"SAN RAFAEL\"\" (EL CARRIL)\"'),
  (129,194,'HOSPITAL CORONEL MOLDES'),
  (130,195,'HOSPITAL LA VIÑA'),
  (131,196,'HOSPITAL GUACHIPAS'),
  (132,197,'HOSPITAL IRUYA'),
  (133,198,'HOSPITAL NAZARENO'),
  (134,199,'SECRETARÍA PERSONAL DEL SEÑOR GOBERNADOR'),
  (135,200,'MUNICIPALIDAD DE METÁN'),
  (136,201,'MUNICIPALIDAD DE ROSARIO DE LA FRONTERA'),
  (137,202,'MUNICIPALIDAD DE CAFAYATE'),
  (138,203,'MUNICIPALIDAD DE ORÁN'),
  (139,204,'MUNICIPALIDAD DE TARTAGAL'),
  (140,205,'MUNICIPALIDAD DE GENERAL GÜEMES'),
  (141,206,'MUNICIPALIDAD DE CACHI'),
  (142,207,'MUNICIPALIDAD DE ANIMANÁ'),
  (143,208,'MUNICIPALIDAD DE HIPÓLITO IRIGOYEN'),
  (144,209,'MUNICIPALIDAD DE SAN CARLOS'),
  (145,210,'MUNICIPALIDAD DE SALVADOR MAZZA'),
  (146,211,'MUNICIPALIDAD DE PICHANAL'),
  (147,212,'MUNICIPALIDAD DE EMBARCACIÓN'),
  (148,213,'MUNICIPALIDAD DE GENERAL MOSCONI'),
  (149,214,'MUNICIPALIDAD DE AGUARAY'),
  (150,215,'MUNICIPALIDAD DE CAMPO QUIJANO'),
  (151,216,'MUNICIPALIDAD DE CERRILLOS'),
  (152,217,'MUNICIPALIDAD DE VAQUEROS'),
  (153,218,'MUNICIPALIDAD DE ROSARIO DE LERMA'),
  (154,238,'AUTORIDAD METROPOLITANA DE TRANSPORTE'),
  (155,242,'AUDITOR GRAL DE LA PROVINCIA DE SALTA'),
  (156,244,'MINISTERIO DE DESARROLLO HUMANO'),
  (157,247,'HOSPITAL SESCLANTÁS'),
  (158,250,'HOSPITAL SANTA VICTORIA OESTE'),
  (159,251,'UNIDAD CENTRAL DE ADMINISTRACIÓN DE LA GOBERNACIÓN'),
  (160,252,'OFICINA DEL AUDITOR DEL SR. GOBERNADOR'),
  (161,254,'UTE (UNIDAD TRANSITORIA DE EMPRESAS)'),
  (162,255,'UNIDAD CENTRAL DE CONTRATACIONES (HACIENDA)'),
  (163,256,'COOPERATIVA ASISTENCIAL DE LA CAPITAL'),
  (164,257,'AREA OPERATIVA LA CALDERA (XXXIX)'),
  (165,260,'TOMOGRAFÍA COMPUTADA S.E.'),
  (166,261,'PROGRAMA DE PRESTACIONES MÉDICAS SOCIALES (MSP)'),
  (167,267,'ENTE REGULADOR DE LOS SERVICIOS PÚBLICOS'),
  (168,268,'COORD. DE OBRAS NACIONALES Y PROVINCIALES'),
  (169,270,'SECRETARÍA VICE-GOBERNACIÓN'),
  (170,274,'SECRETARÍA DE LOS MAYORES'),
  (171,277,'SECRETARIA DE LA GOBERNACION'),
  (172,295,'MINISTERIO DE JUSTICIA'),
  (173,297,'GOBIERNO DE LA PROVINCIA DE SALTA'),
  (174,501,'ADMINISTRACION FEDERAL DE INGRESOS PUBLICOS'),
  (175,502,'BANCOS PRIVADOS'),
  (176,503,'ORGANISMOS NO GUBERNAMENTALES'),
  (177,504,'EMPRESAS PRIVADAS'),
  (178,505,'CONSULADOS'),
  (179,506,'ESCUELAS - COLEGIOS - UNIVERSIDADES'),
  (180,507,'OFICINAS DE OTRAS PROVINCIAS'),
  (181,508,'DIRECCION GENERAL IMPOSITIVA'),
  (182,509,'GUARNICION MILITAR'),
  (183,510,'JUZGADOS FEDERALES'),
  (184,511,'EJERCITO ARGENTINO'),
  (185,512,'SERV.PENITENCIARIO DE LA PROV.DE SALTA'),
  (186,513,'ANSES'),
  (187,514,'CONCEJO DELIBERANTE DE ORAN SALTA'),
  (188,515,'CORTE DE JUSTICIA DE SALTA'),
  (189,2285,'DIRECCION GENERAL DE RENTAS - TRIBUTOS MUNICIPALES'),
  (190,516,'SUB SECRETARIA DE POLITICAS DE PREVISION SOCIAL'),
  (191,232,'SECRETARÍA DE ABORDAJE TERRITORIAL'),
  (192,321,'MINISTERIO DE SALUD PUBLICA'),
  (193,518,'MINISTERIO DE ECONOMIA Y FINANZAS PUBLICAS'),
  (194,519,'MINISTERIO PUBLICO DE LA PROVINCIA DE SALTA'),
  (195,520,'MINISTERIO DE SEGURIDAD DEL GOBIERNO DE SALTA'),
  (196,521,'MINISTERIO DE AMBIENTE Y PRODUCCION SUSTENTABLE'),
  (197,522,'SECRETARIA DE RECURSOS HIDRICOS'),
  (198,524,'TIERRA Y HABITAT'),
  (199,523,'TRIBUNAL ELECTORAL DE LA PROVINCIA DE SALTA'),
  (200,525,'TELECOM'),
  (201,526,'SECRETARIA DE SERIVICIOS PULBICOS');
COMMIT;

#
# Data for the `adjunto_ini` table  (LIMIT 0,500)
#

INSERT INTO `adjunto_ini` (`id_adjunto`, `adjunto`) VALUES 
  (1,'PRINCIPAL'),
  (2,'ADJUNTO');
COMMIT;

#
# Data for the `comision` table  (LIMIT 0,500)
#

INSERT INTO `comision` (`id_comision`, `nombre_comision`, `nombre_encargado_comision`, `apellido_encargado_comision`) VALUES 
  (1,'LEGISLACION GENERAL','SOCORRO ','VILLAMAYOR'),
  (2,'HACIEDA, PRESUPUESTO Y CUENTAS','FERNANDO','ECHAZU'),
  (3,'OBRAS PUBLICAS Y URBANISMO','ARTURO','BORELLI'),
  (4,'SERVICIOS PUBLICOS, ACTIVIDADES COMERCIALES Y PRIVATIZACIONES','GASTON ','GALINDEZ'),
  (5,'TRANSITO, TRANSPORTE Y SEGURIDAD VIAL','FERNANDO ','ECHAZU'),
  (6,'ACCION SOCIAL Y BECAS','ELIANA ','CHUCHUY'),
  (7,'CULTURA, EDUCACION Y PRENSA','TOMAS','RODRIGUEZ'),
  (8,'DEPORTE, TURISMO Y RECREACION','MARIO ','MORENO'),
  (9,'MEDIO AMBIENTE, HIGIENE Y SEGURIDAD','ANGELA','DI BEZ'),
  (10,'SALUD Y NINEZ','JORGELINA','FRANCO'),
  (11,'ASUNTOS VECINALES, ORGANIZACIONES COMINITARIAS Y DEFENZA DEL CONSUMIDOR','ABEL','MOYA'),
  (12,'DERECHOS HUMANOS Y GARANTIAS CONSTITUCIONALES','MIRTA','HAUCHANA'),
  (13,'COMERCIO INTERNACIONAL','ABEL ','MOYA'),
  (14,'MESA DE ENTRADA','NOMBRE_EMPLEADO','APELLIDO_EMPLEADO'),
  (15,'ADMINISTRACION (INFORMATICA)','PROFESIONAL_NOMBRE','PROFESIONAL_APELLIDO');
COMMIT;

#
# Data for the `tipo_iniciador` table  (LIMIT 0,500)
#

INSERT INTO `tipo_iniciador` (`id_tipo_ini`, `tipo_ini`) VALUES 
  (1,'PARTICULAR'),
  (2,'CONCEJAL'),
  (3,'CENTRO VECINAL'),
  (4,'VECINOS');
COMMIT;

#
# Data for the `usuario_usuario` table  (LIMIT 0,500)
#

INSERT INTO `usuario_usuario` (`id_usuario`, `nombre`, `apellido`, `dni`, `usuario`, `id_comision`) VALUES 
  (1,'JOSE ALEJANDRO','VILLA DIAZ','37775104',1,15),
  (2,'CARLOS ISMAEL','GUAYMAS','35048538',1,15),
  (3,'SAMUEL ALEJANDRO','MARTINEZ','36803020',1,15),
  (4,'ADMINISTRADOR(INFORMATICA)','PROFESIONAL_APELLIDO','9999',1,15);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;