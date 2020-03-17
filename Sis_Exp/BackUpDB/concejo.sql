-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: concejo_
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `concejo_`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `concejo_` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `concejo_`;

--
-- Table structure for table `adjunto`
--

DROP TABLE IF EXISTS `adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjunto` (
  `id_cabecera` bigint(20) NOT NULL,
  `id_adjunto` bigint(20) NOT NULL,
  PRIMARY KEY (`id_cabecera`,`id_adjunto`),
  KEY `id_cabecera` (`id_cabecera`),
  KEY `id_adjunto` (`id_adjunto`),
  CONSTRAINT `adjunto_fk` FOREIGN KEY (`id_cabecera`) REFERENCES `expediente` (`id_exp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adjunto_fk1` FOREIGN KEY (`id_adjunto`) REFERENCES `expediente` (`id_exp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjunto`
--

LOCK TABLES `adjunto` WRITE;
/*!40000 ALTER TABLE `adjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjunto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER InsertarAdjunto BEFORE INSERT
ON adjunto
FOR EACH ROW
INSERT INTO adjunto_audit (id_cabecera_nueva,id_cabecera_anterior,id_adjunto_nueva,id_adjunto_anterior,usuario,fecha,accion)
VALUES (NEW.id_cabecera,DEFAULT,NEW.id_adjunto,DEFAULT,USER(),NOW(),'Inserto') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ModificarAdjunto BEFORE UPDATE
ON adjunto
FOR EACH ROW
INSERT INTO adjunto_audit (id_cabecera_nueva,id_cabecera_anterior,id_adjunto_nueva,id_adjunto_anterior,usuario,fecha,accion)
VALUES (NEW.id_cabecera,OLD.id_cabecera,NEW.id_adjunto,OLD.id_adjunto,USER(),NOW(),'Modifico') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER EliminarAdjunto BEFORE DELETE
ON adjunto
FOR EACH ROW
INSERT INTO adjunto_audit (id_cabecera_nueva,id_cabecera_anterior,id_adjunto_nueva,id_adjunto_anterior,usuario,fecha,accion)
VALUES (DEFAULT,OLD.id_cabecera,DEFAULT,OLD.id_adjunto,USER(),NOW(),'Elimino') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `adjunto_audit`
--

DROP TABLE IF EXISTS `adjunto_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjunto_audit`
--

LOCK TABLES `adjunto_audit` WRITE;
/*!40000 ALTER TABLE `adjunto_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjunto_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjunto_ini`
--

DROP TABLE IF EXISTS `adjunto_ini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjunto_ini` (
  `id_adjunto` int(11) NOT NULL AUTO_INCREMENT,
  `adjunto` varchar(20) NOT NULL,
  PRIMARY KEY (`id_adjunto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjunto_ini`
--

LOCK TABLES `adjunto_ini` WRITE;
/*!40000 ALTER TABLE `adjunto_ini` DISABLE KEYS */;
INSERT INTO `adjunto_ini` VALUES (1,'PRINCIPAL'),(2,'ADJUNTO');
/*!40000 ALTER TABLE `adjunto_ini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comision`
--

DROP TABLE IF EXISTS `comision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comision` (
  `id_comision` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_comision` varchar(100) NOT NULL,
  `nombre_encargado_comision` varchar(20) NOT NULL,
  `apellido_encargado_comision` varchar(20) NOT NULL,
  PRIMARY KEY (`id_comision`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comision`
--

LOCK TABLES `comision` WRITE;
/*!40000 ALTER TABLE `comision` DISABLE KEYS */;
INSERT INTO `comision` VALUES (1,'LEGISLACION GENERAL','SOCORRO ','VILLAMAYOR'),(2,'HACIEDA, PRESUPUESTO Y CUENTAS','FERNANDO','ECHAZU'),(3,'OBRAS PUBLICAS Y URBANISMO','ARTURO','BORELLI'),(4,'SERVICIOS PUBLICOS, ACTIVIDADES COMERCIALES Y PRIVATIZACIONES','GASTON ','GALINDEZ'),(5,'TRANSITO, TRANSPORTE Y SEGURIDAD VIAL','FERNANDO ','ECHAZU'),(6,'ACCION SOCIAL Y BECAS','ELIANA ','CHUCHUY'),(7,'CULTURA, EDUCACION Y PRENSA','TOMAS','RODRIGUEZ'),(8,'DEPORTE, TURISMO Y RECREACION','MARIO ','MORENO'),(9,'MEDIO AMBIENTE, HIGIENE Y SEGURIDAD','ANGELA','DI BEZ'),(10,'SALUD Y NINEZ','JORGELINA','FRANCO'),(11,'ASUNTOS VECINALES, ORGANIZACIONES COMINITARIAS Y DEFENZA DEL CONSUMIDOR','ABEL','MOYA'),(12,'DERECHOS HUMANOS Y GARANTIAS CONSTITUCIONALES','MIRTA','HAUCHANA'),(13,'COMERCIO INTERNACIONAL','ABEL ','MOYA'),(14,'MESA DE ENTRADA','NOMBRE_EMPLEADO','APELLIDO_EMPLEADO'),(15,'ADMINISTRACION (INFORMATICA)','PROFESIONAL_NOMBRE','PROFESIONAL_APELLIDO');
/*!40000 ALTER TABLE `comision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_exp`
--

DROP TABLE IF EXISTS `estado_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_exp` (
  `id_estado_exp` int(11) NOT NULL AUTO_INCREMENT,
  `estado_exp` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_exp`
--

LOCK TABLES `estado_exp` WRITE;
/*!40000 ALTER TABLE `estado_exp` DISABLE KEYS */;
INSERT INTO `estado_exp` VALUES (1,'NUEVO'),(2,'APROBADO'),(3,'RECHAZADO'),(4,'DERIVADO');
/*!40000 ALTER TABLE `estado_exp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente`
--

LOCK TABLES `expediente` WRITE;
/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER InsertarExpediente BEFORE INSERT
ON expediente
FOR EACH ROW
INSERT INTO expediente_audit (id_exp,num_exp_nueva,num_exp_anterior,fecha_ini_exp_nueva,fecha_ini_exp_anterior,referencia_exp_nueva,referencia_exp_anterior,observaciones_exp_nueva,observaciones_exp_anterior,id_tipo_exp_nueva,id_tipo_exp_anterior,id_estado_exp_nueva,id_estado_exp_anterior,estado_pen_acp_nueva,estado_pen_acp_anterior,id_org_nueva,id_org_anterior,cantidad_folios_nueva,cantidad_folios_anterior,usuario,fecha,accion) VALUES (NEW.id_exp,NEW.num_exp,DEFAULT,NEW.fecha_ini_exp,DEFAULT,NEW.referencia_exp,DEFAULT,NEW.observaciones_exp,DEFAULT,NEW.id_tipo_exp,DEFAULT,NEW.id_estado_exp,DEFAULT,NEW.estado_pen_acp,DEFAULT,NEW.id_org,DEFAULT,NEW.cantidad_folios,DEFAULT,USER(),NOW(),'Inserto') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ModificarExpediente BEFORE UPDATE
ON expediente
FOR EACH ROW
INSERT INTO expediente_audit (id_exp,num_exp_nueva,num_exp_anterior,fecha_ini_exp_nueva,fecha_ini_exp_anterior,referencia_exp_nueva,referencia_exp_anterior,observaciones_exp_nueva,observaciones_exp_anterior,id_tipo_exp_nueva,id_tipo_exp_anterior,id_estado_exp_nueva,id_estado_exp_anterior,estado_pen_acp_nueva,estado_pen_acp_anterior,id_org_nueva,id_org_anterior,cantidad_folios_nueva,cantidad_folios_anterior,usuario,fecha,accion) VALUES (OLD.id_exp,NEW.num_exp,OLD.num_exp,NEW.fecha_ini_exp,OLD.fecha_ini_exp,NEW.referencia_exp,OLD.referencia_exp,NEW.observaciones_exp,OLD.observaciones_exp,NEW.id_tipo_exp,OLD.id_tipo_exp,NEW.id_estado_exp,OLD.id_estado_exp,NEW.estado_pen_acp,OLD.estado_pen_acp,NEW.id_org,OLD.id_org,NEW.cantidad_folios,OLD.cantidad_folios,USER(),NOW(),'Modifico') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER EliminarExpediente BEFORE DELETE
ON expediente
FOR EACH ROW
INSERT INTO expediente_audit (id_exp,num_exp_nueva,num_exp_anterior,fecha_ini_exp_nueva,fecha_ini_exp_anterior,referencia_exp_nueva,referencia_exp_anterior,observaciones_exp_nueva,observaciones_exp_anterior,id_tipo_exp_nueva,id_tipo_exp_anterior,id_estado_exp_nueva,id_estado_exp_anterior,estado_pen_acp_nueva,estado_pen_acp_anterior,id_org_nueva,id_org_anterior,cantidad_folios_nueva,cantidad_folios_anterior,usuario,fecha,accion) VALUES (OLD.id_exp,DEFAULT,OLD.num_exp,DEFAULT,OLD.fecha_ini_exp,DEFAULT,OLD.referencia_exp,DEFAULT,OLD.observaciones_exp,DEFAULT,OLD.id_tipo_exp,DEFAULT,OLD.id_estado_exp,DEFAULT,OLD.estado_pen_acp,DEFAULT,OLD.id_org,DEFAULT,OLD.cantidad_folios,USER(),NOW(),'Elimino') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `expediente_audit`
--

DROP TABLE IF EXISTS `expediente_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_audit`
--

LOCK TABLES `expediente_audit` WRITE;
/*!40000 ALTER TABLE `expediente_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ini_x_exp`
--

DROP TABLE IF EXISTS `ini_x_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ini_x_exp`
--

LOCK TABLES `ini_x_exp` WRITE;
/*!40000 ALTER TABLE `ini_x_exp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ini_x_exp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iniciador`
--

DROP TABLE IF EXISTS `iniciador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iniciador`
--

LOCK TABLES `iniciador` WRITE;
/*!40000 ALTER TABLE `iniciador` DISABLE KEYS */;
/*!40000 ALTER TABLE `iniciador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER InsertarMovimiento BEFORE INSERT
ON movimiento
FOR EACH ROW
INSERT INTO movimiento_audit (id_movimiento,fecha_movimiento_nueva,fecha_movimiento_anterior,id_exp_nueva,id_exp_anterior,id_comision_actual_nueva,id_comision_actual_anterior,id_comision_anterior_nueva,id_comision_anterior_anterior,usuario,fecha,accion)
VALUES (NEW.id_movimiento,NEW.fecha_movimiento,DEFAULT,NEW.id_exp,DEFAULT,NEW.id_comision_actual,DEFAULT,NEW.id_comision_anterior,DEFAULT,USER(),NOW(),'Inserto') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ModificarMovimiento BEFORE UPDATE
ON movimiento
FOR EACH ROW
INSERT INTO movimiento_audit (id_movimiento,fecha_movimiento_nueva,fecha_movimiento_anterior,id_exp_nueva,id_exp_anterior,id_comision_actual_nueva,id_comision_actual_anterior,id_comision_anterior_nueva,id_comision_anterior_anterior,usuario,fecha,accion) 
VALUES (OLD.id_movimiento,NEW.fecha_movimiento,OLD.fecha_movimiento,NEW.id_exp,OLD.id_exp,NEW.id_comision_actual,OLD.id_comision_actual,NEW.id_comision_anterior,OLD.id_comision_anterior,USER(),NOW(),'Modifico') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER EliminarMovimiento BEFORE DELETE
ON movimiento
FOR EACH ROW
INSERT INTO movimiento_audit (id_movimiento,fecha_movimiento_nueva,fecha_movimiento_anterior,id_exp_nueva,id_exp_anterior,id_comision_actual_nueva,id_comision_actual_anterior,id_comision_anterior_nueva,id_comision_anterior_anterior,usuario,fecha,accion)
VALUES (OLD.id_movimiento,DEFAULT,OLD.fecha_movimiento,DEFAULT,OLD.id_exp,DEFAULT,OLD.id_comision_actual,DEFAULT,OLD.id_comision_anterior,USER(),NOW(),'Elimino') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movimiento_audit`
--

DROP TABLE IF EXISTS `movimiento_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_audit`
--

LOCK TABLES `movimiento_audit` WRITE;
/*!40000 ALTER TABLE `movimiento_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismos`
--

DROP TABLE IF EXISTS `organismos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organismos` (
  `id_org` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_org` int(11) NOT NULL,
  `nombre_org` varchar(50) NOT NULL,
  PRIMARY KEY (`id_org`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismos`
--

LOCK TABLES `organismos` WRITE;
/*!40000 ALTER TABLE `organismos` DISABLE KEYS */;
INSERT INTO `organismos` VALUES (2,1,'SECRETARIA GENERAL DE LA GOBERNACION'),(3,2,'DELEGACION CASA DE SALTA'),(4,4,'DIRECCIÃ“N GENERAL DE PERSONAL'),(5,5,'SECRETARÃA DE PRENSA, CEREMONIAL Y COMUNICACIONES'),(6,6,'TESORERÃA GENERAL DE LA PROVINCIA'),(7,7,'FISCALÃA DE ESTADO'),(8,8,'ESCRIBANÃA DE GOBIERNO'),(9,9,'SUB-SECRETARÃA AREA DE FRONTERA'),(10,10,'SECRETARÃA DE PLANEAMIENTO Y CONTROL DE GESTIÃ“N'),(11,11,'MINISTERIO DE FINANZAS Y OBRAS PUBLICAS'),(12,13,'PROVIPO'),(13,16,'SECRETARÃA DE LA GOBERNACIÃ“N DE TURISMO'),(14,17,'DIRECCIÃ“N GENERAL DE ESTADÃSTICAS Y CENSOS'),(15,18,'DIRECCIÃ“N GENERAL DE INMUEBLES (DPTO. TÃ‰CNICO)'),(16,20,'DIRECCIÃ“N GENERAL DE TRANSPORTE'),(17,21,'CONTADURÃA GENERAL DE LA PROVINCIA'),(18,22,'DIRECCIÃ“N GENERAL DE RENTAS'),(19,26,'FONDO ESPECIAL DEL TABACO'),(20,29,'DIRECCIÃ“N GENERAL DE INMUEBLES (MESA CENTRAL)'),(21,30,'DIRECCIÃ“N GENERAL DE INMUEBLES (DPTO. JURÃDICO)'),(22,31,'DIRECCIÃ“N GENERAL DE AVIACIÃ“N CIVIL'),(23,33,'DIRECCIÃ“N DE VIALIDAD'),(24,34,'ADMINISTRACIÃ“N GENERAL DE AGUAS DE SALTA'),(25,35,'BANCO DE PRÃ‰STAMOS Y ASISTENCIA SOCIAL'),(26,36,'DIRECCIÃ“N PROVINCIAL DE ENERGÃA'),(27,37,'DIRECCIÃ“N GENERAL DE OBRAS SANITARIAS'),(28,38,'DIRECCIÃ“N GENERAL DE INDUSTRIA'),(29,39,'BANCO PROVINCIAL DE SALTA'),(30,41,'MINISTERIO DE GOBIERNO (MESA CENTRAL)'),(31,43,'HOGAR BUEN PASTOR'),(32,44,'POLICÃA DE SALTA'),(33,46,'DIRECCIÃ“N GENERAL DE EDUCACIÃ“N SUPERIOR'),(34,47,'SECRETARÃA DE EDUCACIÃ“N'),(35,49,'DIRECCIÃ“N GENERAL DE COMUNICACIONES'),(36,50,'DIRECCIÃ“N GENERAL DE INSTITUTOS PENALES'),(37,54,'INSPECCIÃ“N GENERAL DE PERSONAS JURÃDICAS'),(38,55,'ARCHIVO DE LA PROVINCIA'),(39,57,'BIBLIOTECA PRIVADA \"DR. VICTORINO DE LA PLAZA\"'),(40,58,'BOLETÃN OFICIAL DE LA PROVINCIA'),(41,59,'DIRECCIÃ“N GENERAL DE CULTURA'),(42,60,'ARCHIVO Y BIBLIOTECA HISTÃ“RICOS'),(43,62,'MUSEO DE ANTROPOLOGÃA DE SALTA'),(44,63,'MUSEO DE BELLAS ARTES'),(45,64,'DIRECCIÃ“N PROVINCIAL DEL TRABAJO'),(46,65,'IMPRENTA DE LA LEGISLATURA'),(47,517,'SAETA'),(48,69,'DIRECCIÃ“N DE PROMOCIÃ“N SOCIAL'),(49,70,'HOTEL TERMAS \"ROSARIO DE LA FRONTERA\"'),(50,71,'DIRECCIÃ“N GENERAL DE COOPERATIVAS Y MUTUALIDADES'),(51,72,'DIRECCIÃ“N DE DEPORTES Y RECREACIÃ“N'),(52,73,'CAJA DE PREVISIÃ“N SOCIAL'),(53,74,'INSTITUTO PROVINCIAL DE SEGUROS'),(54,75,'HOSPITAL \"CHRISTOFREDO JAKOB\"'),(55,77,'DIRECCIÃ“N GENERAL DE FAMILIA Y MINORIDAD'),(56,78,'DIRECCIÃ“N ZONA NORTE'),(57,79,'DIRECCIÃ“N ZONA SUR'),(58,80,'DIRECCIÃ“N ZONA OESTE'),(59,81,'TRIBUNAL DE CUENTAS DE LA PROVINCIA'),(60,83,'DIRECCIÃ“N GENERAL DE INFORMÃTICA PROVINCIAL'),(61,85,'PODER JUDICIAL'),(62,87,'HOSPITAL MATERNO INFANTIL'),(63,88,'DIRECCIÃ“N PROVINCIAL DE DEFENSA CIVIL'),(64,89,'HOSPITAL SAN BERNARDO'),(65,90,'CÃMARA DE SENADORES'),(66,91,'CÃMARA DE DIPUTADOS'),(67,97,'HOSPITAL COLONIA SANTA ROSA'),(68,98,'HOSPITAL EL GALPÃ“N'),(69,101,'DIRECCIÃ“N DE CEREMONIAL Y AUDIENCIAS'),(70,104,'PATRONATO DE PRESOS Y LIBERADOS'),(71,107,'DIRECCIÃ“N DE ACCIÃ“N CULTURAL'),(72,111,'ENTE AUTÃRQUICO PARQUE INDUSTRIAL'),(73,115,'DIRECCIÃ“N GENERAL DE ORGANIZACIÃ“N Y SISTEMAS'),(74,120,'INSTITUTO PROVINCIAL DEL ABORIGEN'),(75,121,'MINISTERIO DE SALUD PÃšBLICA'),(76,122,'HOSPITAL DE SALVADOR MAZZA'),(77,123,'HOSPITAL DE AGUARAY'),(78,124,'HOSPITAL DE SANTA VICTORIA ESTE'),(79,129,'DIRECCIÃ“N GENERAL DE EDUCACIÃ“N PRIVADA'),(80,134,'HOSPITAL DEL MILAGRO'),(81,135,'CONCEJO'),(82,137,'SECRETARÃA DE INGRESOS PÃ‰BLICOS'),(83,139,'SECRETARÃA DE LA FUNCIÃ“N PÃ‰BLICA'),(84,140,'MINISTERIO DE EDUCACIÃ“N'),(85,141,'SECRETARÃA DE FINANZAS'),(86,142,'SECRETARÃA DE LA PRODUCCIÃ“N'),(87,143,'SECRETARÃA DE MINERÃA Y RECURSOS ENERGÃ‰TICO'),(88,144,'SECRETARÃA DE ESTADO DE GOBIERNO'),(89,145,'SECRETARÃA DE DERECHOS HUMANOS'),(90,146,'SECRETARÃA DEL SEGURO SOCIAL'),(91,147,'SECRETARÃA DE SERVICIOS DE SALUD'),(92,148,'SECRETARÃA DE GESTIÃ“N EDUCATIVA'),(93,149,'SECRETARÃA DE LA GOBERNACIÃ“N DE SEGURIDAD'),(94,150,'SUBSECRETARÃA DE PROTECCIÃ“N A LA COMUNIDAD'),(95,151,'SUBSECRETARÃA DE SEGURIDAD Y PLANIFICACIÃ“N'),(96,152,'SECRETARÃA DE LA GOBERNACIÃ“N DE DESARROLLO SOCIA'),(97,153,'SUBSECRETARÃA DE DESARROLLO FAMILIAR'),(98,154,'SUBSECRETARÃA DE PROGRAMACIÃ“N Y ACCIÃ“N SOCIAL'),(99,155,'SUBSECRETARÃA DE DEPORTES Y RECREACIÃ“N'),(100,156,'DELEGACIÃ“N DE ADMINISTRACIÃ“N DE LA GOBERNACIÃ“N'),(101,159,'DIRECCIÃ“N DE PERSONAL - MINISTERIO DE EDUCACIÃ“N'),(102,164,'COORDINACIÃ“N GENERAL (MINISTERIO DE LA PRODUCCIÃ“'),(103,165,'UNIDAD DE EMPLEO (MINISTERIO DE LA PRODUCCIÃ“N)'),(104,166,'UNIDAD EJECUTORA (MINISTERIO DE LA PRODUCCIÃ“N)'),(105,167,'\"HOSPITAL \"\"DR. VICENTE ARROYABE\"\" (PICHANAL)\"'),(106,168,'HOSPITAL MORILLO'),(107,170,'\"HOSPITAL \"\"SAN VICENTE DE PAUL\"\" (ORÃN)\"'),(108,171,'\"HOSPITAL \"\"PRESIDENTE JUAN D. PERÃ“N\"\" (TARTAGAL)'),(109,172,'HOSPITAL RIVADAVIA BANDA SUD,'),(110,173,'HOSPITAL GRAL. MOSCONI'),(111,174,'HOSPITAL HIPÃ“LITO IRIGOYEN'),(112,175,'HOSPITAL ALTO LA SIERRA'),(113,176,'HOSPITAL LAS LAJITAS'),(114,177,'\"HOSPITAL \"\"DR. OSCAR H. COSTAS\"\" (J.V.GONZÃLEZ)\"'),(115,178,'HOSPITAL EL QUEBRACHAL'),(116,180,'\"HOSPITAL \"\"EL CARMEN\"\" (METÃN)\"'),(117,181,'\"HOSPITAL \"\"SANTA TERESA\"\" (EL TALA)\"'),(118,183,'HOSPITAL APOLINARIO SARAVIA'),(119,184,'HOSPITAL EL POTRERO'),(120,185,'\"HOSPITAL \"\"NTRA.SRA. DEL ROSARIO\"\" (CAFAYATE)\"'),(121,186,'HOSPITAL. SAN CARLOS'),(122,187,'\"HOSPITAL \"\"J.A.FERNÃNDEZ\"\" (MOLINOS)\"'),(123,188,'\"HOSPITAL \"\"DR.A. HOYGAARD\"\" (SAN JOSÃ‰ DE CACHI)\"'),(124,189,'HOSPITAL SAN ANTONIO DE LOS COBRES'),(125,190,'\"HOSPITAL \"\"STA. TERESITA\"\" (CERRILLOS)\"'),(126,191,'\"HOSPITAL \"\"DR.JOAQUÃN CORBALÃN\"\" (R. DE LERMA)\"'),(127,192,'\"HOSPITAL \"\"DR.RAFAEL VILLAGRÃN\"\" (CHICOANA)\"'),(128,193,'\"HOSPITAL \"\"SAN RAFAEL\"\" (EL CARRIL)\"'),(129,194,'HOSPITAL CORONEL MOLDES'),(130,195,'HOSPITAL LA VIÃ‘A'),(131,196,'HOSPITAL GUACHIPAS'),(132,197,'HOSPITAL IRUYA'),(133,198,'HOSPITAL NAZARENO'),(134,199,'SECRETARÃA PERSONAL DEL SEÃ‘OR GOBERNADOR'),(135,200,'MUNICIPALIDAD DE METÃN'),(136,201,'MUNICIPALIDAD DE ROSARIO DE LA FRONTERA'),(137,202,'MUNICIPALIDAD DE CAFAYATE'),(138,203,'MUNICIPALIDAD DE ORÃN'),(139,204,'MUNICIPALIDAD DE TARTAGAL'),(140,205,'MUNICIPALIDAD DE GENERAL GÃœEMES'),(141,206,'MUNICIPALIDAD DE CACHI'),(142,207,'MUNICIPALIDAD DE ANIMANÃ'),(143,208,'MUNICIPALIDAD DE HIPÃ“LITO IRIGOYEN'),(144,209,'MUNICIPALIDAD DE SAN CARLOS'),(145,210,'MUNICIPALIDAD DE SALVADOR MAZZA'),(146,211,'MUNICIPALIDAD DE PICHANAL'),(147,212,'MUNICIPALIDAD DE EMBARCACIÃ“N'),(148,213,'MUNICIPALIDAD DE GENERAL MOSCONI'),(149,214,'MUNICIPALIDAD DE AGUARAY'),(150,215,'MUNICIPALIDAD DE CAMPO QUIJANO'),(151,216,'MUNICIPALIDAD DE CERRILLOS'),(152,217,'MUNICIPALIDAD DE VAQUEROS'),(153,218,'MUNICIPALIDAD DE ROSARIO DE LERMA'),(154,238,'AUTORIDAD METROPOLITANA DE TRANSPORTE'),(155,242,'AUDITOR GRAL DE LA PROVINCIA DE SALTA'),(156,244,'MINISTERIO DE DESARROLLO HUMANO'),(157,247,'HOSPITAL SESCLANTÃS'),(158,250,'HOSPITAL SANTA VICTORIA OESTE'),(159,251,'UNIDAD CENTRAL DE ADMINISTRACIÃ“N DE LA GOBERNACIÃ'),(160,252,'OFICINA DEL AUDITOR DEL SR. GOBERNADOR'),(161,254,'UTE (UNIDAD TRANSITORIA DE EMPRESAS)'),(162,255,'UNIDAD CENTRAL DE CONTRATACIONES (HACIENDA)'),(163,256,'COOPERATIVA ASISTENCIAL DE LA CAPITAL'),(164,257,'AREA OPERATIVA LA CALDERA (XXXIX)'),(165,260,'TOMOGRAFÃA COMPUTADA S.E.'),(166,261,'PROGRAMA DE PRESTACIONES MÃ‰DICAS SOCIALES (MSP)'),(167,267,'ENTE REGULADOR DE LOS SERVICIOS PÃšBLICOS'),(168,268,'COORD. DE OBRAS NACIONALES Y PROVINCIALES'),(169,270,'SECRETARÃA VICE-GOBERNACIÃ“N'),(170,274,'SECRETARÃA DE LOS MAYORES'),(171,277,'SECRETARIA DE LA GOBERNACION'),(172,295,'MINISTERIO DE JUSTICIA'),(173,297,'GOBIERNO DE LA PROVINCIA DE SALTA'),(174,501,'ADMINISTRACION FEDERAL DE INGRESOS PUBLICOS'),(175,502,'BANCOS PRIVADOS'),(176,503,'ORGANISMOS NO GUBERNAMENTALES'),(177,504,'EMPRESAS PRIVADAS'),(178,505,'CONSULADOS'),(179,506,'ESCUELAS - COLEGIOS - UNIVERSIDADES'),(180,507,'OFICINAS DE OTRAS PROVINCIAS'),(181,508,'DIRECCION GENERAL IMPOSITIVA'),(182,509,'GUARNICION MILITAR'),(183,510,'JUZGADOS FEDERALES'),(184,511,'EJERCITO ARGENTINO'),(185,512,'SERV.PENITENCIARIO DE LA PROV.DE SALTA'),(186,513,'ANSES'),(187,514,'CONCEJO DELIBERANTE DE ORAN SALTA'),(188,515,'CORTE DE JUSTICIA DE SALTA'),(189,2285,'DIRECCION GENERAL DE RENTAS - TRIBUTOS MUNICIPALES'),(190,516,'SUB SECRETARIA DE POLITICAS DE PREVISION SOCIAL'),(191,232,'SECRETARÃA DE ABORDAJE TERRITORIAL'),(192,321,'MINISTERIO DE SALUD PUBLICA'),(193,518,'MINISTERIO DE ECONOMIA Y FINANZAS PUBLICAS'),(194,519,'MINISTERIO PUBLICO DE LA PROVINCIA DE SALTA'),(195,520,'MINISTERIO DE SEGURIDAD DEL GOBIERNO DE SALTA'),(196,521,'MINISTERIO DE AMBIENTE Y PRODUCCION SUSTENTABLE'),(197,522,'SECRETARIA DE RECURSOS HIDRICOS'),(198,524,'TIERRA Y HABITAT'),(199,523,'TRIBUNAL ELECTORAL DE LA PROVINCIA DE SALTA'),(200,525,'TELECOM'),(201,526,'SECRETARIA DE SERIVICIOS PULBICOS');
/*!40000 ALTER TABLE `organismos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_expediente`
--

DROP TABLE IF EXISTS `tipo_expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_expediente` (
  `id_tipo_exp` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_exp` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_expediente`
--

LOCK TABLES `tipo_expediente` WRITE;
/*!40000 ALTER TABLE `tipo_expediente` DISABLE KEYS */;
INSERT INTO `tipo_expediente` VALUES (1,'ORDENANZA'),(2,'DECLARACION'),(3,'RESOLUCION'),(4,'INFORMES'),(5,'CONDONACION'),(6,'PROYECTO'),(7,'EXPEDIENTE');
/*!40000 ALTER TABLE `tipo_expediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_iniciador`
--

DROP TABLE IF EXISTS `tipo_iniciador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_iniciador` (
  `id_tipo_ini` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_ini` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_ini`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_iniciador`
--

LOCK TABLES `tipo_iniciador` WRITE;
/*!40000 ALTER TABLE `tipo_iniciador` DISABLE KEYS */;
INSERT INTO `tipo_iniciador` VALUES (1,'PARTICULAR'),(2,'CONCEJAL'),(3,'CENTRO VECINAL'),(4,'VECINOS');
/*!40000 ALTER TABLE `tipo_iniciador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario`
--

DROP TABLE IF EXISTS `usuario_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario`
--

LOCK TABLES `usuario_usuario` WRITE;
/*!40000 ALTER TABLE `usuario_usuario` DISABLE KEYS */;
INSERT INTO `usuario_usuario` VALUES (1,'JOSE ALEJANDRO','VILLA DIAZ','37775104',1,15),(2,'CARLOS ISMAEL','GUAYMAS','35048538',1,15),(3,'SAMUEL ALEJANDRO','MARTINEZ','36803020',1,15),(4,'ADMINISTRADOR(INFORMATICA)','PROFESIONAL_APELLIDO','9999',1,15);
/*!40000 ALTER TABLE `usuario_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-05 23:41:49
