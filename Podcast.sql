CREATE DATABASE  IF NOT EXISTS `Podcast` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */;
USE `Podcast`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: Podcast
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `Descargas`
--

DROP TABLE IF EXISTS `Descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Descargas` (
  `idDescargas` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `Podcast_idPodcast` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idDescargas`),
  KEY `fk_Descargas_Podcast_idx` (`Podcast_idPodcast`),
  KEY `fk_Descargas_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Descargas_Podcast` FOREIGN KEY (`Podcast_idPodcast`) REFERENCES `Podcast` (`idPodcast`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Descargas_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Descargas`
--

LOCK TABLES `Descargas` WRITE;
/*!40000 ALTER TABLE `Descargas` DISABLE KEYS */;
INSERT INTO `Descargas` VALUES (10,'2024-06-01 20:00:00',1,1),(11,'2024-06-07 20:00:00',1,2),(12,'2024-06-10 20:00:00',2,2),(13,'2024-06-11 20:00:00',2,5),(14,'2024-06-12 20:00:00',3,1),(15,'2024-06-12 20:00:00',4,3),(16,'2024-06-13 20:00:00',1,3),(17,'2024-06-13 20:00:00',1,4),(18,'2024-06-13 20:00:00',4,4);
/*!40000 ALTER TABLE `Descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalles_descarga`
--

DROP TABLE IF EXISTS `Detalles_descarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalles_descarga` (
  `idDetalles_descarga` int(11) NOT NULL AUTO_INCREMENT,
  `tipoArchivo` varchar(45) DEFAULT NULL,
  `descargas_idDescargas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDetalles_descarga`),
  UNIQUE KEY `idDescargas_UNIQUE` (`descargas_idDescargas`),
  CONSTRAINT `fk_idDescargas` FOREIGN KEY (`idDetalles_descarga`) REFERENCES `Descargas` (`idDescargas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalles_descarga`
--

LOCK TABLES `Detalles_descarga` WRITE;
/*!40000 ALTER TABLE `Detalles_descarga` DISABLE KEYS */;
INSERT INTO `Detalles_descarga` VALUES (11,'mp3',10),(12,'wav',11),(13,'mp4',12),(14,'mp4',13),(15,'mp3',15);
/*!40000 ALTER TABLE `Detalles_descarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Podcast`
--

DROP TABLE IF EXISTS `Podcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Podcast` (
  `idPodcast` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  PRIMARY KEY (`idPodcast`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Podcast`
--

LOCK TABLES `Podcast` WRITE;
/*!40000 ALTER TABLE `Podcast` DISABLE KEYS */;
INSERT INTO `Podcast` VALUES (1,'He FACTURADO 230M€','Toda una aventura empresarial que, con esfuerzo, llegó a facturar 1.000.000€','01:29:00'),(2,'VENDÍ mi proyecto ','Esta semana regresamos con nuestro podcast y hoy tenemos el placer de presentar a: ¡Xavi Ginesta, Founder y ex-CEO de Voxel!','02:20:00'),(3,'¡CREAR y VENDER una EMPRESA','¡Este podcast es muy especial porque tenemos el honor de contar con dos invitados increíbles: Javi López y Emilio Nicolás, los fundadores de Magnific AI!\n\n','00:30:20'),(4,'Así será el FUTURO','El episodio de hoy es una combinación entre medicina, tecnología y negocios. Ángel Alberich, fundador y CEO','01:10:00');
/*!40000 ALTER TABLE `Podcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(75) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Juan','Palomo'),(2,'Maria','Suarez'),(3,'Esther','Alonso'),(4,'Luis','Delgado'),(5,'Jose','Perez');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20 20:14:52
