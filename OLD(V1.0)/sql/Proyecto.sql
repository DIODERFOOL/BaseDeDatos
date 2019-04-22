-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Proyect
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Archivo`
--

DROP TABLE IF EXISTS `Archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Archivo` (
  `id_Archivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_Archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Archivo`
--

LOCK TABLES `Archivo` WRITE;
/*!40000 ALTER TABLE `Archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Demanda`
--

DROP TABLE IF EXISTS `Demanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Demanda` (
  `id_Demanda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `reclamo` varchar(100) NOT NULL,
  `direccion_demandado` varchar(100) NOT NULL,
  `prestaciones` double NOT NULL,
  `id_Archivo` int(11) NOT NULL,
  PRIMARY KEY (`id_Demanda`),
  KEY `id_Archivo` (`id_Archivo`),
  CONSTRAINT `demanda_ibfk_1` FOREIGN KEY (`id_Archivo`) REFERENCES `archivo` (`id_Archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Demanda`
--

LOCK TABLES `Demanda` WRITE;
/*!40000 ALTER TABLE `Demanda` DISABLE KEYS */;
/*!40000 ALTER TABLE `Demanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Empresa` (
  `id_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `forma_juridica` varchar(100) NOT NULL,
  `id_Trabajador` int(11) NOT NULL,
  PRIMARY KEY (`id_Empresa`),
  KEY `id_Trabajador` (`id_Trabajador`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_Trabajador`) REFERENCES `trabajador` (`id_Trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmpresaDemandada`
--

DROP TABLE IF EXISTS `EmpresaDemandada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EmpresaDemandada` (
  `id_Empresa` int(11) NOT NULL,
  `id_DemandaE` int(11) NOT NULL,
  KEY `id_Empresa` (`id_Empresa`),
  KEY `id_DemandaE` (`id_DemandaE`),
  CONSTRAINT `empresademandada_ibfk_1` FOREIGN KEY (`id_Empresa`) REFERENCES `empresa` (`id_Empresa`),
  CONSTRAINT `empresademandada_ibfk_2` FOREIGN KEY (`id_DemandaE`) REFERENCES `juicio` (`id_Juicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpresaDemandada`
--

LOCK TABLES `EmpresaDemandada` WRITE;
/*!40000 ALTER TABLE `EmpresaDemandada` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmpresaDemandada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Expediente`
--

DROP TABLE IF EXISTS `Expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Expediente` (
  `id_Expendiente` int(11) NOT NULL AUTO_INCREMENT,
  `contrato` varchar(100) NOT NULL,
  `pago` double NOT NULL,
  `salarioIntegral` double NOT NULL,
  `id_Juicio` int(11) NOT NULL,
  PRIMARY KEY (`id_Expendiente`),
  KEY `id_Juicio` (`id_Juicio`),
  CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`id_Juicio`) REFERENCES `juicio` (`id_Juicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Expediente`
--

LOCK TABLES `Expediente` WRITE;
/*!40000 ALTER TABLE `Expediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Expediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Juicio`
--

DROP TABLE IF EXISTS `Juicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Juicio` (
  `id_Juicio` int(11) NOT NULL AUTO_INCREMENT,
  `juez` varchar(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  `juntaLocal` varchar(100) NOT NULL,
  `id_Demanda` int(11) NOT NULL,
  PRIMARY KEY (`id_Juicio`),
  KEY `id_Demanda` (`id_Demanda`),
  CONSTRAINT `juicio_ibfk_1` FOREIGN KEY (`id_Demanda`) REFERENCES `demanda` (`id_Demanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Juicio`
--

LOCK TABLES `Juicio` WRITE;
/*!40000 ALTER TABLE `Juicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Juicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonaDemandada`
--

DROP TABLE IF EXISTS `PersonaDemandada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PersonaDemandada` (
  `id_Fisica` int(11) NOT NULL,
  `id_DemandaF` int(11) NOT NULL,
  KEY `id_Fisica` (`id_Fisica`),
  KEY `id_DemandaF` (`id_DemandaF`),
  CONSTRAINT `personademandada_ibfk_1` FOREIGN KEY (`id_Fisica`) REFERENCES `personafisica` (`id_Fisica`),
  CONSTRAINT `personademandada_ibfk_2` FOREIGN KEY (`id_DemandaF`) REFERENCES `juicio` (`id_Juicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonaDemandada`
--

LOCK TABLES `PersonaDemandada` WRITE;
/*!40000 ALTER TABLE `PersonaDemandada` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonaDemandada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonaFisica`
--

DROP TABLE IF EXISTS `PersonaFisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PersonaFisica` (
  `id_Fisica` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Fisica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonaFisica`
--

LOCK TABLES `PersonaFisica` WRITE;
/*!40000 ALTER TABLE `PersonaFisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonaFisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registrado`
--

DROP TABLE IF EXISTS `Registrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Registrado` (
  `id_Trabajador` int(11) NOT NULL,
  `id_Testimonio` int(11) NOT NULL,
  KEY `id_Trabajador` (`id_Trabajador`),
  KEY `id_Testimonio` (`id_Testimonio`),
  CONSTRAINT `registrado_ibfk_1` FOREIGN KEY (`id_Trabajador`) REFERENCES `trabajador` (`id_Trabajador`),
  CONSTRAINT `registrado_ibfk_2` FOREIGN KEY (`id_Testimonio`) REFERENCES `testimonios` (`id_Testimonios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registrado`
--

LOCK TABLES `Registrado` WRITE;
/*!40000 ALTER TABLE `Registrado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Registrado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Testimonios`
--

DROP TABLE IF EXISTS `Testimonios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Testimonios` (
  `id_Testimonios` int(11) NOT NULL AUTO_INCREMENT,
  `peritaje` varchar(100) NOT NULL,
  `pruebas` varchar(100) NOT NULL,
  `validacion` varchar(100) NOT NULL,
  `nombreDeTestigo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Testimonios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testimonios`
--

LOCK TABLES `Testimonios` WRITE;
/*!40000 ALTER TABLE `Testimonios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Testimonios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabajador`
--

DROP TABLE IF EXISTS `Trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Trabajador` (
  `id_Trabajador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `salario` double NOT NULL,
  `fechaDeIngreso` date DEFAULT NULL,
  PRIMARY KEY (`id_Trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trabajador`
--

LOCK TABLES `Trabajador` WRITE;
/*!40000 ALTER TABLE `Trabajador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id_Usario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `id_Empresa` int(11) NOT NULL,
  `id_Fisica` int(11) NOT NULL,
  `foto` blob,
  PRIMARY KEY (`id_Usario`),
  KEY `id_Empresa` (`id_Empresa`),
  KEY `id_Fisica` (`id_Fisica`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_Empresa`) REFERENCES `empresa` (`id_Empresa`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_Fisica`) REFERENCES `personafisica` (`id_Fisica`)
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

-- Dump completed on 2019-04-01 10:47:16
