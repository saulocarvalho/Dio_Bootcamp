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
-- Table structure for table `pedidoproduto`
--

DROP TABLE IF EXISTS `pedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoproduto` (
  `Pedido_idPedido` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `PedidoProduto_Quantidade` int NOT NULL,
  `PedidoProduto_Status` enum('Disponível','Sem estoque') NOT NULL DEFAULT 'Disponível',
  `PedidoProduto_DataPedido` date NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`,`Produto_idProduto`),
  KEY `fk_idPedidoProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idPedidoProduto_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_idPedidoProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoproduto`
--

LOCK TABLES `pedidoproduto` WRITE;
/*!40000 ALTER TABLE `pedidoproduto` DISABLE KEYS */;
INSERT INTO `pedidoproduto` VALUES (1,3,2,'Disponível','2023-01-23'),(2,5,1,'Disponível','2023-01-17'),(3,2,1,'Disponível','2023-03-01'),(4,6,1,'Sem estoque','2023-04-14'),(5,1,1,'Disponível','2023-04-20'),(6,4,2,'Disponível','2023-04-24');
/*!40000 ALTER TABLE `pedidoproduto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 17:37:20
