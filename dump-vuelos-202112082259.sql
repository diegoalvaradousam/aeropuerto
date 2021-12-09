-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: vuelos
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeropuerto` (
  `Cod_aeropuerto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_aeropuerto` varchar(150) NOT NULL,
  `localidad` varchar(150) NOT NULL,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_aeropuerto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
INSERT INTO `aeropuerto` VALUES (1,'Aeropuerto San Salvadro','San Savador','El salvador'),(2,'Monsenior Romero','San Savador','El salvador'),(8,'Aeropuerto Santa ana','Santa ana','El salvador');
/*!40000 ALTER TABLE `aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aviones`
--

DROP TABLE IF EXISTS `aviones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aviones` (
  `Cod_avion` int(11) NOT NULL AUTO_INCREMENT,
  `num_plazas` int(11) DEFAULT NULL,
  `Cod_aeropuerto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_avion`),
  KEY `Cod_aeropuerto` (`Cod_aeropuerto`),
  CONSTRAINT `aviones_ibfk_1` FOREIGN KEY (`Cod_aeropuerto`) REFERENCES `aeropuerto` (`Cod_aeropuerto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviones`
--

LOCK TABLES `aviones` WRITE;
/*!40000 ALTER TABLE `aviones` DISABLE KEYS */;
INSERT INTO `aviones` VALUES (1,7,2),(2,7,1),(4,122,2);
/*!40000 ALTER TABLE `aviones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `DNI` int(11) NOT NULL AUTO_INCREMENT,
  `tarjeta_embarque` int(10) unsigned zerofill NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `tarjeta_credito` varchar(20) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `tarjeta_embarque` (`tarjeta_embarque`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`tarjeta_embarque`) REFERENCES `embarque` (`tarjeta_embarque`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3242344 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,0000000002,'Jorge','Romero','San salvador','64','456456','jromero','jromero'),(2,0000000001,'tyrtyy','ytrtr','rrrr','4564','4','',''),(123123,0000000001,'Diego Jose','Alvarado','San Salvador','71727374','12321312312','diego','diego');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embarque`
--

DROP TABLE IF EXISTS `embarque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embarque` (
  `tarjeta_embarque` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `asiento` int(11) DEFAULT NULL,
  `columna` varchar(3) DEFAULT NULL,
  `planta` int(11) DEFAULT NULL,
  PRIMARY KEY (`tarjeta_embarque`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embarque`
--

LOCK TABLES `embarque` WRITE;
/*!40000 ALTER TABLE `embarque` DISABLE KEYS */;
INSERT INTO `embarque` VALUES (0000000001,55,'55',55),(0000000002,44,'44',44),(0000000003,22,'3e',1),(0000000004,3,'2',1),(0000000005,3,'2',1),(0000000006,3,'2',1);
/*!40000 ALTER TABLE `embarque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_vuelo`
--

DROP TABLE IF EXISTS `reserva_vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva_vuelo` (
  `Cod_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_salida` date DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `aeropuerto_salida` int(11) DEFAULT NULL,
  `aeropuerto_llegada` int(11) DEFAULT NULL,
  `DNI_cliente` int(11) DEFAULT NULL,
  `cod_avion` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_reserva`),
  KEY `aeropuerto_salida` (`aeropuerto_salida`),
  KEY `aeropuerto_llegada` (`aeropuerto_llegada`),
  KEY `cod_avion` (`cod_avion`),
  KEY `DNI_cliente` (`DNI_cliente`),
  CONSTRAINT `reserva_vuelo_ibfk_1` FOREIGN KEY (`aeropuerto_salida`) REFERENCES `aeropuerto` (`Cod_aeropuerto`),
  CONSTRAINT `reserva_vuelo_ibfk_2` FOREIGN KEY (`aeropuerto_llegada`) REFERENCES `aeropuerto` (`Cod_aeropuerto`),
  CONSTRAINT `reserva_vuelo_ibfk_3` FOREIGN KEY (`cod_avion`) REFERENCES `aviones` (`Cod_avion`),
  CONSTRAINT `reserva_vuelo_ibfk_4` FOREIGN KEY (`DNI_cliente`) REFERENCES `clientes` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_vuelo`
--

LOCK TABLES `reserva_vuelo` WRITE;
/*!40000 ALTER TABLE `reserva_vuelo` DISABLE KEYS */;
INSERT INTO `reserva_vuelo` VALUES (1,'2021-10-08','2021-10-23',1,2,1,1),(2,'2021-10-13','2021-10-16',1,2,2,2);
/*!40000 ALTER TABLE `reserva_vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vuelos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08 22:59:38
