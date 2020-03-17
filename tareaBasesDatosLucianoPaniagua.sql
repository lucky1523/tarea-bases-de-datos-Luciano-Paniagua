-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: cuarentena
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `PacienteID` int NOT NULL,
  `DoctorID` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`PacienteID`,`DoctorID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`PacienteID`) REFERENCES `paciente` (`ID`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `piso` int NOT NULL,
  `nro` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,1,102),(2,2,103),(3,3,104),(4,4,105),(5,1,102),(6,2,103),(7,3,104),(8,4,105),(9,1,102),(10,2,103),(11,3,104),(12,4,105);
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `personaID` int NOT NULL,
  `consultorioID` int NOT NULL,
  `especialidadID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `personaID` (`personaID`),
  KEY `consultorioID` (`consultorioID`),
  KEY `especialidadID` (`especialidadID`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`personaID`) REFERENCES `persona` (`CI`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`consultorioID`) REFERENCES `consultorio` (`ID`),
  CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`especialidadID`) REFERENCES `especialidad` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (31,1093301,1,1),(32,1093302,2,2),(33,1093303,3,3),(34,1093304,4,4),(35,1093305,5,5);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'cirugia'),(2,'Pediatría'),(3,'cardiologia'),(4,'laringologia'),(5,'oftalmologia'),(6,'cirugia'),(7,'Pediatría'),(8,'cardiologia'),(9,'laringologia'),(10,'oftalmologia'),(11,'cirugia'),(12,'Pediatría'),(13,'cardiologia'),(14,'laringologia'),(15,'oftalmologia');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `personaID` int NOT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `personaID` (`personaID`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`personaID`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,10933055,'2020-03-11 00:00:00'),(2,10933056,'2020-03-12 00:00:00'),(3,10933057,'2020-03-13 00:00:00'),(4,10933058,'2020-03-14 00:00:00'),(5,10933059,'2020-03-15 00:00:00'),(6,10933055,'2020-03-11 00:00:00'),(7,10933056,'2020-03-12 00:00:00'),(8,10933057,'2020-03-13 00:00:00'),(9,10933058,'2020-03-14 00:00:00'),(10,10933059,'2020-03-15 00:00:00'),(11,10933055,'2020-03-11 00:00:00'),(12,109330556,'2020-03-12 00:00:00'),(13,109330557,'2020-03-13 00:00:00'),(14,109330558,'2020-03-14 00:00:00'),(15,109330559,'2020-03-15 00:00:00'),(21,1093301,'2020-03-11 00:00:00'),(22,1093302,'2020-03-12 00:00:00'),(23,1093303,'2020-03-13 00:00:00'),(24,1093304,'2020-03-14 00:00:00'),(25,1093305,'2020-03-15 00:00:00');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `CI` int NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1093301,'Luciano','Paniagua Mallea','2000-05-08 00:00:00'),(1093302,'Rodrigo','Viladegut Alurralde','2000-05-09 00:00:00'),(1093303,'luis','Perez Paniagua','2000-05-10 00:00:00'),(1093304,'pepe','Rosa Pomier','2000-05-19 00:00:00'),(1093305,'Camila','Avila Vega','2000-05-11 00:00:00'),(1093306,'Rodolfo','Teran Vega','2000-05-12 00:00:00'),(1093307,'maria','hatake uchiha','2000-05-13 00:00:00'),(1093308,'juan','Uzumaki Konohamaru','2000-05-14 00:00:00'),(1093309,'natalia','Uchiha Paniagua','2000-05-15 00:00:00'),(10933055,'Luciano','Paniagua Mallea','2000-05-08 00:00:00'),(10933056,'Rodrigo','Viladegut Alurralde','2000-05-09 00:00:00'),(10933057,'luis','Perez Paniagua','2000-05-10 00:00:00'),(10933058,'pepe','Rosa Pomier','2000-05-19 00:00:00'),(10933059,'Camila','Avila Vega','2000-05-11 00:00:00'),(10933060,'Rodolfo','Teran Vega','2000-05-12 00:00:00'),(10933061,'maria','hatake uchiha','2000-05-13 00:00:00'),(10933062,'juan','Uzumaki Konohamaru','2000-05-14 00:00:00'),(10933063,'natalia','Uchiha Paniagua','2000-05-15 00:00:00'),(109330554,'Luciano','Paniagua Mallea','2000-05-08 00:00:00'),(109330556,'Rodrigo','Viladegut Alurralde','2000-05-09 00:00:00'),(109330557,'luis','Perez Paniagua','2000-05-10 00:00:00'),(109330558,'pepe','Rosa Pomier','2000-05-19 00:00:00'),(109330559,'Camila','Avila Vega','2000-05-11 00:00:00'),(109330560,'Rodolfo','Teran Vega','2000-05-12 00:00:00'),(109330561,'maria','hatake uchiha','2000-05-13 00:00:00'),(109330562,'juan','Uzumaki Konohamaru','2000-05-14 00:00:00'),(109330563,'natalia','Uchiha Paniagua','2000-05-15 00:00:00');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-17 17:52:51
