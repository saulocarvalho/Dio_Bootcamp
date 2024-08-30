CREATE DATABASE  IF NOT EXISTS `viagens` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `viagens`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: viagens
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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do usuário',
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'saulo','teste@teste.com','2000-03-01','Rua A',' 123',' Cidade X',' Estado Y'),(2,'carlos','carlos@teste.com','1995-03-01','Rua B',' 456',' Cidade Y',' Estado Z'),(3,'pedro','pedro@teste.com','1994-03-01','Rua C',' 789',' Cidade H',' Estado I'),(4,'paulo','peste@teste.com','1980-03-01','Rua D',' 454',' Cidade K',' Estado L'),(5,'saulo2','teste3@teste.com','2000-03-01','Rua A',' 123',' Cidade X',' Estado Y'),(6,'João Silva','joao.silva@example.com','1990-01-01','Rua A',NULL,NULL,NULL),(7,'Maria Santos','maria.santos@example.com','1992-03-15','Rua B',NULL,NULL,NULL),(8,'Pedro Almeida','pedro.almeida@example.com','1985-07-10','Rua C',NULL,NULL,NULL),(9,'Ana Oliveira','ana.oliveira@example.com','1998-12-25','Rua D',NULL,NULL,NULL),(10,'Carlos Pereira','carlos.pereira@example.com','1991-06-05','Rua E',NULL,NULL,NULL),(11,'Laura Mendes','laura.mendes@example.com','1994-09-12','Rua F',NULL,NULL,NULL),(12,'Fernando Santos','fernando.santos@example.com','1988-02-20','Rua G',NULL,NULL,NULL),(13,'Mariana Costa','mariana.costa@example.com','1997-11-30','Rua H',NULL,NULL,NULL),(14,'Ricardo Rodrigues','ricardo.rodrigues@example.com','1993-04-18','Rua I',NULL,NULL,NULL),(15,'Camila Alves','camila.alves@example.com','1989-08-08','Rua J',NULL,NULL,NULL),(16,'Bruno Carvalho','bruno.carvalho@example.com','1995-03-25','Rua K',NULL,NULL,NULL),(17,'Amanda Silva','amanda.silva@example.com','1996-12-02','Rua L',NULL,NULL,NULL),(18,'Paulo Mendonça','paulo.mendonca@example.com','1999-07-20','Rua M',NULL,NULL,NULL),(19,'Larissa Oliveira','larissa.oliveira@example.com','1987-10-15','Rua N',NULL,NULL,NULL),(20,'Fernanda Sousa','fernanda.sousa@example.com','1992-05-08','Rua O',NULL,NULL,NULL),(21,'Gustavo Santos','gustavo.santos@example.com','1993-09-18','Rua P',NULL,NULL,NULL),(22,'Helena Costa','helena.costa@example.com','1998-02-22','Rua Q',NULL,NULL,NULL),(23,'Diego Almeida','diego.almeida@example.com','1991-11-27','Rua R',NULL,NULL,NULL),(24,'Juliana Lima','juliana.lima@example.com','1997-04-05','Rua S',NULL,NULL,NULL),(25,'Rafaela Silva','rafaela.silva@example.com','1996-01-10','Rua T',NULL,NULL,NULL),(26,'Lucas Pereira','lucas.pereira@example.com','1986-08-30','Rua U',NULL,NULL,NULL),(27,'Fábio Rodrigues','fabio.rodrigues@example.com','1989-03-12','Rua V',NULL,NULL,NULL),(28,'Isabela Santos','isabela.santos@example.com','1994-12-07','Rua W',NULL,NULL,NULL),(29,'André Alves','andre.alves@example.com','1995-09-28','Rua X',NULL,NULL,NULL),(30,'Clara Carvalho','clara.carvalho@example.com','1990-02-15','Rua Y',NULL,NULL,NULL),(31,'Roberto Mendes','roberto.mendes@example.com','1992-07-21','Rua Z',NULL,NULL,NULL),(32,'Mariana Oliveira','mariana.oliveira@example.com','1997-05-03','Av. A',NULL,NULL,NULL),(33,'Gustavo Costa','gustavo.costa@example.com','1998-11-16','Av. B',NULL,NULL,NULL),(34,'Lara Sousa','lara.sousa@example.com','1993-06-09','Av. C',NULL,NULL,NULL),(35,'Pedro Lima','pedro.lima@example.com','1996-09-27','Av. D',NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
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
