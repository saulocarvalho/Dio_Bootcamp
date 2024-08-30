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
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Produto_Nome` varchar(45) NOT NULL,
  `Produto_Categoria` enum('Notebook','Desktop','Memória','Placa de Vídeo','Placa mãe') NOT NULL,
  `Produto_Descricao` varchar(255) DEFAULT NULL,
  `Produto_Marca` varchar(20) NOT NULL,
  `Produto_Modelo` varchar(40) NOT NULL,
  `Produto_Avaliacao` float DEFAULT NULL,
  `Produto_Valor` float NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Notebook Dell Vostro 3510','Notebook','11ª geração Intel® Core™ i5-1135G7 (4-core, cache de 8MB, até 4.2GHz)','Dell','Vostro 3510',4.8,3500),(2,'Desktop Dell XPS 8950','Desktop','12ª geração Intel® Core™ i7-12700 - NVIDIA® GeForce RTX™ 3060 12GB GDDR6 - Memória de 16GB DDR5 SSD de 256GB PCIe NVMe M.2 + HD de 1TB (7200RPM)','Dell','XPS 8950',5,10449),(3,'Memória Kingston Fury Beast','Memória','Memória Kingston Fury Beast, 8GB, 3200MHz, DDR4, CL16, Preto - KF432C16BB/8','Kingston','Fury Beast',4.9,172.99),(4,'PNY NVIDIA Geforce RTX 3060','Placa de Vídeo','Placa de Video PNY NVIDIA Geforce RTX 3060, 12 GB GDDR6, DLSS, Ray Tracing - VCG306012DFBPB1','PNY','RTX 3060',4,2310.99),(5,'Asus TUF Gaming','Placa mãe','Placa Mãe Asus TUF Gaming B660M-PLUS D4, Intel LGA 1700, mATX, DDR4, RGB','Asus','B660M-PLUS D4',5,1199.99),(6,'Notebook ASUS VivoBook X513EA','Notebook','Intel® Core™ i5 - 11ª Geração - Intel® Iris® Xe - 16GB - 256GB SSD','Asus','X513EA-BQ3400W',4.7,4049.1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
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
