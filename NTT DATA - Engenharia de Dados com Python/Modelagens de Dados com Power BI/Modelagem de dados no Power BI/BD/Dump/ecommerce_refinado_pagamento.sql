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
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idPagamento` int NOT NULL AUTO_INCREMENT,
  `Cliente_idClientePF` int DEFAULT NULL,
  `Cliente_idClientePJ` int DEFAULT NULL,
  `Pedido_idPedido` int DEFAULT NULL,
  `Pagamento_TipoPagamento` enum('Cartão de crédito','Cartão de Débito','PIX','Boleto') NOT NULL,
  `Pagamento_CartaoNumero` char(12) DEFAULT NULL,
  `Pagamento_CartaoValidade` char(6) DEFAULT NULL,
  `Pagamento_CartaoCVV` char(3) DEFAULT NULL,
  `Pagamento_ValorTotal` float DEFAULT NULL,
  `Pagamento_Aprovado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idPagamento`),
  KEY `fk_idPedido_Pedido` (`Pedido_idPedido`),
  KEY `fk_ClienteidClientePF_ClientePF` (`Cliente_idClientePF`),
  KEY `fk_ClienteidClientePJ_ClientePJ` (`Cliente_idClientePJ`),
  CONSTRAINT `fk_ClienteidClientePF_ClientePF` FOREIGN KEY (`Cliente_idClientePF`) REFERENCES `clientepf` (`idClientePF`),
  CONSTRAINT `fk_ClienteidClientePJ_ClientePJ` FOREIGN KEY (`Cliente_idClientePJ`) REFERENCES `clientepj` (`idClientePJ`),
  CONSTRAINT `fk_idPedido_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,NULL,1,'Cartão de crédito','123456789102','72027','666',322.99,1),(2,1,NULL,2,'Cartão de crédito','534456200102','42030','412',1299.99,1),(3,2,NULL,3,'PIX',NULL,NULL,NULL,10549,1),(4,3,NULL,4,'Cartão de Débito','942255021347','1229','987',4049.1,0),(5,3,NULL,5,'Cartão de Débito','942255021347','1229','987',3540,1),(6,4,NULL,6,'Boleto',NULL,NULL,NULL,2430.99,1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 17:37:22
