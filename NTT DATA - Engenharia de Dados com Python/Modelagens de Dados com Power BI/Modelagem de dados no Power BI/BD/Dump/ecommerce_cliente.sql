CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Pnome` varchar(10) NOT NULL,
  `Sobrenome` varchar(30) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL,
  `DataNascimento` date NOT NULL,
  `CPF` char(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Celular` char(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_cpf_cliente` (`CPF`),
  UNIQUE KEY `unique_email_cliente` (`Email`),
  UNIQUE KEY `unique_celular_cliente` (`Celular`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maria','M Silva','rua silva de prata 29, Carangola - Cidade das flores','2000-07-05','12346789','maria@msilva.com.br','82987417417'),(2,'Matheus','O Pimentel','rua alemeda 289, Centro - Cidade das flores','1990-04-04','987654321','matheus@opimentel.com.br','77945214741'),(3,'Ricardo','F Silva','avenida alemeda vinha 1009, Centro - Cidade das flores','1995-10-25','45678913','ricardo@fsilva.com.br','11947581354'),(4,'Julia','S França','rua lareijras 861, Centro - Cidade das flores','2001-01-25','789123456','julia@ffranca.com.br','31945789652'),(5,'Roberta','G Assis','avenidade koller 19, Centro - Cidade das flores','1999-03-01','98745631','roberta@gassis.com.br','81987432568'),(6,'Isabela','M Cruz','rua alemeda das flores 28, Centro - Cidade das flores','1995-05-20','654789123','isabela@mcruz.com.br','11998547567');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 17:37:24
