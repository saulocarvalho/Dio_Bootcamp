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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Cliente_idClientePF` int DEFAULT NULL,
  `Cliente_idClientePJ` int DEFAULT NULL,
  `cliente_Email` varchar(30) NOT NULL,
  `Cliente_Celular` char(11) DEFAULT NULL,
  `Cliente_Telefone` char(10) DEFAULT NULL,
  `Cliente_CEP` char(8) NOT NULL,
  `Cliente_Logradouro` varchar(45) NOT NULL,
  `Cliente_Numero` varchar(5) DEFAULT NULL,
  `Cliente_Complemento` varchar(20) DEFAULT NULL,
  `Cliente_Bairro` varchar(15) NOT NULL,
  `Cliente_Municipio` varchar(20) NOT NULL,
  `Cliente_UF` char(2) NOT NULL,
  `Cliente_Regiao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_email_cliente` (`cliente_Email`),
  UNIQUE KEY `unique_celular_cliente` (`Cliente_Celular`),
  UNIQUE KEY `unique_telefone_cliente` (`Cliente_Telefone`),
  KEY `fk_idClientePF_ClientePF` (`Cliente_idClientePF`),
  KEY `fk_idClientePJ_ClientePJ` (`Cliente_idClientePJ`),
  CONSTRAINT `fk_idClientePF_ClientePF` FOREIGN KEY (`Cliente_idClientePF`) REFERENCES `clientepf` (`idClientePF`),
  CONSTRAINT `fk_idClientePJ_ClientePJ` FOREIGN KEY (`Cliente_idClientePJ`) REFERENCES `clientepj` (`idClientePJ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,NULL,'Emano@emmc.com.br','83987417417',NULL,'57025458','rua silva de prata','29',NULL,'Carangola','Cidade das flores','PB','Nordeste'),(2,2,NULL,'saulo@sdc.com.br','82965452154','8233554411','88047596','Rua Manoel Soares DAzevedo Maia','255',NULL,'Carianos','Maceió','AL','Nordeste'),(3,3,NULL,'jorge@jtg.com.br',NULL,'6838485483','69919817','Rua N2','2',NULL,'Conjunto Tucumã','Rio Branco','AC','Norte'),(4,4,NULL,'ryan.vilar@geradornv.com.br','71993683614','7133230670','41950690','Travessa Professora Nilzete','54',NULL,'Rio Vermelho','Salvador','BA','Nordeste');
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

-- Dump completed on 2024-08-30 17:37:21
