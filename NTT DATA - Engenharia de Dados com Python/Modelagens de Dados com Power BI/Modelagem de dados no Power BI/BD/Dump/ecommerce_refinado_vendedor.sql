CREATE DATABASE  IF NOT EXISTS `ecommerce_refinado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce_refinado`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_refinado
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
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `Vendedor_CNPJ` char(14) NOT NULL,
  `Vendedor_RazaoSocial` varchar(30) NOT NULL,
  `Vendedor_NomeFantasia` varchar(30) NOT NULL,
  `Vendedor_Email` varchar(30) NOT NULL,
  `Vendedor_Celular` char(11) DEFAULT NULL,
  `Vendedor_Telefone` char(10) DEFAULT NULL,
  `Vendedor_CEP` char(8) NOT NULL,
  `Vendedor_Logradouro` varchar(45) NOT NULL,
  `Vendedor_Numero` varchar(5) DEFAULT NULL,
  `Vendedor_Complemento` varchar(20) DEFAULT NULL,
  `Vendedor_Bairro` varchar(15) NOT NULL,
  `Vendedor_Municipio` varchar(30) NOT NULL,
  `Vendedor_UF` char(2) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE KEY `unique_CNPJ_Vendedor` (`Vendedor_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_Vendedor` (`Vendedor_RazaoSocial`),
  UNIQUE KEY `unique_Email_Vendedor` (`Vendedor_Email`),
  UNIQUE KEY `unique_Celular_Vendedor` (`Vendedor_Celular`),
  UNIQUE KEY `unique_Telefone_Vendedor` (`Vendedor_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'23456789456321','Tech eletronics','Technology','tech@tech.com.br','21988547414',NULL,'12354684','Rua Rio blue','5487',NULL,'Tambaú','João Pessoa','PB'),(2,'12345678374541','Botique Durgas','Durgas','durgas@durgas.com.br',NULL,'3855446622','98754214','Rua Minas','74',NULL,'Jaboatão','Belo Horizonte','MG'),(3,'45678912365448','Kids World','KW','kw@kidsworld.com.br','11988552288','1166554477','77798542','Rua da Liberdade','777',NULL,'Liberdade','São Paulo','SP'),(4,'13167385000128','Camille & Moraes Tecnologia','CMT','camille.moraes@cmoraes.com.br','82998552142',NULL,'57040509','5ª Travessa Santo Antonio','25',NULL,'Jatiúca','Maceió','AL'),(5,'47271766000174','Regufe Tech','Regufe ','brunna@regufe.com.br',NULL,'9235650744','69036070','Beco Lobo Soropita','823',NULL,'Compensa','Manaus','AM');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 17:37:21
