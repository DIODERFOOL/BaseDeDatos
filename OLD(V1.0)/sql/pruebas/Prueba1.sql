-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: proyect
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `archivo` (
  `id_Archivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_Archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demanda`
--

DROP TABLE IF EXISTS `demanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `demanda` (
  `id_Demanda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `reclamo` varchar(100) NOT NULL,
  `direccion_demandado` varchar(100) NOT NULL,
  `prestaciones` double NOT NULL,
  PRIMARY KEY (`id_Demanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demanda`
--

LOCK TABLES `demanda` WRITE;
/*!40000 ALTER TABLE `demanda` DISABLE KEYS */;
/*!40000 ALTER TABLE `demanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplo`
--

DROP TABLE IF EXISTS `ejemplo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ejemplo` (
  `id_Key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplo`
--

LOCK TABLES `ejemplo` WRITE;
/*!40000 ALTER TABLE `ejemplo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejemplo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empresa` (
  `id_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `forma_juridica` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `expediente` (
  `id_Expediente` int(11) NOT NULL AUTO_INCREMENT,
  `contrato` varchar(100) NOT NULL,
  `pago` double NOT NULL,
  `salarioIntegral` double NOT NULL,
  PRIMARY KEY (`id_Expediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente`
--

LOCK TABLES `expediente` WRITE;
/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juicio`
--

DROP TABLE IF EXISTS `juicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `juicio` (
  `id_Juicio` int(11) NOT NULL AUTO_INCREMENT,
  `juez` varchar(100) NOT NULL,
  `juntaLocal` varchar(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_Juicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juicio`
--

LOCK TABLES `juicio` WRITE;
/*!40000 ALTER TABLE `juicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `juicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personademandada`
--

DROP TABLE IF EXISTS `personademandada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personademandada` (
  `id_Cliente` int(11) NOT NULL,
  `id_DemandaE` int(11) NOT NULL,
  KEY `id_Cliente` (`id_Cliente`),
  KEY `id_DemandaE` (`id_DemandaE`),
  CONSTRAINT `personademandada_ibfk_1` FOREIGN KEY (`id_Cliente`) REFERENCES `personafisica` (`id_Física`),
  CONSTRAINT `personademandada_ibfk_2` FOREIGN KEY (`id_DemandaE`) REFERENCES `juicio` (`id_Juicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personademandada`
--

LOCK TABLES `personademandada` WRITE;
/*!40000 ALTER TABLE `personademandada` DISABLE KEYS */;
/*!40000 ALTER TABLE `personademandada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personafisica`
--

DROP TABLE IF EXISTS `personafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personafisica` (
  `id_Física` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Física`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personafisica`
--

LOCK TABLES `personafisica` WRITE;
/*!40000 ALTER TABLE `personafisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `personafisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrado`
--

DROP TABLE IF EXISTS `registrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registrado` (
  `id_Trabajador` int(11) NOT NULL,
  `id_Testimonio` int(11) NOT NULL,
  KEY `id_Trabajador` (`id_Trabajador`),
  KEY `id_Testimonio` (`id_Testimonio`),
  CONSTRAINT `registrado_ibfk_1` FOREIGN KEY (`id_Trabajador`) REFERENCES `trabajador` (`id_Trabajador`),
  CONSTRAINT `registrado_ibfk_2` FOREIGN KEY (`id_Testimonio`) REFERENCES `testimonios` (`id_Testimonios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrado`
--

LOCK TABLES `registrado` WRITE;
/*!40000 ALTER TABLE `registrado` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonios`
--

DROP TABLE IF EXISTS `testimonios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `testimonios` (
  `id_Testimonios` int(11) NOT NULL AUTO_INCREMENT,
  `peritaje` varchar(100) NOT NULL,
  `pruebas` varchar(100) NOT NULL,
  `validacion` varchar(100) NOT NULL,
  `nombreDeTestigo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Testimonios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonios`
--

LOCK TABLES `testimonios` WRITE;
/*!40000 ALTER TABLE `testimonios` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trabajador` (
  `id_Trabajador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `salario` double NOT NULL,
  `fechaDeIngreso` date DEFAULT NULL,
  PRIMARY KEY (`id_Trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `id_Empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_Usuario`),
  KEY `id_Empresa` (`id_Empresa`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_Empresa`) REFERENCES `empresa` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-15 17:15:45
